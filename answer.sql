--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: answers; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE answers (
    id integer NOT NULL,
    text character varying(255),
    rating integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    decision_id integer
);


ALTER TABLE public.answers OWNER TO rails;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO rails;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE answers_id_seq OWNED BY answers.id;


--
-- Name: criteria; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE criteria (
    id integer NOT NULL,
    text character varying(255),
    importance integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    decision_id integer
);


ALTER TABLE public.criteria OWNER TO rails;

--
-- Name: criteria_answers; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE criteria_answers (
    id integer NOT NULL,
    answer_id integer,
    criterion_id integer,
    rating integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.criteria_answers OWNER TO rails;

--
-- Name: criteria_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE criteria_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criteria_answers_id_seq OWNER TO rails;

--
-- Name: criteria_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE criteria_answers_id_seq OWNED BY criteria_answers.id;


--
-- Name: criteria_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE criteria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criteria_id_seq OWNER TO rails;

--
-- Name: criteria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE criteria_id_seq OWNED BY criteria.id;


--
-- Name: decisions; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE decisions (
    id integer NOT NULL,
    text character varying(255),
    decision character varying(255),
    user_id integer
);


ALTER TABLE public.decisions OWNER TO rails;

--
-- Name: decisions_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE decisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.decisions_id_seq OWNER TO rails;

--
-- Name: decisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE decisions_id_seq OWNED BY decisions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO rails;

--
-- Name: users; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255),
    name character varying(255),
    password_digest character varying(255),
    is_active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO rails;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO rails;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY answers ALTER COLUMN id SET DEFAULT nextval('answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY criteria ALTER COLUMN id SET DEFAULT nextval('criteria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY criteria_answers ALTER COLUMN id SET DEFAULT nextval('criteria_answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY decisions ALTER COLUMN id SET DEFAULT nextval('decisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY answers (id, text, rating, created_at, updated_at, decision_id) FROM stdin;
1	Tender Greens	\N	2014-08-27 17:41:27.795623	2014-08-27 17:41:27.795623	1
2	Umami Burger	\N	2014-08-27 17:41:31.707556	2014-08-27 17:41:31.707556	1
3	Shop House	\N	2014-08-27 17:41:48.846025	2014-08-27 17:41:48.846025	1
8	University of Colorado	\N	2014-09-07 03:10:44.50945	2014-09-07 03:10:44.50945	2
9	Tender Greens	\N	2014-09-16 16:30:19.155311	2014-09-16 16:30:19.155311	3
10	Pinches	\N	2014-09-16 16:31:25.123474	2014-09-16 16:31:25.123474	3
11	Shop House	\N	2014-09-16 16:33:55.473362	2014-09-16 16:33:55.473362	3
13	Harvard	\N	2014-09-16 22:50:59.936703	2014-09-16 22:50:59.936703	4
14	Yale	\N	2014-09-16 22:51:03.200365	2014-09-16 22:51:03.200365	4
17	\N	1	2014-09-16 23:17:18.18672	2014-09-16 23:17:18.18672	3
21	test	\N	2014-09-18 00:11:33.311709	2014-09-18 00:11:33.311709	8
24	harvard	\N	2014-09-18 22:11:40.48318	2014-09-18 22:11:40.48318	8
26	yale	\N	2014-09-19 00:12:47.942735	2014-09-19 00:12:47.942735	8
27	Susan	\N	2014-09-22 16:57:04.362333	2014-09-22 16:57:04.362333	9
28	Alicia	\N	2014-09-22 16:57:07.469449	2014-09-22 16:57:07.469449	9
29	Edwina	\N	2014-09-22 16:57:16.747884	2014-09-22 16:57:16.747884	9
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('answers_id_seq', 29, true);


--
-- Data for Name: criteria; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY criteria (id, text, importance, created_at, updated_at, decision_id) FROM stdin;
1	Cost	\N	2014-09-17 23:48:10.456806	2014-09-17 23:48:10.456806	7
2	Location	\N	2014-09-17 23:48:10.469326	2014-09-17 23:48:10.469326	7
3	Location	9	2014-09-17 23:49:24.361904	2014-09-17 23:49:24.361904	8
4	Price	8	2014-09-17 23:49:28.327999	2014-09-17 23:49:28.327999	8
5	friends	10	2014-09-17 23:49:32.23927	2014-09-17 23:49:32.23927	8
6	Put up with Fred's antics	8	2014-09-22 16:56:22.370875	2014-09-22 16:56:22.370875	9
7	Dances well	7	2014-09-22 16:56:38.604235	2014-09-22 16:56:38.604235	9
8	Clean driving record	6	2014-09-22 16:56:48.599534	2014-09-22 16:56:48.599534	9
\.


--
-- Data for Name: criteria_answers; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY criteria_answers (id, answer_id, criterion_id, rating, created_at, updated_at) FROM stdin;
1	29	6	\N	\N	\N
2	29	7	\N	\N	\N
4	28	6	\N	\N	\N
6	28	8	\N	\N	\N
8	27	7	\N	\N	\N
9	27	8	\N	\N	\N
5	28	7	8	\N	\N
3	29	8	2	\N	\N
7	27	6	9	\N	\N
\.


--
-- Name: criteria_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('criteria_answers_id_seq', 9, true);


--
-- Name: criteria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('criteria_id_seq', 8, true);


--
-- Data for Name: decisions; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY decisions (id, text, decision, user_id) FROM stdin;
7	Where do I go for dinner?	\N	\N
8	Where do i go to school?	\N	3
9	Who should I marry?	\N	3
\.


--
-- Name: decisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('decisions_id_seq', 9, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY schema_migrations (version) FROM stdin;
20140823033807
20140823034450
20140826175740
20140826181654
20140916235603
20140918000832
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY users (id, email, name, password_digest, is_active, created_at, updated_at) FROM stdin;
1	jeremy.zander@gmail.com	Jeremy	$2a$10$C4sMm4p9R6MqWgafkqSakeAj3AK9fIToWkGcYa8l8qnUqyHiZPhgO	\N	2014-08-27 17:40:33.304541	2014-08-27 17:40:33.304541
2	gary@projectone.com	Gary	$2a$10$RcXlcD0KZlCbbYL9R9UhDO.AU3Qo9ebTSfqVJV4FkQtBdO0BTSoWm	\N	2014-09-07 03:10:02.914732	2014-09-07 03:10:02.914732
3	jack@aol.com	Jack	$2a$10$YD0RcyCAJAuHnjhLskr53OGSY3IQ9HWcWB2b50.7B26DEGjKO.XEW	\N	2014-09-16 16:29:19.061514	2014-09-16 16:29:19.061514
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: answers_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: criteria_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY criteria_answers
    ADD CONSTRAINT criteria_answers_pkey PRIMARY KEY (id);


--
-- Name: criteria_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY criteria
    ADD CONSTRAINT criteria_pkey PRIMARY KEY (id);


--
-- Name: decisions_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY decisions
    ADD CONSTRAINT decisions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_answers_on_decision_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_answers_on_decision_id ON answers USING btree (decision_id);


--
-- Name: index_criteria_answers_on_answer_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_criteria_answers_on_answer_id ON criteria_answers USING btree (answer_id);


--
-- Name: index_criteria_answers_on_criterion_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_criteria_answers_on_criterion_id ON criteria_answers USING btree (criterion_id);


--
-- Name: index_decisions_on_user_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_decisions_on_user_id ON decisions USING btree (user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: jeremyzander
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM jeremyzander;
GRANT ALL ON SCHEMA public TO jeremyzander;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

