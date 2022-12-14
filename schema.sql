/* Database schema to keep the structure of entire database. */
CREATE TABLE animal(
  id BIGSERIAL PRIMARY KEY NOT Null,
  name varchar(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts smallint ,
  neuterred boolean ,
  weight_kg decimal 
); 

ALTER TABLE animal ADD species varchar(255);

ALTER TABLE animal DROP COLUMN species;

ALTER TABLE animal ADD species_id BIGINt REFERENCES species(id);

ALTER TABLE animal ADD owners_id BIGINT REFERENCES owners(id);

CREATE TABLE owners(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  full_name varchar(255) NOT NULL,
  age int NOT NULL
);

CREATE TABLE species(
  id bigsERIAL PRIMARY KEY NOT NULL,
  name varchar(255) NOT NULL
);

-- create table vets
CREATE TABLE vets(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  name varchar(255) NOT NULL,
  age int NOT NULL,
  date_of_graduation DATE NOT NULL
);

-- create join table specializations
CREATE TABLE specializations(
vet_id INTEGER REFERENCES vets(id),
species_id INTEGER REFERENCES species(id)
);

-- create join table visits
CREATE TABLE visits(
  vet_id INTEGER REFERENCES vets(id),
  animal_id INTEGER REFERENCES animal(id),
  date_of_visit DATE NOT NULL
);
