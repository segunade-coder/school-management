const express = require("express");
const router = express.Router();
const conn = require("../conn&apis/conn"); // connection module made to apache server
const dbQueries = require("../conn&apis/mysqlApi"); // mysql api module
const db = new dbQueries(conn);
const logErr = require("../conn&apis/logErrors");
const mysqldump = require("mysqldump");
const path = require('path')
const { exec } = require("child_process");
require("../conn&apis/prototypes");

router.get("/", (req, res) => {
  if (req?.session?.user) {
    db.getAll(`${req?.session?.databaseName}_settings`)
      .then((data) => {
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
          message: "something went wrong. Try again",
        });
      });
  } else {
    res.json({
      status: false,
      message: "Not logged in",
    });
  }
});
router.post("/edit-current-session", (req, res) => {
  if (req?.session?.user) {
    let { value } = req.body;
    if (value) {
      db.updateByColumnName(
        "current_session",
        value,
        `${req?.session?.databaseName}_settings`
      )
        .then((data) => {
          res.json({
            status: true,
            message: "Operation successful",
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
});
router
  .post("/edit-current-term", (req, res) => {
    if (req?.session?.user) {
      let { value } = req.body;
      if (value) {
        db.updateByColumnName(
          "current_term",
          value,
          `${req?.session?.databaseName}_settings`
        )
          .then((data) => {
            res.json({
              status: true,
              message: "Operation successful",
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
  .post("/save", (req, res) => {
    if (req?.session?.user?.school) {
      let { data, name } = req.body;
      let newdata;
      if (data) {
        if (
          name == "sessions" ||
          name == "terms" ||
          name == "payment_for" ||
          name == "payment_method"
        ) {
          newdata = data.join(",");
        } else {
          newdata = JSON.stringify(data);
        }
        newdata &&
          db
            .updateByColumnName(
              name,
              `${newdata}`,
              `${req?.session?.databaseName}_settings`
            )
            .then((response) => {
              return res.json({
                status: true,
                message: "Operation succesful",
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
    } else {
      res.json({
        status: false,
        message: "not logged in",
      });
    }
  })
  .post("/update-class", (req, res) => {
    let { prev, newCls, classes, fees } = req?.body;
    if ((prev && newCls, classes)) {
      classes = JSON.stringify(classes);
      fees = JSON.stringify(fees);
      db.query(
        `UPDATE ${req?.session?.databaseName}_payment_record SET class = "${newCls}" WHERE class = "${prev}"`
      )
        .then((data) => {
          db.query(
            `UPDATE ${req?.session?.databaseName}_students SET class = "${newCls}" WHERE class = "${prev}"`
          )
            .then((data) => {
              db.updateByColumnName(
                "classes",
                `${classes}`,
                `${req?.session?.databaseName}_settings`
              )
                .then((data) => {
                  res.json({
                    status: true,
                    message: "Edit Succesful",
                  });
                })
                .catch((err) => {
                  console.log(err);
                  return res.json({
                    status: false,
                    message: "Something went wrong. Try refreshing",
                  });
                });
            })
            .catch((err) => {
              console.log(err);
            });
        })
        .catch((err) => {
          console.log(err);
          return res.json({
            status: false,
            message: "Something went wrong. Try refreshing",
          });
        });
    }
  })
  .get("/backup", (req, res) => {
    let command = `cd ${path.join(__dirname, '/backups')} && touch backup_database.sql`
    exec(command)
    mysqldump({
      connection: {
        host: "localhost",
        user: "root",
        password: "",
        port: "3306",
        database: "paymof",
      },
      dumpToFile: `${path.join(__dirname, '/backups/')}backup_database.sql`,
    })
      db.updateByColumnName('backup_date', `${new Date(Date.now())}`, `${req?.session?.databaseName}_settings`)
      .then(data => {
        res.json({
          status:true,
          message:'Backup Succesful'
        })
      }).catch((err) => {
        console.log(err);
        return res.json({
          status: false,
          message: "Something went wrong. Try refreshing",
        });
      });
   
  })
  .get("/backup-record", (req, res) => {
    db.query(
      `SELECT backup_date FROM ${req?.session?.databaseName}_settings WHERE id = 1`
    )
      .then((data) => {
        return res.json({
          status: true,
          message: data,
        });
      })
      .catch((err) => {
        console.log(err);
        return res.json({
          status: false,
          message: "Something went wrong. Try refreshing",
        });
      });
  });

module.exports =  router;