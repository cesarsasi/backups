--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE "DB-Volunteering";




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md501a09d4b484a07a6df80f3ae838be8fe';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "DB-Volunteering" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

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
-- Name: DB-Volunteering; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "DB-Volunteering" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE "DB-Volunteering" OWNER TO postgres;

\connect -reuse-previous=on "dbname='DB-Volunteering'"

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
-- Name: eme_habilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eme_habilidad (
    id numeric(8,0) NOT NULL,
    id_emergencia numeric(6,0),
    id_habilidad numeric(4,0)
);


ALTER TABLE public.eme_habilidad OWNER TO postgres;

--
-- Name: emergencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emergencia (
    id numeric(6,0) NOT NULL,
    nombre character varying(100),
    descrip character varying(400),
    finicio date,
    ffin date,
    id_institucion numeric(4,0)
);


ALTER TABLE public.emergencia OWNER TO postgres;

--
-- Name: estado_tarea0; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_tarea0 (
    id numeric(2,0) NOT NULL,
    descrip character varying(20)
);


ALTER TABLE public.estado_tarea0 OWNER TO postgres;

--
-- Name: habilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habilidad (
    id numeric(4,0) NOT NULL,
    descrip character varying(100)
);


ALTER TABLE public.habilidad OWNER TO postgres;

--
-- Name: institucion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institucion (
    id numeric(4,0) NOT NULL,
    nombre character varying(100),
    descrip character varying(400)
);


ALTER TABLE public.institucion OWNER TO postgres;

--
-- Name: ranking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ranking (
    id numeric(8,0) NOT NULL,
    id_voluntario numeric(8,0),
    id_tarea numeric(8,0),
    puntaje numeric(3,0),
    flg_invitado numeric(1,0),
    flg_participa numeric(1,0)
);


ALTER TABLE public.ranking OWNER TO postgres;

--
-- Name: TABLE ranking; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.ranking IS 'los flgInvitado, flgParticipa 1 si la respuesta es si, 2 si la respuesta es no';


--
-- Name: tarea0; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarea0 (
    id numeric(8,0) NOT NULL,
    nombre character varying(60),
    descrip character varying(300),
    cant_vol_requeridos numeric(4,0),
    cant_vol_inscritos numeric(4,0),
    id_emergencia numeric(6,0),
    finicio date,
    ffin date,
    id_estado numeric(2,0),
    invisible numeric(2,0)
);


ALTER TABLE public.tarea0 OWNER TO postgres;

--
-- Name: tarea0_habilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarea0_habilidad (
    id numeric(8,0) NOT NULL,
    id_emehab numeric(8,0),
    id_tarea numeric(8,0)
);


ALTER TABLE public.tarea0_habilidad OWNER TO postgres;

--
-- Name: vol_habilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vol_habilidad (
    id numeric(8,0) NOT NULL,
    id_voluntario numeric(8,0),
    id_habilidad numeric(8,0)
);


ALTER TABLE public.vol_habilidad OWNER TO postgres;

--
-- Name: voluntario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voluntario (
    id numeric(8,0) NOT NULL,
    nombre character varying(100),
    fnacimiento date
);


ALTER TABLE public.voluntario OWNER TO postgres;

--
-- Data for Name: eme_habilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eme_habilidad (id, id_emergencia, id_habilidad) FROM stdin;
0	2	2
1	0	1
2	2	2
3	0	5
4	4	5
5	3	1
\.


--
-- Data for Name: emergencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emergencia (id, nombre, descrip, finicio, ffin, id_institucion) FROM stdin;
0	emergencia_0	descrip_0	1993-07-06	2009-02-17	1
1	emergencia_1	descrip_1	1993-06-12	2019-12-11	5
2	emergencia_2	descrip_2	1993-07-18	2008-02-21	4
3	emergencia_3	descrip_3	1996-04-08	2007-08-05	1
4	emergencia_4	descrip_4	1994-04-12	2007-08-30	1
5	emergencia_5	descrip_5	1998-06-07	2002-07-23	4
\.


--
-- Data for Name: estado_tarea0; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado_tarea0 (id, descrip) FROM stdin;
0	estado_0
1	estado_1
2	estado_2
3	estado_3
4	estado_4
5	estado_5
\.


--
-- Data for Name: habilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habilidad (id, descrip) FROM stdin;
0	Habilidad_0
1	Habilidad_1
2	Habilidad_2
3	Habilidad_3
4	Habilidad_4
5	Habilidad_5
\.


