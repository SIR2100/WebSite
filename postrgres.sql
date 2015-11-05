--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5beta1
-- Dumped by pg_dump version 9.5beta1

-- Started on 2015-11-05 18:21:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2125 (class 1262 OID 12373)
-- Dependencies: 2124
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 186 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 186
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 185 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 185
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 16408)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comment (
    place_id text,
    user_id text,
    date text,
    rating text,
    access text
);


ALTER TABLE comment OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16425)
-- Name: kol_articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kol_articles (
);


ALTER TABLE kol_articles OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16411)
-- Name: places; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE places (
    place_id text,
    coord text,
    coord_name text,
    verified_status text,
    added_user text,
    wiki_http text
);


ALTER TABLE places OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16422)
-- Name: reg_date; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reg_date (
);


ALTER TABLE reg_date OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16405)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "user" (
    id text NOT NULL,
    username text,
    access text,
    raiting text,
    reg_date text,
    article_mount text,
    review_mount text,
    "e-mail" text,
    tel_number text,
    id_soc_vk text,
    id_soc_facebook text
);


ALTER TABLE "user" OWNER TO postgres;

--
-- TOC entry 2116 (class 0 OID 16408)
-- Dependencies: 181
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comment (place_id, user_id, date, rating, access) FROM stdin;
\.


--
-- TOC entry 2119 (class 0 OID 16425)
-- Dependencies: 184
-- Data for Name: kol_articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kol_articles  FROM stdin;
\.


--
-- TOC entry 2117 (class 0 OID 16411)
-- Dependencies: 182
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY places (place_id, coord, coord_name, verified_status, added_user, wiki_http) FROM stdin;
\.


--
-- TOC entry 2118 (class 0 OID 16422)
-- Dependencies: 183
-- Data for Name: reg_date; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reg_date  FROM stdin;
\.


--
-- TOC entry 2115 (class 0 OID 16405)
-- Dependencies: 180
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "user" (id, username, access, raiting, reg_date, article_mount, review_mount, "e-mail", tel_number, id_soc_vk, id_soc_facebook) FROM stdin;
SIR2100	MaradeR2100	Rostov	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2000 (class 2606 OID 16418)
-- Name: id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-11-05 18:21:51

--
-- PostgreSQL database dump complete
--

