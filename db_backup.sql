--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9
-- Dumped by pg_dump version 14.1

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: morganwaites
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO morganwaites;

--
-- Name: descriptions; Type: TABLE; Schema: public; Owner: morganwaites
--

CREATE TABLE public.descriptions (
    id bigint NOT NULL,
    content character varying,
    status character varying DEFAULT 'submitted'::character varying,
    user_id integer,
    rating integer DEFAULT 0,
    request_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.descriptions OWNER TO morganwaites;

--
-- Name: descriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: morganwaites
--

CREATE SEQUENCE public.descriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.descriptions_id_seq OWNER TO morganwaites;

--
-- Name: descriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: morganwaites
--

ALTER SEQUENCE public.descriptions_id_seq OWNED BY public.descriptions.id;


--
-- Name: requests; Type: TABLE; Schema: public; Owner: morganwaites
--

CREATE TABLE public.requests (
    id bigint NOT NULL,
    content character varying,
    status character varying DEFAULT 'submitted'::character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    categories character varying[] DEFAULT '{}'::character varying[]
);


ALTER TABLE public.requests OWNER TO morganwaites;

--
-- Name: requests_id_seq; Type: SEQUENCE; Schema: public; Owner: morganwaites
--

CREATE SEQUENCE public.requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requests_id_seq OWNER TO morganwaites;

--
-- Name: requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: morganwaites
--

ALTER SEQUENCE public.requests_id_seq OWNED BY public.requests.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: morganwaites
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO morganwaites;

--
-- Name: users; Type: TABLE; Schema: public; Owner: morganwaites
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    admin boolean DEFAULT false,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    username character varying
);


ALTER TABLE public.users OWNER TO morganwaites;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: morganwaites
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO morganwaites;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: morganwaites
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: descriptions id; Type: DEFAULT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.descriptions ALTER COLUMN id SET DEFAULT nextval('public.descriptions_id_seq'::regclass);


--
-- Name: requests id; Type: DEFAULT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.requests ALTER COLUMN id SET DEFAULT nextval('public.requests_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: morganwaites
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2022-03-01 23:45:14.822805	2022-03-01 23:45:14.822805
\.


--
-- Data for Name: descriptions; Type: TABLE DATA; Schema: public; Owner: morganwaites
--

COPY public.descriptions (id, content, status, user_id, rating, request_id, created_at, updated_at) FROM stdin;
2	Pyramidal in shape, the tallest structure in all of Paris and composed almost completely of latticed wrought iron, it's imposing presence is one of the most identifiable landmarks in Paris and the entire world	published	1	0	1	2022-03-02 02:31:22.809339	2022-03-02 02:31:22.809339
1	The most beautiful creature that ever lived, his face is carved by god, his body lithe and slender and tall at five-feet-eleven-inches, his hair is loosely curled and dark brown, his eyes are brown as well, he's equal parts mischevious, charming, sweet, and shy which you can see in his delicate smile. His style is immaculate and inspired by haute couture and street fashion. His skin is pale and he just has a perennially youthful look about him.	published	1	0	6	2022-03-02 02:22:29.059067	2022-03-02 02:34:26.218322
\.


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: morganwaites
--

COPY public.requests (id, content, status, user_id, created_at, updated_at, categories) FROM stdin;
4	What does fire look like?	submitted	1	2022-03-02 01:05:09.517215	2022-03-02 01:05:09.517215	{miscellaneous,nature}
5	What does Timothee Chalamet look like?	submitted	1	2022-03-02 01:11:47.311084	2022-03-02 01:11:47.311084	{People}
7	Describe the ugliest person you've ever met in detail.	approved	1	2022-03-02 01:16:06.865791	2022-03-02 01:16:06.865791	{people}
8	What does Schönbrunn Palace look like?	approved	1	2022-03-02 01:31:17.15805	2022-03-02 01:31:17.15805	{buildings}
9	What does a sunrise look like?	approved	1	2022-03-02 01:47:04.453286	2022-03-02 01:47:04.453286	{nature}
10	What does Kanye West look like?	approved	1	2022-03-02 02:02:17.960037	2022-03-02 02:02:17.960037	{people}
6	What does Timothee Chalamet look like?	published	1	2022-03-02 01:12:29.504444	2022-03-02 02:24:39.230956	{people}
1	Describe the Eiffel Tower.	published	1	2022-03-01 23:50:58.643521	2022-03-02 02:32:42.253327	{}
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: morganwaites
--

COPY public.schema_migrations (version) FROM stdin;
20220227063713
20220218182523
20220218180237
20220218180519
20220218175102
20220218180454
20220218180340
20220221042757
20220218175515
20220218221807
20220218221643
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: morganwaites
--

COPY public.users (id, email, encrypted_password, admin, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, username) FROM stdin;
1	admin@test.com	$2a$12$TeC8xLvlP.zG5qwNouU.kOcWxFqyoSOFObhGiC1rxb6AOB5.AZrpG	t	\N	\N	\N	2022-03-01 23:47:19.055466	2022-03-01 23:47:19.055466	admin_1
\.


--
-- Name: descriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: morganwaites
--

SELECT pg_catalog.setval('public.descriptions_id_seq', 2, true);


--
-- Name: requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: morganwaites
--

SELECT pg_catalog.setval('public.requests_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: morganwaites
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: descriptions descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_pkey PRIMARY KEY (id);


--
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: morganwaites
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: morganwaites
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: descriptions fk_rails_46f6ab2363; Type: FK CONSTRAINT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT fk_rails_46f6ab2363 FOREIGN KEY (request_id) REFERENCES public.requests(id);


--
-- Name: descriptions fk_rails_58ab0d4634; Type: FK CONSTRAINT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT fk_rails_58ab0d4634 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: requests fk_rails_8ead8b1e6b; Type: FK CONSTRAINT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT fk_rails_8ead8b1e6b FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

