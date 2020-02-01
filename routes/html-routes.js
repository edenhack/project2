const path = require ("path");

module.exports = function (app) {
    //index route
    app.get ("/", function (req, res){
        res.sendFile(path.join(__dirname, "../public/index.html"));
    });

    app.get("/reviews", function (req, res) {
        res.sendFile(path.join(__dirname, "../public/reviews.html"));

    });

    app.get("/sitter", function(req, res) {
        res.sendFile(path.join(__dirname, "../public/sitter.html"))
    });

    app.get("/request-sitter", function(req, res) {
        res.sendFile(path.join(__dirname, "../public/request-sitter.html"))
    });

    app.get("/petsignup", function(req, res) {
        res.sendFile(path.join(__dirname, "../public/pet-signup.html"))
    });

    app.get("/availablesitters", function(req, res) {
        res.sendFile(path.join(__dirname, "../public/available-sitters.html"))
    });
};