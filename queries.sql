/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND '2019-01-01';
SELECT * from animals WHERE neutered = true AND  escape_attempts < 3;
SELECT name, date_of_birth from animals WHERE name IN  ('Agumon','Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg BETWEEN '10.4' AND '17.3';
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name !='Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

