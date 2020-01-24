module.exports = function(sequelize, DataTypes) {
    var PetPals = sequelize.define("PetPals", {
      // Validation Here
    });
    return PetPals;
  };
  

  // Likely need a different object for owners, pets, sitters, etc