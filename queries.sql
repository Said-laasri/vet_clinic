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


-- Link animal table to species table and owners table

-- Update species_id in animal table
UPDATE animal SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animal SET species_id = 1 WHERE name NOT LIKE '%mon';

-- Update owner_id in animal table
UPDATE animal SET owners_id = 1 WHERE name = 'Agumon';

UPDATE animal SET owners_id = 2 WHERE name  = 'Gabumon' OR name ='Pikachu';

UPDATE animal SET owners_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animal SET owners_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animal SET owners_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';


--  write querries usinf JOIN

SELECT animal.name FROM animal JOIN owners ON animal.owners_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT * FROM animal JOIN species ON animal.species_id = species.id WHERE species.name = 'Pokemon';

SELECT animal.name, owners.full_name FROM animal RIGHT JOIN owners ON animal.owners_id = owners.id;

SELECT species.name, COUNT(animal.species_id) FROM animal JOIN species ON species.id = animal.species_id GROUP BY species.name;

SELECT animal.name from animal JOIN owners ON owners.id = animal.owners_id JOIN species on species.id = animal.species_id WHERE animal.species_id = '2' AND animal.owners_id = '2';

SELECT animal.name from animal JOIN owners ON owners.id = animal.owners_id WHERE animal.escape_attempts = '0' AND animal.owners_id = '5';

SELECT full_name, COUNT(owners_id) FROM owners JOIN animal on owners.id = animal.owners_id GROUP BY full_name ORDER BY COUNT (owners_id) desc limit 1;


-- write querries using for join tabele

SELECT animal.name,vets.name,visits.date_of_visit  from animal JOIN visits ON animal.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id where vet_id = 1 ORDER BY visits.date_of_visit desc limit 1;    
-- count distinct
SELECT animal_id, animal.name from animal JOIN visits ON animal.id = visits.animal_id where vet_id = 2;

SELECT COUNT(DISTINCT animal_id) from visits WHERE vet_id = 2;
-- two cae
SELECT vets.name, species.name  FROM vets JOIN specializations ON vets.id = specializations.vet_id JOIN species ON species.id = specializations.species_id;

SELECT vets.name, specializations.vet_id, specializations.species_id FROM vets LEFT JOIN specializations ON specializations.vet_id = vets.id; 

-- visit between two dates

SELECT animal.name , visits.date_of_visit FROM animal JOIN visits ON animal.id = visits.animal_id WHERE visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30' AND vet_id = '3'; 
-- max count of visits to animal

SELECT animal.name, COUNT(animal_id) FROM animal JOIN visits ON animal.id = visits.animal_id GROUP BY animal.name ORDER BY COUNT(animal_id) desc limit 1;

-- who is the first visit maisy

SELECT animal.name, visits.date_of_visit FROM animal JOIN visits ON animal.id = visits.animal_id WHERE visits.date_of_visit = (SELECT MIN(date_of_visit) FROM visits WHERE vet_id = 2);

-- Details for most recent visit: animal information, vet information, and date of visit.

SELECT animal.name, vets.name, visits.date_of_visit FROM animal JOIN visits ON animal.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE visits.date_of_visit = (SELECT MIN(date_of_visit) FROM visits);

-- How many visits were with a vet that did not specialize in that animal's species?

SELECT COUNT(visits.animal_id) FROM visits JOIN vets ON vets.id = visits.vet_id WHERE vet_id = 2;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT species.name, COUNT(animal.species_id) FROM animal JOIN visits ON animal.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id JOIN species ON species.id = animal.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(animal.species_id) desc limit 1;


SELECT *, visits.date_of_visit FROM animal JOIN visits ON animal.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE visits.date_of_visit = (SELECT MIN(date_of_visit) FROM visits); 