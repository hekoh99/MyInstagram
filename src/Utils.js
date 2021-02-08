require("dotenv").config();
import { adjectives, nouns } from "./word";
import nodemailer from "nodemailer";
import sgTransport from "nodemailer-sendgrid-transport";
import jwt from "jsonwebtoken";

export const generateSecret = () => {
  const randomIndex_a = Math.floor(Math.random() * adjectives.length);
  const randomIndex_n = Math.floor(Math.random() * nouns.length);
  return `${adjectives[randomIndex_a]} ${nouns[randomIndex_n]}`;
};

const sendEmail = (email) => {
  const options = {
    auth: {
      api_key: process.env.SENDGRID_PASSWORD,
    },
  };
  const client = nodemailer.createTransport(sgTransport(options));
  return client.sendMail(email);
};

export const sendSecretEmail = (addr, secret) => {
  const email = {
    from: "PrismaGram <haeun.ko99@gmail.com>",
    to: addr,
    subject: "login secret for prisma test :)",
    html: `your login secret is <b>${secret}</b>. <br/> please copy-paste to login`,
  };
  return sendEmail(email);
};

export const generateToken = (id) => jwt.sign({ id }, process.env.JWT_SECRET);
