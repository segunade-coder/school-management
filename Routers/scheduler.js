// import cron module for scheduling task to run on a specific time
const cron = require("node-cron");

// set variable of crodrun to '0'. specifies the amount of time the task has run
let crodrun = 0;
let keyidArr = [];

// create a function scheduler that takes the custom mysql api module and request object as parameters
let scheduler = (db, req) => {

  // array for the months of a year
  let Months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  // schedule task to run every 8:10am of every day 
  cron.schedule("10 8 * * *", () => {

    // chech the variable crodrun to know the amount of time the task has run
    if (crodrun === 0) {
      console.log("checking for expired balance date");

      // if crodrun = "0", increment crodrun by 1. 
      ++crodrun;

      // create a function to check expired dates of payment 
      let checkFnc = () => {

        // fetch already existing notification and filter new notification to avoid duplicate notification
        db.query(
          `SELECT payment_id FROM ${req?.session?.databaseName}_notifications`
        )
          .then((noti) => {
            noti.forEach((element) => {
              keyidArr.push(element.payment_id);
            });
          })
          .catch((err) => console.log(err));
        db.query(
          `SELECT name, balance_date, keyid FROM ${req?.session?.databaseName}_payment_record WHERE balance_date < CURRENT_TIMESTAMP AND balance > 0 IN (SELECT MAX(id) FROM ${req?.session?.databaseName}_payment_record GROUP BY keyid) GROUP BY keyid`
        )
          .then((users) => {

            // create inner function to create notification 
            let insertFnc = (arr) => {

              // loop through and filter out notification that already exist.
              arr.forEach((user) => {
                if (keyidArr.includes(user.keyid)) {
                  console.log(`user ${user.name} exist`);
                } else {

                  // create notification text
                  let title = `Balance date expired.`;
                  let text = `The balance date of ${user.name} expired on ${
                    (new Date(user.balance_date) &&
                      new Date(user.balance_date).getDate()) > 3 &&
                    new Date(user.balance_date).getDate() + "th"
                  } of ${
                    (new Date(user.balance_date) &&
                      Months[new Date(user.balance_date).getMonth()]) ||
                    ""
                  }, ${
                    (new Date(user.balance_date) &&
                      new Date(user.balance_date).getFullYear()) ||
                    ""
                  }`;
                  payment_id = user.keyid;
                  if (title == "" || text == "" || payment_id == "") {
                    return;
                  } else {

                    // insert notifications into the database. 
                    db.insert(`${req?.session?.databaseName}_notifications`, {
                      title: title,
                      text: text,
                      payment_id: payment_id,
                    })
                      .then((data) => {
                        console.log("success");
                        checkFnc();
                      })
                      .catch((err) => console.log(err));
                  }
                }
              });
            };

            insertFnc(users);
          })
          .catch((err) => console.log(err));
      };
      checkFnc();
    }
  });

};

module.exports = scheduler;