--
-- Data for Name: institucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institucion (id, nombre, descrip) FROM stdin;
0	institucion_0	descrip_0
1	institucion_1	descrip_1
2	institucion_2	descrip_2
3	institucion_3	descrip_3
4	institucion_4	descrip_4
5	institucion_5	descrip_5
\.


--
-- Data for Name: ranking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ranking (id, id_voluntario, id_tarea, puntaje, flg_invitado, flg_participa) FROM stdin;
0	1	4	84	1	1
1	1	1	16	1	1
2	0	5	7	1	1
3	5	4	30	1	1
4	3	3	70	1	1
5	2	3	87	1	1
\.


--
-- Data for Name: tarea0; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarea0 (id, nombre, descrip, cant_vol_requeridos, cant_vol_inscritos, id_emergencia, finicio, ffin, id_estado, invisible) FROM stdin;
5	tarea_5	descrip_5	19	10	4	1998-10-28	2005-10-14	1	0
1	tarea_1	descrip_1	16	14	3	1990-06-30	2001-10-18	2	0
3	tarea_3	descrip_3	18	11	4	1995-11-22	2004-09-09	5	1
4	tarea_4	descrip_4	19	13	1	1996-06-09	2019-05-31	4	0
6	tarea_1	\N	18	0	0	2020-11-22	2017-07-21	1	1
0	tarea_0	descrip_0	18	11	4	1994-08-30	2009-01-11	3	1
2	tarea_2	descrip_2	17	11	4	1991-10-27	2019-01-19	3	1
9	tarea_9	descrip_9	18	0	0	2020-11-22	2017-07-21	1	0
\.


--
-- Data for Name: tarea0_habilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarea0_habilidad (id, id_emehab, id_tarea) FROM stdin;
0	1	5
1	2	2
2	5	1
3	5	1
4	0	4
5	2	4
\.


--
-- Data for Name: vol_habilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vol_habilidad (id, id_voluntario, id_habilidad) FROM stdin;
0	0	4
1	4	0
2	1	4
3	5	0
4	4	3
5	1	0
\.


--
-- Data for Name: voluntario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voluntario (id, nombre, fnacimiento) FROM stdin;
0	Voluntario_0	1992-04-10
1	Voluntario_1	1995-12-10
2	Voluntario_2	1992-01-18
3	Voluntario_3	1993-11-25
4	Voluntario_4	1970-02-08
5	Voluntario_5	1972-04-30
\.


--
-- Name: eme_habilidad eme_habilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT eme_habilidad_pkey PRIMARY KEY (id);


--
-- Name: emergencia emergencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergencia
    ADD CONSTRAINT emergencia_pkey PRIMARY KEY (id);


--
-- Name: estado_tarea0 estado_tarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_tarea0
    ADD CONSTRAINT estado_tarea_pkey PRIMARY KEY (id);


--
-- Name: habilidad habilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilidad
    ADD CONSTRAINT habilidad_pkey PRIMARY KEY (id);


--
-- Name: institucion institucion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institucion
    ADD CONSTRAINT institucion_pkey PRIMARY KEY (id);


--
-- Name: ranking ranking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT ranking_pkey PRIMARY KEY (id);


--
-- Name: tarea0_habilidad tarea_habilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea0_habilidad
    ADD CONSTRAINT tarea_habilidad_pkey PRIMARY KEY (id);


--
-- Name: tarea0 tarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea0
    ADD CONSTRAINT tarea_pkey PRIMARY KEY (id);


--
-- Name: vol_habilidad vol_habilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT vol_habilidad_pkey PRIMARY KEY (id);


--
-- Name: voluntario voluntario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voluntario
    ADD CONSTRAINT voluntario_pkey PRIMARY KEY (id);


--
-- Name: eme_habilidad fk_emehab_emergencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT fk_emehab_emergencia FOREIGN KEY (id_emergencia) REFERENCES public.emergencia(id);


--
-- Name: eme_habilidad fk_emehab_habilidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT fk_emehab_habilidad FOREIGN KEY (id_habilidad) REFERENCES public.habilidad(id);


--
-- Name: emergencia fk_emergencia_institucion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergencia
    ADD CONSTRAINT fk_emergencia_institucion FOREIGN KEY (id_institucion) REFERENCES public.institucion(id);


