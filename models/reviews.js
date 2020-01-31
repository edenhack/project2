

module.exports = function (sequelize, DataTypes) { 
    let Reviews = sequelize.define("Reviews", {
      review_name:{}
    });
    return Reviews; 
  
  };