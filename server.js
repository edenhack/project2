const express = require("express");
require(__dirname)
const path = require('path')

const PORT = process.env.PORT || 8080;

const app = express();

app.use(express.static("public"));

app.listen(PORT, function() {
    console.log("Server listening on: http://localhost:" + PORT);
  });

app.get('/', function(req, res){
    res.sendFile(path.join(__dirname, '../public', 'index.html'));
  })