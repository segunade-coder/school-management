// Entry point for all route and routers 

// importing express module for creating server and routes
const express = require('express')

const router = express.Router();

// importing connectivity to mysql database 
const conn = require("../conn&apis/conn"); 

// importing custom mysql modules.  
const dbQueries = require("../conn&apis/mysqlApi"); 

// initialization with the connection as a parameter
const db = new dbQueries(conn);

// custom modules to log out where an error has occur and the line. 
const logErr = require("../conn&apis/logErrors");

// importing scheduler function that runs ones a day
const scheduler = require("./scheduler");

// import all routes 
const paymentRoute = require("./paymentRouter");

const dashboardRoute = require("./dashboardRouter");

const settingsRoute = require("./settingsRouter");

const usersRoute = require("./usersRouter");

const feesRoute = require("./feesRouter");

const studentsRoute = require("./studentsRouter");

const recordsRoute = require("./recordsRouter");

let admin = "";

// middleware to check if logged user is an admin or not
function checkAdmin(req, res, next) {
  if (req?.session?.user?.admin) next();
  else {
    console.log("not allowed");
    res.redirect(301, "/authorization");
  }
}

// middleware to check if user is logged in
function checkAuth(req, res, next) {
  if (req?.session?.user) next();
  else {
    console.log("not logged in");
    res.redirect("/");
  }
}

// route that supply all the data the dashboard needs when the first page loads
router.get("/", checkAuth, (req, res) => {
    if (req?.session?.user?.school) {
      
      // get user and school information from the database
      db.query(
        `SELECT * FROM school_cred WHERE school = '${req?.session?.user?.school}' AND admin = '${req?.session?.user?.user}'`
      )
        .then((data) => {

          // set the admin variable to true if user is an admin and return response to the frontend

          data.length > 0 ? (admin = true) : (admin = false);
          req.session.user.admin = admin;
          res.json({
            status: true,
            creds: req?.session?.user,
          });
        })
        .catch((err) => {
          logErr(
            err,
            __filename,
            new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
          );
          res.json({
            status: "something",
            message: "Try again or refresh server",
          });
        });

        // scheduler function to run once every single day
      scheduler(db, req);
    } else {
      console.log("session", req?.session?.user?.school);
      res.json({
        status: false,
        message: "Not logged in",
      });
    }
  })

  // using express "use" method to like the routers to their specific route 
  .use("/dashboard", checkAuth, dashboardRoute)
  
  .use("/students", checkAuth, studentsRoute)
  
  .use("/payment", checkAuth, paymentRoute)
  
  .use("/users", [checkAuth, checkAdmin], usersRoute)
  
  .use("/settings", [checkAuth, checkAdmin], settingsRoute)
  
  .use("/fees", checkAuth, feesRoute)
  
  .use("/records", checkAuth, recordsRoute);

module.exports = router;