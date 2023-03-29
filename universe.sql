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

--
-- Name: constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_id_seq OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer DEFAULT nextval('public.constellation_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    galaxy_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size integer,
    age numeric(8,2),
    has_black_hole boolean,
    is_visible boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxyid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxyid_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxyid_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size numeric(8,2),
    distance_from_planet integer,
    has_atmosphere boolean,
    is_habitable boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moonid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moonid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moonid_seq OWNER TO freecodecamp;

--
-- Name: moon_moonid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moonid_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size numeric(8,2),
    distance_from_star integer,
    has_atmosphere boolean,
    is_habitable boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planetid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planetid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planetid_seq OWNER TO freecodecamp;

--
-- Name: planet_planetid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planetid_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    color character varying(20),
    age integer,
    temperature numeric(8,2),
    has_planets boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_starid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_starid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_starid_seq OWNER TO freecodecamp;

--
-- Name: star_starid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_starid_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxyid_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moonid_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planetid_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_starid_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (2, 'Orion', 'Orion is one of the most recognizable constellations in the sky, located on the celestial equator and visible throughout the world.', 1);
INSERT INTO public.constellation VALUES (3, 'Ursa Major', 'Ursa Major is a constellation in the northern sky, also known as the Great Bear.', 1);
INSERT INTO public.constellation VALUES (4, 'Cassiopeia', 'Cassiopeia is a constellation in the northern sky, named after the queen Cassiopeia in Greek mythology.', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 13.20, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 10.50, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50000, 8.10, false, true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 35, 13.17, false, true);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 25, 13.23, false, true);
INSERT INTO public.galaxy VALUES (6, 'IC 1101', 600, 13.82, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 0.27, 238, false, false, 1);
INSERT INTO public.moon VALUES (2, 'Ganymede', 0.41, 1070, false, false, 2);
INSERT INTO public.moon VALUES (3, 'Phobos', 0.00, 9, false, false, 3);
INSERT INTO public.moon VALUES (4, 'Callisto', 0.02, 13, false, false, 2);
INSERT INTO public.moon VALUES (5, 'Io', 0.02, 6, true, false, 2);
INSERT INTO public.moon VALUES (6, 'Titan', 0.02, 20, true, false, 4);
INSERT INTO public.moon VALUES (7, 'Enceladus', 0.00, 2, true, false, 4);
INSERT INTO public.moon VALUES (8, 'Mimas', 0.00, 1, false, false, 4);
INSERT INTO public.moon VALUES (9, 'Tethys', 0.00, 3, false, false, 4);
INSERT INTO public.moon VALUES (10, 'Rhea', 0.00, 5, false, false, 4);
INSERT INTO public.moon VALUES (11, 'Dione', 0.00, 4, false, false, 4);
INSERT INTO public.moon VALUES (12, 'Hyperion', 0.00, 14, false, false, 4);
INSERT INTO public.moon VALUES (13, 'Phoebe', 0.00, 215, false, false, 4);
INSERT INTO public.moon VALUES (14, 'Deimos', 0.00, 23, false, false, 3);
INSERT INTO public.moon VALUES (15, 'Charon', 0.00, 19, false, false, 5);
INSERT INTO public.moon VALUES (16, 'Nix', 0.00, 49, false, false, 5);
INSERT INTO public.moon VALUES (17, 'Hydra', 0.00, 65, false, false, 5);
INSERT INTO public.moon VALUES (18, 'Oberon', 0.00, 14, false, false, 6);
INSERT INTO public.moon VALUES (19, 'Titania', 0.00, 11, false, false, 6);
INSERT INTO public.moon VALUES (20, 'Umbriel', 0.00, 10, false, false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1.00, 93, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', 11.00, 483, true, false, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 0.50, 142, false, false, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', 0.06, 0, false, false, 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 17.15, 30, true, false, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 14.54, 19, true, false, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 95.16, 10, true, false, 2);
INSERT INTO public.planet VALUES (8, 'Pluto', 0.00, 39, false, false, 3);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 1.16, 0, true, true, 4);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 0.77, 0, true, true, 5);
INSERT INTO public.planet VALUES (11, 'Gliese 667 Cc', 3.70, 0, true, true, 6);
INSERT INTO public.planet VALUES (12, 'K2-18b', 8.60, 0, true, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow', 5, 5778.00, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red', 8, 3600.00, false, 1);
INSERT INTO public.star VALUES (3, 'Polaris', 'Yellow', 5, 5750.00, true, 2);
INSERT INTO public.star VALUES (4, 'Sirius', 'Blue', 3, 9940.00, true, 1);
INSERT INTO public.star VALUES (5, 'Proxima', 'Red', 5, 3024.00, false, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'Blue', 0, 9602.00, true, 1);


--
-- Name: constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_id_seq', 4, true);


--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxyid_seq', 6, true);


--
-- Name: moon_moonid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moonid_seq', 20, true);


--
-- Name: planet_planetid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planetid_seq', 12, true);


--
-- Name: star_starid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_starid_seq', 6, true);


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
-- Name: constellation unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planetid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planetid_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_starid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_starid_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxyid_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

