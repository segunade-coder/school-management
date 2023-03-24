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

router.get("/", (req, res) => {

  // checking if user exist in the session object. 
  if (req.session.user) {
    
    // fetch the total number of student in the database using async method that returns a promise, ...custom mysql module
    db.query(
      `SELECT COUNT(*) AS count FROM ${req?.session?.databaseName}_students`
    )
      .then((data) => {

        // fetch the total of money paid monthly. 
        db.query(
          `SELECT SUM(amount_paid) AS total, MONTH(created_at) AS month_payment FROM ${req?.session?.databaseName}_payment_record WHERE MONTH(created_at) = MONTH(CURRENT_DATE()) GROUP BY month_payment`
        )
          .then((month) => {

            // fetch the total of money paid monthly.
            db.query(
              `SELECT SUM(amount_paid) AS total, YEAR(created_at) AS year_payment FROM ${req?.session?.databaseName}_payment_record WHERE YEAR(created_at) = YEAR(CURRENT_DATE()) GROUP BY year_payment`
            )
              .then((year) => {

                // return the total output in a json format
                return res.json({
                  status: true,
                  message: data[0].count,
                  year: year,
                  month: month,
                });
              })
              .catch((err) => {

                // if an error occur, log error using the custom error module 
                logErr(
                  err,
                  __filename,
                  new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
                );
              });
          })
          .catch((err) => {
            logErr(
              err,
              __filename,
              new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
            );
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
});

// export router
module.exports =  router;