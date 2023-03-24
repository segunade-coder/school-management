// importing express module for creating server and routes
const express = require("express");

const router = express.Router();

// importing connectivity to mysql database 
const conn = require("../conn&apis/conn"); 

// importing custom mysql modules.  
const dbQueries = require("../conn&apis/mysqlApi"); 

// initialization with the connection as a parameter
const db = new dbQueries(conn);

// custom modules to log out where an error has occur and the line. 
const logErr = require("../conn&apis/logErrors");

// route to find name for autocomplete 
router.post("/find-name", (req, res) => {

  // destructure "name" and "condition" from req.body object
    let { name, condition } = req.body;

    // if condition is false, that is: no filter needed in the search
    if (!condition) {

      // check if school record exist in the session
      if (req?.session?.databaseName) {

        // fetch name from table "payment_record" whose balance are greater than '0'

        db.query(
          `SELECT * FROM ${
            req?.session?.databaseName
          }_payment_record WHERE (name LIKE "%${name.toLowerCase()}%" OR payment_id LIKE "%${name.toLowerCase()}%") AND balance > 0 GROUP BY keyid`
        )
          .then((data) =>

          // returns a json format output to the frontend 
            res.json({
              status: true,
              message: data,
            })
          )
          .catch((err) => {
            logErr(
              err,
              __filename,
              new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
            );

            // if an error occurs in the async fetch, throw error and send a response back to the frontend 
            res.json({
              status: false,
              message: "something went wrong. Try refreshing or restarting",
            });
          });
      } else {

        // if school details not found on the session object, send a response back to the frontend
        res.json({
          status: false,
          message: "Not logged in",
        });
      }
    } else {

      // if the condition is true, that isL there are filters in the search

      // destructure variable from req.body object
      let { filterArray } = req.body;
      let sqlqry = [];
      let sqlstring = "";

      // a for loop to loop through the filterArray object
      for (filter of filterArray) {

        // another for in loop to extract the keys of the individual properties of the filterArray object
        for (let key in filter) {

          // form a mysql query string with the key/value of the properties
          sqlqry.push(`${key} LIKE "%${filter[key].trim().toLowerCase()}%"`);
          sqlqry.push("AND");
        }
      }

      // delete excess "AND" word at the end of the query string. 
      if (sqlqry[sqlqry.length - 1] == "AND") sqlqry.pop();
      sqlstring = sqlqry.join(" ");
      if (sqlstring) {

        // create another query string that incoporates the first query sting as part of it. 
        let qry = `SELECT id, name, class FROM ${
          req?.session?.databaseName
        }_payment_record WHERE (name LIKE "%${name.toLowerCase()}%" OR payment_id LIKE "%${name.toLowerCase()}%") AND ${sqlstring} AND balance > 0 GROUP BY keyid`;
        db.query(qry)
          .then((data) => {

              // returns a json format output to the frontend 
            res.json({
              status: true,
              message: data,
            });
          })
          .catch((err) => {
            logErr(
              err,
              __filename,
              new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
            );
            res.json({
              status: false,
              message: "something went wrong. Try refreshing or restarting",
            });
          });
      }
    }
  })

  // route to find record using the search id or name. 
  .post("/findId", (req, res) => {

    // destructure variables from object
    let { status, name, searchId } = req.body;

    // if status is true that ie: we are fetching record through payment id
    if (status) {

      db.query(
        `SELECT *, SUM(amount_paid) AS TotalPaid FROM ${req?.session?.databaseName}_payment_record WHERE payment_id = "${searchId}" AND balance > 0 GROUP BY keyid ORDER BY created_at`
      )
        .then((data) => {
          if (data) {

            // if data is not empty, return a response in json format
            res.json({
              status: true,
              message: data,
            });
          }
        })
        .catch((err) => {
          logErr(
            err,
            __filename,
            new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
          );
          res.json({
            status: false,
            message: "something went wrong. Try refreshing or restarting",
          });
        });
    } else {

      // if status is false that is: we are fetching record either by name or by payment id using a wildcard "LIKE"
      db.query(
        `SELECT *, SUM(amount_paid) AS TotalPaid FROM ${
          req?.session?.databaseName
        }_payment_record WHERE (name LIKE "%${name.toLowerCase()}%" OR payment_id = "${name}") AND balance > 0 GROUP BY keyid`
      )
        .then((data) => {
          if (data) {
            res.json({
              status: true,
              message: data,
            });
          }
        })
        .catch((err) => {
          logErr(
            err,
            __filename,
            new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
          );
          res.json({
            status: false,
            message: "something went wrong. Try refreshing or restarting",
          });
        });
    }
  })

  // route to return records to be displayed when the page first loads
  .get("/records", (req, res) => {

    // destructuring...
    let { limit, page } = req.query;

    // calculate offset 
    const offset = (page - 1) * limit;
    let total = 0;

    // fetch the total number of records we have that have balance greater than '0'. so as to know the number of pagnation buttons to have
    db.query(
      `SELECT COUNT(*) as total FROM ${req?.session?.databaseName}_payment_record WHERE balance > 0 GROUP BY keyid`
    )

      // insert response into the total variable 
      .then((data) => (total = data.length))
      .catch((err) => console.log(err));

      // fetch record with limit and offset. 
    db.query(
      `SELECT * FROM ${req?.session?.databaseName}_payment_record WHERE balance > 0 IN (SELECT MAX(id) FROM ${req?.session?.databaseName}_payment_record GROUP BY keyid) GROUP BY keyid ORDER BY id LIMIT ${limit} OFFSET ${offset}`
    )
      .then((data) => {

        // ..return response as a json object. The total records, and the individual records in details. 
        return res.json({
          status: true,
          message: data,
          total,
        });
      })
      .catch((err) => {
        logErr(
          err,
          __filename,
          new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
        );
        res.json({
          status: false,
          message: "something went wrong. Try refreshing or restarting",
        });
      });
  })

  // route to balance fees
  .post("/save", (req, res) => {

    // destructuring variables....
    let {
      name,
      payment_id,
      balanceClass,
      amount_paid,
      expected_payment,
      balance,
      payment_for,
      payment_method,
      term,
      session,
      DOG,
      DOP,
      balance_date,
      remark,
      keyid,
      accountant,
    } = req.body;

    // chech if the variable are empty. 
    if (
      name === "" ||
      payment_id === "" ||
      balanceClass === "" ||
      DOP === "" ||
      payment_for === "" ||
      payment_method === "" ||
      term === "" ||
      expected_payment === "" ||
      amount_paid === "" ||
      balance === "" ||
      session === "" ||
      keyid === ""
    ) {

      // return a response to frontend to fill all textbos if any of the variable is empty

      return res.json({
        status: false,
        message: "Please fill in all the textbox",
      });

      // if none of the variables are empty
    } else {

      // create a variable called stat. change stat to true if payment for includes "bus" or else set it to false

      let stat = false;
      if (payment_for.toLowerCase().includes("bus")) stat = true;
      else stat = false;

      // insert values into the mysql database

      db.insert(`${req?.session?.databaseName}_payment_record`, {
        name: name.toLowerCase(),
        payment_id,
        class: balanceClass.toLowerCase(),
        amount_paid,
        expected_payment,
        balance,
        term: term.toLowerCase(),
        session,
        DOP,
        DOG,
        // if stat = true, set tuition to "0", else set it to the same value as amount paid
        tuition: stat ? 0 : amount_paid,
        balance_date,
        remark: remark.toLowerCase(),
        keyid,
        payment_for: payment_for.toLowerCase(),
        payment_method: payment_method.toLowerCase(),
        accountant: accountant.toLowerCase(),
      })
        .then((data) => {

          // if balance is = "0", update the balance of the records containing this details to "0"

          if (balance == 0) {
            db.query(
              `UPDATE ${req?.session?.databaseName}_payment_record SET balance = 0 WHERE keyid = '${keyid}'`
            )
              .then((data) => {
                return res.json({
                  status: true,
                  message: "Fee balanced succesfully",
                });
              })
              .catch((err) => {
                logErr(
                  err,
                  __filename,
                  new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
                );
                return res.json({
                  status: false,
                  message: "something went wrong, please try again later",
                });
              });
          } else {

           // if balance is not = "0", update the balance of the records containing this details to the balance variable value

            db.query(
              `UPDATE ${req?.session?.databaseName}_payment_record SET balance = ${balance}, balance_date = '${balance_date}' WHERE keyid = '${keyid}'`
            )
              .then((data) => {
                return res.json({
                  status: true,
                  message: "Fee balanced succesfully",
                });
              })
              .catch((err) => {
                logErr(
                  err,
                  __filename,
                  new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
                );
                return res.json({
                  status: false,
                  message: "something went wrong, please try again later",
                });
              });
          }
        })
        .catch((err) => {
          logErr(
            err,
            __filename,
            new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
          );
          return res.json({
            status: false,
            message: "something went wrong, please try again later",
          });
        });
    }
  });

module.exports = router;
