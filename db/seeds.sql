
USE petpals_db;

 -- Having some problems seeding pets --
INSERT INTO pets (pet_type, pet_breed, pet_size, pet_name, owner_id) 
VALUES 

-- VARIETY OF 10 PETS --
 ('DOG', 'GERMAN SHEPHERD', 'L', 'HULK', '1')
,('DOG', 'PIT BULL', 'L', 'BEAR', '2') 
,('DOG', 'CORGIE', 'M', 'QUEEN ELIZABETH', '3')
,('DOG', 'BEAGLE', 'M', 'BRONX', '4')
,('DOG', 'YORKIE', 'S', 'PRINCESS BUTTERCUP', '5')
,('CAT', 'TABBY', 'S', 'WHISKERS', '6')
,('CAT', 'SIAMESE', 'S', 'LENNY BENNY', '7')
,('CAT', 'MAINE COON', 'S', 'MR. SPARKLES', '8')
,('BIRD', 'PARAKEET', 'S', 'TWEETIE', '9')
,('EXOTIC', 'BOA CONSTRICTOR', 'L', 'HULK', '10')

-- A COUPLE OF OWNERS HAVE MULTIPLE PETS --
,('DOG', 'DALMATIAN', 'L', 'SPOT', '1')
,('DOG', 'TERRIER', 'M', 'RI RI', '1') 
,('DOG', 'WHIPPET', 'M', 'WILLOW', '1') 
,('DOG', 'CHIHUAHUA', 'S', 'HOLLYWOOD', '2') 
,('DOG', 'MIN PIN', 'S', 'TWINKLE TOES', '2');


INSERT INTO owners (owner_name, owner_location)
VALUES
  ('RUBY WOO', '77090')
, ('DAVE WANDERLUST', '77654')
, ('ROBERT OHANA', '77456')
, ('LINDSAY UROGUAY', '77449')
, ('JOHANNA PIXAR', '77396')
, ('ALFRED WINNIFRED', '77210')
, ('MANNY MUMPHS', '77329')
, ('TENNESSEE COWBOY', '77362')
, ('WALTER WHITE', '77494');

INSERT INTO sitters (sitter_name, sitter_email, sitter_location, sitter_bio)
VALUES
 ('RESPONSIBLE RITA','mergherita@aol.com' ,'77494', 'I have always loved dogs and am dedicated to their care.')
,('WACKY WAYNE', 'waynesworld92@gmail.com', '77449', 'I am a vet tech and specialize in care for elderly animals. If your pet has special medical needs, I am your man'  )
,('ADVENTEROUS ARNOLD', 'readyforrecess@gmail.com' , '77090', 'Reptiles are fun! Snakes, lizards, dinosaurs- I love them all!')
,('BOB MARLEY', 'chillphil@yahoo.com', '77396' , 'My suave personality is ideal for handling animals with behavioral issues.')
,('KATE HUDSON','prettyinpink@123.com' ,'77321', 'I guess you can call me an old cat lady. MEOW!');


INSERT INTO sitter_animal_types (sits_dogs, sits_cats, sits_birds, sits_exotics, sitter_id)
VALUES
 (true , true , false , true ,'1')
,(true , false , true , false ,'2')
,(true , true , false , false ,'3')
,(false , false , false , false ,'4')
,(false , true , false , false ,'5');

INSERT INTO services (service_walk, service_visit, service_groom, service_sit, sitter_id)
VALUES
 (true , true , true , true ,'1')
,(true , true , false , true ,'2')
,(true , true , true , true ,'3')
,(false , true , false , true ,'4')
,(false , true , true , true ,'5');  


INSERT INTO sitter_reviews (review_name, review_email, review_rating, review_txt, owner_id, pet_id)
VALUES
( 'Elastigirl','abc123@aol.com','1', 'Worst.Service.Ever.', '1', '1')
,('Mr.Incredible', "strongman95@yahoo.com",'2', 'Sitter was late. I value punctuality.', '1', '2')
,('Violet', 'tonyiscool@aol.com','3', 'The service was alright. Site is awesome.', '2', '3')
,('Flash', 'needforspeed@runner.com','4', 'I love this sitter and would recommend to all of my friends!', '3', '3')
,('Jack Jack', 'ilovecookies@earthlink.com','5', 'BEST DAY EVER!!!!!!!!', '2', '1');




