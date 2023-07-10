// require important modules
const path = require("path");
const express = require("express");
const app = express(); // server module
const conn = require("./conn&apis/conn");
const session = require("express-session");
const server = require("http").createServer(app);
const chalk = require("chalk");
let WebSok = require("./conn&apis/webSok");
const MysqlStore = require("express-mysql-session")(session);
const cors = require("cors");
const PORT = process.env.PORT || 5000;
const {host, user, password, database_name} = require("./conn&apis/infos")
const sessionStore = new MysqlStore({
 host,
 user,
 password,
 database_name,
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
const regRouter = require("./Routers/regRouter");
const loginRouter = require("./Routers/loginRouter");
const mainRouter = require("./Routers/mainRouter");
// url module
let origins = ["https://paymof.onrender.com/"];

const io = require("socket.io")(server, {
  cors: {
    origin: origins,
  },
});

app.set("trust proxy", 1);
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
    secret: "This_it_secret_$PVSG@1ZsF9l_",
    key: "paymof",
    store: sessionStore,
    cookie: {
      httpOnly: true,
      maxAge: 20 * 24 * 60 * 60 * 1000,
      sameSite: "none",
      secure: true,
    },
  })

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

});

