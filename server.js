const express = require("express");
const path = require('path')
//require('dotenv').config()
const { join } = require("path");
const db = require ("./models");

const PORT = process.env.PORT || 8080;

const app = express();

app.use(express.static("public"));

require("./routes/html-routes")(app);

var apiRoutes = require("./routes/api-routes");
app.use(apiRoutes);

app.get("/auth_config.json", (req, res) => {
  res.sendFile(join(__dirname, "./config/auth_config.json"));
});

app.get("/*", (_, res) => {
  res.sendFile(join(__dirname, "./public/index.html"));
});

app.get('/', function(req, res){
    res.sendFile(path.join(__dirname, '../public', 'index.html'));
  });

  // Set Handlebars.
var exphbs = require("express-handlebars");

app.engine("handlebars", exphbs({ defaultLayout: "main" }));
app.set("view engine", "handlebars");

db.sequelize.sync({force: false}).then(function(){
  app.listen(PORT, function() {
    console.log ("App listening on PORT " + PORT);
  });
});