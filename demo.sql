--
-- PostgreSQL database dump
--

\restrict fq3llMaptTErnshdxPLOfgslnTSYVluj93I0pHDacjamc4Fn1KIimgdN8UEWM3L

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-03-18 11:38:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 24796)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    full_name character(225) CONSTRAINT users_name_not_null NOT NULL,
    sex character(225),
    date_time timestamp without time zone CONSTRAINT users_data_time_not_null NOT NULL,
    email character(225) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24795)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4959 (class 0 OID 24796)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, full_name, sex, date_time, email) FROM stdin;
3	Chicken Nation                                                                                                                                                                                                                   	Male                                                                                                                                                                                                                             	2026-02-10 00:00:00	whumobrianrinywe@gmail.com                                                                                                                                                                                                       
5	brian whumo                                                                                                                                                                                                                      	Male                                                                                                                                                                                                                             	2026-02-10 07:45:57.380697	whumobrianrinywe@gmail.com                                                                                                                                                                                                       
7	Alota                                                                                                                                                                                                                            	Male                                                                                                                                                                                                                             	2026-02-10 14:18:42.911723	whumobrianrinywe@gmail.com                                                                                                                                                                                                       
11	Lorem ipsum dolor sit amet                                                                                                                                                                                                       	Male                                                                                                                                                                                                                             	2026-02-10 14:39:46.974614	whumobrianrinywe@gmail.com                                                                                                                                                                                                       
\.


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- TOC entry 4810 (class 2606 OID 24804)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2026-03-18 11:38:35

--
-- PostgreSQL database dump complete
--

\unrestrict fq3llMaptTErnshdxPLOfgslnTSYVluj93I0pHDacjamc4Fn1KIimgdN8UEWM3L

