const express = require("express");
const router = express.Router();
const conn = require("../conn&apis/conn"); // connection module made to apache server
const dbQueries = require("../conn&apis/mysqlApi"); // mysql api module
const db = new dbQueries(conn);
require("../conn&apis/prototypes");
const logErr = require("../conn&apis/logErrors");

router
  .post("/add-student-upload", (req, res) => {
    let { header, file } = req?.body;
    if (header?.length === 0 || file?.length === 0) {
      return res.json({
        status: false,
        message: "Try Again",
      });
    } else {
      let formattedHeader = header.join(", ");
      let formattedFile = [];
      file.forEach((element) => {
        let newObj = [];
        element.forEach((innerElement) => {
          for (let key in innerElement) {
            newObj.push(`"${innerElement[key]}"`);
          }
        });
        let joined = newObj.join(", ");
        let newFile = `(${joined})`;
        formattedFile.push(newFile);
      });
      db.query(
        `INSERT INTO ${req?.session?.databaseName}_students (${formattedHeader}) VALUES ${formattedFile}`
      )
        .then((data) => {
          return res.json({
            status: true,
            message: "Student added successfully!",
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
  })
  .post("/add-student", (req, res) => {
    let { name, filteredClass, guardianName, tel } = req?.body;
    if (filteredClass === "" || name === "" || guardianName === "") {
      return res.json({
        status: false,
        message: "Enter necessary fields",
      });
    } else {
      db.insert(`${req?.session?.databaseName}_students`, {
        name: name?.toLowerCase(),
        class: filteredClass?.toLowerCase(),
        guardian_name: guardianName?.toLowerCase(),
        phone_number: tel,
        status: "active",
      })
        .then((data) => {
          return res.json({
            status: true,
            message: "Student added successfully!",
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
  })
  .post("/find-name", (req, res) => {
    let { name, condition } = req.body;
    if (!condition) {
      if (req?.session?.user) {
        db.query(
          `SELECT * FROM ${
            req?.session?.databaseName
          }_students WHERE ( name LIKE "%${name.toLowerCase()}%" OR adm_no = "${name}" OR guardian_id = "${name}") ORDER BY created_at`
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
    } else {
      let { filterArray } = req.body;
      let sqlqry = [];
      let sqlstring = "";
      // console.log(filterArray)
      for (filter of filterArray) {
        for (let key in filter) {
          sqlqry.push(`${key} LIKE "%${filter[key].trim().toLowerCase()}%"`);
          sqlqry.push("AND");
        }
      }
      if (sqlqry[sqlqry.length - 1] == "AND") sqlqry.pop();
      sqlstring = sqlqry.join(" ");
      if (sqlstring) {
        let qry = `SELECT id, name, class FROM ${
          req?.session?.databaseName
        }_students WHERE name LIKE "%${name.toLowerCase()}%" AND ${sqlstring} ORDER BY created_at`;
        db.query(qry)
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
              message: "something went wrong. Try refreshing or restarting",
            });
          });
      }
    }
  })
  .post("/find-g-name", (req, res) => {
    let { name } = req.body;
    if (req?.session?.databaseName) {
      db.query(
        `SELECT guardian_name, guardian_id FROM ${
          req?.session?.databaseName
        }_students WHERE (guardian_name LIKE "%${name.toLowerCase()}%" OR guardian_id = "%${name.toLowerCase()}%") GROUP BY guardian_name ORDER BY created_at`
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
  .post("/findId", (req, res) => {
    let { status, name, searchId } = req.body;
    if (status) {
      db.query(
        `SELECT * FROM ${req?.session?.databaseName}_students WHERE id = "${searchId}" ORDER BY created_at`
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
    } else {
      db.query(
        `SELECT * FROM ${
          req?.session?.databaseName
        }_students WHERE name LIKE "%${name.toLowerCase()}%"`
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
  .post("/find-guardian", (req, res) => {
    let { searchId } = req.body;
    db.query(
      `SELECT * FROM ${req?.session?.databaseName}_students WHERE guardian_id = "${searchId}" ORDER BY created_at`
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
  })
  .get("/class-view", (req, res) => {
    let { limit, page, filteredClass } = req.query;
    const offset = (page - 1) * limit;
    let total = 0;
    db.query(
      `SELECT COUNT(*) as total FROM ${
        req?.session?.databaseName
      }_students WHERE class = "${filteredClass?.trim().toLowerCase()}"`
    )
      .then((data) => (total = data[0].total))
      .catch((err) => console.log(err));
    db.query(
      `SELECT * FROM ${
        req?.session?.databaseName
      }_students WHERE class = "${filteredClass
        ?.trim()
        .toLowerCase()}" ORDER BY name LIMIT ${limit} OFFSET ${offset}`
    )
      .then((data) => {
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
  .get("/students", (req, res) => {
    let { limit, page } = req.query;
    const offset = (page - 1) * limit;
    let total = 0;
    db.query(
      `SELECT COUNT(*) as total FROM ${req?.session?.databaseName}_students`
    )
      .then((data) => (total = data[0].total))
      .catch((err) => console.log(err));
    db.query(
      `SELECT * FROM ${req?.session?.databaseName}_students ORDER BY id LIMIT ${limit} OFFSET ${offset}`
    )
      .then((data) => {
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
  .get("/get-view", (req, res) => {
    let { key } = req.query;
    if (key) {
      db.getByColumnName(`id`, key, `${req?.session?.databaseName}_students`)
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
            message: "something went wrong. Try refreshing or restarting",
          });
        });
    }
  })
  .get("/delete", (req, res) => {
    let { key } = req.query;
    if (key) {
      db.query(
        `DELETE FROM ${req?.session?.databaseName}_students WHERE id = '${key}'`
      )
        .then((data) => {
          return res.json({
            status: true,
            message: "Student deleted succesfully",
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
  })
  .post("/save-edit", (req, res) => {
    let {
      name,
      newClass,
      address,
      guardianName,
      tel,
      guardianID,
      studentAdm,
      status,
      id,
      discounts,
    } = req.body;
    if (name === "" || newClass === "" || guardianName === "") {
      res?.json({
        status: false,
        message: "Enter all necessary fields",
      });
    } else {
      let staVal = "";
      status === true ? (staVal = "active") : (staVal = "left");
      db.query(
        `UPDATE ${req?.session?.databaseName}_students SET name = '${name
          ?.toLowerCase()
          ?.trim()}', class = '${newClass
          ?.toLowerCase()
          ?.trim()}', guardian_name = '${guardianName
          ?.toLowerCase()
          ?.trim()}', address = '${address
          ?.toLowerCase()
          ?.trim()}', discounts = '${discounts
          ?.toLowerCase()
          ?.trim()}', phone_number = '${tel}', guardian_id = '${guardianID?.trim()}', adm_no = '${studentAdm?.trim()}', status = '${staVal
          ?.toLowerCase()
          ?.trim()}' WHERE id = ${id}`
      )
        .then((data) => {
          return res.json({
            status: true,
            message: "Student updated Succesfully",
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
  })
  .post("/promote", (req, res) => {
    let { ids, promoteClass, receipt, term, session } = req.body;
    if (ids.length === 0 || promoteClass === "") {
      return res?.json({
        status: false,
        message: "Nothing to Promote",
      });
    } else {
      let conn = db.returnConnection();
      if (!receipt) {
        conn.query(
          `UPDATE ${req?.session?.databaseName}_students SET class = "${promoteClass}" WHERE id IN (?) `,
          [ids],
          (err, data) => {
            if (err) {
              res.json({
                status: false,
                message: "Something went wrong. Try refreshing",
              });
              throw err;
            }
            res?.json({
              status: true,
              message: "Students Promoted Succesfully",
            });
          }
        );
      } else {
        conn.query(
          `UPDATE ${req?.session?.databaseName}_students SET class = "${promoteClass}" WHERE id IN (?) `,
          [ids],
          (err, data) => {
            if (err) {
              res.json({
                status: false,
                message: "Something went wrong. Try refreshing",
              });
              throw err;
            }
            conn.query(
              `SELECT name FROM ${req?.session?.databaseName}_students WHERE class = "${promoteClass}" AND id IN (?) `,
              [ids],
              (err2, data2) => {
                if (err2) {
                  res.json({
                    status: false,
                    message: "Something went wrong. Try refreshing",
                  });
                  throw err2;
                }
                let names = data2?.map((name) => name?.name);
                conn.query(
                  `UPDATE ${req?.session?.databaseName}_payment_record SET class = "${promoteClass}" WHERE term = ? AND session = ? AND name IN (?)`,
                  [term, session, names],
                  (error, data) => {
                    if (error) {
                      res.json({
                        status: false,
                        message: "Something went wrong. Try refreshing",
                      });
                      throw error;
                    }
                    res?.json({
                      status: true,
                      message: "Students Promoted Succesfully",
                    });
                  }
                );
              }
            );
          }
        );
      }
    }
  });
module.exports = router;
