--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    meaning text,
    star_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_in_kpc integer NOT NULL,
    meaning character varying(200),
    is_visible_to_naked_eye boolean
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
    name character varying(30) NOT NULL,
    planet_id integer,
    year_discovered integer,
    diameter_in_km integer
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
    name character varying(30) NOT NULL,
    star_id integer,
    orbital_period_in_years numeric,
    rotation_period_in_days numeric,
    has_moon boolean
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    distance_in_ly numeric NOT NULL,
    brightness numeric NOT NULL,
    approval_date date
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Aquarius', NULL, 'Water-bearer', 1);
INSERT INTO public.constellation VALUES (2, 'Aries', NULL, 'Ram', 2);
INSERT INTO public.constellation VALUES (3, 'Bootes', NULL, 'Herdsman', 3);
INSERT INTO public.constellation VALUES (4, 'Capricornus', NULL, 'Sea goat', 4);
INSERT INTO public.constellation VALUES (5, 'Centaurus', NULL, 'Centaur', 5);
INSERT INTO public.constellation VALUES (6, 'Cetus', NULL, 'Sea monster (later, whale)', 9);
INSERT INTO public.constellation VALUES (7, 'Coma Berenices', 1536, 'Berenice hair', 6);
INSERT INTO public.constellation VALUES (8, 'Leo', NULL, 'Lion', 7);
INSERT INTO public.constellation VALUES (9, 'Ophiuchus', NULL, 'Serpent-bearer', 12);
INSERT INTO public.constellation VALUES (10, 'Pegasus', NULL, 'Pegasus (mythology)', 10);
INSERT INTO public.constellation VALUES (11, 'Sagittarius', NULL, 'Archer', 11);
INSERT INTO public.constellation VALUES (12, 'Taurus', NULL, 'Bull', 8);
INSERT INTO public.constellation VALUES (13, 'Virgo', NULL, 'Virgin or maiden', 13);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkyway', 8277, 'a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye', true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 765, 'itself is named after the princess who was the wife of Perseus in Greek mythology', true);
INSERT INTO public.galaxy VALUES (2, 'Pinwheel Galaxy', 6400, 'to be updated', true);
INSERT INTO public.galaxy VALUES (4, 'Tadpole Galaxy', 129000, 'to be updated - 2', false);
INSERT INTO public.galaxy VALUES (5, 'Eye of Sauron', 19000, 'to be updated - 3', false);
INSERT INTO public.galaxy VALUES (6, 'Antennae Galaxy', 19000, 'to be updated - 4', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, NULL, 3476);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1877, 23);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1877, 13);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1610, 3630);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1610, 3138);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1610, 5262);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1610, 4800);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 1892, 200);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 1904, 170);
INSERT INTO public.moon VALUES (10, 'Thebe', 5, 1979, 90);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 1789, 90);
INSERT INTO public.moon VALUES (12, 'Enceladus', 6, 1789, 502);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1684, 1048);
INSERT INTO public.moon VALUES (14, 'Dione', 6, 1684, 1120);
INSERT INTO public.moon VALUES (15, 'Rhea', 6, 1672, 1530);
INSERT INTO public.moon VALUES (16, 'Titan', 6, 1655, 5150);
INSERT INTO public.moon VALUES (17, 'Hyperion', 6, 1848, 270);
INSERT INTO public.moon VALUES (18, 'Iapetus', 6, 1671, 1435);
INSERT INTO public.moon VALUES (19, 'Phoebe', 6, 1899, 220);
INSERT INTO public.moon VALUES (20, 'Helene', 6, 1980, 35);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 13, 0.24, 58.65, false);
INSERT INTO public.planet VALUES (2, 'Venus', 7, 0.62, 243.02, false);
INSERT INTO public.planet VALUES (3, 'Earth', 5, 1.00, 1.00, true);
INSERT INTO public.planet VALUES (4, 'Mars', 8, 1.88, 1.03, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 9, 11.86, 0.41, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 4, 29.45, 0.44, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 2, 84.02, 0.72, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 164.79, 0.67, true);
INSERT INTO public.planet VALUES (9, 'Ceres', 7, 4.60, 0.38, false);
INSERT INTO public.planet VALUES (10, 'Orcus', 11, 247.5, NULL, true);
INSERT INTO public.planet VALUES (11, 'Pluto', 11, 247.9, 6.39, true);
INSERT INTO public.planet VALUES (12, 'Haumera', 3, 283.8, 0.16, true);
INSERT INTO public.planet VALUES (13, 'Quaoar', 12, 288.0, 0.37, true);
INSERT INTO public.planet VALUES (14, 'Makemake', 6, 306.2, 0.95, true);
INSERT INTO public.planet VALUES (15, 'Gonggong', 1, 552.5, 0.93, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sadalsuud', 1, 612, 2.90, '2016-08-21');
INSERT INTO public.star VALUES (2, 'Hamal', 1, 66, 2.01, '2016-07-20');
INSERT INTO public.star VALUES (3, 'Arcturus', 1, 37, 0.05, '2016-06-30');
INSERT INTO public.star VALUES (4, 'Deneb Algedi', 1, 39, 2.85, '2017-02-01');
INSERT INTO public.star VALUES (5, 'Rigil Kentaurus', 1, 4.36, 0.01, '2016-11-06');
INSERT INTO public.star VALUES (6, 'Beta Comae Berenices', 1, 30, 4.26, NULL);
INSERT INTO public.star VALUES (7, 'Regulus', 1, 77, 1.36, '2016-06-30');
INSERT INTO public.star VALUES (8, 'Aldebaran', 1, 65.23, 0.85, '2016-06-30');
INSERT INTO public.star VALUES (9, 'Diphda', 1, 96.22, 2.04, '2016-08-21');
INSERT INTO public.star VALUES (10, 'Enif', 1, 688.20, 2.40, '2016-07-20');
INSERT INTO public.star VALUES (11, 'Kaus Australis', 1, 143.20, 1.85, '2016-07-20');
INSERT INTO public.star VALUES (12, 'Rasalhague', 1, 46.60, 2.08, '2016-06-30');
INSERT INTO public.star VALUES (13, 'Spica', 3, 260.90, 1.04, '2016-06-30');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 13, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: constellation constellation_meaning_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_meaning_key UNIQUE (meaning);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_meaning_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_meaning_key UNIQUE (meaning);


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
-- Name: constellation constellation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

