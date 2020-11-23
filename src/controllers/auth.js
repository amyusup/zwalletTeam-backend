const { compareSync, genSaltSync, hashSync } = require("bcryptjs");
const { validationResult } = require("express-validator");
const { sign } = require("jsonwebtoken");
const { insertUser, getUserByEmail, updateUser } = require("../models/users");
const {
  resSuccess,
  resFailure,
  BADREQUEST,
  UNAUTHORIZED,
  CREATED,
  INTERNALSERVERERROR,
} = require("../helpers/status");

class Auth {
  async loginUser(req, res) {
    const { email, password: passwordBody, device } = req.body;
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty())
        return resFailure(res, BADREQUEST, errors.array()[0].msg, {});

      const checkEmail = await getUserByEmail(email);
      if (!checkEmail.length)
        return resFailure(
          res,
          UNAUTHORIZED,
          "Email and Password incorrect",
          {}
        );

      const { password, role, id } = checkEmail[0];
      if (device !== checkEmail[0].device && checkEmail[0].device !== "") {
        return resFailure(
          res,
          BADREQUEST,
          "Your account has been logged in using another device, please log out and try to log in again",
          {}
        );
      } else if (checkEmail[0].device === "") {
        await updateUser({ device: device }, checkEmail[0].id);
      }
      const compare = compareSync(passwordBody, password);
      if (!compare)
        return resFailure(
          res,
          UNAUTHORIZED,
          "Email and Password incorrect",
          {}
        );

      const data = { role, token: sign({ id, role }, process.env.SECRET) };
      return resSuccess(res, CREATED, "Login succesfully", data);
    } catch (e) {
      return resFailure(res, INTERNALSERVERERROR, e.message, {});
    }
  }

  async registerUser(req, res) {
    const { name, email, password, deviceToken } = req.body;
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty())
        return resFailure(res, BADREQUEST, errors.array()[0].msg, {});

      let checkEmail = await getUserByEmail(email);
      if (checkEmail.length)
        return resFailure(res, UNAUTHORIZED, "Email has been taken", {});

      const register = await insertUser({
        name: name,
        email: email,
        password: hashSync(password, genSaltSync(10)),
        // device: deviceToken,
      });

      const data = {
        role: "user",
        token: sign(
          { id: register.insertId, role: "user" },
          process.env.SECRET
        ),
      };
      return resSuccess(res, CREATED, "Register succesfully", data);
    } catch (e) {
      return resFailure(res, INTERNALSERVERERROR, "Internal Server Error", {});
    }
  }

  async logoutUser(req, res) {
    const { email } = req.body;
    console.log(req.body)
    try {
      const checkEmail = await getUserByEmail(email);
      if (!checkEmail.length)
        return resFailure(
          res,
          UNAUTHORIZED,
          "Failed to logout, there is something wrong.",
          {}
        );

      await updateUser({ device: '' }, checkEmail[0].id);

      return resSuccess(res, CREATED, "Logout succesfully", {});
    } catch (e) {
      return resFailure(res, INTERNALSERVERERROR, e.message, {});
    }
  }

  async forgotPassword(req, res) {
    const { email, password, repeatPassword } = req.body;
    console.log(req.body)
    try {
      const checkEmail = await getUserByEmail(email);
      if (!checkEmail.length)
        return resFailure(res,UNAUTHORIZED,"Email Not Found, try again.",{});
      // if(password != repeatPassword)
      //   return resFailure(res,BADREQUEST,"Password not match.",{});

      await updateUser({ password: hashSync(password, genSaltSync(10)) }, checkEmail[0].id);

      return resSuccess(res, CREATED, "Succesfully change password ", {});
    } catch (e) {
      return resFailure(res, INTERNALSERVERERROR, e.message, {});
    }
  }
}

module.exports = new Auth();
