/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND '2019-01-01';
SELECT * from animals WHERE neutered = true AND  escape_attempts < 3;
SELECT name, date_of_birth from animals WHERE name IN  ('Agumon','Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg BETWEEN '10.4' AND '17.3';
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name !='Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROOLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROOLBACK;
SELECT FROM animals;

BEGIN;
DELETE FROM animals;
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;

UPDATE animals
SET weight_kg = weight_kg*-1;

ROOLBACK TO SP1;

UPDATE animals
SET weight_kg = weight_kg*-1 WHERE weight_kg < 0; 

COMMIT;

BEGIN;
SELECT COUNT (id) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG (weight_kg) FROM animals;
SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;
SELECT species, AVG(escape_attempts)
FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND  '2000-12-31'
GROUP BY species;
COMMIT;


SELECT * FROM animals LEFT JOIN owners ON owners.id = owners_id WHERE owners.full_name='Melody Pond';
SELECT * FROM animals LEFT JOIN species ON species.id = species_id WHERE species.name = 'Pokemon';
SELECT * FROM animals JOIN owners ON animals.owners_id = owners.id;
SELECT species.name,COUNT(species_id) FROM animals LEFT JOIN species ON species.id = species_id GROUP BY species.name;
SELECT full_name, animals.name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE full_name = 'Jennifer Orwell' AND species_id = 1;
SELECT * FROM animals JOIN owners ON owners.id = owners_id WHERE escape_attempts < 1 AND owners.full_name='Dean Winchester';
SELECT full_name, COUNT (animals.owners_id) AS total FROM animals JOIN owners ON animals.owners_id = owners.id
GROUP BY owners.full_name ORDER BY total DESC; 


SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name  = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;
SELECT COUNT(DISTINCT animals_id) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez';
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id GROUP BY animals.name ORDER BY COUNT(animals_id) DESC LIMIT 1;
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit LIMIT 1;

SELECT animals.name AS animal_name, animals.date_of_birth, animals.escape_attempts, animals.neutered, animals.weight_kg, vets.name AS vet_name, vets.age, vets.date_of_graduation, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id ORDER BY visits.date_of_visit DESC LIMIT 1;
SELECT COUNT(visits.animals_id) FROM visits JOIN vets ON vets.id = visits.vets_id JOIN animals ON animals.id = visits.animals_id JOIN specializations ON specializations.vets_id = vets.id WHERE specializations.species_id <> animals.species_id;
SELECT species.name, COUNT(visits.animals_id) as count FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY count DESC LIMIT 1;

-- Vet clinic database: database performance audit
explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;
explain analyze SELECT * FROM visits where vets_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';