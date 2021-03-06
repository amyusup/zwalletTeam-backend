const express = require("express");
const router = express.Router();
const { body } = require("express-validator");
const { getAllTopup } = require("../controllers/topup");
const { verifyAdmin } = require("../middlewares/auth");
const {
  uploadImage,
  transferBalance,
  findUsersData,
  createPin,
  checkPin,
  getUserByToken,
  getHistoryById,
  addPhoneNumber,
  deletePhoneNumber,
  changePassword,
  getAllHistoryByUserId,
  getPaymentToken,
  getUserById,
  getAllUsersData,
  processPayment,
  getHistoryPayment,
} = require("../controllers/users");

const validatePin = [
  body("pin")
    .isLength({ min: 6, max: 6 })
    .withMessage("PIN must be 6 character"),
];

const validateTransfer = [
  body("id").not().isEmpty().withMessage("ID Cannot be empty"),
  body("total").not().isEmpty().withMessage("Total Cannot be empty"),
  body("note").not().isEmpty().withMessage("Note Cannot be empty"),
  ...validatePin,
];

const validateAddPhone = [
  body("phone").not().isEmpty().withMessage("Phone Cannot be empty"),
];

const validatePassword = [
  body("password").not().isEmpty().withMessage("Password cannot be null"),
  body("passwordNew")
    .not()
    .isEmpty()
    .withMessage("Password New cannot be null"),
];

const validateAmount = [
  body("amount")
    .not()
    .isEmpty()
    .withMessage("Amount cannot be null")
    .isNumeric()
    .withMessage("Amount must be number string")
]

router
  .get("/history/topup", getHistoryPayment)
  .get("/history/:id", getHistoryById)
  .get("/histories", getAllHistoryByUserId)
  .get("/detail", getUserByToken)
  .get("/search", findUsersData)
  .get("/guide-topup", getAllTopup)
  .get("/:id", getUserById)
  .get("/", getAllUsersData)
  .post("/photo", uploadImage)
  .post("/get-token", validateAmount, getPaymentToken)
  .post("/transfer", validateTransfer, transferBalance)
  .post("/process-topup", processPayment)
  .patch("/phone", validateAddPhone, addPhoneNumber)
  .patch("/create_pin", validatePin, createPin)
  .patch("/check-pin", validatePin, checkPin)
  .patch("/password", validatePassword, changePassword)
  .delete("/phone", deletePhoneNumber)
module.exports = router;
