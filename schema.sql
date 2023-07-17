/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

CREATE TABLE owners(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    age INT NOT NULL
    );

CREATE TABLE species(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
    );

ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id BIGINT REFERENCES species (id),
ADD COLUMN owners_id BIGINT REFERENCES owners (id);

CREATE TABLE vets (
    id BIGINT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
 vets_id integer REFERENCES vets(id), 
    species_id integer REFERENCES species(id),
    PRIMARY KEY (vets_id, species_id)    
);

CREATE TABLE visits (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    animals_id integer REFERENCES animals(id),
    vets_id integer REFERENCES vets(id),
    date_of_visit DATE
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
ALTER TABLE owners ALTER COLUMN age DROP NOT NULL;


-- Vet clinic database: database performance audit
CREATE INDEX animals_order ON visits (animals_id ASC);
CREATE INDEX vets_order ON visits (vets_id ASC);
CREATE INDEX owners_email_asc ON owners (email ASC);