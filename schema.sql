/* Database schema to keep the structure of entire database. */
CREATE TABLE animal(
  id BIGSERIAL PRIMARY KEY NOT Null,
  name varchar(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts smallint ,
  neuterred boolean ,
  weight_kg decimal ,
); 
