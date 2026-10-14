-- PostgreSQL dump for Celestial Bodies Database (universe)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;
\c universe

-- Table: galaxy
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    age_in_millions_of_years INT NOT NULL,
    distance_from_earth NUMERIC(10, 2),
    has_supermassive_black_hole BOOLEAN NOT NULL
);

-- Table: star
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    age_in_millions_of_years INT NOT NULL,
    mass_relative_to_sun NUMERIC(8, 2),
    is_spherical BOOLEAN NOT NULL
);

-- Table: planet
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id),
    planet_types INT NOT NULL,
    has_life BOOLEAN NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    radius_km NUMERIC(10, 2)
);

-- Table: moon
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    orbit_period_days INT NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    has_water_ice BOOLEAN NOT NULL
);

-- Table: space_station
CREATE TABLE space_station (
    space_station_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    crew_capacity INT NOT NULL,
    is_active BOOLEAN NOT NULL
);

-- Data insertion
INSERT INTO galaxy (name, description, age_in_millions_of_years, distance_from_earth, has_supermassive_black_hole) VALUES
('Milky Way', 'Our home galaxy', 13600, 0.00, TRUE),
('Andromeda', 'Nearest major spiral galaxy', 10000, 2.53, TRUE),
('Triangulum', 'Third-largest in Local Group', 12000, 3.00, FALSE),
('Sombrero', 'Unusual bright nucleus galaxy', 13000, 31.10, TRUE),
('Whirlpool', 'Grand design spiral galaxy', 400, 23.00, TRUE),
('Pinwheel', 'Face-on spiral galaxy', 13000, 20.90, TRUE);

INSERT INTO star (name, galaxy_id, age_in_millions_of_years, mass_relative_to_sun, is_spherical) VALUES
('Sun', 1, 4600, 1.00, TRUE),
('Proxima Centauri', 1, 4850, 0.12, TRUE),
('Alpha Andromeda', 2, 200, 3.80, TRUE),
('Mirach', 2, 1100, 2.40, TRUE),
('Triangulum Main Star', 3, 5000, 1.50, TRUE),
('Sombrero Central Star', 4, 8000, 2.10, TRUE);

INSERT INTO planet (name, star_id, planet_types, has_life, is_spherical, radius_km) VALUES
('Mercury', 1, 1, FALSE, TRUE, 2439.70),
('Venus', 1, 1, FALSE, TRUE, 6051.80),
('Earth', 1, 1, TRUE, TRUE, 6371.00),
('Mars', 1, 1, FALSE, TRUE, 3389.50),
('Jupiter', 1, 2, FALSE, TRUE, 69911.00),
('Saturn', 1, 2, FALSE, TRUE, 58232.00),
('Uranus', 1, 3, FALSE, TRUE, 25362.00),
('Neptune', 1, 3, FALSE, TRUE, 24622.00),
('Proxima b', 2, 1, FALSE, TRUE, 7000.00),
('Andromeda Prime', 3, 2, FALSE, TRUE, 50000.00),
('Mirach b', 4, 1, FALSE, TRUE, 4500.00),
('Triangulum I', 5, 1, FALSE, TRUE, 3000.00);

INSERT INTO moon (name, planet_id, orbit_period_days, is_spherical, has_water_ice) VALUES
('Moon', 3, 27, TRUE, TRUE),
('Phobos', 4, 1, FALSE, FALSE),
('Deimos', 4, 1, FALSE, FALSE),
('Io', 5, 2, TRUE, FALSE),
('Europa', 5, 4, TRUE, TRUE),
('Ganymede', 5, 7, TRUE, TRUE),
('Callisto', 5, 17, TRUE, TRUE),
('Mimas', 6, 1, TRUE, TRUE),
('Enceladus', 6, 1, TRUE, TRUE),
('Tethys', 6, 2, TRUE, TRUE),
('Dione', 6, 3, TRUE, TRUE),
('Rhea', 6, 5, TRUE, TRUE),
('Titan', 6, 16, TRUE, TRUE),
('Hyperion', 6, 21, FALSE, TRUE),
('Iapetus', 6, 79, TRUE, TRUE),
('Phoebe', 6, 550, FALSE, TRUE),
('Miranda', 7, 1, TRUE, TRUE),
('Ariel', 7, 3, TRUE, TRUE),
('Umbriel', 7, 4, TRUE, TRUE),
('Triton', 8, 6, TRUE, TRUE);

INSERT INTO space_station (name, crew_capacity, is_active) VALUES
('International Space Station', 7, TRUE),
('Tiangong', 6, TRUE),
('Mir', 3, FALSE);
