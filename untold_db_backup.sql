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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: morganwaites
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO morganwaites;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: morganwaites
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO morganwaites;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: morganwaites
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: morganwaites
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO morganwaites;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: morganwaites
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO morganwaites;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: morganwaites
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


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
    categories character varying[] DEFAULT '{}'::character varying[],
    image_url character varying
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
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


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
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: morganwaites
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	image	Request	44	1	2022-03-07 08:30:23.57124
2	image	Request	47	2	2022-03-07 21:07:01.324643
4	image	Request	49	4	2022-03-07 21:16:30.20819
6	image	Request	50	6	2022-03-08 00:05:09.536757
10	image	Request	56	10	2022-03-08 00:58:38.050693
11	image	Request	57	11	2022-03-08 01:01:41.138928
16	image	Request	60	16	2022-03-08 01:21:47.428854
17	image	Request	61	17	2022-03-08 01:23:59.220238
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: morganwaites
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
1	Yg21uCUG1YVeEogBYuhhH9oY	954f99b2f612ec9efbabd71a0e3ab04e.jpg	image/jpeg	{"identified":true,"analyzed":true}	72156	AdlCMdp1UbPHf5WJHqWAow==	2022-03-07 08:30:23.5565
2	r37CEKWMjAaUx5kmZRUVN2Mt	Celtic_Cross_Tarot_Spread.jpeg	image/jpeg	{"identified":true,"analyzed":true}	485311	8TKCJSoW0AVR2YM6cVeauw==	2022-03-07 21:07:01.322304
4	so838w3TSSv2ikXsNDAcGCtg	49.jpg	image/jpeg	{"identified":true,"analyzed":true}	98809	6GDK123gYeLoiI2vMzG/DQ==	2022-03-07 21:16:30.204797
6	46C7ytXZmjn5uwWLZzSmQztE	50.jpg	image/jpeg	{"identified":true,"analyzed":true}	62539	kHFJa/6RHNqMAGGTgslY/g==	2022-03-08 00:05:09.528508
10	3E3mzY1Spkvrq4n4XsCXyuk6	56.jpg	image/jpeg	{"identified":true,"analyzed":true}	33122	CAxjfcewIQDyltlXjJiisQ==	2022-03-08 00:58:38.047457
11	WcqegfrvEKRUpC9JKigxNTzp	bozos.png	image/png	{"identified":true,"analyzed":true}	2621786	kW6PDP8+CrXtxKiGdjsfQQ==	2022-03-08 01:01:41.136595
16	qkzAzduQ5Dndu36dVhFZHva9	60.jpg	image/jpeg	{"identified":true,"analyzed":true}	22647	mLlKEh3atHq/0ihhrk+WJg==	2022-03-08 01:21:47.425681
17	MFiYAA3gps4P4qeipvttvHfj	bozos.png	image/png	{"identified":true,"analyzed":true}	2621786	kW6PDP8+CrXtxKiGdjsfQQ==	2022-03-08 01:23:59.217062
\.


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
3	Really cool neogothic	published	1	0	1	2022-03-06 19:50:53.371936	2022-03-06 19:50:53.371936
4	It's Timothee Chalamet!	published	1	0	44	2022-03-07 18:54:24.086523	2022-03-07 18:55:15.540832
5	He's ugly.	published	1	0	31	2022-03-07 19:37:52.768126	2022-03-07 19:37:52.768126
9	White and ugly.	published	1	0	14	2022-03-07 19:41:47.877311	2022-03-07 19:41:47.877311
10	It's red orange hot a blaze flickering like something amorphous.	published	1	0	45	2022-03-07 19:58:29.835849	2022-03-07 19:58:29.835849
12	His booty big tho.	published	1	0	31	2022-03-07 23:26:30.646258	2022-03-07 23:26:30.646258
13	Jeff Bezos, bald, is posing during New Year’s Eve with girlfriend Lauren Sánchez aboard a luxury yacht. Bezos is smiling open-mouth dressed in heart-shaped sunglasses (even though it's night) and a colorful button down shirt and light pants. All of his clothes are too tight. His girlfriend is fiercely pouting, striking a model pose in a sparkly dark bodysuit that shows off her surgically-enhanced physique. A pool and pink neon sign of 2022 shines behind them in background.	published	5	0	61	2022-03-08 01:28:22.435641	2022-03-08 01:28:22.435641
\.


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: morganwaites
--

COPY public.requests (id, content, status, user_id, created_at, updated_at, categories, image_url) FROM stdin;
4	What does fire look like?	submitted	1	2022-03-02 01:05:09.517215	2022-03-02 01:05:09.517215	{miscellaneous,nature}	\N
5	What does Timothee Chalamet look like?	submitted	1	2022-03-02 01:11:47.311084	2022-03-02 01:11:47.311084	{People}	\N
7	Describe the ugliest person you've ever met in detail.	approved	1	2022-03-02 01:16:06.865791	2022-03-02 01:16:06.865791	{people}	\N
8	What does Schönbrunn Palace look like?	approved	1	2022-03-02 01:31:17.15805	2022-03-02 01:31:17.15805	{buildings}	\N
9	What does a sunrise look like?	approved	1	2022-03-02 01:47:04.453286	2022-03-02 01:47:04.453286	{nature}	\N
10	What does Kanye West look like?	approved	1	2022-03-02 02:02:17.960037	2022-03-02 02:02:17.960037	{people}	\N
6	What does Timothee Chalamet look like?	published	1	2022-03-02 01:12:29.504444	2022-03-02 02:24:39.230956	{people}	\N
1	Describe the Eiffel Tower.	published	1	2022-03-01 23:50:58.643521	2022-03-02 07:32:41.938119	{landmarks}	\N
11	Describe how woman look different form men.	submitted	1	2022-03-02 23:03:32.894194	2022-03-02 23:03:32.894194	{people}	\N
12	What does fire look like?	approved	1	2022-03-04 17:41:08.472961	2022-03-04 17:41:08.472961	{nature}	\N
13	What do golden retrievers look like? My friend has one.	approved	1	2022-03-04 17:44:45.855276	2022-03-04 17:44:45.855276	{animals}	\N
17	How do the different ethnicities differ in appearance?	approved	1	2022-03-04 18:04:37.79522	2022-03-04 18:04:37.79522	{people,nature}	\N
18	How would you describe the color red?	approved	1	2022-03-04 18:05:36.423095	2022-03-04 18:05:36.423095	{miscellaneous}	\N
19	How would you describe the color blue?	approved	1	2022-03-04 18:07:24.230345	2022-03-04 18:07:24.230345	{miscellaneous}	\N
20	What's a sunset look like?	approved	1	2022-03-04 18:13:07.23931	2022-03-04 18:13:07.23931	{nature}	\N
49	What is Timmy wearing in this photo?	approved	1	2022-03-07 21:16:30.016989	2022-03-07 21:16:30.209187	{people}	https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1193568705-1-1576249998.jpg?crop=1.00xw:0.667xh;0,0.0942xh&resize=980:*
44	who dis?	published	1	2022-03-07 08:30:23.511323	2022-03-07 18:57:48.865373	{}	\N
31	What does Donald Trump look like?	published	1	2022-03-06 18:53:47.148575	2022-03-07 19:40:34.824434	{people}	\N
14	What does the White House look like?	published	1	2022-03-04 17:57:34.101274	2022-03-07 19:41:47.882326	{buildings,landmarks}	\N
45	What does fire look like?	published	1	2022-03-07 19:49:22.238727	2022-03-07 19:58:29.85518	{}	\N
47	What does this spread look like? Describe each card and placement. Astrology knowledge needed.	approved	1	2022-03-07 21:07:01.314599	2022-03-07 21:07:01.32654	{miscellaneous,objects}	\N
50	Can you give me detailed description of Tinder Swindler?	approved	1	2022-03-08 00:05:09.338748	2022-03-08 00:05:09.538967	{}	https://www.thesun.co.uk/wp-content/uploads/2022/02/NINTCHDBPICT000709167929-6.jpg
60	What's this meme?	approved	5	2022-03-08 01:21:47.34589	2022-03-08 01:21:47.430064	{}	https://i.pinimg.com/550x/15/86/e6/1586e632940bcdfb272efa701ce166b2.jpg
61	What going on in this photo?	published	5	2022-03-08 01:23:59.189905	2022-03-08 01:28:22.443808	{}	\N
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
20220307063206
20220307205405
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: morganwaites
--

COPY public.users (id, email, encrypted_password, admin, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, username) FROM stdin;
1	admin@test.com	$2a$12$TeC8xLvlP.zG5qwNouU.kOcWxFqyoSOFObhGiC1rxb6AOB5.AZrpG	t	\N	\N	\N	2022-03-01 23:47:19.055466	2022-03-01 23:47:19.055466	admin_1
5	morgan.waites@gmail.com	$2a$12$GMftd7qEtaXM9fZdoqTx4O.8tjZf8SLGSSpVJ8mnJ14m8XCVEId6O	f	\N	\N	\N	2022-03-08 01:18:19.512914	2022-03-08 01:31:38.995687	mellowmorgan
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: morganwaites
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 17, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: morganwaites
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 17, true);


--
-- Name: descriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: morganwaites
--

SELECT pg_catalog.setval('public.descriptions_id_seq', 13, true);


--
-- Name: requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: morganwaites
--

SELECT pg_catalog.setval('public.requests_id_seq', 61, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: morganwaites
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


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
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: morganwaites
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: morganwaites
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: morganwaites
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


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
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: morganwaites
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