--
-- Name: ranking fk_ranking_tarea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT fk_ranking_tarea FOREIGN KEY (id_tarea) REFERENCES public.tarea0(id);


--
-- Name: ranking fk_ranking_voluntario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT fk_ranking_voluntario FOREIGN KEY (id_voluntario) REFERENCES public.voluntario(id);


--
-- Name: tarea0 fk_tarea_emergencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea0
    ADD CONSTRAINT fk_tarea_emergencia FOREIGN KEY (id_emergencia) REFERENCES public.emergencia(id);


--
-- Name: tarea0 fk_tarea_estadotarea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea0
    ADD CONSTRAINT fk_tarea_estadotarea FOREIGN KEY (id_estado) REFERENCES public.estado_tarea0(id);


--
-- Name: tarea0_habilidad fk_tareahab_emehab; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea0_habilidad
    ADD CONSTRAINT fk_tareahab_emehab FOREIGN KEY (id_emehab) REFERENCES public.eme_habilidad(id);


--
-- Name: tarea0_habilidad fk_tareahab_tarea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea0_habilidad
    ADD CONSTRAINT fk_tareahab_tarea FOREIGN KEY (id_tarea) REFERENCES public.tarea0(id);


--
-- Name: vol_habilidad fk_volhab_habilidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT fk_volhab_habilidad FOREIGN KEY (id_habilidad) REFERENCES public.habilidad(id);


