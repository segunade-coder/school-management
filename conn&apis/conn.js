const mysql = require("mysql");
const logErr = require("./logErrors");
// mysql apache credentials for connnecting to xampp without database
const db_cred = {
 host: "31.22.4.18",
 user: "ushmoney_jeo_segun",
 password: "ushTeam123!",
 database: "ushmoney_segun",
};

// create a database connection with the credentials above
const connection = mysql.createConnection(db_cred);

//connect to the apache server
connection.connect((err) => {
  if (err) {
    logErr(
      "Error connecting to Apache Server..",
      __filename,
      new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
    );
    console.log(err)
  } else {
    console.log("connected to apache database...");

    // let query_string = `CREATE TABLE sessions (session_id VARCHAR(20) NOT NULL, expires VARCHAR(80) NOT NULL, data VARCHAR(80) NOT NULL)`;
    // connection.query('SHOW TABLES LIKE "sessions"', (err, data) => {
    //   if (err) {
    //     console.log(err);
    //     return;
    //   } else {
    //     if(data.length === 0){
    //       connection.query(query_string, (err, data) => {
    //         if (err) {
    //           console.log(err);
    //           return ;
    //         }
    //         console.log("created session ");
    //       });
    //     }
    //   }
    // });
  }
});

// export the connection
module.exports = connection;
