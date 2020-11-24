const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
var admin = require("firebase-admin");
var serviceAccount = require("./src/services/zwallet-amy-firebase-adminsdk-sdg8q-48576efe28.json");

// //socket
// const server = require('http').createServer(express());
// const io = require('socket.io')(server);

// io.on("connection", (socket) => {
//   console.log("socket connect")
//   socket.emit("refresh", "refresh");
// });

// server.listen(4444);

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: 'https://zwallet-amy.firebaseio.com'
});

// var registrationToken = "<registration token goes here>";

require("dotenv").config();
require("./src/configs/database").connect((err) =>
  console.log(err ? err : `Database working on ${process.env.DB_HOSTNAME}`)
);

// Middlewares
const { statusNotFound } = require("./src/middlewares/serverHandler");
const { verify, verifyAdmin } = require("./src/middlewares/auth");

// Routers
const indexRouter = require("./src/routes/index");
const authRouter = require("./src/routes/auth");
const usersRouter = require("./src/routes/users");
const adminRouter = require("./src/routes/admin");
const { midtransPaymentProcess } = require("./src/controllers/users");
// const topupRouter = require('./src/routes/topup')
// const transferRouter = require('./src/routes/transfer')

const app = express();
const prefix = process.env.PREFIX_URL || "/api/v1";

app.use(express.static("public"));
app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use("*", cors());
app.use(`${prefix}/`, indexRouter);
app.use(`${prefix}/auth`, authRouter);
app.use(`${prefix}/users`, verify, usersRouter);
app.use(`${prefix}/admin`, verifyAdmin, adminRouter);
app.post(`${prefix}/midtrans/payment-process`, midtransPaymentProcess)

// app.use(`${prefix}/topup`, verifyAdmin, topupRouter)
// app.use(`${prefix}/transfer`, transferRouter)

// Handle Error Notfound
app.use(statusNotFound);

module.exports = app;
