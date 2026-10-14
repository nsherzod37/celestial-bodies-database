--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.star DROP CONSTRAINT star_galaxy_id_fkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_star_id_fkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_planet_id_fkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_pkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_name_key;
ALTER TABLE ONLY public.space_station DROP CONSTRAINT space_station_pkey;
ALTER TABLE ONLY public.space_station DROP CONSTRAINT space_station_name_key;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_name_key;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_pkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_name_key;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_pkey;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_name_key;
ALTER TABLE public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE public.space_station ALTER COLUMN space_station_id DROP DEFAULT;
ALTER TABLE public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
DROP SEQUENCE public.star_star_id_seq;
DROP TABLE public.star;
DROP SEQUENCE public.space_station_space_station_id_seq;
DROP TABLE public.space_station;
DROP SEQUENCE public.planet_planet_id_seq;
DROP TABLE public.planet;
DROP SEQUENCE public.moon_moon_id_seq;
DROP TABLE public.moon;
DROP SEQUENCE public.galaxy_galaxy_id_seq;
DROP TABLE public.galaxy;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    has_supermassive_black_hole boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    orbit_period_days integer NOT NULL,
    is_spherical boolean NOT NULL,
    has_water_ice boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_types integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    radius_km numeric(10,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(100) NOT NULL,
    crew_capacity integer NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_space_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_space_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_space_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    mass_relative_to_sun numeric(8,2),
    is_spherical boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_space_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, 0.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major spiral galaxy', 10000, 2.53, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest in Local Group', 12000, 3.00, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unusual bright nucleus galaxy', 13000, 31.10, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Grand design spiral galaxy', 400, 23.00, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy', 13000, 20.90, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 27, true, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 2, true, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 4, true, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 7, true, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 17, true, true);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 1, true, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 1, true, true);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 2, true, true);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 3, true, true);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 5, true, true);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 16, true, true);
INSERT INTO public.moon VALUES (14, 'Hyperion', 6, 21, false, true);
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, 79, true, true);
INSERT INTO public.moon VALUES (16, 'Phoebe', 6, 550, false, true);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 1, true, true);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 3, true, true);
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 4, true, true);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 6, true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1, false, true, 2439.70);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, false, true, 6051.80);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, true, true, 6371.00);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, false, true, 3389.50);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, false, true, 69911.00);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, false, true, 58232.00);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 3, false, true, 25362.00);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 3, false, true, 24622.00);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 1, false, true, 7000.00);
INSERT INTO public.planet VALUES (10, 'Andromeda Prime', 3, 2, false, true, 50000.00);
INSERT INTO public.planet VALUES (11, 'Mirach b', 4, 1, false, true, 4500.00);
INSERT INTO public.planet VALUES (12, 'Triangulum I', 5, 1, false, true, 3000.00);


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES (1, 'International Space Station', 7, true);
INSERT INTO public.space_station VALUES (2, 'Tiangong', 6, true);
INSERT INTO public.space_station VALUES (3, 'Mir', 3, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 1.00, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, 0.12, true);
INSERT INTO public.star VALUES (3, 'Alpha Andromeda', 2, 200, 3.80, true);
INSERT INTO public.star VALUES (4, 'Mirach', 2, 1100, 2.40, true);
INSERT INTO public.star VALUES (5, 'Triangulum Main Star', 3, 5000, 1.50, true);
INSERT INTO public.star VALUES (6, 'Sombrero Central Star', 4, 8000, 2.10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_space_station_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

