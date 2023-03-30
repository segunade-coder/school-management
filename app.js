// require important modules
const path = require("path");
const express = require("express");
const app = express(); // server module
const conn = require("./conn&apis/conn");
const session = require("express-session");
const server = require("http").createServer(app);
const chalk = require("chalk");
const os = require("os");
let WebSok = require("./conn&apis/webSok");
const { exec } = require("child_process");
const MysqlStore = require("express-mysql-session")(session);
const cors = require("cors");
const PORT = process.env.PORT || 5000;
const sessionStore = new MysqlStore({
 database: "sql12608320",
  host: "sql12.freesqldatabase.com",
  user: "sql12608320",
  password: "CjAnUskEsJ",
  port: "3306",
  clearExpired: true,
  checkExpirationInterval: 900000,
  expiration: 86400000 * 20,
  createDatabaseTable: true,
  connectionLimit: 1,
  endconnectionOnClose: true,
  charset: "utf8mb4_bin",
  schema: {
    tableName: "sessions",
    columnNames: {
      session_id: "session_id",
      expires: "expires",
      data: "data",
    },
  },
});
// chech if network is available
let wifiConected;
const addresses = [];
let mainAddress = "";
// get arrays of network available.
const interfaces = os.networkInterfaces();
// loop through the array of etworks
for (const name of Object.keys(interfaces)) {
  for (const interface of interfaces[name]) {
    // search for address that is not internak
    if (interface.family === "IPv4" && !interface.internal) {
      // push into address
      addresses.push(interface.address);
      mainAddress = addresses;
      wifiConected = true;
      break;
    }
  }
}
const regRouter = require("./Routers/regRouter");
const loginRouter = require("./Routers/loginRouter");
const mainRouter = require("./Routers/mainRouter");
// url module
//let origins = ["http://localhost:3000", "http://localhost:5000"];
if (wifiConected) {
  // add network adress to origin to prevent cors error
  if (mainAddress.length !== 0) {
    mainAddress.map((address) => origins.push(`http://${address}:${PORT}`));
  }
}
const io = require("socket.io")(server, {
  cors: {
    origin: origins,
  },
});

//app.set("trust proxy", 1);
app.use(express.static(path.resolve(__dirname, "./build")));
app.use(
  cors({
    origin: origins,
    credentials: true,
  })
);
app.use(
  session({
  resave: false,
  saveUninitialized: false,
  secret: "long_randomly_generated_string",
  key: "unique_key_value",
  store: sessionStore,
  cookie: {
    httpOnly: true,
    maxAge: 20 * 24 * 60 * 60 * 1000,
    sameSite: "none",
    secure: true,
  },
});

);
WebSok(io, conn);

app.use(express.json());
app.use("/reg", regRouter);
app.use("/login", loginRouter);
app.use("/main", mainRouter);

app.get("/logout", (req, res) => {
  req.session.destroy((err) => {
    if (err) {
      return console.error(err);
    }
    console.log("The session has been destroyed!");
    return res.json({
      status: true,
      logout: true,
    });
  });
});

app.get("*", (req, res) => {
  res.sendFile(path.resolve(__dirname, "./build", "index.html"));
});
server.listen(PORT, (err) => {
  if (err) throw err;
  console.clear();
  console.log(chalk.green(`compiled succesfully!`));
  console.log("");
  console.log(`You can view app in the browser.`);
  console.log("");
  console.log(
    chalk.whiteBright(
      ` ${
        mainAddress.length !== 0 ? "Local:            " : ""
      }http://localhost:${PORT}`
    )
  );
  mainAddress.length !== 0 &&
    console.log(
      chalk.whiteBright(
        ` On Your Network:  ${
          mainAddress.length !== 0 &&
          mainAddress?.map(
            (address, index) =>
              `http://${address !== "" ? address : ""}:${PORT}`
          )
        }`
      )
    );
  mainAddress.length !== 0 && console.log("");
  console.log(`webpack Compiled ${chalk.green("succesfully")}`);
  console.log("");

  let command;
  command = `explorer "http://localhost:${PORT}/"`;
  exec(command);
});
