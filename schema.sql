-- Project 2: Pet Pals --

-- Database Plan --

-- Since Sequelize is required, not everything will have to be explicitly stated --

-- Tables subject to change based on requirements of form fields and other reporting needs --



CREATE DATABASE petpals_db;
USE petpals_db;

CREATE TABLE pets (
  pet_id INTEGER(9) AUTO_INCREMENT NOT NULL
  , pet_type VARCHAR(50) NOT NULL -- Pet Types should be determined from a fintie list in order to standardize ex: drop down list on form field --
  , pet_breed VARCHAR(50) NOT NULL -- Ex: If pet_type is dog, pet_breed may be German Shepherd --
  , pet_size VARCHAR(1) NOT NULL -- S, M, L only --
  , pet_name VARCHAR(250) NOT NULL
  , pet_available BOOLEAN NOT NULL DEFAULT true 
  , PRIMARY KEY ( pet_id ) 
  , FOREIGN KEY ( owner_id) REFERENCES owners(owner_id)
);

CREATE TABLE owners (
  owner_id INTEGER(9) AUTO_INCREMENT NOT NULL
  , owner_name VARCHAR(250) NOT NULL -- Do we want field for first and last, or just one? What if people want to make up names?/Aren't comfortable with real names being displayed? Might be best to reference everyone by first name only, but keep both in db. --
  , owner_location INTEGER (5) -- I think it would be easiest to leverage location by zip code, might have to change for google maps API --
  , PRIMARY KEY ( owner_id )  
);

CREATE TABLE sitters (
  sitter_id INTEGER(9) AUTO_INCREMENT NOT NULL
  , sitter_name VARCHAR(250) NOT NULL -- Do we want field for first and last, or just one? What if people want to make up names?/Aren't comfortable with real names being displayed? Might be best to reference everyone by first name only, but keep both in db.  --
  , sitter_location INTEGER (5) -- I think it would be easiest to leverage location by zip code, might have to change for google maps API --
  , sitter_available BOOLEAN NOT NULL DEFAULT true
  , PRIMARY KEY ( sitter_id )  
);

-- Per Tish: Move repeated subsets into dedicated table. Will know what each particular entry refers to based on foreign key. Ex: If to know which services a sitter offers, use sitter_id --
CREATE TABLE services (

  -- Don't really need the service_id but adding for consistency/just in case --
  service_id INTEGER(9) AUTO_INCREMENT NOT NULL
 
  , service_walk BOOLEAN NOT NULL DEFAULT false
  , service_visit BOOLEAN NOT NULL  DEFAULT false
  , service_groom BOOLEAN NOT NULL DEFAULT false
  , service_sit BOOLEAN NOT NULL DEFAULT false -- sit as in pet sit --

  , FOREIGN KEY ( sitter_id ) REFERENCES sitters(sitter_id)
  , FOREIGN KEY ( review_id ) REFERENCES sitter_reviews(review_id)
  , FOREIGN KEY ( request_id ) REFERENCES requests(request_id)

);


-- If we are doing more than just dogs --

CREATE TABLE animal_types (

-- Which animals to include? --

-- Dogs, cats, birds, reptiles, exotic --

 sits_dogs BOOLEAN NOT NULL DEFAULT false
, sits_cats BOOLEAN NOT NULL DEFAULT false
, sits_birds BOOLEAN NOT NULL DEFAULT false
, sits_exotics BOOLEAN NOT NULL DEFAULT false


,FOREIGN KEY ( sitter_id ) REFERENCES sitters(sitter_id)

);


CREATE TABLE sitter_reviews (
  review_id INTEGER(9) AUTO_INCREMENT NOT NULL
  , review_rating INTEGER (1) -- Should be 1 through 5, will do math and round down to nearest whole number to dermine rating --
  , review_txt VARCHAR(250) -- Review comments/etc --


  , PRIMARY KEY ( review_id ) 
  , FOREIGN KEY ( sitter_id ) REFERENCES sitters(sitter_id)
  , FOREIGN KEY ( owner_id  ) REFERENCES owners(owner_id) -- to know who submitted --
);

CREATE TABLE contact_info ( 
-- Do we need this? --
-- If so, then I would prefer to keep owner and sitters together so that we can keep track of individuals whom may be both --
  
  contact_id INTEGER(9) AUTO_INCREMENT NOT NULL
  , contact_email VARCHAR(100) NOT NULL -- How to validate? Look to see if email/phone exists to determine if individual already in system --
  , contact_phone INTEGER(10) NOT NULL  -- How to valdiate? Look to see if email/phone exists to determine if individual already in system --
  , PRIMARY KEY ( contact_id )
  , FOREIGN KEY ( owner_id) REFERENCES owners(owner_id)
  , FOREIGN KEY ( sitter_id ) REFERENCES sitters(sitter_id)

);

-- Request is submitted when an owner needs a service --
CREATE TABLE requests (
  request_id INTEGER(9) AUTO_INCREMENT NOT NULL
  , PRIMARY KEY ( request_id ) 
  , FOREIGN KEY ( owner_id) REFERENCES owners(owner_id)
  , FOREIGN KEY ( pet_id ) REFERENCES pets(pet_id)

);
    


-- Examples of needed information and how to get it --

-- List of all an Owners's Pets --
SELECT * FROM pets where owner_id = {}

-- List of available sitters for a particular service --
SELECT * from sitters WHERE sitter_available = 'true' AND {particular service type} = 'true'


-- Ratings for a sitter --
SELECT * from sitter_reviews WHERE sitter_id = {}
-- ... then math all service types --

-- Ratings for a sitter based on a particular service --
SELECT * from sitter_reviews WHERE sitter_id = {} AND {particular service type} = 'true'




 
 
   
  




