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

// route to get all the user pertaining to the logged school 
router.get("/", (req, res) => {

  // using method getAll from custom mysql module importede 
    db.getAll(`${req?.session?.databaseName}_users`)
      .then((data) => {
        return res.json({
          status: true,
          data,
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

  // route to add a user to the current logged school
  .post("/add", (req, res) => {

    // destructure variables from req.body object
    let { username, pass, loggedSchool } = req.body;

    // set variables to lowerCase()
    username = username?.toLowerCase()?.trim();
    loggedSchool = loggedSchool?.toLowerCase()?.trim();
    pass = pass.toLowerCase()?.trim();

    // check database if user already exist 
    db.getByColumnName(
      "user",
      `${username}`,
      `${req?.session?.databaseName}_users`
    )
      .then((data) => {
        
        // return error to frontend if user already exist. 
        if (data.length !== 0) {
          return res.json({
            status: false,
            message: "Username already exist. Try a different name",
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

      // if user does not already exist, insert credentials to the database. 
    if (username && pass) {
      db.insert(`${req?.session?.databaseName}_users`, {
        school: loggedSchool.toLowerCase(),
        user: username.toLowerCase(),
        password: pass.toLowerCase(),
        status: 1,
      })
        .then((data) =>
          res.json({ status: true, message: "opertion succesful" })
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
    }
  })

  // route to edit user status
  .post("/edit", (req, res) => {
    let { id, status } = req.body;

    db.query(
      `UPDATE ${req?.session?.databaseName}_users SET status = '${status}' WHERE id = ${id}`
    )
      .then((data) => res.json({ status: true, message: "opertion succesful" }))
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

  // route to delete user from database 
  .post("/delete-user", (req, res) => {
    let { id } = req.body;
    if (id) {
      db.delete(`${req?.session?.databaseName}_users`, parseInt(id))
        .then((data) =>
          res.json({ status: true, message: "opertion succesful" })
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
    }
  });

module.exports = router;
