/* Database schema to keep the structure of entire database. */
CREATE TABLE 'animals'(
  `id` int(11) PRIMARY KEY NOT Null,
  `name` varchar(255) NOT NULL,
  `date_of_birth` smalldatetime NOT NULL,
  `escape_attempts` smallint NOT NULL,
  `neuterred` boolean NOT NULL,
  `weight_kg` decimal NOT NULL ,
); 
