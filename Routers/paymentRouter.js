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

// require prototype 
require('../conn&apis/prototypes')

// route to find name for autocomplete 
router.post("/findName", (req, res) => {

   // destructure "name" from req.body object
    let { name } = req.body;

    if (req?.session?.user) {

      // fetch name from table "students" 
      db.query(
        `SELECT * FROM ${
          req?.session?.databaseName
        }_students WHERE name LIKE "%${name.toLowerCase()}%"`
      )
        .then((data) =>
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
          res.json({
            status: false,
            message: "something went wrong. Try refreshing or restarting",
          });
        });
    } else {
      res.json({
        status: false,
        message: "Not logged in",
      });
    }
  })

  // route for fetching settings 
  .get("/classes", (req, res) => {
    if (req?.session?.user) {
      db.query(`SELECT * FROM ${req?.session?.databaseName}_settings`)
        .then((data) =>
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
          res.json({
            status: false,
            message: "something went wrong. Try refreshing or restarting",
          });
        });
    } else {
      res.json({
        status: false,
        message: "Not logged in",
      });
    }
  })

  // save a receipt
  .post("/save", (req, res) => {

    // create a random key using randomKey function from prototype modules
    let key = randomKey() + randomKey();

    // chech if user is logged in and destructure variable from req.body object
    if (req?.session?.user) {
      let { datas } = req.body;
      let {
        name,
        paymentId,
        studentClass,
        DOP,
        DOB,
        DOG,
        PTA,
        lesson,
        paymentFor,
        paymentMethod,
        term,
        totalFee,
        feePaid,
        balance,
        remark,
        session,
        loggedUser,
      } = datas;

      // check if variables are empty
      if (
        name === "" ||
        paymentId === "" ||
        studentClass === "" ||
        DOP === "" ||
        paymentFor === "" ||
        paymentMethod === "" ||
        term === "" ||
        totalFee === "" ||
        feePaid === "" ||
        balance === "" ||
        session === ""
      ) {

        // return error to frontend if any variable is empty
        return res.json({
          status: false,
          message: "Please fill in all the textbox",
        });
      } else {

        let tuition = paymentFor.toLowerCase().includes("bus")
          ? 0
          : parseInt(feePaid - (parseInt(PTA) + parseInt(lesson)));

          // create a function to insert data into the database
        let fnc = () => {


          // if key is not epmty
          if (key) {

            // create another inner function to add the data to database
            let innerFnc = () => {
              db.insert(`${req?.session?.databaseName}_payment_record`, {
                name: name.toLowerCase(),
                payment_id: paymentId,
                amount_paid: feePaid,
                expected_payment: totalFee.toLowerCase(),
                balance,
                term: term.toLowerCase(),
                session: session.toLowerCase(),
                DOP,
                DOG,
                PTA,
                lesson,
                tuition,
                balance_date: DOB,
                remark: remark.toLowerCase(),
                class: studentClass.toLowerCase(),
                keyid: key,
                payment_for: paymentFor.toLowerCase(),
                payment_method: paymentMethod.toLowerCase(),
                accountant: loggedUser.toLowerCase(),
              })
                .then((data) => {

                  // return succesful if inserting to database is succesful
                  return res.json({
                    status: true,
                    message: "Record added succesfully",
                    key_id: key,
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
            };

            // check if key exist already in the database
            db.getByColumnName(
              "keyid",
              key,
              `${req?.session?.databaseName}_payment_record`
            )
              .then((data) => {
                if (data.length == 0) {

                  // if it dosent exist, call the inner function to save the data to the database

                  innerFnc();
                } else {

                  // if key do exist, set key variable to a new set of key and call the "fnc" function
                  key = randomKey() + randomKey();
                  fnc();
                }
              })
              .catch((err) => {
                console.log(err);
                return res.json({
                  status: false,
                  message: "something went wrong, please try again later",
                });
              });
          }
        };

        // call the function "fnc"
        fnc();
      }
    } else {

      // if user not present in the session, return an error response to the frontend 
      
      res.json({
        status: false,
        message: "Not logged in",
      });
    }
  });

module.exports = router;
