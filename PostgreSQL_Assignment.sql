-- Active: 1748068332919@@127.0.0.1@5432@conservation_db@public
DROP TABLE rangers;
DROP TABLE species;
DROP TABLE sightings;

CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region text
);

create TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50),
    scientific_name VARCHAR(50),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT,
    species_id INT,
    sighting_time TIMESTAMP,
    location VARCHAR(50),
    notes TEXT,
    FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id),
    FOREIGN KEY (species_id) REFERENCES species(species_id)
);

INSERT INTO rangers (ranger_id, name, region) VALUES
    (1, 'Alice Green', 'Northern Hills'),
    (2, 'Bob White', 'River Delta'),
    (3, 'Carol King', 'Mountain Range');

INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
    (1, 'Snow Leopard', 'Panthera uncia','1775-01-01', 'Endangered'),
    (2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
    (3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
    (4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
    (1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
    (2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
    (3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
    (4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

-- 1️⃣ Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers(ranger_id,name, region) VALUES
    (4,'Derek Fox','Coastal Plains'); --OK

-- 2️⃣ Count unique species ever sighted.
SELECT count(DISTINCT species_id) as unique_species_count from sightings; --ok

-- 3️⃣ Find all sightings where the location includes "Pass".
SELECT * from sightings
    WHERE location LIKE '%Pass'; -- OK

-- 4️⃣ List each ranger's name and their total number of sightings.
SELECT name , count(ranger_id) as total_sightings from rangers
    JOIN sightings USING(ranger_id) GROUP BY ranger_id
    ORDER BY name ASC; --OK

-- 5️⃣ List species that have never been sighted.
SELECT common_name FROM sightings as si 
    RIGHT JOIN species as s ON si.species_id = s.species_id
    WHERE si.species_id IS NULL ; --ok

-- 6️⃣ Show the most recent 2 sightings.
SELECT s.common_name,si.sighting_time,r.name FROM sightings as si
    JOIN species as s ON si.species_id = s.species_id
    JOIN rangers as r on si.ranger_id = r.ranger_id
    ORDER BY sighting_time DESC LIMIT 2;--ok

-- 7️⃣ Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species
SET conservation_status='Historic'
WHERE extract(YEAR FROM discovery_date) < 1800; --OK

-- 8️⃣ Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT si.sighting_id,
    CASE 
        WHEN(EXTRACT(HOUR from si.sighting_time) < 12) THEN 'Morning'
        WHEN(EXTRACT(HOUR from si.sighting_time) < 17) THEN 'Afternoon'
        WHEN(EXTRACT(HOUR from si.sighting_time) < 24) THEN 'Evening'
        END as time_of_day
    FROM sightings as si
    JOIN species as s ON si.species_id = s.species_id
    JOIN rangers as r on si.ranger_id = r.ranger_id
    ; --OK

-- 9️⃣ Delete rangers who have never sighted any species
DELETE FROM rangers
    WHERE ranger_id IN(SELECT r.ranger_id FROM rangers as r 
    LEFT JOIN sightings as si ON si.ranger_id = r.ranger_id
    WHERE si.species_id IS NULL );
