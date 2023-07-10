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