--
-- Name: vol_habilidad fk_volhab_voluntario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT fk_volhab_voluntario FOREIGN KEY (id_voluntario) REFERENCES public.voluntario(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: eme_habilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eme_habilidad (
    id numeric(8,0) NOT NULL,
    id_emergencia numeric(6,0),
    id_habilidad numeric(4,0)
);


ALTER TABLE public.eme_habilidad OWNER TO postgres;

--
-- Name: emergencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emergencia (
    id numeric(6,0) NOT NULL,
    nombre character varying(100),
    descrip character varying(400),
    finicio date,
    ffin date,
    id_institucion numeric(4,0)
);


ALTER TABLE public.emergencia OWNER TO postgres;

--
-- Name: estado_tarea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_tarea (
    id numeric(2,0) NOT NULL,
    descrip character varying(20)
);


ALTER TABLE public.estado_tarea OWNER TO postgres;

--
-- Name: habilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habilidad (
    id numeric(4,0) NOT NULL,
    descrip character varying(100)
);


ALTER TABLE public.habilidad OWNER TO postgres;

--
-- Name: institucion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institucion (
    id numeric(4,0) NOT NULL,
    nombre character varying(100),
    descrip character varying(400)
);


ALTER TABLE public.institucion OWNER TO postgres;

--
-- Name: ranking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ranking (
    id numeric(8,0) NOT NULL,
    id_voluntario numeric(8,0),
    id_tarea numeric(8,0),
    puntaje numeric(3,0),
    flg_invitado numeric(1,0),
    flg_participa numeric(1,0)
);


ALTER TABLE public.ranking OWNER TO postgres;

--
-- Name: TABLE ranking; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.ranking IS 'los flgInvitado, flgParticipa 1 si la respuesta es si, 2 si la respuesta es no';


--
-- Name: tarea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarea (
    id numeric(8,0) NOT NULL,
    nombre character varying(60),
    descrip character varying(300),
    cant_vol_requeridos numeric(4,0),
    cant_vol_inscritos numeric(4,0),
    id_emergencia numeric(6,0),
    finicio date,
    ffin date,
    id_estado numeric(2,0)
);


ALTER TABLE public.tarea OWNER TO postgres;

--
-- Name: tarea_habilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarea_habilidad (
    id numeric(8,0) NOT NULL,
    id_emehab numeric(8,0),
    id_tarea numeric(8,0)
);


ALTER TABLE public.tarea_habilidad OWNER TO postgres;

--
-- Name: vol_habilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vol_habilidad (
    id numeric(8,0) NOT NULL,
    id_voluntario numeric(8,0),
    id_habilidad numeric(8,0)
);


ALTER TABLE public.vol_habilidad OWNER TO postgres;

--
-- Name: voluntario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voluntario (
    id numeric(8,0) NOT NULL,
    nombre character varying(100),
    fnacimiento date
);


ALTER TABLE public.voluntario OWNER TO postgres;

--
-- Data for Name: eme_habilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eme_habilidad (id, id_emergencia, id_habilidad) FROM stdin;
\.


--
-- Data for Name: emergencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emergencia (id, nombre, descrip, finicio, ffin, id_institucion) FROM stdin;
\.


--
-- Data for Name: estado_tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado_tarea (id, descrip) FROM stdin;
\.


--
-- Data for Name: habilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habilidad (id, descrip) FROM stdin;
\.


--
-- Data for Name: institucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institucion (id, nombre, descrip) FROM stdin;
\.


--
-- Data for Name: ranking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ranking (id, id_voluntario, id_tarea, puntaje, flg_invitado, flg_participa) FROM stdin;
\.


--
-- Data for Name: tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarea (id, nombre, descrip, cant_vol_requeridos, cant_vol_inscritos, id_emergencia, finicio, ffin, id_estado) FROM stdin;
\.


--
-- Data for Name: tarea_habilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarea_habilidad (id, id_emehab, id_tarea) FROM stdin;
\.


--
-- Data for Name: vol_habilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vol_habilidad (id, id_voluntario, id_habilidad) FROM stdin;
\.


--
-- Data for Name: voluntario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voluntario (id, nombre, fnacimiento) FROM stdin;
\.


--
-- Name: eme_habilidad eme_habilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT eme_habilidad_pkey PRIMARY KEY (id);


--
-- Name: emergencia emergencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergencia
    ADD CONSTRAINT emergencia_pkey PRIMARY KEY (id);


--
-- Name: estado_tarea estado_tarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_tarea
    ADD CONSTRAINT estado_tarea_pkey PRIMARY KEY (id);


--
-- Name: habilidad habilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilidad
    ADD CONSTRAINT habilidad_pkey PRIMARY KEY (id);


--
-- Name: institucion institucion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institucion
    ADD CONSTRAINT institucion_pkey PRIMARY KEY (id);


--
-- Name: ranking ranking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT ranking_pkey PRIMARY KEY (id);


--
-- Name: tarea_habilidad tarea_habilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea_habilidad
    ADD CONSTRAINT tarea_habilidad_pkey PRIMARY KEY (id);


--
-- Name: tarea tarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_pkey PRIMARY KEY (id);


--
-- Name: vol_habilidad vol_habilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT vol_habilidad_pkey PRIMARY KEY (id);


--
-- Name: voluntario voluntario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voluntario
    ADD CONSTRAINT voluntario_pkey PRIMARY KEY (id);


--
-- Name: eme_habilidad fk_emehab_emergencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT fk_emehab_emergencia FOREIGN KEY (id_emergencia) REFERENCES public.emergencia(id);


--
-- Name: eme_habilidad fk_emehab_habilidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT fk_emehab_habilidad FOREIGN KEY (id_habilidad) REFERENCES public.habilidad(id);


--
-- Name: emergencia fk_emergencia_institucion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergencia
    ADD CONSTRAINT fk_emergencia_institucion FOREIGN KEY (id_institucion) REFERENCES public.institucion(id);


--
-- Name: ranking fk_ranking_tarea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT fk_ranking_tarea FOREIGN KEY (id_tarea) REFERENCES public.tarea(id);


--
-- Name: ranking fk_ranking_voluntario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT fk_ranking_voluntario FOREIGN KEY (id_voluntario) REFERENCES public.voluntario(id);


--
-- Name: tarea fk_tarea_emergencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT fk_tarea_emergencia FOREIGN KEY (id_emergencia) REFERENCES public.emergencia(id);


--
-- Name: tarea fk_tarea_estadotarea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT fk_tarea_estadotarea FOREIGN KEY (id_estado) REFERENCES public.estado_tarea(id);


--
-- Name: tarea_habilidad fk_tareahab_emehab; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea_habilidad
    ADD CONSTRAINT fk_tareahab_emehab FOREIGN KEY (id_emehab) REFERENCES public.eme_habilidad(id);


--
-- Name: tarea_habilidad fk_tareahab_tarea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea_habilidad
    ADD CONSTRAINT fk_tareahab_tarea FOREIGN KEY (id_tarea) REFERENCES public.tarea(id);


--
-- Name: vol_habilidad fk_volhab_habilidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT fk_volhab_habilidad FOREIGN KEY (id_habilidad) REFERENCES public.habilidad(id);


--
-- Name: vol_habilidad fk_volhab_voluntario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT fk_volhab_voluntario FOREIGN KEY (id_voluntario) REFERENCES public.voluntario(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

