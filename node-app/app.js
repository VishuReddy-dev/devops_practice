const express = require("express");

const app = express();

app.get("/", (req, res) => {
    res.send("Welcome to DevOps Lab");
});

app.get("/version", (req, res) => {
    res.send("Version 1.0");
});

app.listen(3000, () => {
    console.log("Application Started");
});
