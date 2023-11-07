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
    name character varying(20) NOT NULL,
    name_description character varying(80)
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
    name character varying(20) NOT NULL,
    name_description text,
    constellation character varying(20),
    visible_naked_eye boolean
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
    name character varying(20) NOT NULL,
    diameter_km numeric(6,2),
    discovery_year integer,
    planet_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    moons_included integer,
    dwarf_planet boolean,
    star_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    name_description character varying(80),
    galaxy_id integer NOT NULL,
    constellation_id integer NOT NULL
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

INSERT INTO public.constellation VALUES (1, 'Canis Major', 'Larger of the two hunting dog used by Orion');
INSERT INTO public.constellation VALUES (2, 'Carina', 'Formerly "Argo Navis", the ship used by Jason an the Argonauts');
INSERT INTO public.constellation VALUES (3, 'Bootes', 'Ox driver');
INSERT INTO public.constellation VALUES (4, 'Centaurus', 'Half-men and half-horse mythological creatures');
INSERT INTO public.constellation VALUES (5, 'Lyra', 'Harp of the greek musician Orpheus');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'From the Earth looks like a band of light', 'Sagittarius', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Area in the sky in which appears, the constellation of Andromeda', 'Andromeda', true);
INSERT INTO public.galaxy VALUES (3, 'Butterfly', 'Looks are similar to a butterfly', 'Virgo', false);
INSERT INTO public.galaxy VALUES (4, 'Condor', 'Name after a type of vultur', 'Pavo', false);
INSERT INTO public.galaxy VALUES (5, 'Little Sombrero', 'Similarity to the Sombrero Galaxy', 'Pegasus', false);
INSERT INTO public.galaxy VALUES (6, 'Medusa Merger', 'Looks like the head of the Gorgon Medusa', 'Ursa Major', false);
INSERT INTO public.galaxy VALUES (7, 'Sculptor', 'Named after its location, the Sculptor constellation', 'Sculptor', false);
INSERT INTO public.galaxy VALUES (8, 'Whirpool', 'From its whirpool appearance', 'Canes Venatici', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474.80, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.53, 1877, 4);
INSERT INTO public.moon VALUES (3, 'Metis', 43.00, 1979, 5);
INSERT INTO public.moon VALUES (4, 'Amalthea', 167.00, 1892, 5);
INSERT INTO public.moon VALUES (5, 'Thebe', 98.60, 1979, 5);
INSERT INTO public.moon VALUES (6, 'Io', 3643.20, 1610, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 3121.60, 1610, 5);
INSERT INTO public.moon VALUES (8, 'Ganymede', 5268.20, 1610, 5);
INSERT INTO public.moon VALUES (9, 'Callisto', 4820.60, 1610, 5);
INSERT INTO public.moon VALUES (10, 'Leda', 21.50, 1974, 5);
INSERT INTO public.moon VALUES (11, 'Himalia', 139.60, 1904, 5);
INSERT INTO public.moon VALUES (12, 'Lysithea', 42.20, 1938, 5);
INSERT INTO public.moon VALUES (13, 'Elara', 79.90, 1905, 5);
INSERT INTO public.moon VALUES (14, 'Ananke', 29.10, 1951, 5);
INSERT INTO public.moon VALUES (15, 'Carme', 46.70, 1938, 5);
INSERT INTO public.moon VALUES (16, 'Pasiphae', 57.80, 1908, 5);
INSERT INTO public.moon VALUES (17, 'Sinope', 35.00, 1914, 5);
INSERT INTO public.moon VALUES (18, 'Pan', 28.20, 1990, 6);
INSERT INTO public.moon VALUES (19, 'Atlas', 30.20, 1980, 6);
INSERT INTO public.moon VALUES (20, 'Prometheus', 86.20, 1980, 6);
INSERT INTO public.moon VALUES (21, 'Pandora', 81.40, 1980, 6);
INSERT INTO public.moon VALUES (22, 'Epimetheus', 116.20, 1977, 6);
INSERT INTO public.moon VALUES (23, 'Janus', 179.00, 1966, 6);
INSERT INTO public.moon VALUES (24, 'Mimas', 396.40, 1789, 6);
INSERT INTO public.moon VALUES (25, 'Enceladus', 504.20, 1789, 6);
INSERT INTO public.moon VALUES (26, 'Tethys', 1062.20, 1684, 6);
INSERT INTO public.moon VALUES (27, 'Telesto', 24.80, 1980, 6);
INSERT INTO public.moon VALUES (28, 'Calypso', 21.40, 1980, 6);
INSERT INTO public.moon VALUES (29, 'Dione', 1122.80, 1684, 6);
INSERT INTO public.moon VALUES (30, 'Helene', 35.20, 1980, 6);
INSERT INTO public.moon VALUES (31, 'Rhea', 1527.60, 1672, 6);
INSERT INTO public.moon VALUES (32, 'Titan', 5149.46, 1655, 6);
INSERT INTO public.moon VALUES (33, 'Hyperion', 270.00, 1848, 6);
INSERT INTO public.moon VALUES (34, 'Iapetus', 1468.60, 1671, 6);
INSERT INTO public.moon VALUES (35, 'Phoebe', 213.00, 1899, 6);
INSERT INTO public.moon VALUES (36, 'Paaliaq', 25.00, 2000, 6);
INSERT INTO public.moon VALUES (37, 'Albiorix', 28.60, 2000, 6);
INSERT INTO public.moon VALUES (38, 'Siarnaq', 39.30, 2000, 6);
INSERT INTO public.moon VALUES (39, 'Cordelia', 40.00, 1986, 7);
INSERT INTO public.moon VALUES (40, 'Ophelia', 43.00, 1986, 7);
INSERT INTO public.moon VALUES (41, 'Bianca', 51.00, 1986, 7);
INSERT INTO public.moon VALUES (42, 'Cressida', 80.00, 1986, 7);
INSERT INTO public.moon VALUES (43, 'Desdemona', 64.00, 1986, 7);
INSERT INTO public.moon VALUES (44, 'Juliet', 94.00, 1986, 7);
INSERT INTO public.moon VALUES (45, 'Portia', 135.00, 1986, 7);
INSERT INTO public.moon VALUES (46, 'Rosalind', 72.00, 1986, 7);
INSERT INTO public.moon VALUES (47, 'Belinda', 90.00, 1986, 7);
INSERT INTO public.moon VALUES (48, 'Perdita', 30.00, 1999, 7);
INSERT INTO public.moon VALUES (49, 'Puck', 162.00, 1985, 7);
INSERT INTO public.moon VALUES (50, 'Mab', 25.00, 2003, 7);
INSERT INTO public.moon VALUES (51, 'Miranda', 471.60, 1948, 7);
INSERT INTO public.moon VALUES (52, 'Ariel', 1157.80, 1851, 7);
INSERT INTO public.moon VALUES (53, 'Umbriel', 1169.40, 1851, 7);
INSERT INTO public.moon VALUES (54, 'Titania', 1576.80, 1787, 7);
INSERT INTO public.moon VALUES (55, 'Oberon', 1522.80, 1787, 7);
INSERT INTO public.moon VALUES (56, 'Francisco', 22.00, 2003, 7);
INSERT INTO public.moon VALUES (57, 'Caliban', 42.00, 1997, 7);
INSERT INTO public.moon VALUES (58, 'Stephano', 32.00, 1999, 7);
INSERT INTO public.moon VALUES (59, 'Sycorax', 157.00, 1997, 7);
INSERT INTO public.moon VALUES (60, 'Margaret', 20.00, 2003, 7);
INSERT INTO public.moon VALUES (61, 'Prospero', 50.00, 1999, 7);
INSERT INTO public.moon VALUES (62, 'Setebos', 48.00, 1999, 7);
INSERT INTO public.moon VALUES (63, 'Ferdinand', 20.00, 2003, 7);
INSERT INTO public.moon VALUES (64, 'Naiad', 60.40, 1989, 8);
INSERT INTO public.moon VALUES (65, 'Thalassa', 81.40, 1989, 8);
INSERT INTO public.moon VALUES (66, 'Despina', 156.00, 1989, 8);
INSERT INTO public.moon VALUES (67, 'Galatea', 174.80, 1989, 8);
INSERT INTO public.moon VALUES (68, 'Larissa', 194.00, 1981, 8);
INSERT INTO public.moon VALUES (69, 'Hippocamp', 34.80, 2013, 8);
INSERT INTO public.moon VALUES (70, 'Proteus', 420.00, 1989, 8);
INSERT INTO public.moon VALUES (71, 'Triton', 2705.20, 1846, 8);
INSERT INTO public.moon VALUES (72, 'Nereid', 357.00, 1949, 8);
INSERT INTO public.moon VALUES (73, 'Halimede', 61.00, 2002, 8);
INSERT INTO public.moon VALUES (74, 'Sao', 40.00, 2002, 8);
INSERT INTO public.moon VALUES (75, 'Laomedeia', 40.00, 2002, 8);
INSERT INTO public.moon VALUES (76, 'Psamathe', 38.00, 2003, 8);
INSERT INTO public.moon VALUES (77, 'Neso', 60.00, 2002, 8);
INSERT INTO public.moon VALUES (78, 'Vanth', 440.00, 2005, 10);
INSERT INTO public.moon VALUES (79, 'Charon', 1212.00, 1978, 11);
INSERT INTO public.moon VALUES (80, 'Hiiaka', 310.00, 2005, 12);
INSERT INTO public.moon VALUES (81, 'Namaka', 170.00, 2005, 12);
INSERT INTO public.moon VALUES (82, 'Weywot', 170.00, 2007, 13);
INSERT INTO public.moon VALUES (83, 'Xiangliu', 36.00, 2010, 15);
INSERT INTO public.moon VALUES (84, 'Dysnomia', 700.00, 2005, 16);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 15, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 21, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 25, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, false, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 0, true, 1);
INSERT INTO public.planet VALUES (10, 'Orcus', 1, true, 1);
INSERT INTO public.planet VALUES (11, 'Pluto', 1, true, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 2, true, 1);
INSERT INTO public.planet VALUES (13, 'Quaoar', 1, true, 1);
INSERT INTO public.planet VALUES (14, 'Makemake', 1, true, 1);
INSERT INTO public.planet VALUES (15, 'Gonggong', 1, true, 1);
INSERT INTO public.planet VALUES (16, 'Eris', 0, true, 1);
INSERT INTO public.planet VALUES (17, 'Sedna', 0, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Personification of the greek god Helios', 1, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Scorcher', 1, 1);
INSERT INTO public.star VALUES (3, 'Canopus', 'Canopus was a navigator for Menelaus, king of Sparta', 1, 2);
INSERT INTO public.star VALUES (4, 'Arcturus', 'Guardian of the bear', 1, 3);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Nearest star of Centaurus', 1, 4);
INSERT INTO public.star VALUES (6, 'Rigil Kentaurus', 'The foot of the Centaur', 1, 4);
INSERT INTO public.star VALUES (7, 'Vega', 'Falling or landing', 1, 5);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 84, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- NALTER TABLE ONLY public.star
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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

ame: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
