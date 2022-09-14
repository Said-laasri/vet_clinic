/*Queries that provide answers to the questions from all projects.*/

SELECT * from animal WHERE name LIKE '%mon';

SELECT name from animal WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name from animal WHERE escape_attempts < 3 AND neuterred = TRUE;

SELECT date_of_birth from animal WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name , escape_attempts from animal WHERE weight_kg > 10.5;

SELECT * from animal WHERE neuterred = TRUE;

SELECT * from animal WHERE name != 'Gabumon';

SELECT * from animal Where weight_kg BETWEEN 10.5 AND  17.3;

/* update the animal table*/

BEGIN;

UPDATE animal SET species = 'unspecified';

ROLLBACK;

/* update the animal table*/

UPDATE animal SET species = 'digimon' WHERE name LIKE '%mon';   

UPDATE animal SET species = 'pokemon' WHERE species is NULL;

COMMIT;

BEGIN;

ROLLBACK;

SELECT * from animal;

BEGIN;

-- delete the animal table

DELETE FROM animal WHERE date_of_birth > '2022-01-01';

SAVEPOINT H1;

UPDATE animal SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT H1;

UPDATE animal SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

-- count the number of animals

SELECT COUNT(*) FROM animal;

SELECT COUNT(*) FROM animal WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animal;

SELECT MAX(escape_attempts), neuterred FROM animal GROUP BY neuterred; 

SELECT MIN(weight_kg), MAX(weight_kg) FROM animal;

SELECT AVG(weight_kg) FROM animal WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';    



