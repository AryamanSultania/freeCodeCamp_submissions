--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: dark_matter; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dark_matter (
    dark_matter_id integer NOT NULL,
    name character varying(30) NOT NULL,
    volume integer
);


ALTER TABLE public.dark_matter OWNER TO freecodecamp;

--
-- Name: dark_matter_dark_matter_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dark_matter_dark_matter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dark_matter_dark_matter_id_seq OWNER TO freecodecamp;

--
-- Name: dark_matter_dark_matter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dark_matter_dark_matter_id_seq OWNED BY public.dark_matter.dark_matter_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    constellation character varying(20),
    star_count integer
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
    is_solo boolean,
    diameter numeric,
    planet_id integer
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
    is_habitable boolean,
    moon_count integer,
    has_water boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    temp integer,
    galaxy_id integer,
    age numeric
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
-- Name: dark_matter dark_matter_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dark_matter ALTER COLUMN dark_matter_id SET DEFAULT nextval('public.dark_matter_dark_matter_id_seq'::regclass);


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
-- Data for Name: dark_matter; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dark_matter VALUES (1, 'WIMP', NULL);
INSERT INTO public.dark_matter VALUES (2, 'WISP', NULL);
INSERT INTO public.dark_matter VALUES (3, 'SIMP', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Alpha Centauri', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Alpha Canis Majoris', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Alpha Canis Minoris', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Groombridge 34', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Gilese 412', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Omicron Eridani', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ananke', NULL, 28, 2);
INSERT INTO public.moon VALUES (2, 'Harpalyke', NULL, 4, 2);
INSERT INTO public.moon VALUES (3, 'Iocaste', NULL, 5, 2);
INSERT INTO public.moon VALUES (4, 'Praxidike', NULL, 7, 2);
INSERT INTO public.moon VALUES (5, 'Thyone', NULL, 4, 2);
INSERT INTO public.moon VALUES (6, 'Hermippe', NULL, 4, 2);
INSERT INTO public.moon VALUES (7, 'Euanthe', NULL, 3, 2);
INSERT INTO public.moon VALUES (8, 'Euporie', NULL, 2, 2);
INSERT INTO public.moon VALUES (9, 'Orthosie', NULL, 2, 2);
INSERT INTO public.moon VALUES (10, 'Mneme', NULL, 2, 2);
INSERT INTO public.moon VALUES (11, 'Thelxinoe', NULL, 2, 2);
INSERT INTO public.moon VALUES (12, 'Helike', NULL, 4, 2);
INSERT INTO public.moon VALUES (13, 'Eupheme', NULL, 2, 2);
INSERT INTO public.moon VALUES (14, 'S/2010 J 2', NULL, 1, 2);
INSERT INTO public.moon VALUES (15, 'S/2016 J 1', NULL, 1, 2);
INSERT INTO public.moon VALUES (16, 'S/2017 J 3', NULL, 2, 2);
INSERT INTO public.moon VALUES (17, 'S/2017 J 7', NULL, 2, 2);
INSERT INTO public.moon VALUES (18, 'S/2017 J 9', NULL, 3, 2);
INSERT INTO public.moon VALUES (19, 'S/2003 J 2', NULL, 2, 2);
INSERT INTO public.moon VALUES (20, 'S/2021 J 1', NULL, 1, 2);
INSERT INTO public.moon VALUES (21, 'S/2021 J 2', NULL, 1, 2);
INSERT INTO public.moon VALUES (22, 'S/2021 J 3', NULL, 2, 2);
INSERT INTO public.moon VALUES (23, 'S/2022 J 3', NULL, 1, 2);
INSERT INTO public.moon VALUES (24, 'S/2003 J 12', NULL, 1, 2);
INSERT INTO public.moon VALUES (25, 'S/2003 J 16', NULL, 2, 2);
INSERT INTO public.moon VALUES (26, 'S/2003 J 18', NULL, 2, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, 1, true, 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', NULL, 95, true, 1);
INSERT INTO public.planet VALUES (3, 'Pluto', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Venus', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Mars', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Jupiter', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Saturn', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Neptune', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Ceres', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (13, 'Makemake', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (14, 'Eris', NULL, NULL, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5772, 1, 4.6);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', NULL, 2, NULL);
INSERT INTO public.star VALUES (3, 'Sirius', NULL, 3, NULL);
INSERT INTO public.star VALUES (4, 'Procyon', NULL, 4, NULL);
INSERT INTO public.star VALUES (5, 'GX Andromedae', NULL, 5, NULL);
INSERT INTO public.star VALUES (6, 'WX Ursae Majoris', NULL, 6, NULL);
INSERT INTO public.star VALUES (7, 'Keid', NULL, 7, NULL);


--
-- Name: dark_matter_dark_matter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dark_matter_dark_matter_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: dark_matter dark_matter_dark_matter_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dark_matter
    ADD CONSTRAINT dark_matter_dark_matter_id_key UNIQUE (dark_matter_id);


--
-- Name: dark_matter dark_matter_dark_matter_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dark_matter
    ADD CONSTRAINT dark_matter_dark_matter_id_key1 UNIQUE (dark_matter_id);


--
-- Name: dark_matter dark_matter_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dark_matter
    ADD CONSTRAINT dark_matter_pkey PRIMARY KEY (dark_matter_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_galaxy_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key1 UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_moon_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key1 UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star star_star_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key1 UNIQUE (star_id);


--
-- Name: moon moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

