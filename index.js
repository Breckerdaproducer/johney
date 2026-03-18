require("dotenv").config();
const express = require("express");
const cors = require("cors");
const app = express();
app.use(express.json());
const pool = require("./db/db");

app.use(cors());
const port = process.env.PORT;

app.get("/", async (req, res) => {
  res.send("Backend is working");
});

app.listen(port, () => {
  console.log(`Listerning to port ${port}`);
});
