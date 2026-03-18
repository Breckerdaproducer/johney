require("dotenv").config();
const express = require("express");
const cors = require("cors");
const app = express();
app.use(express.json());
const pool = require("./db/db");
const path = require("path");

app.use(cors());
app.use(express.static(path.join(__dirname, "public")));
const port = process.env.PORT;
// get a single user
app.get("/users/:id", async (req, res) => {
  const { id } = req.params;

  if (!id) {
    return res.status(401).json({ success: false, message: "failed" });
  }
  const query = `SELECT * FROM users WHERE id = $1`;

  const response = await pool.query(query, [id]);

  if (!response || response.rowCount === 0) {
    return res.json({ success: false, message: "Users not found" });
  }

  //   const ip = req.ip;
  return res.json({
    success: true,
    user: response.rows[0],
    total: response.rowCount,
  });
});
// get all users from db
app.get("/users", async (req, res) => {
  const query = `SELECT * FROM users ORDER BY date_time DESC`;
  const response = await pool.query(query);

  if (!response || response.rowCount === 0) {
    return res.json({ success: false, message: "Users not found" });
  }
  return res.json({
    success: true,
    user: response.rows,
    total: response.rowCount,
  });
});

app.delete("/users", async (req, res) => {
  const { id } = req.body;

  if (!id) {
    return res.status(401).json({ success: false, message: "Id is required" });
  }

  const query = `DELETE FROM users WHERE id = $1`;

  try {
    const response = await pool.query(query, [id]);

    return res.json({ success: true, message: "deleted successfully" });
  } catch (e) {
    return res
      .status(401)
      .json({ success: false, message: "Failed to delete" });
  }
});

app.post("/users", async (req, res) => {
  const { name, sex, email } = req.body;

  if (!name || name === "") {
    return res
      .status(401)
      .json({ success: false, message: "Name is required" });
  }
  if (!sex || sex === "") {
    return res.status(401).json({ success: false, message: "sex is required" });
  }
  if (!email || email === "") {
    return res
      .status(401)
      .json({ success: false, message: "email is required" });
  }
  const query = `INSERT INTO users (full_name, sex, email, date_time) VALUES ($1,$2,$3,NOW())`;
  try {
    const response = await pool.query(query, [name, sex, email]);
    return res.json({ success: true, message: "submitted succesfully" });
  } catch (e) {
    return res
      .status(401)
      .json({ success: false, message: `failed error: ${e}` });
  }
});

app.listen(port, () => {
  console.log(`Listerning to port ${port}`);
});
