// Get the models
var db = require("../models");
module.exports = function(app){

// ROUTES


// GET
// A little confused on the DB Names/ When to include S vs not
// Included S since that how I setup the variable in each relative models doc

// GET Reviews
app.get("/api/reviews", function (req,res){
   
    db.Reviews.findAll({}).then(function(dbReviews){
        res.json(dbReviews);

    });
});

// GET Sitters

app.get("/api/sitters", function (req,res){
   
    db.Sitters.findAll({}).then(function(dbSitters){
        res.json(dbSitters);

    });
});

// GET Owners

app.get("/api/owners", function (req,res){
   
    db.Owners.findAll({}).then(function(dbOwners){
        res.json(dbOwners);

    });
});

// Get Pets

app.get("/api/pets", function (req,res){
   
    db.Pets.findAll({}).then(function(dbPets){
        res.json(dbPets);

    });
});

// Get Requests

app.get("/api/requests", function (req,res){
   
    db.Requests.findAll({}).then(function(dbRequests){
        res.json(dbRequests);

    });
});

// POST

// POST Reviews

app.post("api/reviews", function(req, res) {

    db.Reviews.create(

        // Define what we are bringing in (req.body....)
        req.body

    ).then(function(dbReviews){

        res.json(dbReviews)

    }).catch(function(err){

        res.json(err);

    });

});

// POST Sitters

app.post("api/sitters", function(req, res) {

    db.Sitters.create({

        // Define what we are bringing in (req.body....)

    }).then(function(dbSitters){

        res.json(dbSitters)

    }).catch(function(err){

        res.json(err);

    });

});

// POST Owners

app.post("api/Owners", function(req, res) {

    db.Owners.create({

        // Define what we are bringing in (req.body....)

    }).then(function(dbOwners){

        res.json(dbOwners)

    }).catch(function(err){

        res.json(err);

    });

});

// POST Pets

app.post("api/pets", function(req, res) {

    db.Pets.create({

        // Define what we are bringing in (req.body....)

    }).then(function(dbPets){

        res.json(dbPets)

    }).catch(function(err){

        res.json(err);

    });

});

// Post Requests

app.post("api/requests", function(req, res) {

    db.Requests.create({

        // Define what we are bringing in (req.body....)

    }).then(function(dbRequests){

        res.json(dbRequests)

    }).catch(function(err){

        res.json(err);

    });

});



// DELETE (Do we need this?)

// DELETE Account Info?


// UPDATE

// UPDATE Requests

app.put("/api/requests", function(req, res){

    db.Requests.update({
        
        // Define what we are updating (req.body....)

    }, {
        where: {
            request_id: req.body.request_id
        }
    }).then(function(dbRequests){

        res.json(dbRequests);

    }).catch(function(err){

        res.json(err);

    });

});

// UPDATE Sitter Availability

app.put("/api/sitters", function(req, res){

    db.Requests.update({
        
        // Define what we are updating (req.body....)
        sitter_availability: req.body.sitter_availability
        
    }, {
        where: {
            sitter_id: req.body.sitter_id
        }
    }).then(function(dbSitters){

        res.json(dbSitters);

    }).catch(function(err){

        res.json(err);

    });

});

// UPDATE Pet Availability

app.put("/api/pets", function(req, res){

    db.Petss.update({
        
        // Define what we are updating (req.body....)
        pet_availability: req.body.pet_availability
        
    }, {
        where: {
            pet_id: req.body.pet_id
        }
    }).then(function(dbPets){

        res.json(dbPets);

    }).catch(function(err){

        res.json(err);

    });

});

};