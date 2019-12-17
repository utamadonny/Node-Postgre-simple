// Inisialisasi ========================================================
const express = require("express");
const path = require("path");
const ejs = require("ejs");
const { Pool } = require('pg')

const app = express();

//server
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "Views"));
app.use(express.static(path.join(__dirname, "public")));
app.use(express.urlencoded({ extended: true }));

//Server database PG
const pool = new Pool({
    user: "postgres",
    host: "localhost",
    database: "Perpustakaan",
    password: "postgre",
    port: 5432
  });
  console.log("Successful connection to the database");

app.listen(3000, () => { {
  console.log("Server started (http://localhost:3000/) !");
}});

// Tampilan =============================================================
// ROOT
app.get("/", (req, res) => { {
 // res.send ("Good Morning, Believer Apes");
  res.render("index");
}});

//ABOUT
app.get("/about", (req, res) => {
    res.render("about");
  });

//DATA
app.get("/data", (req, res) => {
    const test = {
      title: "Test",
      items: ["one", "two", "three"]
    };
    res.render("data", { model: test });
  });

// BUKU
app.get("/books", (req, res) => {
    const sql = "SELECT * FROM books ORDER BY title"
    pool.query(sql, [], (err, result) => {
      if (err) {
        return console.error(err.message);
      }
      res.render("books", { model: result.rows });
    });
  });

//Edit Route // GET /edit/5 ==============================================
app.get("/edit/:id", (req, res) => {
  const id = req.params.id;
  const sql = "SELECT * FROM books WHERE book_id = $1";
  pool.query(sql, [id], (err, result) => {
    if (err) {
      return console.error(err.message);
    }
    res.render("edit", { model: result.rows[0] });
  });
});

// POST /edit/5
app.post("/edit/:id", (req, res) => {
  const id = req.params.id;
  const book = [req.body.title, req.body.author, req.body.comments, id];
  const sql = "UPDATE Books SET Title = $1, Author = $2, Comments = $3 WHERE (book_id = $4)";
  pool.query(sql, book, (err, result) => {
    if (err) {
      return console.error(err.message);
    }
    res.redirect("/books");
  });
});

// GET /create ==========================================================
app.get("/create", (req, res) => {
  res.render("create", { model: {} });
});

// POST /create
app.post("/create", (req, res) => {
  const sql = "INSERT INTO Books (Title, Author, Comments) VALUES ($1, $2, $3)";
  const book = [req.body.title, req.body.author, req.body.comments];
  pool.query(sql, book, (err, result) => {
    if (err) {
      return console.error(err.message);
    }
    res.redirect("/books");
  });
});

// GET /delete/5 ===========================================================
app.get("/delete/:id", (req, res) => {
  const id = req.params.id;
  const sql = "SELECT * FROM Books WHERE Book_ID = $1";
  pool.query(sql, [id], (err, result) => {
    if (err) {
      return console.error(err.message);
    }
    res.render("delete", { model: result.rows[0] });
  });
});

// POST /delete/5
app.post("/delete/:id", (req, res) => {
  const id = req.params.id;
  const sql = "DELETE FROM Books WHERE Book_ID = $1";
  pool.query(sql, [id], (err, result) => {
    // if (err) ...
    res.redirect("/books");
  });
});