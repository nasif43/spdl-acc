--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8 (Debian 15.8-1.pgdg120+1)
-- Dumped by pg_dump version 15.8 (Debian 15.8-1.pgdg120+1)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO myuser;

--
-- Name: daily_billings; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.daily_billings (
    id integer NOT NULL,
    date date NOT NULL,
    description character varying,
    labour integer,
    due double precision NOT NULL,
    paid double precision,
    note character varying,
    project_id integer NOT NULL,
    upfront_cost boolean,
    user_id integer
);


ALTER TABLE public.daily_billings OWNER TO myuser;

--
-- Name: daily_billings_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.daily_billings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.daily_billings_id_seq OWNER TO myuser;

--
-- Name: daily_billings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.daily_billings_id_seq OWNED BY public.daily_billings.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    project_id integer,
    unit_id integer,
    amount double precision NOT NULL,
    date date NOT NULL,
    description character varying,
    cash_bank character varying,
    remarks character varying
);


ALTER TABLE public.payments OWNER TO myuser;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO myuser;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying NOT NULL,
    location character varying NOT NULL,
    start_date date,
    status character varying
);


ALTER TABLE public.projects OWNER TO myuser;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO myuser;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: units; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.units (
    id integer NOT NULL,
    project_id integer,
    unit_name character varying NOT NULL,
    date date NOT NULL,
    client_name character varying NOT NULL,
    client_number character varying,
    client_nid character varying,
    amount double precision NOT NULL,
    paid double precision NOT NULL,
    sold boolean
);


ALTER TABLE public.units OWNER TO myuser;

--
-- Name: units_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.units_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.units_id_seq OWNER TO myuser;

--
-- Name: units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.units_id_seq OWNED BY public.units.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    usertype character varying NOT NULL
);


ALTER TABLE public.users OWNER TO myuser;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO myuser;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: daily_billings id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.daily_billings ALTER COLUMN id SET DEFAULT nextval('public.daily_billings_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: units id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.units ALTER COLUMN id SET DEFAULT nextval('public.units_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.alembic_version (version_num) FROM stdin;
e4ca0851b1f0
\.


--
-- Data for Name: daily_billings; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.daily_billings (id, date, description, labour, due, paid, note, project_id, upfront_cost, user_id) FROM stdin;
923	2024-10-18	Cement	150	76500	0	 Avalon Project 2nd chad Dalai	4	f	\N
928	2024-09-30	Rod Mistri Head	0	0	10400	17-10-2024 over tk Sep-24	2	f	\N
933	2024-10-20	Cement	350	0	150000	 UCb no 1509666 SAH Project Cement 350 Bag	4	f	\N
114	2024-09-09	Cement	50	0	0	৫০ ব্যাগ	2	f	\N
115	2024-09-09	Steel Rod Purchase	0	0	0	২০ মিলি ৫ বান্ডেল\n১৬ মিলি ১ বান্ডেল	2	f	\N
86	2024-09-01	Rod Mistri Head	4	2950	2000	স্বাধীন ৮০০, নজরুল ৭৫০	2	f	\N
87	2024-09-01	Rod Mistri Helper	3	1500	1500		2	f	\N
89	2024-09-03	Rod Mistri Helper	1	600	500	মোস্তফা ৬০০	2	f	\N
90	2024-09-03	Miscellaneous	0	100	100	ভাড়া	2	f	\N
88	2024-09-03	Rod Mistri Head	3	2500	2000	শাহ আলম ১০০০৳\nমোতাহার ও জহুরুল ৭৫০৳	2	f	\N
91	2024-09-04	Rod Mistri Head	3	2550	2000	শাহআলম ১০০০৳\nস্বাধীন ৮০০৳\nমোতাহার ৭৫০৳	2	f	\N
92	2024-09-04	Rod Mistri Helper	5	2600	2500	মোস্তফা ৬০০৳	2	f	\N
93	2024-09-04	Guard Salary	0	2000	2000	আগস্ট মাস	2	f	\N
100	2024-09-07	Rod Mistri Helper	4	2200	2000	রাজু ৬০০৳\nমোস্তফা ৬০০৳	2	f	\N
94	2024-09-05	Rod Mistri Head	3	2550	2000	শাহআলম ১০০০৳\nস্বাধীন ৮০০৳\nমোতাহার ৭৫০৳	2	f	\N
97	2024-09-06	Rod Mistri Head	4	3250	2500	শাহআলম ১০০০৳\nস্বাধীন ৮০০৳\nমোতাহার ৭৫০	2	f	\N
95	2024-09-05	Rod Mistri Helper	4	2200	2000	রাজু ৬০০৳\nমোস্তফা ৬০০৳	2	f	\N
105	2024-09-05	Miscellaneous	0	100	100	ভাড়া	2	f	\N
96	2024-09-04	Miscellaneous	0	50	50	পানির মগ	2	f	\N
98	2024-09-06	Rod Mistri Helper	3	1700	1500	রাজু ৬০০৳\nমোস্তফা ৬০০৳	2	f	\N
191	2024-08-31	Rod Mistri Head	0	11550	2000	Sadin-2000	2	f	\N
99	2024-09-07	Rod Mistri Head	4	3250	2500	শাহআলম ১০০০৳\nস্বাধীন ৮০০৳\nমোতাহার ৭৫০৳	2	f	\N
101	2024-09-07	Miscellaneous	0	615	615	ক্যাশ মেমো পেরেক ও রুপবানশিট 	2	f	\N
103	2024-09-08	Rod Mistri Helper	3	1700	1500	রাজু ৬০০৳\nমোস্তফা ৬০০৳	2	f	\N
106	2024-09-07	Sand	0	20000	20000	সিলেট বালু হাফ গাড়ি 	2	f	\N
109	2024-09-09	Miscellaneous	0	200	200	লেবার নাস্তা বিল 	2	f	\N
104	2024-09-08	Miscellaneous	0	780	280	পিন ও স্টিল পেরেক	2	f	\N
111	2024-09-10	Rod Mistri Helper	5	2700	2500	রাজু ৬০০৳\nমোস্তফা ৬০০৳	2	f	\N
108	2024-09-09	Rod Mistri Helper	5	2700	2500	রাজু ৬০০৳\nমোস্তফা ৬০০৳	2	f	\N
107	2024-09-09	Rod Mistri Head	3	2500	2000	শাহআলম ১০০০৳\nস্বাধীন ৮০০৳	2	f	\N
110	2024-09-10	Rod Mistri Head	3	2550	2000	শাহআলম ১০০০৳\nস্বাধীন ৮০০৳\nমোতাহার ৭৫০	2	f	\N
217	2024-09-05	Concrete-Casting	0	40000	0	 ৯ তলা ছাদের ঢালাই 	0	f	\N
930	2024-10-19	Rod Mistri Helper	4	2000	2000		2	f	\N
253	2024-09-16	Steel Rod Purchase	0	2895080	0	(Rod + Cement) Up to Aug16	4	f	\N
176	2024-09-01	Raj Mistri Helper	2	1000	1000		0	f	\N
178	2024-09-01	Rod Mistri Helper	2	1025	1000	মাসুদ -৫২৫	0	f	\N
179	2024-09-01	Miscellaneous	3	1500	1500	হাতে খোয়া ভাঙা 	0	f	\N
180	2024-09-01	Miscellaneous	0	210	210	ক্যাশ মেমো	0	f	\N
181	2024-09-01	Electrician	1	1000	1000	৯ তলা ছাদের পাইপ	0	f	\N
182	2024-09-01	Miscellaneous	0	1500	1500	সকাল, দুপুর খাবার বাবদ	0	f	\N
183	2024-09-01	Concrete-Casting	0	25000	25000	৯ তলা ছাদ	0	f	\N
189	2024-09-02	Electrician	1	1000	1000		0	f	\N
190	2024-09-02	Miscellaneous	0	1600	1600	সকাল + দুপুর খাবার 	0	f	\N
218	2024-09-06	Rod Mistri Head	7	4900	3500		0	f	\N
219	2024-09-06	Rod Mistri Helper	3	1525	1500	ওবায়দুল -৫২৫৳	0	f	\N
220	2024-09-06	Raj Mistri Head	3	2150	1500	জাহাঙ্গীর -৭৫০৳	0	f	\N
255	2024-09-10	Rod Mistri Helper	3	1550	1500	সুজন -৫৫০৳	0	f	\N
112	2024-09-11	Rod Mistri Head	2	1550	1000	স্বাধীন ৮০০৳\nমোতাহার ৭৫০৳	2	f	\N
113	2024-09-11	Rod Mistri Helper	1	600	500	রাজু ৬০০৳	2	f	\N
116	2024-09-11	Miscellaneous	0	380	380	ক্যাশ মেমো গুনাতার ও ঝাড়ু	2	f	\N
117	2024-09-11	Guard Salary	0	2000	2000	আগস্ট মাস 2024	2	f	\N
265	2024-09-18	Rod Mistri Head	1	700	500	সেলিম ৭০০৳	2	f	\N
1163	2024-10-26	Rod Mistri Head	9	6500	4500		0	f	\N
1166	2024-10-26	Head Welder	1	800	500		0	f	\N
1172	2024-10-27	Rod Mistri Helper	7	3550	3500	মাসুদ =৫৫০৳	0	f	\N
1181	2024-10-26	Cement	50	25500	0	Spire 50 bag Rate -510	4	f	\N
1192	2024-10-20	Utility	0	429460	429460	31-7-2024 Last Date	0	f	\N
924	2024-10-19	Cement	350	182000	0	 SAH Projcet Supercreat Rate -520	4	f	\N
280	2024-09-14	Miscellaneous	0	0	0	কাজ বন্ধ 	0	f	\N
281	2024-09-15	Miscellaneous	0	0	0	কাজ বন্ধ 	0	f	\N
186	2024-09-02	Rod Mistri Helper	6	3150	3000	সুজন -৫৫০৳, মোস্তফা -৫৫০৳, ওবায়দুল -৫২৫৳, মাসুদ -৫২৫৳	0	f	\N
188	2024-09-02	Raj Mistri Helper	2	1000	1000		0	f	\N
187	2024-09-02	Raj Mistri Head	2	1470	1000	মাসুদ -৭২০৳, জাহাঙ্গীর -৭২০৳	0	f	\N
192	2024-09-02	Miscellaneous	0	850	850	ক্যাশ মেমো	0	f	\N
193	2024-09-02	Miscellaneous	0	200	200	সিমেন্ট আনলোড বকশিস 	0	f	\N
194	2024-09-02	Sand	0	14500	14500	সাদা বালি ১ গাড়ি 	0	f	\N
195	2024-09-02	Miscellaneous	0	500	500	মোটরসাইকেল তেল 	0	f	\N
196	2024-09-02	Concrete-Casting	0	25000	25000	৯ তলা ছাদ	0	f	\N
197	2024-09-03	Rod Mistri Head	5	3600	2500	রাব্বানী -৯০০৳, সুরেশ -৬৫০৳, সাকিল-৬০০৳, রিংকু -৭৫০৳	0	f	\N
198	2024-09-03	Rod Mistri Helper	4	2000	2000		0	f	\N
199	2024-09-03	Raj Mistri Head	3	2120	1500	মাসুদ ৭২০৳	0	f	\N
200	2024-09-03	Raj Mistri Helper	3	1500	1500		0	f	\N
201	2024-09-03	Miscellaneous	3	1500	1500	হাতে খোয়া ভাঙা 	0	f	\N
291	2024-09-18	Rod Mistri Helper	4	2025	2000	over 25	0	f	\N
279	2024-09-13	Miscellaneous	0	500	500	wi-fi bill September -20247	0	f	\N
251	2024-09-09	Miscellaneous	0	200	200	নাস্ত বাবদ	0	f	\N
250	2024-09-09	Raj Mistri Head	0	1000	1000	রাজ মিস্ত্রি গাড়ি ভাড়া সেপ্টেম্বর 	0	f	\N
256	2024-09-10	Raj Mistri Head	6	4270	3000	জাহাঙ্গীর -৭৫০৳, মাসুদ -৭২০৳	0	f	\N
261	2024-09-11	Rod Mistri Head	7	4950	3500		0	f	\N
260	2024-09-10	Guard Salary	0	1000	1000	আগস্ট মাসে -2024	0	f	\N
257	2024-09-10	Raj Mistri Helper	6	3000	3000		0	f	\N
259	2024-09-10	Electrician	3	1500	1500		0	f	\N
258	2024-09-10	Miscellaneous	0	2725	0	ক্যাশ মেমো Due	0	f	\N
262	2024-09-11	Rod Mistri Helper	7	3575	3500	সুজন -৫৫০৳, ওবায়দুল -৫২৫৳	0	f	\N
263	2024-09-11	Raj Mistri Head	1	750	500		0	f	\N
264	2024-09-11	Raj Mistri Helper	1	500	500		0	f	\N
268	2024-09-12	Rod Mistri Helper	6	3075	3000	ওবায়দুল -৫২৫৳, সুজন - ৫৫০৳	0	f	\N
269	2024-09-12	Raj Mistri Head	3	2170	1500	জাহাঙ্গীর -৭৫০৳, মাসুদ -৭২০৳	0	f	\N
270	2024-09-12	Raj Mistri Helper	3	1500	1500		0	f	\N
271	2024-09-12	Miscellaneous	0	2760	2760	হাতে খোয়া ভাঙা 	0	f	\N
272	2024-09-12	Sand	0	14000	0	১ গাড়ি সাদা বালি Due 	0	f	\N
274	2024-09-13	Rod Mistri Head	9	6650	4500	রাব্বানী -৯০০৳, মিন্টু -৭৫০৳ রিংকু -৭৫০৳ সুরেশ -৬৫০৳ জহরুল- ৭৫০৳ সাকিল-৬০০৳ বুলবুল -৫৫০৳ শাহ- আলম -১০০০৳	0	f	\N
282	2024-09-16	Rod Mistri Head	7	4950	3500	রাব্বানী -৯০০৳, জহরুল- ৭৫০৳, সাকিল-৬০০৳, রিংকু -৭৫০৳, বুলবুল -৫৫০৳, সুরেশ -৬৫০৳, মিন্টু -৭৫০৳	0	f	\N
252	2024-08-31	Rod Mistri Head	0	0	3000	রিংকু রড মিস্তিরি মাথার টাকা জুন-জুলাই -১৫০০৳,\nআগস্ট- ১৫০০৳ 09-09-24	0	f	\N
275	2024-09-13	Rod Mistri Helper	3	1525	1500	ওবায়দুল -৫২৫৳	0	f	\N
276	2024-09-13	Raj Mistri Head	3	2170	1500	জাহাঙ্গীর -৭৫০৳ মাসুদ -৭২০৳	0	f	\N
278	2024-09-13	Guard Salary	0	500	500	আগস্ট মাসে-2024 Didar	0	f	\N
283	2024-09-16	Rod Mistri Helper	4	2025	2000	ওবায়দুল -৫২৫	0	f	\N
284	2024-09-16	Raj Mistri Head	4	2870	2000	জাহাঙ্গীর -৭৫০৳, মাসুদ -৭২০৳	0	f	\N
285	2024-09-16	Raj Mistri Helper	4	2000	2000		0	f	\N
286	2024-09-17	Rod Mistri Head	7	4950	3500		0	f	\N
277	2024-09-13	Raj Mistri Helper	2	1000	1000		0	f	\N
288	2024-09-17	Raj Mistri Head	5	3570	2500		0	f	\N
289	2024-09-17	Raj Mistri Helper	5	2500	2500		0	f	\N
287	2024-09-17	Rod Mistri Helper	4	2025	2000	over-25	0	f	\N
290	2024-09-18	Rod Mistri Head	6	4350	3000	রাব্বানী ৯০০৳, রিংকু -৭৫০৳, জহরুল- 19-09-2024 paid৭৫০৳, মিন্টু -৭৫০৳, সুরেশ -৬৫০৳, বুলবুল -৫৫০৳	0	f	\N
292	2024-09-18	Raj Mistri Head	5	3570	2500	19-9-2024 paid	0	f	\N
293	2024-09-18	Raj Mistri Helper	5	2500	2500	19-09-2024 paid	0	f	\N
202	2024-07-31	Rod Mistri Head	0	0	7250	মিন্টু রড মিস্তি মাথার টাকা \nজুন-জুলাই =৭২৫০৳\n আগস্ট = ৭৫০৳	0	f	\N
102	2024-09-08	Rod Mistri Head	4	3100	2500	শাহআলম ১০০০৳\nস্বাধীন ৮০০৳\nবুলবুল ৬০০৳	2	f	\N
171	2024-09-16	Miscellaneous	0	875	0	ক্যাশ মেমো (পেরেক ৫ কেজি ও গুনাতার ২ কেজি)	2	f	\N
172	2024-09-17	Raj Mistri Head	3	2300	0	স্বাধীন ৮০০৳\nমোতাহার ৭৫০৳\nনজরুল ৭৫০৳	2	f	\N
174	2024-09-17	Miscellaneous	0	200	0	লেবার নাস্তা বিল ২০০৳	2	f	\N
925	2024-09-30	Rod Mistri Head	0	0	16700	17-10-2024 All Person	0	f	\N
230	2024-09-07	Sand	0	26000	0	লাল বালি ১/২ গাড়ি 	0	f	\N
926	2024-09-30	Raj Mistri Head	0	0	7150	17-10-2024 ALL Over TK	0	f	\N
204	2024-09-04	Rod Mistri Helper	2	1025	1000	ওবায়দুল -৫২৫৳	0	f	\N
205	2024-09-04	Raj Mistri Head	3	2120	1500	মাসুদ -৭২০৳	0	f	\N
206	2024-09-04	Raj Mistri Helper	3	1500	1500		0	f	\N
207	2024-09-04	Guard Salary	0	2000	2000	আগস্ট মাসে ( Didar)	0	f	\N
208	2024-09-05	Rod Mistri Head	8	5650	4000	রিংকু -৭৫০৳, রাব্বানী ৯০০৳, বুলবুল -৫৫০৳, সাকিল- ৬০০৳, সুরেশ -৬৫০৳, জহরুল- ৭৫০৳, নজরুল - -৭৫০৳	0	f	\N
209	2024-09-05	Rod Mistri Helper	3	1525	1500	ওবায়দুল -৫২৫৳	0	f	\N
210	2024-09-05	Raj Mistri Head	5	3570	2500	মাসুদ -৭২০৳, জাহাঙ্গীর -৭৫০৳	0	f	\N
211	2024-09-05	Raj Mistri Helper	3	1500	1500		0	f	\N
212	2024-09-05	Miscellaneous	0	100	100	খাতা কেনা	0	f	\N
214	2024-09-05	Miscellaneous	0	11465	11465	ক্যাশ মেমো	0	f	\N
213	2024-09-05	Stone	0	22800	22800	পাথর +বালি উঠা ৯ তলা  Quantity= ?	0	f	\N
233	2024-07-31	Raj Mistri Head	0	0	1000	রানা রাজ মিস্ত্রি মাথার টাকা জুন-জুলাই 	0	f	\N
215	2024-09-05	Electrician	3	1800	1800		0	f	\N
221	2024-09-06	Raj Mistri Helper	3	1500	1500		0	f	\N
222	2024-09-06	Miscellaneous	0	100	100	ক্যাশ মেমো	0	f	\N
223	2024-09-06	Miscellaneous	0	400	0	  ইঞ্জিনিয়ার ওভার টাইম Due	0	f	\N
225	2024-09-07	Rod Mistri Head	6	4200	3000		0	f	\N
232	2024-07-31	Raj Mistri Head	0	0	1000	মাসুদ রাজ মিস্ত্রি মাথার টাকা জুন-জুলাই 	0	f	\N
227	2024-09-07	Raj Mistri Head	5	3570	2500	মাসুদ -৭২০৳, জাহাঙ্গীর -৭৫০৳	0	f	\N
228	2024-09-07	Raj Mistri Helper	4	2000	2000		0	f	\N
229	2024-09-07	Miscellaneous	0	80	80	ক্যাশ মেমো	0	f	\N
169	2024-09-16	Rod Mistri Head	4	3300	2500	শাহআলম ১০০০৳\nস্বাধীন ৮০০৳\nমোতাহার ৭৫০৳\nনজরুল ৭৫০৳	2	f	\N
226	2024-09-07	Rod Mistri Helper	3	1575	1500	সুজন ৫৫০৳, ওবায়দুল -৫২৫৳	0	f	\N
166	2024-09-12	Rod Mistri Head	2	1400	1000	স্বাধীন ৮০০৳\nবুলবুল ৬০০৳	2	f	\N
234	2024-09-07	Miscellaneous	3	3000	3000	হাতে খোয়া ভাঙা 	0	f	\N
235	2024-09-07	Electrician	2	1200	1200		0	f	\N
231	2024-07-31	Rod Mistri Head	0	0	1000	আজাদ রড মিস্তিরি মাথার টাকা জুন-জুলাই 	0	f	\N
238	2024-09-08	Rod Mistri Helper	4	2075	2000	সুজন -৫৫০৳,ওবায়দুল -৫২৫৳	0	f	\N
239	2024-09-08	Raj Mistri Head	6	4220	3000	মাসুদ ৭২০৳	0	f	\N
240	2024-09-08	Raj Mistri Helper	5	2500	2500		0	f	\N
241	2024-09-08	Miscellaneous	4	4000	4000	হাতে খোয়া ভাঙা 	0	f	\N
242	2024-09-08	Electrician	2	1200	1200		0	f	\N
244	2024-09-09	Rod Mistri Helper	2	1000	1000		0	f	\N
243	2024-09-09	Rod Mistri Head	5	3800	2500	রিংকু -৭৫০৳,  মিন্টু -৭৫০৳, রাব্বানী -৯০০৳, সুরেশ -৬৫০৳, নজরুল -৭৫০৳	0	f	\N
245	2024-09-09	Raj Mistri Head	6	4220	3000	মাসুদ -৭২০৳	0	f	\N
246	2024-09-09	Raj Mistri Helper	5	2500	2500		0	f	\N
247	2024-09-09	Maid Salary	0	1000	1000	আগস্ট -2024	0	f	\N
248	2024-09-09	Miscellaneous	0	560	560	ক্যাশ মেমো	0	f	\N
249	2024-09-09	Miscellaneous	0	150	150	ভ্যান ভাড়া	0	f	\N
167	2024-09-12	Rod Mistri Helper	2	1100	1000	রাজু ৬০০৳	2	f	\N
168	2024-09-12	Miscellaneous	0	500	500	September WiFi bill	2	f	\N
266	2024-09-18	Rod Mistri Helper	3	1500	1500		2	f	\N
216	2024-09-05	Miscellaneous	0	10000	10000	সিট ভাড়া ৯ তলা ছাদের 	0	f	\N
170	2024-09-16	Rod Mistri Helper	3	1700	1500	রাজু ৬০০৳\nমোস্তফা ৬০০৳	2	f	\N
173	2024-09-17	Rod Mistri Helper	5	2600	2500	রাজু ৬০০৳	2	f	\N
236	2024-09-07	Raj Mistri Head	0	0	1000	রাজ মিস্ত্রি গাড়ি ভাড়া সেপ্টেম্বর 	0	f	\N
934	2024-10-20	Rod Mistri Helper	6	3000	3000		2	f	\N
1173	2024-10-27	Head Welder	1	800	500		0	f	\N
300	2024-09-19	Miscellaneous	0	100	0	মালামাল আনা ভাড়া 	0	f	\N
175	2024-09-01	Raj Mistri Head	2	1400	1000		0	f	\N
294	2024-09-18	Miscellaneous	0	600	600	ক্যাশ মেমো	0	f	\N
297	2024-09-19	Raj Mistri Head	5	3570	2500		0	f	\N
927	2024-09-30	Raj Mistri Head	0	0	2000	 Shop due  over tk Sep-24	0	f	\N
1831	2024-11-13		0	12130	12130	ক্যাশ মেমো	0	f	\N
931	2024-10-19	Miscellaneous	0	526	526	ক্যাশ মেমো পলিমার পাইপ Due	2	f	\N
1171	2024-10-27	Rod Mistri Head	8	5900	4000	সুরেশ =৬৫০৳,জহরুল- ৭৫০৳,সোহেল =৮০০৳,বুলবুল =৬০০৳,রাব্বানী =৯০০৳,রিংকু =৭৫০৳,মিন্টু =৭৫০৳	0	f	\N
1187	2024-10-25	Project Deposit	0	0	0	 not Deposited Friday	5	f	\N
1205	2024-07-31	Miscellaneous	0	1389120	1389120	31-7-2024 Upto 31-07-2024 Varius Cost	0	f	\N
1207	2024-07-31	Head Welder	0	38200	38200	Greel Mestry AL Amin 31-7-2024	0	f	\N
1197	2024-10-28	Rod Mistri Helper	8	4100	4000	ওবায়দুল =৫৫০৳,মাসুদ =৫৫০৳	0	f	\N
1177	2024-10-28	Raj Mistri Head	2	1400	1000	সালাম ৭০০৳\nআলমগীর ৭০০৳	1	f	\N
1185	2024-10-28	Rod Mistri Head	4	2750	2000	আনিস ৭৫০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳\nমাহফুজ ৭০০৳	2	f	\N
1795	2024-11-13	Office Cost	0	0	20000	Liton Salary Month of Oct-2024	6	f	\N
1777	2024-11-12	Rod Mistri Head	7	5200	3500	 Mestry Name ullekh nai ????	0	f	\N
1782	2024-11-12	Chipping Head	1	2000	2000		0	f	\N
1787	2024-11-12	Miscellaneous	0	100	100	সিমেন্ট আনলোড বকশিস 	0	f	\N
1794	2024-11-10	Rod Mistri Head	4	2850	2000	রাশেদুল=750৳	3	f	\N
1806	2024-11-13	Rod Mistri Helper	4	2050	2000	জুবায়েত=550৳	3	f	\N
1843	2024-11-14	Chipping Head	1	1000	1000	৮ তলা চিপিং শেষ 	0	f	\N
1826	2024-11-13	Raj Mistri Helper	6	3000	3000		0	f	\N
1829	2024-11-13	Welder's Helper	1	500	500		0	f	\N
1849	2024-11-14	Miscellaneous	0	50	50	পিন কাটা 	0	f	\N
1852	2024-11-15	Rod Mistri Helper	10	5200	5000	আশিক =৫৫০৳,মাসুদ=৫৫০,ওবায়দুল =৫৫০,লাকু=৫৫০৳	0	f	\N
1860	2024-11-16	Raj Mistri Head	3	2170	1500	মাসুদ =৭২০৳,জাহাঙ্গীর =৭৫০৳	0	f	\N
1863	2024-11-16	Miscellaneous	0	120	120	মালামাল আনা ভাড়া 	0	f	\N
1893	2024-11-17	Rod Mistri Head	6	4250	3000	same mistri	0	f	\N
1911	2024-11-18	Raj Mistri Helper	7	3500	3500		0	f	\N
1916	2024-11-18	Miscellaneous	0	500	500	ক্যাশ মেমো	0	f	\N
1838	2024-11-16	Rod Mistri Helper	5	2500	2500		2	f	\N
1868	2024-11-14	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
1873	2024-11-15	Rod Mistri Helper	6	3000	3000		1	f	\N
1879	2024-11-16	Raj Mistri Helper	1	500	500		1	f	\N
1884	2024-11-17	Raj Mistri Helper	1	500	500		1	f	\N
1900	2024-11-15	Rod Mistri Helper	4	2050	2000	জুবায়েত=550৳	3	f	\N
1909	2024-11-18	Rod Mistri Helper	4	2050	2000	জুবায়েত=550৳	3	f	\N
1898	2024-11-17	Miscellaneous	0	5270	5270	ক্যাশ মেমো	0	f	\N
2118	2024-11-26	Raj Mistri Head	4	2920	2000	একই মিস্তিরি 	0	f	\N
2122	2024-11-26	Electrician	4	4000	4000	১০ তলা ছাদের কাজ 	0	f	\N
2128	2024-11-26	Door Frame Purchase	10	78000	50000	UCB Cheque no -1534343 Mosharraf Cash Cheque	1	f	\N
2061	2024-11-17	Raj Mistri Head	0	0	2000	রাজ মিস্ত্রি সাগর নভেম্বর মাসের অগ্রিম বেতন ২০০০৳	1	f	\N
2125	2024-11-27	Rod Mistri Head	4	2750	2000	Anis 800\nArif 650\nBulbul 600\nAhmmod 700	2	f	\N
2259	2024-10-11	Cement	200	102000	0	Rate-510	1	f	\N
2264	2024-11-07	Steel Rod Purchase	0	0	450000	UCb Im + UCb	1	f	\N
2266	2024-11-12	Steel Rod Purchase	0	0	100000	MD Sir Cash	1	f	\N
2268	2024-11-20	Cement	150	75000	0	Rate-500	1	f	\N
2279	2024-11-30	Cement	150	75000	0	SSD Project	4	f	\N
2283	2024-10-04	Steel Rod Purchase	8200	744560	0	Rate 90.80	2	f	\N
2288	2024-10-28	Steel Rod Purchase	5200	472160	0	Rate 90.80	2	f	\N
1168	2024-10-27	Steel Rod Purchase	0	0	500000	UCB SPDL Cheque no 1509670 SAH -300000 + SSD 200000	4	f	\N
1191	2024-08-31	Steel Rod Purchase	0	27733405	27733405	 last Date 31-7-2024 , Sarker + M/S Taioba Steel,Ksrm + Cement	0	f	\N
2272	2024-11-29	Concrete-Casting	0	23000	23000	3rd floor casting 	3	f	\N
2291	2024-12-02	Steel Rod Purchase	8500	722500	0	Rate 85 TK per Kg GPH Yeasin রড ক্রয় টোটাল ৮.৫ টন। ২০ মিলি ৩.৫ ১৬ মিলি ১.০ ১০ মিলি ৪.০	2	f	\N
2277	2024-11-30	Rod Mistri Helper	3	1550	1500	তারেক 550৳	3	f	\N
2324	2024-12-01	Bricks Purchase	0	0	4000	সাটার ঠিক করা  Bricks Habib Payment Adjustment 	0	f	\N
2329	2024-12-02	Head Welder	1	800	500		0	f	\N
2337	2024-12-03	Raj Mistri Helper	5	2500	2500		0	f	\N
301	2024-09-20	Miscellaneous	0	0	0	কাজ বন্ধ 	0	f	\N
295	2024-09-19	Rod Mistri Head	7	4950	3500		0	f	\N
298	2024-09-19	Raj Mistri Helper	5	2500	2500		0	f	\N
929	2024-10-19	Rod Mistri Head	2	1400	1000	মাহফুজ ৭০০৳\nফিরোজ ৭০০৳	2	f	\N
1142	2024-10-26	Miscellaneous	0	170	170	ক্যাশ মেমো।	1	f	\N
1180	2024-10-24	Steel Rod Purchase	1326	121497	0	 Avalon project 1326 kg rate -90.80 tk per kg	4	f	\N
1189	2024-10-27	Project Deposit	0	42000	41780		5	f	\N
1193	2024-10-21	Sand	0	1995000	1995000		0	f	\N
1203	2024-07-31	Soil Test	0	36500	36500		0	f	\N
1209	2024-07-31	Raj Mistri Head	0	970800	970800	31-7-2024	0	f	\N
1211	2024-07-31	Sanitary Expense	0	7700	7700	Senatary Mestry Cost =31-7-2024	0	f	\N
1199	2024-10-28	Head Welder	1	800	500		0	f	\N
1194	2024-10-28	Raj Mistri Head	6	4270	3000	মাসুদ =৭২০৳,জাহাঙ্গীর =৭৫০৳	0	f	\N
1793	2024-11-10	Project Deposit	0	38500	0	Tacos Shop 31-10-24 to 10-11-2024 = 11 Days X3500= 38500 Deposited	6	f	\N
1779	2024-11-12	Guard Salary	0	4000	4000	অক্টোবর মাসে  Didar 	0	f	\N
1784	2024-11-12	Welder's Helper	1	500	500		0	f	\N
1814	2024-10-31	Rod Mistri Head	0	0	23000	Rod Mestry Over TK OCt-24 Paid	0	f	\N
1789	2024-11-12	Maid Salary	0	1000	1000	অক্টোবর মাসে 	0	f	\N
1792	2024-11-13	Rod Mistri Helper	5	2500	2500		2	f	\N
1816	2024-10-31	Rod Mistri Head	0	0	3800	 Rod Over Tk  October -24  Payment Date-12-11-2024	2	f	\N
1797	2024-11-10	Hardware Materials	2	1370	1370	ক্যাশ মেমো	3	f	\N
2280	2024-12-01	Steel Rod Purchase	8500	722500	0	SAH Project 8500 Kg Rate -85 TK	4	f	\N
1807	2024-10-31		0	0	2400	ইউসুফ রড মিস্ত্রি মাথার টাকা -October =2400 Payment Date-11-3-11-24	3	f	\N
1817	2024-11-12	Project Deposit	0	80000	82450	Cash 60000+ UCB Cheque =20000	5	f	\N
1825	2024-11-13	Raj Mistri Head	5	3570	2500	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳	0	f	\N
1841	2024-11-14	Raj Mistri Head	5	3570	2500	একই মিস্তিরি 	0	f	\N
1847	2024-11-14	Miscellaneous	0	200	200	মালামাল আনা ভাড়া 	0	f	\N
1853	2024-11-15	Raj Mistri Head	3	2120	1500	মাসুদ =৭২০৳	0	f	\N
1861	2024-11-16	Raj Mistri Helper	5	2500	2500		0	f	\N
1895	2024-11-17	Raj Mistri Head	4	2870	2000	মাসুদ =৭২০৳,জাহাঙ্গীর =৭৫০৳	0	f	\N
1910	2024-11-18	Raj Mistri Head	5	3570	2500	জাহাঙ্গীর =৭৫০,মাসুদ =৭২০৳	0	f	\N
1915	2024-11-18	Electrician	1	600	600		0	f	\N
1834	2024-11-15	Raj Mistri Helper	5	2500	2500		2	f	\N
2284	2024-10-04	Cement	150	76500	0	Rate 510	2	f	\N
1836	2024-11-16	Rod Mistri Head	3	2100	1500	সেলিম ৬৫০৳\nআনিস ৮০০৳\nআরিফ ৬৫০৳	2	f	\N
1869	2024-11-14	Raj Mistri Helper	1	500	500		1	f	\N
1874	2024-11-15	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
1880	2024-11-16	Hardware Materials	0	5030	5030	ক্যাশ মেমো ৫০৩০৳	1	f	\N
1802	2024-11-12	Rod Mistri Head	3	2300	1600	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
1902	2024-11-16	Rod Mistri Head	4	3000	2100	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
1906	2024-11-17	Rod Mistri Helper	4	2050	2000	জুবায়েত=550৳	3	f	\N
2072	2024-11-21	Rod Mistri Helper	2	1000	1000		1	f	\N
2267	2024-11-19	Steel Rod Purchase	0	0	100000	UCb Cheque	1	f	\N
2292	2024-10-27	Steel Rod Purchase	0	0	200000	UCB Cheque	0	f	\N
671	2024-10-06	Steel Rod Purchase	0	0	300000	SSD Project IBBL Cheque- no 3824911 GPH ISpat Ltd	4	f	\N
2273	2024-11-29	Miscellaneous	2	1200	1200	খাবার বাবদ 1000৳\nবকশিস 200৳	3	f	\N
2320	2024-12-01	Sanitary Mistri Head	3	1800	1800		0	f	\N
2269	2024-11-28	Guard Salary	0	0	1000	সিকিউরিটি গার্ড শফিকুল নভেম্বর মাসের বেতন 1000৳	3	f	\N
2325	2024-12-02	Rod Mistri Head	1	800	500		0	f	\N
2330	2024-12-02	Welder's Helper	1	500	500		0	f	\N
2358	2024-12-03	Concrete-Casting	0	0	47000	ঢালাই বাবদ জমা =৪৭০০০৳	0	f	\N
2338	2024-12-03	Rod Mistri Head	2	1400	1000		0	f	\N
2345	2024-12-03	Miscellaneous	0	600	600	লেবার বকশিস 	0	f	\N
2360	2024-12-04	Welder's Helper	1	500	500		0	f	\N
2371	2024-12-05	Raj Mistri Helper	5	2500	2500		0	f	\N
2363	2024-12-05	Rod Mistri Head	5	3400	2500	Anis 800৳\nArif 650৳\nSelim 700৳\nAhmad 650৳\nBulbul 600৳	2	f	\N
2378	2024-12-06	Rod Mistri Helper	3	1600	1500	ওবায়দুল =৫৫০৳,আশিক =৫৫০৳	0	f	\N
2387	2024-12-02	Rod Mistri Head	2	1500	1000	রাসেল ৮০০৳, সোহাগ ৭০০৳	1	f	\N
2392	2024-12-03	Rod Mistri Helper	4	2000	2000		1	f	\N
2397	2024-12-04	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
177	2024-09-01	Rod Mistri Head	2	1650	1000	রাব্বানী -৯০০৳\nমিন্টু - ৭৫০৳	0	f	\N
185	2024-09-02	Rod Mistri Head	8	6250	4500	রাব্বানী -৯০০৳, মিন্টু -৭৫০৳, সুরেশ -৬৫০৳, রিংকু -৭৫০৳, নজরুল -৭৫০৳, জহরুল-৭৫০৳, শাহ-আলম-১০০০৳	0	f	\N
203	2024-09-04	Rod Mistri Head	7	5100	3500	 নজরুল -৭৫০৳, রাব্বানী -৯০০৳, জহরুল- ৭৫০৳, সুরেশ -৬৫০৳, সাকিল-৬০০৳, রিংকু- ৭৫০৳	0	f	\N
237	2024-09-08	Rod Mistri Head	5	3800	2500	নজরুল -৭৫০৳, রাব্বানী -৯০০৳, সুরেশ -৬৫০৳, রিংকু -৭৫০৳, মিন্টু -৭৫০৳	0	f	\N
254	2024-09-10	Rod Mistri Head	9	6400	4500	রাব্বানী -৯০০৳, মিন্টু -৭৫০৳, রিংকু -৭৫০৳, সুরেশ -৬৫০৳, নজরুল -৭৫০৳, জহরুল- ৭৫০৳, সাকিল-৬০০৳, বুলবুল -৫৫০৳, 	0	f	\N
267	2024-09-12	Rod Mistri Head	6	4400	3000	রাব্বানী -৯০০৳, মিন্টু -৭৫০৳, রিংকু -৭৫০৳, সুরেশ - ৬৫০৳, জহরুল- ৭৫০৳, সাকিল-৬০০৳ 	0	f	\N
935	2024-09-30	Rod Mistri Head	0	0	750	 Nazrul 10-10-2024	2	f	\N
315	2024-09-01	Project Deposit	0	61000	48285		5	f	\N
299	2024-09-19	Electrician	1	500	500		0	f	\N
951	2024-10-19	Raj Mistri Helper	4	2000	2000		0	f	\N
353	2024-09-22	Miscellaneous	0	100	0	ইঞ্জিনিয়ার কনভেন্স	0	f	\N
354	2024-09-01	Rod Mistri Head	3	2000	1500	রিংকু=৭৫০	3	f	\N
355	2024-09-01	Rod Mistri Helper	3	1500	1500		3	f	\N
357	2024-09-06	Rod Mistri Head	3	2250	1600	ইউসুফ=৮০০,আলমগীর=৭৫০	3	f	\N
359	2024-09-06	Miscellaneous	1	330	330		3	f	\N
361	2024-09-06	Rod Mistri Helper	2	1000	1000		3	f	\N
360	2024-09-07	Rod Mistri Head	3	2250	1600	ইউসুফ=৮০০,আলমগীর=৭৫০	3	f	\N
362	2024-09-07	Rod Mistri Helper	2	1000	1000		3	f	\N
364	2024-09-08	Rod Mistri Helper	3	2250	1600	ইউসুফ=৮০০,আলমগীর=৭৫০	3	f	\N
363	2024-09-07	Miscellaneous	2	100	100	যাতায়াত ভাড়া =৬০,বিকাশ খরচ=৪০	3	f	\N
365	2024-09-08	Rod Mistri Helper	2	1000	1000		3	f	\N
366	2024-09-08	Miscellaneous	1	30	30	বিকাশ খরচ=৩০৳	3	f	\N
367	2024-09-09	Rod Mistri Head	3	2250	1600	ইউসুফ=৮০০,আলমগীর=৭৫০	3	f	\N
368	2024-09-09	Rod Mistri Helper	2	1000	1000		3	f	\N
369	2024-09-10	Rod Mistri Head	3	2250	1600	ইউসুফ=৮০০,আলমগীর=৭৫০	3	f	\N
370	2024-09-10	Rod Mistri Helper	1	500	500		3	f	\N
372	2024-09-11	Rod Mistri Helper	2	1000	1000		3	f	\N
350	2024-07-31	Raj Mistri Head	0	0	1000	মাসুদ রাজ মিস্ত্রি মাথার টাকা জুন-জুলাই 1000৳	0	f	\N
346	2024-09-21	Rod Mistri Head	4	3150	2000	রাব্বানী -৯০০৳, রিংকু -৭৫০৳, জহরুল- ৭৫০৳, মিন্টু -৭৫০৳, 	0	f	\N
347	2024-09-21	Raj Mistri Helper	5	2575	2500	সুজন -৫৫০৳, ওবায়দুল -৫২৫৳	0	f	\N
348	2024-09-21	Maid Salary	0	2000	2000	আগস্ট -2024  Boa salary	0	f	\N
349	2024-09-21	Electrician	2	1000	1000		0	f	\N
296	2024-09-19	Rod Mistri Helper	7	3525	3500	over-25	0	f	\N
351	2024-09-22	Raj Mistri Head	2	1470	1000	জাহাঙ্গীর -৭৫০৳, মাসুদ -৭২০৳	0	f	\N
352	2024-09-22	Raj Mistri Helper	3	1500	1500		0	f	\N
303	2024-09-21	Rod Mistri Head	3	1900	1500	বুলবুল ৬০০৳\nসুরেশ ৭০০৳\nশাকিল ৬০০৳	2	f	\N
304	2024-09-21	Rod Mistri Helper	6	3000	3000		2	f	\N
344	2024-09-22	Rod Mistri Head	7	4950	3500	রব্বানী ৯০০৳\nরিংকু ৭৫০৳\nনজরুল ৭৫০৳\nজহুরুল ৭৫০৳\nসুরেশ ৬৫০৳\nশাকিল ৬০০৳\nবুলবুল ৫৫০৳	2	f	\N
345	2024-09-22	Rod Mistri Helper	6	3150	3000	সুজন ৬০০৳\nওবায়দুল ৫৫০৳	2	f	\N
314	2024-09-04	Project Deposit	0	25000	25185	Cost Over	5	f	\N
306	2024-09-05	Project Deposit	0	59000	57965		5	f	\N
312	2024-09-10	Project Deposit	\N	26000	28560	 over	5	f	\N
305	2024-09-07	Project Deposit	0	50000	47195		5	f	\N
307	2024-09-08	Project Deposit	0	30000	28690		5	f	\N
308	2024-09-09	Project Deposit	0	35000	27835		5	f	\N
309	2024-09-06	Project Deposit	0	20000	21630	 Over	5	f	\N
311	2024-09-11	Project Deposit	0	22000	22500	 Md Sir 2000 Guard SAH Salary at  Over	5	f	\N
310	2024-09-12	Project Deposit	0	20000	18530		5	f	\N
313	2024-09-13	Project Deposit	0	16000	16015		5	f	\N
320	2024-09-19	Project Deposit	0	40000	40000		5	f	\N
319	2024-09-17	Project Deposit	0	16500	17000		5	f	\N
318	2024-09-16	Project Deposit	0	13000	14500	 over	5	f	\N
317	2024-09-03	Project Deposit	0	50000	25100		5	f	\N
316	2024-09-02	Project Deposit	0	50000	50100		5	f	\N
371	2024-09-11	Rod Mistri Head	3	2250	1600	ইউসুফ=৮০০,আলমগীর=৭৫০	3	f	\N
376	2024-09-13	Rod Mistri Head	4	2950	2100	ইউসুফ=৮০০,আলমগীর=৭৫০	3	f	\N
381	2024-09-16	Rod Mistri Helper	3	1500	1500		3	f	\N
383	2024-09-17	Rod Mistri Head	3	2250	1500	ইউসুফ=৮০০৳,আলমগীর=৭৫০৳	3	f	\N
938	2024-09-30	Rod Mistri Helper	0	0	500	 Rajo Helper 10-10-24 sep-24	2	f	\N
939	2024-09-30	Rod Mistri Helper	0	0	350	Sujan -10-10-24 Sep-24	2	f	\N
941	2024-09-30	Rod Mistri Head	0	0	1000	 Nazrul 11-10-24 Sep-24 Over Tk	0	f	\N
943	2024-10-17	Raj Mistri Head	4	2870	2000	জাহাঙ্গীর =৭৫০, মাসুদ = ৭২০৳	0	f	\N
948	2024-10-17	Electrician	2	1200	1200	 Kabir 	0	f	\N
952	2024-10-19	Chipping Head	1	1000	1000	 Details Ullekh nai ?	0	f	\N
961	2024-10-20	Rod Mistri Helper	7	3550	3500	ওবায়দুল =৫৫০৳	0	f	\N
968	2024-10-21	Miscellaneous	0	800	800	ড্রিল মেশিন মেরামত 	2	f	\N
973	2024-10-21	Miscellaneous	0	0	0		2	f	\N
974	2024-10-21	Sand	0	0	0		2	f	\N
1210	2024-07-31	Engineer Salary	0	382500	382500	Engineer + Guard Salary Last Date-31-7-2024	0	f	\N
1198	2024-10-28	Welder's Helper	1	500	500		0	f	\N
1790	2024-10-31	Raj Mistri Head	0	0	0	মাথার টাকা অক্টোবর =৯৩৫০৳	0	f	\N
1780	2024-11-12	Raj Mistri Head	5	3570	2500	 Mestry Name nai ???	0	f	\N
1785	2024-10-31	Head Welder	0	0	2900	মাথার টাকা অক্টোবর =২৯০০৳	0	f	\N
1810	2024-11-14	Rod Mistri Head	3	2100	1500	আনিস ৮০০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
1799	2024-11-11	Rod Mistri Head	2	1450	1000	রাশেদুল=750৳	3	f	\N
1805	2024-11-13	Rod Mistri Head	4	3000	2100	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
1835	2024-11-13	Miscellaneous	0	1010	0	ক্যাশ মেমো	0	f	\N
1823	2024-11-13	Rod Mistri Head	5	3700	2500	সোহেল =৮০০৳,মিন্টু =৭৫০৳,রিংকু =৭৫০৳,সুরেশ =৬৫০৳,জহরুল- ৭৫০৳	0	f	\N
1828	2024-11-13	Head Welder	1	800	500		0	f	\N
1837	2024-11-13	Engineer Salary	0	2000	2000	নভেম্বর মাস Sabiqul  SSD Project	0	f	\N
1840	2024-11-14	Rod Mistri Helper	12	6200	6000	মাসুদ =৫৫০৳, ওবায়দুল =৫৫০৳,লাকু=৫৫০৳,আশিক =৫৫০৳	0	f	\N
1842	2024-11-14	Raj Mistri Helper	7	3500	3500		0	f	\N
1848	2024-11-14	Day Labour Bill	0	5100	5100	বালি উঠা ৪,৬ তলা	0	f	\N
1854	2024-11-15	Raj Mistri Helper	5	2500	2500		0	f	\N
1856	2024-11-15	Miscellaneous	0	500	500	ইন্জি. সাফি ওভার টাইম 	0	f	\N
1862	2024-11-16	Sanitary Mistri Head	2	1200	1200		0	f	\N
1885	2024-11-17	Door Frame Purchase	0	0	50000	UCB Cheque no -1534331 M.H. Timber Mosharraf	0	f	\N
1894	2024-11-17	Rod Mistri Helper	12	6200	6000	মাসুদ =৫৫০৳,ওবায়দুল =৫৫০৳,লাকু=৫৫০৳,আশিক =৫৫০৳	0	f	\N
1886	2024-11-17	Rod Mistri Head	2	1450	1000	Anis 800৳\nArif 650৳	2	f	\N
1866	2024-11-14	Rod Mistri Head	1	700	500	কাসেম ৭০০৳	1	f	\N
1871	2024-11-14	Maid Salary	1	3500	3500	বুয়া বেতন অক্টোবর ২০২৪	1	f	\N
1876	2024-11-16	Rod Mistri Head	2	1400	1000	কাসেম ৭০০৳\nসোহাগ ৭০০৳	1	f	\N
1881	2024-11-17	Rod Mistri Head	2	1400	1000	কাসেম ৭০০৳\nসোহাগ ৭০০৳	1	f	\N
1901	2024-11-15	Miscellaneous	0	697	697	ক্যাশ মেমো	3	f	\N
1914	2024-11-18	Sanitary Mistri Head	4	2400	2400		0	f	\N
1905	2024-11-17	Rod Mistri Head	4	3000	2100	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
1891	2024-11-16	Razia Tower Cost	0	0	1000	 Lift Sarket 63 Mpr Asif Winer co. 	6	f	\N
2129	2024-11-26	Razia Tower Cost	0	50000	50000	RT Stair Tali Uttara Stone shop 404 Sft Bank Al Falah Cheque rate -580 	6	f	\N
2141	2024-11-23	Cement	100	50000	0	SSD Project Cement 100 Bag Rate =500 TK Per Bag.	4	f	\N
2163	2024-11-27	MD Sir Personal Cost	0	0	2600	Online persel File Dir Sir	6	f	\N
2166	2024-11-28	Cement	0	0	100000	Avalone project UCB Imp Dir Sir no-1503909	4	f	\N
2194	2024-11-28	Welder's Helper	2	1000	1000		1	f	\N
2153	2024-11-27	Rod Mistri Helper	4	2150	2000	ওবায়দুল =৫৫০৳,আশিক =৫৫০৳,মাসুদ =৫৫০৳	0	f	\N
2158	2024-11-27	Chipping Head	1	1000	1000		0	f	\N
2170	2024-11-28	Rod Mistri Head	3	2200	1500	সোহেল =৮০০৳,সুরেশ =৬৫০৳,রিংকু =৭৫০৳	0	f	\N
2175	2024-11-28	Day Labour Bill	0	7200	7200	খোয়া ভাঙা ১২ হাজার 	0	f	\N
2180	2024-11-29	Raj Mistri Head	4	2920	2000	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳,রিয়াদ=৭৫০৳	0	f	\N
2146	2024-11-27	Rod Mistri Helper	2	1000	1000		3	f	\N
1202	2024-10-29	Steel Rod Purchase	0	0	200000	AVALON Project  Rod + Cement UCB no-1509673	4	f	\N
1372	2024-11-02	Rod Mistri Head	3	2050	2000	আনিস ৭৫০৳\nসেলমি ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
375	2024-09-12	Rod Mistri Helper	2	1000	1000		3	f	\N
378	2024-09-13	Miscellaneous	4	4195	4195	ক্যাশ মেমো=১১৫৳,ভাইব্রেটর আনা ভাড়া=৮০৳,ডে লেবার যাতায়াত ভাড়া=৫০০৳,রড মিস্ত্রি আসা ভাড়া=৩৫০০৳	3	f	\N
380	2024-09-16	Rod Mistri Head	3	2250	1500	ইউসুফ=৮০০৳,আলমগীর=৭৫০৳	3	f	\N
940	2024-09-30	Rod Mistri Helper	0	0	450	Mostofa Helper 10-10-24 sep-24	2	f	\N
958	2024-10-21	Miscellaneous	0	0	0	test	2	f	\N
944	2024-10-17	Raj Mistri Helper	4	2000	2000		0	f	\N
1289	2024-10-29	Rod Mistri Helper	7	3600	3500	মাসুদ =৫৫০৳,ওবায়দুল =৫৫০৳	0	f	\N
962	2024-10-20	Chipping Head	1	1000	1000	 detailes nai  ?	0	f	\N
394	2024-09-22	Miscellaneous	2	785	785	ইঞ্জিনিয়ার যাতায়াত ভাড়া=২১০৳,ক্যাশ মেমো=৫৭৫৳	3	f	\N
373	2024-09-11	Sanitary Expense	4	1890	1890	ক্যাশ মেমো=৪১০৳,সেনেটারি মিস্ত্রি =১০০০৳,সেনেটারি মালামাল =৩০০৳,যাতায়াত ভাড়া =১৮০৳	3	f	\N
978	2024-10-19	Project Deposit	0	20000	20000	 UCb Cheque 20000 Asad Salary Month of Sep-24	5	f	\N
969	2024-10-21	Miscellaneous	0	1400	1400	খাবার বাবাদ 	2	f	\N
964	2024-10-21	Sand	0	45000	16500	লাল বালু বড় ১ গাড়ি due -28500	2	f	\N
981	2024-10-07	Miscellaneous	3	3239	3239	ক্যাশ মেমো=3039৳ \n17 টু 15 রডকাটার নিয়ে যাওয়া=160৳\nপিপড়ার বিষ=30৳\n	3	f	\N
987	2024-10-09	Miscellaneous	2	250	250	রড মিস্ত্রি যাতায়াত ভাড়া 150+100	3	f	\N
1379	2024-10-31	Project Deposit	0	100000	99932		5	f	\N
1218	2024-07-31	Electrician	0	160700	160700	 Kabir 31-7-2024	0	f	\N
1223	2024-07-31	Purchased Bamboo	0	205000	205000	31-7-2024 Mohan	0	f	\N
1230	2024-08-28	Rod Mistri Head	0	410750	410750	Last Date-28-8-2024	2	f	\N
1231	2024-08-28	Raj Mistri Head	0	26800	26800		2	f	\N
1232	2024-08-28	Sand	0	397500	397500		2	f	\N
1237	2024-08-28	Engineer Salary	0	318500	318500	 Guard Salary at	2	f	\N
1240	2024-08-28	Sign Board	0	25500	25500	Scarlet + Add It	2	f	\N
1241	2024-08-28	Electrician	0	2000	2000		2	f	\N
1259	2024-08-28	Broker	0	155000	155000	 Missing + Hights + Other Cost  Md. Jashimuddin	1	f	\N
1264	2024-08-30	Steel Rod Purchase	0	4180978	4180978	 Rod + Cement Taioba Steel 	1	f	\N
1269	2024-08-30	Bricks Purchase	15000	180500	180500	Bricks Habib	1	f	\N
1273	2024-08-30	Utility	0	432500	432500	 Desco + Wasa + Submersible at 	1	f	\N
1275	2024-08-30	Concrete-Casting	0	347880	347880		1	f	\N
1250	2024-10-29	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
953	2024-10-19	Electrician	3	1800	1800	 Kabir paid -27-10-24	0	f	\N
1368	2024-10-29	Rod Mistri Head	0	0	1000	 rod mestry Rabbani over TK- October -24	0	f	\N
1356	2024-10-31	Raj Mistri Head	5	3570	2500	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳	0	f	\N
1358	2024-10-31	Rod Mistri Head	6	4450	3000		0	f	\N
1359	2024-10-31	Raj Mistri Helper	8	4050	4000	মাসুদ =৫৫০৳	0	f	\N
1364	2024-10-31	Miscellaneous	0	120	120	মালামাল আনা ভাড়া 	0	f	\N
1374	2024-11-02	Rod Mistri Helper	3	1550	1500	ওবায়দুল ৫৫০৳	2	f	\N
1301	2024-10-31	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
1366	2024-10-31	Miscellaneous	0	2360	2360	হেলমেট=৬পিস\nসেইফটি বেল=৪ পিস 	3	f	\N
1400	2024-11-01	Miscellaneous	0	0	0	Engr. Shafi Over time.	1	f	\N
1388	2024-11-02	Electrician	3	1800	1800		0	f	\N
1417	2024-10-20	Miscellaneous	0	0	1500	 office SPDL Net Bill October -24	6	f	\N
1414	2024-10-31	Miscellaneous	0	0	40	 Show polish Dir Sir A	6	f	\N
1212	2024-10-24	Engineer Salary	0	0	5000	 Engineer Shakib Due Salary Sep-24  Office Paid by Liton	6	f	\N
1412	2024-11-02	Miscellaneous	0	0	1120	 SSD Stamp + Katiz paper 8+10	6	f	\N
1402	2024-11-02	Rod Mistri Helper	4	2000	2000		1	f	\N
1311	2024-10-24	Guard Salary	1	2000	2000	সেপ্টেম্বর মাসের বেতন 	3	f	\N
1312	2024-10-25	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1377	2024-10-31	Sand	0	44000	44000	সিলেট বালু ক্রয় (লাল)	2	f	\N
1420	2024-11-03	Utility	0	0	3000	 SAH Project Desco Bill Paid by Liton Bkash	6	f	\N
1393	2024-11-02	Miscellaneous	0	1000	1000	আসাদ মোবাইল বিল 	0	f	\N
1431	2024-11-01	Rod Mistri Helper	3	1550	1500	জুবায়েত=550৳	3	f	\N
1436	2024-11-03	Rod Mistri Helper	3	1550	1500	জুবায়েত=550৳	3	f	\N
1383	2024-11-01	Miscellaneous	0	500	500	Engr. Rahinur over time SAH project 	0	f	\N
1285	2024-10-30	Signing Money	0	200000	200000	Mofij Uddin Cash BY Office MD Sir	7	f	\N
979	2024-10-21	Project Deposit	0	70780	87100	 Md Sir Avalon bkash -780 Deposited	5	f	\N
942	2024-10-12	Sand	0	0	4000	10-9-24 Sada Sand	0	f	\N
356	2024-09-01	Miscellaneous	2	570	570	যাতায়াত ভাড়া=৪২০,ক্যাশ মেমো=১৫০	3	f	\N
374	2024-09-12	Rod Mistri Head	3	2250	1600	ইউসুফ=৮০০,আলমগীর=৭৫০	3	f	\N
379	2024-09-13	Rod Mistri Helper	5	2500	2500		3	f	\N
950	2024-10-19	Raj Mistri Head	3	2100	1500		0	f	\N
402	2024-09-23	Maid Salary	0	1000	0	আগস্ট মাসে 	0	f	\N
403	2024-09-23	Miscellaneous	0	50	0	মালামাল নেওয়া ভাড়া 	0	f	\N
429	2024-09-25	Steel Rod Purchase	0	0	360000	Cash Office Mahmuda siddika payment SSD Project	4	f	\N
431	2024-09-03	Miscellaneous	0	0	0	কাজ বন্ধ 	1	f	\N
423	2024-09-01	Rod Mistri Helper	2	1000	1000		1	f	\N
424	2024-09-01	Miscellaneous	0	905	905	ক্যাশ মেমো	1	f	\N
430	2024-09-02	Miscellaneous	0	4000	4000	ইট উঠা ৫ তলা ৬০০০ হাজার 	1	f	\N
425	2024-09-02	Rod Mistri Head	3	2200	1500		1	f	\N
426	2024-09-02	Rod Mistri Helper	3	1500	1500		1	f	\N
427	2024-09-02	Raj Mistri Head	1	700	500		1	f	\N
428	2024-09-02	Raj Mistri Helper	1	500	500		1	f	\N
432	2024-09-04	Rod Mistri Head	3	2200	1500		1	f	\N
433	2024-09-04	Rod Mistri Helper	2	1000	1000		1	f	\N
434	2024-09-04	Raj Mistri Helper	1	700	500		1	f	\N
435	2024-09-04	Raj Mistri Helper	1	500	500		1	f	\N
436	2024-09-04	Miscellaneous	0	1045	1045	ক্যাশ মেমো	1	f	\N
399	2024-09-23	Raj Mistri Head	2	1470	1000		0	f	\N
400	2024-09-23	Raj Mistri Helper	2	1000	1000		0	f	\N
401	2024-09-23	Electrician	2	1000	1000		0	f	\N
404	2024-09-24	Raj Mistri Head	1	700	500		0	f	\N
405	2024-09-24	Raj Mistri Helper	1	500	500		0	f	\N
414	2024-09-24	Raj Mistri Head	0	0	500	রনি রাজ মিস্ত্রি মাথার টাকা সেপ্টেম্বর = ৫০০৳	0	f	\N
416	2024-08-31	Rod Mistri Head	0	0	1000	মিন্টু রড মিস্তিরি মাথার টাকা আগস্ট = ১০০০৳	0	f	\N
417	2024-07-31	Rod Mistri Head	0	0	1000	শাকিল রড মিস্তিরি মাথার টাকা জুলাই = ১০০০৳	0	f	\N
413	2024-07-31	Raj Mistri Head	0	0	1000	জাহাঙ্গীর রাজ মিস্ত্রি মাথার টাকা জুন-জুলাই = ১০০০৳	0	f	\N
411	2024-09-22	Guard Salary	0	2000	2000	রবিউল আগস্ট মাসের বেতন MD sir বিকাশে দিয়েছে। 	2	f	\N
396	2024-09-23	Rod Mistri Helper	9	4650	4500	ওবায়দুল ৫৫০৳\nসুজন ৬০০৳	2	f	\N
397	2024-09-23	Miscellaneous	1	575	575	২" পেরেক ৫ কেজি	2	f	\N
398	2024-09-23	Miscellaneous	0	200	200	ক্যাশমেমো (পানি ও সেলাইন)	2	f	\N
412	2024-09-23	Guard Salary	0	0	2000	আগস্ট মাস বেতন \nMD Sir বিকাশে দিয়েছে 	2	f	\N
407	2024-09-24	Rod Mistri Head	7	4950	3500	সুরেশ ৬৫০৳\nরব্বানী ৯০০৳\nরিংকু ৭৫০৳\nমিন্টু ৭৫০৳\nজহুরুল ৭৫০৳\nশাকিল ৬০০৳\nবুলবুল ৫৫০৳	2	f	\N
408	2024-09-24	Rod Mistri Helper	9	4650	4500	সুজন ৬০০৳\nরাসেল ৫০০৳	2	f	\N
409	2024-09-24	Miscellaneous	1	5608	2000	ক্যাশ মেমো ২" পেরেক ১০ কেজি, পিন পেরেক   ১ বক্স।  Due-3608	2	f	\N
410	2024-09-24	Hardware Materials	1	1860	1860	মটরের জন্য মালামাল ক্রয় 	2	f	\N
384	2024-09-17	Rod Mistri Helper	3	1500	1500		3	f	\N
385	2024-09-18	Rod Mistri Head	2	2250	1000	ইউসুফ=৮০০৳,আলমগীর=৭৫০৳	3	f	\N
386	2024-09-18	Rod Mistri Helper	3	1500	1500	20-09-2024 paid Md Sir	3	f	\N
387	2024-09-19	Rod Mistri Head	4	2950	2100	ইউসুফ=৮০০৳,আলমগীর=৭৫০৳	3	f	\N
388	2024-09-19	Rod Mistri Helper	4	2000	2000		3	f	\N
389	2024-09-19	Miscellaneous	2	200	200	মালামাল আনা=১০০৳,মিস্ত্রি যাতায়াত ভাড়া=১০০৳	3	f	\N
390	2024-09-21	Rod Mistri Head	4	2950	2000	ইউসুফ=৮০০৳,আলমগীর=৭৫০৳	3	f	\N
391	2024-09-21	Rod Mistri Helper	3	1500	1500		3	f	\N
418	2024-09-21	Project Deposit	4	17000	17020	Liton-7000 + Md Sir-10000	5	f	\N
393	2024-09-22	Rod Mistri Helper	4	2000	2000		3	f	\N
392	2024-09-22	Rod Mistri Head	4	2950	2100	ইউসুফ=৮০০৳,আলমগীর=৭৫০৳	3	f	\N
419	2024-09-22	Project Deposit	4	12000	12000	Guard Rabiul-2000 MD Sir	5	f	\N
420	2024-09-23	Project Deposit	4	22000	21770	Md Sir Guard  SAH Guard Salary -2000	5	f	\N
421	2024-09-24	Project Deposit	0	55000	54960	5000+50000	5	f	\N
415	2024-08-31	Rod Mistri Head	0	0	2000	রিংকু রড মিস্তিরি মাথার টাকা আগস্ট = ২০০০৳	0	f	\N
452	2024-09-08	Miscellaneous	0	0	0	কাজ বন্ধ 	1	f	\N
437	2024-09-05	Rod Mistri Head	3	2200	1500		1	f	\N
442	2024-09-06	Rod Mistri Head	3	2200	1500		1	f	\N
447	2024-09-07	Rod Mistri Head	1	800	500		1	f	\N
949	2024-10-18	Miscellaneous	0	0	0	কাজ বন্ধ 	0	f	\N
945	2024-10-17	Rod Mistri Head	9	6500	4500	রাব্বানী =৯০০৳,সোহেল =৮০০৳,মিন্টু ৭৫০৳,রিংকু ৭৫০৳,সুরেশ =৬৫০৳,বুলবুল ৬০০৳,সাকিল-৬০০৳, জহরুল- ৭৫০৳	0	f	\N
954	2024-10-19	Day Labour Bill	0	4500	4500	৩০০০ হাজার ইট উঠা ৮তলা	0	f	\N
959	2024-10-20	Raj Mistri Helper	5	2500	2500		0	f	\N
1389	2024-11-02	Head Welder	1	800	500		0	f	\N
932	2024-10-20	Rod Mistri Head	2	1300	1000	মাহফুজ ৭০০৳\nশাকিল২ ৬০০৳	2	f	\N
975	2024-10-19	Project Deposit	0	44500	54620		5	f	\N
965	2024-10-21	Rod Mistri Head	1	700	500	মাহফুজ ৭০০৳	2	f	\N
970	2024-10-21	Miscellaneous	0	120	120	রিক্সা ভাড়া 	2	f	\N
982	2024-10-08	Rod Mistri Head	1	600	500	বুলবুল=600	3	f	\N
1216	2024-09-30	Head Welder	0	0	500	 over tk Sep-24	0	f	\N
1217	2024-09-30	Head Welder	0	0	1100	 over tk sep-24 payment-11-10-24	0	f	\N
1219	2024-07-31	Electric Items Purchase	0	309254	309254	Shukhi Electric 31-7-2024	0	f	\N
1224	2024-07-31	Hardware Materials	0	358110	358110	 Akata Steel + Fatema Steel Square ber 31-7-2024	0	f	\N
1234	2024-08-28	Piling Expense	0	447000	447000	Aftab Due -30000	2	f	\N
1236	2024-08-28	Purchased Bamboo	0	64500	64500	Mohan	2	f	\N
1238	2024-08-28	Bricks Purchase	0	279500	279500		2	f	\N
1363	2024-10-31	Miscellaneous	2	15345	15345	ক্যাশ মেমো	0	f	\N
1257	2024-08-28	Architect	0	160000	160000		1	f	\N
1262	2024-08-30	Raj Mistri Head	0	55600	55600		1	f	\N
1267	2024-08-30	Rod Mistri Head	0	733990	733990		1	f	\N
1249	2024-10-28	Miscellaneous	0	3000	3000	ক্যাশ মেমো।	1	f	\N
1253	2024-10-29	Raj Mistri Head	2	1400	1000	সালাম ৭০০৳\nআলমগীর ৭০০৳	1	f	\N
1281	2024-10-29	Utility	0	24440	24440	 Wasa Bill Sep-24 Paid By Liton	0	f	\N
1283	2024-10-28	Project Deposit	0	86000	86880	 over 880	5	f	\N
1286	2024-10-29	Raj Mistri Head	6	4270	3000	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳	0	f	\N
1291	2024-10-29	Welder's Helper	1	500	500		0	f	\N
1293	2024-10-29	Maid Salary	0	1000	1000	অক্টোবর মাসে 	0	f	\N
1215	2024-09-30	Rod Mistri Head	0	0	5000	 Rod Mestry Head Yousof over tk Sep-24  Payment 28-10-2024	3	f	\N
1453	2024-09-15	Mobile Bill	0	0	450	 Net Bill Liton 01 Month	6	f	\N
1357	2024-10-31	Raj Mistri Helper	6	3000	3000		0	f	\N
1376	2024-10-31	Guard Salary	0	0	2000	 october-24	2	f	\N
1296	2024-10-30	Rod Mistri Helper	6	3000	3000		1	f	\N
1298	2024-10-30	Raj Mistri Helper	3	1500	1500		1	f	\N
1303	2024-10-31	Raj Mistri Head	3	2100	1500	সালাম ৭০০৳\nআলমগীর ৭০০৳\nসাগোর ৭০০৳	1	f	\N
963	2024-10-20	Electrician	2	1200	1200		0	f	\N
1384	2024-11-02	Raj Mistri Head	5	3570	2500	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳	0	f	\N
1415	2024-10-31	Miscellaneous	0	0	180	 Vander Zakir  MD. Mofiz Landowner Documents  Copy	6	f	\N
1395	2024-11-01	Rod Mistri Helper	4	2000	2000		1	f	\N
1396	2024-11-01	Raj Mistri Head	4	2800	2000	সালাম ৭০০ \nকালাম ৭০০ \nসাগর ৭০০ \nআলমগীর ৭০০ 	1	f	\N
1403	2024-11-02	Raj Mistri Head	3	2100	1500	সালাম ৭০০৳ আলমগীর ৭০০৳ সাগোর ৭০০৳	1	f	\N
1407	2024-11-03	Rod Mistri Helper	5	2500	2500		1	f	\N
1306	2024-10-24	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1440	2024-09-09	Utility	0	0	2970	 Spire Desco Bill July-24	6	f	\N
1432	2024-11-02	Rod Mistri Head	3	2300	1600	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
1448	2024-09-12	Engineer Salary	0	0	18000	Emam Hasan Salary Month of Aug-24 Joining Date -07-08-2024	6	f	\N
1458	2024-10-31	Project Deposit	0	105000	0	 Tacos Shop Deposited 01-10-2024 to 30-10-30 = 30 Days X3500=	6	f	\N
1464	2024-09-19	Miscellaneous	0	0	280	 office Cost Adha + lemon + SAH Client 	6	f	\N
1442	2024-09-30	Miscellaneous	0	94500	0	 Tacos Shop 04-09-24 to 30-09-2024 27 Days X 3500= Liton Received	6	f	\N
1213	2024-10-29	Utility	0	0	30860	 SSD +Spire + Avalon Sep=24 Wasa Bill  Paid By Liton 	6	f	\N
1437	2024-11-03	Hardware Materials	1	80	80	ক্যাশ মেমো	3	f	\N
1426	2024-11-03	Welder's Helper	1	500	500		2	f	\N
1447	2024-10-11	Utility	0	0	3050	SSD Desco Bill Bkash	6	f	\N
1371	2024-10-31	Raj Mistri Head	0	0	1000	Raz over Jahangir car rent October-24	0	f	\N
1378	2024-10-30	Project Deposit	0	60000	60320		5	f	\N
2130	2024-11-26	Razia Tower Cost	0	0	11000	Lift Nasir  Control Fitting 	6	f	\N
438	2024-09-05	Rod Mistri Helper	2	1000	1000		1	f	\N
443	2024-09-06	Rod Mistri Helper	2	1000	1000		1	f	\N
448	2024-09-07	Rod Mistri Helper	1	500	500		1	f	\N
955	2024-10-19	Rod Mistri Head	7	5050	3500	রাব্বানী =৯০০৳,মিন্টু =৭৫০৳,রিংকু =৭৫০৳,সুরেশ =৬৫০৳,সাকিল-৬০০৳, বুলবুল =৬০০৳,সোহেল =৮০০৳	0	f	\N
957	2024-10-20	Raj Mistri Head	4	2870	2000	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳	0	f	\N
976	2024-10-20	Project Deposit	0	50000	28648		5	f	\N
966	2024-10-21	Rod Mistri Helper	3	1500	1500		2	f	\N
971	2024-10-21	Miscellaneous	0	500	500	মাজবান্ডি বকশিস এলাকার পোলাপান	2	f	\N
983	2024-10-08	Rod Mistri Helper	2	1000	1000		3	f	\N
985	2024-10-09	Rod Mistri Head	1	600	500		3	f	\N
1220	2024-07-31	Sanitary Expense	0	27800	27800	Rahmat Senatary goods 31-7-2024	0	f	\N
1228	2024-07-30	Soil Test	0	34000	34000	Seba Soil + Woodbana 15-11-23	2	f	\N
1229	2024-08-28	Miscellaneous	0	320078	320078	28-8-2024	2	f	\N
1233	2024-08-28	Steel Rod Purchase	0	3009370	3009370	 M/S Taioba Steel Corporation	2	f	\N
1235	2024-08-28	Mati Kata	0	237575	237575	 Day labour + Dalai +Mati katta Cost 	2	f	\N
1256	2024-07-30	Deed	0	130000	130000	Power Deed + Agreement	1	f	\N
1258	2024-08-28	Plan Pass/Approval	0	290000	290000	Plan pass + power Accept at	1	f	\N
1263	2024-08-30	Sand	0	370000	370000	White + Red + Vity	1	f	\N
1268	2024-08-30	Engineer Salary	0	302500	302500	Engineer + Guard	1	f	\N
1274	2024-08-30	Am Kat	0	123981	123981	 SR Eterprise + Tarin	1	f	\N
1254	2024-10-29	Raj Mistri Helper	2	1000	1000		1	f	\N
1290	2024-10-29	Head Welder	1	800	500		0	f	\N
1365	2024-11-01	Miscellaneous	0	0	0	কাজ বন্ধ 	0	f	\N
1373	2024-10-31	Rod Mistri Head	0	0	500	 Rod Rinko october-24 over	0	f	\N
1367	2024-10-31	Miscellaneous	0	100	100	SAH to SSD কাটিং মেশিন নেয়া ভাড়া	2	f	\N
1295	2024-10-30	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
1302	2024-10-31	Rod Mistri Helper	6	3000	3000		1	f	\N
1284	2024-10-29	Project Deposit	0	57050	55445		5	f	\N
1360	2024-10-31	Electrician	2	1200	1200		0	f	\N
1385	2024-11-02	Raj Mistri Helper	7	3500	3500		0	f	\N
1390	2024-11-02	Welder's Helper	1	500	500		0	f	\N
1435	2024-11-03	Rod Mistri Head	3	2300	1600	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
1394	2024-11-01	Rod Mistri Head	2	1400	1000	রাসেল ৭০০  \nকাসেম ৭০০ 	1	f	\N
1397	2024-11-01	Raj Mistri Helper	4	2000	2000		1	f	\N
1404	2024-11-02	Raj Mistri Helper	4	2000	2000		1	f	\N
1406	2024-11-03	Rod Mistri Head	2	1400	1000	কাসেম =৭০০৳ \nরাসেল =৭০০৳	1	f	\N
1408	2024-11-03	Raj Mistri Head	3	2100	1500	সালাম ৭০০৳ আলমগীর ৭০০৳ সাগোর ৭০০৳	1	f	\N
1422	2024-11-03	Day Labour Bill	0	200	200	বালু সরানো ২০০৳	2	f	\N
1419	2024-11-03	Utility	0	0	3000	 Desco Bill  Bkash  Paid by Liton	2	f	\N
1438	2024-11-03	Project Deposit	0	0	10000	 Spire + Avalon Project ASad Khoraki cost  Paid by Liton office	6	f	\N
1456	2024-09-17	Engineer Salary	0	0	14000	 SSD Engineer Rahinur Salary Month of Aug-24	6	f	\N
1451	2024-09-15	Engineer Salary	0	0	4500	 Avalon Project Eng. Murad Salary Month of Aug-24	6	f	\N
1463	2024-09-19	Marketing Expenses	0	0	2500	 Pana Steakar  Subuz Cost SSD Project 	6	f	\N
1468	2024-11-04	VAT & TAX	0	0	950	 REF Tower Landtax 1431 Bangla year + BRTA Convince 	6	f	\N
1214	2024-10-29	Marketing Expenses	0	0	4000	Syber Hosting Payment Bkash 01632250881 Renewal Fee Nov-24 to Oct-25 Paid by Liton	6	f	\N
1461	2024-09-16	Staff Salary	0	0	20000	 Liton Salary Month of Aug -2024	6	f	\N
1445	2024-10-10	Utility	0	0	10000	17 no Wasa Inspector Speed Money Paid By Liton 	6	f	\N
1425	2024-11-03	Head Welder	1	800	500	আল-আমীন ৮০০৳\nস্টিল স্যাটারের কাজ	2	f	\N
1381	2024-10-31	Raj Mistri Head	0	0	2500	Alomgir + Salam over Tk. october-24	1	f	\N
1851	2024-11-15	Rod Mistri Head	6	4300	3000	same workers 	0	f	\N
1890	2024-11-17	Razia Tower Cost	0	0	550	 Lite Control Nice 3000 + Van Rent Rosemount 	6	f	\N
1844	2024-11-14	Head Welder	1	800	500		0	f	\N
1859	2024-11-16	Rod Mistri Helper	9	4700	4500	ওবায়দুল =৫৫০৳,আশিক =৫৫০৳,লাকু=৫৫০৳,মাসুদ =৫৫০৳	0	f	\N
1887	2024-11-17	Rod Mistri Helper	3	1500	1500		2	f	\N
1870	2024-11-14	Miscellaneous	0	125	125	ক্যাশ মেমো ১২৫৳	1	f	\N
1875	2024-11-15	Raj Mistri Helper	1	500	500		1	f	\N
1877	2024-11-16	Rod Mistri Helper	5	2500	2500		1	f	\N
1882	2024-11-17	Rod Mistri Helper	5	2500	2500		1	f	\N
1865	2024-11-13	Day Labour Bill	0	9300	9300	বালু তোলা হয়েছে ৫০০ ব্স্তা।	1	f	\N
422	2024-09-01	Rod Mistri Head	3	2200	1500	লাভলু= ৮০০৳	1	f	\N
439	2024-09-05	Raj Mistri Head	1	700	500		1	f	\N
444	2024-09-06	Raj Mistri Head	1	700	500		1	f	\N
449	2024-09-07	Raj Mistri Head	1	700	500		1	f	\N
947	2024-10-17	Miscellaneous	0	100	100	ক্যাশ মেমো	0	f	\N
946	2024-10-17	Rod Mistri Helper	9	4550	4500	ওবায়দুল ৫৫০৳	0	f	\N
956	2024-10-19	Rod Mistri Helper	9	4550	4500	ওবায়দুল =৫৫০৳	0	f	\N
960	2024-10-20	Rod Mistri Head	8	5900	4000	রাব্বানী =৯০০৳,বুলবুল =৬০০৳,সুরেশ =৬৫০৳,মিন্টু =৭৫০৳,সোহেল =৮০০৳,জহরুল-৭৫০৳,রিংকু=৭৫০৳	0	f	\N
967	2024-10-21	Concrete-Casting	0	31000	31000	২য় ছাদ ঢালাই খরচ 	2	f	\N
972	2024-10-21	Sand	0	500	500	সাদা বালু  Paid	2	f	\N
980	2024-10-06	Miscellaneous	0	0	0	কাজ বন্ধ 	3	f	\N
984	2024-10-08	Miscellaneous	1	200	200	3 জন রড মিস্ত্রি যাতায়াত ভাড়া 	3	f	\N
986	2024-10-09	Rod Mistri Helper	2	1000	1000		3	f	\N
1221	2024-07-31	Head Painter	0	9300	9300	 31-7-2024	0	f	\N
1227	2024-08-21	Architect	0	288000	240000	Agreement -288000 Engineer Nurullah Last Payment 20-10-2024 30000	2	f	\N
1239	2024-08-28	Sanitary Expense	0	1500	1500	Mestry Cost 	2	f	\N
1244	2024-08-28	Am Kat	0	213000	213000	S. R Enterprise + AB Timber	2	f	\N
1251	2024-08-28	Electric Items Purchase	0	28500	28500	 Shukhi Electric\n.	2	f	\N
1260	2024-08-28	Miscellaneous	0	352967	352967		1	f	\N
1265	2024-08-30	Piling Expense	0	412000	412000		1	f	\N
1270	2024-08-30	Sanitary Mistri Head	0	1800	1800		1	f	\N
1276	2024-08-30	Electric Items Purchase	0	55190	55190	 Shukhi Electric pipe 	1	f	\N
1278	2024-10-29	Utility	0	3762	3762	 Wasa Bill Sep-24 Paid By Liton	1	f	\N
1178	2024-10-28	Raj Mistri Helper	2	1000	1000		1	f	\N
1279	2024-10-28	Miscellaneous	505	47000	47000	 Square ber Kazi Steel shop Paid by asad	0	f	\N
1287	2024-10-29	Raj Mistri Helper	7	3500	3500		0	f	\N
1292	2024-10-29	Day Labour Bill	0	1000	1000	বালি উঠা ৫তলা ৭৫ব্যাগ	0	f	\N
1361	2024-10-31	Head Welder	1	800	500		0	f	\N
1386	2024-11-02	Rod Mistri Head	5	3650	2500	জহরুল- ৭৫০৳,রাব্বানী =৯০০৳,রিংকু =৭৫০৳,বুলবুল =৬০০৳,সুরেশ =৬৫০৳	0	f	\N
1369	2024-11-01	Rod Mistri Head	2	1400	1000	আনিস ৭৫০৳\nআরিফ ৬৫০৳	2	f	\N
1297	2024-10-30	Raj Mistri Head	3	2100	1500	সালাম ৭০০৳\nআলমগীর ৭০০৳\nসাগোর ৭০০৳	1	f	\N
1299	2024-10-30	Miscellaneous	0	0	1000	রাজ মিস্ত্রি যাতায়াত ভাড়া।  October-24	1	f	\N
1304	2024-10-31	Raj Mistri Helper	3	1500	1500		1	f	\N
1391	2024-11-02	Day Labour Bill	0	4200	4200	১ গাড়ি বালি উঠা ৪ তলা	0	f	\N
1413	2024-11-02	Miscellaneous	0	0	1150	 Avalone Photocopy + B4 paper 500 sheet+ SSD Client Appaon +  convence	6	f	\N
1424	2024-11-03	Rod Mistri Helper	5	2500	2500		2	f	\N
1427	2024-11-03	Hardware Materials	0	110	110	ক্যাশমেমো, ঝাড়ু+রেত ১১০৳	2	f	\N
1405	2024-11-02	Raj Mistri Head	0	0	1000	মিস্ত্রি যাতায়াত ভাড়া। Car Rent Advance Nov-24 Alamgir raz	1	f	\N
1398	2024-11-01	Head Welder	1	800	500	আল-আমিন ৮০০ 	1	f	\N
1409	2024-11-03	Raj Mistri Helper	4	2000	2000		1	f	\N
1294	2024-10-29	Miscellaneous	0	2000	2000	ব্যানার লাগানো 	0	f	\N
1307	2024-10-27	Sand	0	0	8500	 Red Sand Due - 20000	2	f	\N
2131	2024-11-27	Utility	6	0	37420	All Project Wasa Bill 04 pcs + Desco Bill 02pcs Month of Oct-24	6	f	\N
1892	2024-11-16	Miscellaneous	0	500	500	মোটরসাইকেল তেল 	0	f	\N
1897	2024-11-17	Sanitary Mistri Head	4	2400	2000		0	f	\N
1908	2024-11-18	Rod Mistri Head	4	3000	2100	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
1899	2024-11-15	Rod Mistri Head	4	3000	2100	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
1904	2024-11-16	Hardware Materials	0	765	765	ক্যাশ মেমো	3	f	\N
1912	2024-11-18	Rod Mistri Head	6	4250	3000	সোহেল =৮০০৳,মিন্টু =৭৫০৳,সুরেশ =৬৫০৳,রিংকু =৭৫০৳,বুলবুল =৬০০৳,	0	f	\N
1917	2024-11-18	Head Welder	1	800	500		0	f	\N
1418	2024-11-03	Door Frame Purchase	\N	60500	50000	 UCB Cheque  no- 1509677  M. H Timber Mosarrf previous Balance  MD Sir Office	1	f	\N
2165	2024-11-26	Office Cost	0	0	480	A4 paper + pensil 02	6	f	\N
2156	2024-11-27	Sanitary Mistri Head	4	2400	2400		0	f	\N
2139	2024-11-26	Rod Mistri Helper	2	1000	1000		3	f	\N
2144	2024-11-26	Miscellaneous	0	5400	5400	ইট ভাঙ্গানো (9 হাজার*600)	3	f	\N
2149	2024-11-28	Miscellaneous	0	1200	1200	গার্ডের জন্য তোষক,বালিশ,চাদর	3	f	\N
2161	2024-11-27	Marketing Expenses	0	12000	12000	 Software Muthasim Fee Month of December-24 UCb Cheque	6	f	\N
440	2024-09-05	Raj Mistri Helper	1	500	500		1	f	\N
445	2024-09-06	Raj Mistri Helper	1	500	500		1	f	\N
450	2024-09-07	Raj Mistri Helper	1	500	500		1	f	\N
997	2024-10-11	Miscellaneous	0	0	0	Engineer Israfil Over Time	3	f	\N
1001	2024-10-12	Miscellaneous	0	0	0	রডমিস্ত্রি আলমগীর মাথার টাকা সেপ্টেম্বর =1440৳	3	f	\N
988	2024-10-10	Rod Mistri Head	1	800	600	ইউসুফ=৮০০৳	3	f	\N
992	2024-10-10	Guard Salary	0	4000	4000	সেপ্টেম্বর মাসের বেতন	3	f	\N
1004	2024-10-14	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1006	2024-10-15	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1018	2024-10-18	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1020	2024-10-18	Miscellaneous	1	40	40	ক্যাশ মেমো	3	f	\N
1222	2024-07-31	Am Kat	0	764933	764933	Ab Timber + S R Enterprise 31-7-2024	0	f	\N
1225	2024-07-30	Signing Money	0	300000	300000	17-10-2022 Rajuk Plan Cost 	2	f	\N
1226	2024-07-30	Deed	0	185000	185000	Vender Zakir 17-10-2022 Power + Agreement Deed	2	f	\N
1243	2024-08-28	Utility	0	282889	282889	Desco + Wasa Bill at	2	f	\N
1255	2024-07-30	Signing Money	0	2800000	2800000		1	f	\N
1261	2024-08-28	Sanitary Goods	0	131000	131000	Submersible Cost 	1	f	\N
1266	2024-08-30	Day Labour Bill	0	179050	179050		1	f	\N
1271	2024-08-30	Marketing Expenses	0	25000	25000	Scarlet + Add It	1	f	\N
1272	2024-08-30	Electrician	0	23500	23500	28-8-2024 Kabir	1	f	\N
1277	2024-08-30	Purchased Bamboo	0	45000	45000	Mohan	1	f	\N
1176	2024-10-28	Rod Mistri Helper	6	3000	3000		1	f	\N
1248	2024-10-28	Miscellaneous	0	250	250	যাতায়াত ভাড়া (১৭ থেকে ১৫ পাথর আনা ১১ বস্তা)= ২৫০৳	1	f	\N
1252	2024-10-29	Rod Mistri Helper	6	3000	3000		1	f	\N
1280	2024-10-28	Rod Mistri Head	0	0	1000	ovet tk october-24 minto + Rabbani 	0	f	\N
1282	2024-10-29	Utility	0	2657	2657	Wasa Bill Sep-24 Paid by Liton	3	f	\N
1288	2024-10-29	Rod Mistri Head	6	4450	3000	রাব্বানী =৯০০৳,রিংকু =৭৫০৳,সোহেল =৮০০৳,জহরুল- ৭৫০৳,সুরেশ =৬৫০৳,বুলবুল =৬০০৳	0	f	\N
1362	2024-10-31	Welder's Helper	1	500	500		0	f	\N
1370	2024-11-01	Rod Mistri Helper	3	1550	1500	ওবায়দুল ৫৫০৳	2	f	\N
1300	2024-10-30	Miscellaneous	0	1000	1000	খডি ১ পিকাপ ভাড়া ১০০০৳	1	f	\N
1443	2024-09-10	Miscellaneous	0	0	28235	 MD Sir Car 21-6757  Tax Token 2024-2025 	6	f	\N
1382	2024-10-29	Head Welder	0	0	2500	Grill Mestry Al Amin  over Tk-2500  OCtober-24	0	f	\N
1387	2024-11-02	Rod Mistri Helper	6	3050	3000	মাসুদ =৫৫০৳	0	f	\N
1392	2024-11-02	Miscellaneous	0	1200	1200	স্টীল সাটারিং কাজ   SAH project 	0	f	\N
1416	2024-10-20	Electrician	0	0	700	 RT Lift Room Katting reedoy	6	f	\N
1399	2024-11-01	Miscellaneous	0	230	230	SSD to Spire মালামাল নেয়ার ভাড়া 	1	f	\N
1401	2024-11-02	Rod Mistri Head	2	1400	1000	কাসেম=৭০০৳ রাসেল=৭০০৳	1	f	\N
1308	2024-10-24	Rod Mistri Helper	5	2500	2500		3	f	\N
1309	2024-10-24	Miscellaneous	1	100	100	15 থেকে ভাইব্রেটর আনা 	3	f	\N
1310	2024-10-24	Guard Salary	1	2000	2000	সেপ্টেম্বর মাসের বেতন 	3	f	\N
1449	2024-09-14	Miscellaneous	0	0	498	 Hotline Mobile Cost Hasan	6	f	\N
1410	2024-11-02	Plan Pass/Approval	0	0	40000	 MD. Jashimuddin Revised Plan Ucb Cheque- 1509676 Paid Total paid-190000 Less 10000	3	f	\N
1450	2024-09-14	Marketing Expenses	0	0	9600	 SSD Pana + All Project 3X3 Banner pvc 30 pcs  Scarlet 	6	f	\N
1459	2024-09-17	Miscellaneous	0	0	15000	 Director Sir Asadkee Khorakee All Project Paid by Liton	6	f	\N
1465	2024-09-21	Engineer Salary	0	0	12000	SAH Eng. Bijoy Salary Aug -24	6	f	\N
1454	2024-09-15	Office Cost	0	0	3500	D. Sir  Car Garrage Bill Asif-	6	f	\N
1434	2024-11-02	Hardware Materials	1	285	285	ক্যাশ মেমো	3	f	\N
1428	2024-11-03	Miscellaneous	0	500	500	Wifi বিল নভেম্বর মাস।	2	f	\N
1421	2024-11-03	Miscellaneous	0	32830	32830	স্টিল স্যাটার কলামের জন্য মাল ক্রয়	2	f	\N
1423	2024-11-03	Rod Mistri Head	2	1400	1000	আনিস ৭৫০৳\nসেলিম ৬৫০৳	2	f	\N
1921	2024-11-17	Steel Rod Purchase	5	440000	0	5 Ton Avalon, Rate 88 TK Per Kg	4	f	\N
1923	2024-10-31	Raj Mistri Head	0	0	0	মাথার টাকা অক্টোবর =৫৬০০৳	0	f	\N
1850	2024-11-14	Electrician	1	600	600		0	f	\N
1930	2024-11-19	Head Welder	1	800	500		0	f	\N
1919	2024-11-14	Rod Mistri Head	0	0	500	রড মিস্ত্রির রাশেদুল গাড়ি ভাড়া(November) =500	3	f	\N
1935	2024-11-19	Guard Salary	0	2000	2000	নভেম্বর Didar	0	f	\N
1948	2024-11-20	Sanitary Mistri Head	4	2400	2400		0	f	\N
1953	2024-11-20	Miscellaneous	0	530	530	ক্যাশ মেমো	0	f	\N
2422	2024-12-04	Rod Mistri Helper	4	2050	2000	মান্নান =550৳	3	f	\N
441	2024-09-05	Miscellaneous	0	280	0	ক্যাশ মেমো	1	f	\N
446	2024-09-06	Guard Salary	0	1000	1000	আগস্ট মাসে 2024 	1	f	\N
451	2024-09-07	Miscellaneous	0	100	100	ইঞ্জিনিয়ার কন.	1	f	\N
455	2024-09-24	Project Deposit	0	2000	2000	SAH Guard Rabiul Aug-2024 Paid Salary MD Sir	5	f	\N
459	2024-09-25	Miscellaneous	0	1000	0	মোটরসাইকেল তেল 	0	f	\N
488	2024-09-12	Miscellaneous	0	0	0	কাজ বন্ধ 	1	f	\N
489	2024-09-13	Miscellaneous	0	0	0	কাজ বন্ধ 	1	f	\N
490	2024-09-14	Miscellaneous	0	0	0	কাজ বন্ধ 	1	f	\N
491	2024-09-15	Miscellaneous	0	0	0	কাজ বন্ধ 	1	f	\N
498	2024-09-19	Miscellaneous	0	0	0	কাজ বন্ধ 	1	f	\N
499	2024-09-20	Miscellaneous	0	0	0	কাজ বন্ধ 	1	f	\N
509	2024-09-24	Guard Salary	0	5000	0	আগস্ট 	1	f	\N
510	2024-09-25	Miscellaneous	0	0	0	কাজ বন্ধ 	1	f	\N
999	2024-10-12	Rod Mistri Helper	5	2500	2500		3	f	\N
453	2024-09-25	Project Deposit	0	23000	22880	From Liton Office MdSir -3000 Guard Didar Sep-2024	5	f	\N
473	2024-09-09	Raj Mistri Helper	1	500	500		1	f	\N
462	2024-09-23	Rod Mistri Helper	4	2000	2000		3	f	\N
461	2024-09-23	Rod Mistri Head	4	2950	2100	ইউসুফ=৮০০৳,আলমগীর=৭৫০৳	3	f	\N
464	2024-09-24	Rod Mistri Head	4	2950	2100	ইউসুফ=৮০০৳,আলমগীর=৭৫০৳	3	f	\N
463	2024-09-23	Miscellaneous	1	200	200	রড মিস্ত্রি যাতায়াত ভাড়া=১০০৳	3	f	\N
465	2024-09-24	Rod Mistri Helper	4	2000	2000		3	f	\N
466	2024-09-24	Miscellaneous	1	100	100	রড মিস্ত্রি যাতায়াত ভাড়া=১০০৳	3	f	\N
458	2024-09-25	Guard Salary	0	3000	3000	সেপ্টেম্বর-2024 Didar  	0	f	\N
457	2024-09-25	Raj Mistri Helper	2	1000	1000		0	f	\N
515	2024-09-25	Rod Mistri Helper	7	3700	3500	সুজন ১০০৳\nওবায়দুল ৫০৳\nরাসেল ৫০৳	2	f	\N
517	2024-09-27	Rod Mistri Helper	3	1600	1500	রাসেল ৫৫০৳\nওবায়দুল ৫৫০৳	2	f	\N
568	2024-09-29	Rod Mistri Helper	8	4100	4000	রাসেল ৫০৳\nওবায়দুল ৫০৳	2	f	\N
467	2024-09-25	Rod Mistri Head	4	2950	2000	ইউসুফ=৮০০৳,আলমগীর=৭৫০৳	3	f	\N
468	2024-09-25	Rod Mistri Helper	4	2000	2000		3	f	\N
469	2024-09-25	Miscellaneous	2	230	230	রড মিস্ত্রি যাতায়াত ভাড়া=১০০৳,ক্যাশ মেমো=১৩০৳	3	f	\N
460	2024-09-25	Raj Mistri Helper	2	1000	1000		0	f	\N
502	2024-09-21	Miscellaneous	0	380	380	ক্যাশ মেমো	1	f	\N
500	2024-09-21	Raj Mistri Head	1	700	500		1	f	\N
501	2024-09-21	Raj Mistri Helper	1	500	500		1	f	\N
503	2024-09-22	Raj Mistri Head	1	700	500		1	f	\N
504	2024-09-22	Raj Mistri Helper	1	500	500		1	f	\N
505	2024-09-23	Raj Mistri Head	1	700	500		1	f	\N
506	2024-09-23	Raj Mistri Helper	1	500	500		1	f	\N
480	2024-09-10	Maid Salary	0	2850	2850	আগস্ট 	1	f	\N
476	2024-09-10	Rod Mistri Head	1	800	500		1	f	\N
477	2024-09-10	Rod Mistri Helper	1	500	500		1	f	\N
478	2024-09-10	Raj Mistri Head	4	2800	2000		1	f	\N
479	2024-09-10	Raj Mistri Helper	2	1000	1000		1	f	\N
481	2024-09-11	Rod Mistri Head	1	800	500		1	f	\N
482	2024-09-11	Rod Mistri Helper	1	500	500		1	f	\N
483	2024-09-11	Raj Mistri Head	4	2800	2000		1	f	\N
484	2024-09-11	Raj Mistri Helper	2	1000	1000		1	f	\N
485	2024-09-11	Rod Mistri Head	0	0	2000	গাড়ি ভাড়া বাবদ =২০০০৳ Sep-24	1	f	\N
486	2024-09-11	Miscellaneous	0	500	500	নেট বিল সেপ্টেম্বর 	1	f	\N
487	2024-09-11	Miscellaneous	0	300	300	মালামাল নেওয়া ভাড়া 	1	f	\N
492	2024-09-16	Rod Mistri Head	2	1500	1000		1	f	\N
493	2024-09-16	Rod Mistri Helper	2	1000	1000		1	f	\N
494	2024-09-17	Rod Mistri Head	3	2200	1500		1	f	\N
495	2024-09-17	Rod Mistri Helper	2	1000	1000		1	f	\N
470	2024-09-09	Rod Mistri Head	4	2900	2000	লাভলু= ৮০০৳	1	f	\N
471	2024-09-09	Rod Mistri Helper	2	1000	1000		1	f	\N
472	2024-09-09	Raj Mistri Head	1	700	500		1	f	\N
474	2024-09-09	Miscellaneous	0	575	575	ক্যাশ মেমো	1	f	\N
475	2024-09-09	Miscellaneous	0	350	350	যাতায়াত ভাড়া 	1	f	\N
496	2024-09-18	Raj Mistri Head	2	1400	1000		1	f	\N
497	2024-09-18	Raj Mistri Helper	2	1000	1000		1	f	\N
507	2024-09-24	Raj Mistri Head	1	700	500		1	f	\N
508	2024-09-24	Raj Mistri Helper	1	500	500		1	f	\N
512	2024-09-26	Steel Rod Purchase	0	0	20000	MD sir Cash AValon	4	f	\N
406	2024-09-24	Miscellaneous	0	500	500	মোটরসাইকেল তেল 	0	f	\N
395	2024-09-23	Rod Mistri Head	7	4950	3500	সুরেশ ৬৫০৳\nরব্বানি ৯০০৳\nরিংকু ৭৫০৳\nমিন্টু ৭৫০৳\nজহুরুল ৭৫০৳\nশাকিল ৬০০৳\nবুলবুল ৫৫০৳	2	f	\N
523	2024-09-24	Miscellaneous	1	22400	22400	Column Steel Shutter  Buy  Farjana Enter Prise	2	f	\N
524	2024-09-17	Rod Mistri Head	0	0	1000	Rod Alamgir over  Sep-2024	3	f	\N
525	2024-09-18	Miscellaneous	1	600	600	memo no-966 Signature nai ????	3	f	\N
526	2024-09-20	Guard Salary	0	0	2000	 Guard Shahidul Aug-24	3	f	\N
528	2024-09-23	Rod Mistri Head	0	0	700	Due Khorki paid Date ullekh nai  ???	3	f	\N
527	2024-09-20	Miscellaneous	\N	0	0		3	f	\N
558	2024-09-28	Miscellaneous	0	0	0	কাজ বন্ধ 	1	f	\N
530	2024-09-28	Rod Mistri Head	7	4950	3500	সুরেশ ৬৫০৳\nরব্বানী ৯০০৳\nমিন্টু ৭৫০৳\nরিংকু ৭৫০৳\nজহুরুল ৭৫০৳\nশাকিল ৬০০৳\nবুলবুল ৫৫০৳	2	f	\N
546	2024-09-26	Guard Salary	0	1000	0	আগস্ট মাসে 	1	f	\N
549	2024-09-27	Miscellaneous	0	0	0	কাজ বন্ধ 	1	f	\N
551	2024-09-27	Miscellaneous	0	500	0	Engr. Rahinur over time SAH project 	0	f	\N
552	2024-09-27	Miscellaneous	0	0	0	SSD কাজ বন্ধ 	0	f	\N
555	2024-09-28	Miscellaneous	0	400	0	ইন্জি. মোবাইল বিল আগস্ট 	0	f	\N
559	2024-09-18	Project Deposit	0	0	0	 Friday 	5	f	\N
560	2024-09-20	Project Deposit	0	4500	4500	 MD Sir Avalon Khoraki+ Guard Salary	5	f	\N
542	2024-09-28	Project Deposit	0	23500	23800	 MdSir Rajuk Gaynmoy Chakma  Speed  Money=10000 + Asad -13500	5	f	\N
540	2024-09-26	Project Deposit	0	22000	20200	 Guard  Sayful Aug-24 1000\nGuard REf -1500	5	f	\N
565	2024-09-29	Project Deposit	0	18000	18020	MD Sir =3000 Due 620 sha Rod Mestri	5	f	\N
518	2024-09-26	Raj Mistri Head	4	2870	2000		0	f	\N
519	2024-09-26	Raj Mistri Helper	3	1500	1500		0	f	\N
543	2024-09-26	Maid Salary	0	500	500	আগস্ট 24  	0	f	\N
553	2024-09-28	Raj Mistri Head	3	2170	1500		0	f	\N
550	2024-09-27	Miscellaneous	0	100	0	ইন্জি. কনভেন্স SAH  project 	0	f	\N
554	2024-09-28	Raj Mistri Helper	3	1500	1500		0	f	\N
557	2024-09-29	Raj Mistri Helper	3	1500	1500		0	f	\N
556	2024-09-29	Raj Mistri Head	3	2170	1500		0	f	\N
561	2024-09-24	Hardware Materials	0	300	300	মটরের জন্য ২ টা তালা ক্রয়।	2	f	\N
529	2024-09-26	Miscellaneous	0	0	0	 Work Closed	2	f	\N
537	2024-09-28	Rod Mistri Helper	8	4100	4000	ওবায়দুল ৫০৳\nরাসেল ৫০৳	2	f	\N
539	2024-09-28	Miscellaneous	0	1150	1150	ক্যাশ মেমো পেরেক ২" ১০ কেজি।	2	f	\N
567	2024-09-29	Rod Mistri Head	7	4950	3500	সুরেশ ৬৫০৳\nরব্বানী ৯০০৳\nরিংকু ৭৫০৳\nমিন্টু ৭৫০৳\nজহুরুল ৭৫০৳\nশাকিল ৬০০৳\nবুলবুল ৫৫০৳	2	f	\N
532	2024-09-26	Rod Mistri Head	3	2250	1500	ইউসুফ=৮০০৳\nআলমগীর=৭৫০৳	3	f	\N
533	2024-09-26	Rod Mistri Helper	2	1000	1000		3	f	\N
535	2024-09-28	Rod Mistri Head	1	800	600	ইউসুফ=৮০০৳	3	f	\N
536	2024-09-28	Rod Mistri Helper	1	500	500		3	f	\N
538	2024-09-28	Miscellaneous	2	500	500	ইঞ্জিনিয়ার যাতায়াত ভাড়া=৪০৳\nক্যাশ মেমো =৪৬০৳\n 	3	f	\N
562	2024-09-29	Rod Mistri Head	1	800	600	ইউসুফ=৮০০৳	3	f	\N
563	2024-09-29	Rod Mistri Helper	1	500	500		3	f	\N
564	2024-09-29	Rod Mistri Head	\N	0	1000	আলমগীর মাথার টাকা সেপ্টেম্বর=১০০০৳	3	f	\N
531	2024-09-28	Rod Mistri Head	0	0	1000	আলমগীর রড মিস্ত্রি মাথার টাকা সেপ্টেম্বর =১০০০৳	3	f	\N
545	2024-08-31	Rod Mistri Head	0	0	500	রাব্বানী রড মিস্তিরি মাথার টাকা আগস্ট = ৫০০৳	0	f	\N
522	2024-09-26	Rod Mistri Helper	2	1000	1000		1	f	\N
544	2024-08-31	Raj Mistri Head	0	0	1000	মাসুদ রাজ মিস্ত্রি মাথার টাকা আগস্ট =১০০০৳ 26-9-24	0	f	\N
511	2024-09-25	Raj Mistri Head	0	0	1000	রনি রাজ মিস্ত্রি মাথার টাকা সেপ্টেম্বর =১০০০৳	0	f	\N
521	2024-09-26	Rod Mistri Head	1	800	500		1	f	\N
994	2024-10-11	Rod Mistri Head	2	1500	1000	ইউসুফ=৮০০৳	3	f	\N
548	2024-08-31	Rod Mistri Head	0	0	3000	রড মিস্তিরি মাথার টাকা আগস্ট = ৩০০০৳	1	f	\N
534	2024-08-31	Rod Mistri Head	0	0	1200	ইউসুফ রড মিস্ত্রি মাথার টাকা আগস্ট=১২০০৳	3	f	\N
541	2024-09-27	Project Deposit	0	7500	7500	 Friday  SSD, Spire and Avalon Project Work were Closed 	5	f	\N
583	2024-10-01	Rod Mistri Helper	1	500	500		0	f	\N
576	2024-09-30	Rod Mistri Helper	9	4600	4500	রাসেল ৫০৳\nওবায়দুল ৫০৳	2	f	\N
569	2024-09-29	Miscellaneous	0	1150	3000	ক্যাশ মেমো পেরেক ২" ১০ কেজি। Bill Paid 3000 tik nai  ?	2	f	\N
1024	2024-10-19	Concrete-Casting	0	21000	21000		3	f	\N
991	2024-10-10	Engineer Salary	0	3000	3000	সেপ্টেম্বর মাসের বেতন	3	f	\N
995	2024-10-11	Rod Mistri Helper	4	2000	2000		3	f	\N
1000	2024-10-12	Miscellaneous	2	250	250	পানির জগ+মগ=200৳\nLand Owner আপ্যায়ন 50৳	3	f	\N
1009	2024-10-14	Miscellaneous	0	100	100	17 টু 15 যাতায়াত ভাড়া 	3	f	\N
1008	2024-10-15	Guard Salary	0	4000	4000	সেপ্টেম্বর মাসের বেতন	3	f	\N
1011	2024-10-16	Rod Mistri Helper	5	2500	2500		3	f	\N
1013	2024-10-17	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1337	2024-10-30	Utility	0	0	3030	 SSD Desco Bill payment by Liton Bkash	6	f	\N
1349	2024-10-30	Rod Mistri Helper	7	3550	3500	মাসুদ =৫৫০৳	0	f	\N
1322	2024-10-26	Guard Salary	0	2000	2000	অক্টোবর মাসে 	0	f	\N
1354	2024-10-30	Electrician	2	1200	1200		0	f	\N
1922	2024-11-18	Steel Rod Purchase	0	0	300000	UCB SPDL SSD Project	4	f	\N
1342	2024-10-31	Rod Mistri Helper	3	1550	1500	ওবায়দুল ৫৫০৳	2	f	\N
1329	2024-10-29	Rod Mistri Helper	4	2000	2000		3	f	\N
1960	2024-11-21	Door Frame Purchase	20	156000	50000	 Mosharraf  M. H .Timber  UCB Cheque no - 1534338 Segun chowkatt rate -7800	1	f	\N
1313	2024-10-25	Rod Mistri Helper	5	2500	2500		3	f	\N
1316	2024-10-26	Rod Mistri Helper	5	2500	2500		3	f	\N
1320	2024-10-28	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1439	2024-11-03	Miscellaneous	0	0	90	 Cofee office Cost 6 Pcs Asif 	6	f	\N
1944	2024-11-20	Cement	150	75000	0	 Spire Project  150 Bag Rate=500 Tk	4	f	\N
1839	2024-11-14	Rod Mistri Head	6	4300	3000	মিন্টু =৭৫০৳,রিংকু =৭৫০৳,সুরেশ =৬৫০৳,বুলবুল =৬০০৳,জহুরুল =৭৫০৳,সোহেল =৮০০৳	0	f	\N
1457	2024-09-17	Utility	0	0	4000	Desco Bill SSD Project 	6	f	\N
1462	2024-09-19	Miscellaneous	0	0	1400	 Stamp + Map SAH Photocopy	6	f	\N
1452	2024-09-15	VAT & TAX	0	0	1580	 SPDL Vat Fee + Aug-24	6	f	\N
1441	2024-09-09	Razia Tower Cost	0	0	7380	 RT Sub Station Fan + Elc Mestry + Office A4 paper Seet 500 pcs	6	f	\N
1433	2024-11-02	Rod Mistri Helper	3	1550	1500	জুবায়েত=550৳	3	f	\N
1339	2024-10-29	Engineer Salary	0	0	5000	 paid Engineer Shakib Spire Pro 	6	f	\N
1446	2024-09-11	MD Sir Personal Cost	0	0	10000	 Dir Sir Cash Office Received 	6	f	\N
1924	2024-08-31	Rod Mistri Head	0	0	0	মাথার টাকা শাকিল=৭০০৳\nআগস্ট 	0	f	\N
1832	2024-11-15	Rod Mistri Head	3	2100	1500	আনিস ৮০০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
1937	2024-11-18	Rod Mistri Head	3	2100	1500	আনিস ৮০০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
1938	2024-11-18	Rod Mistri Helper	6	3050	3000	বাচ্চু = ৫৫০৳	2	f	\N
1920	2024-11-14	Rod Mistri Head	0	0	500	রড মিস্ত্রি ওয়াজকুরুনি গাড়ি ভাড়া (November) = 500৳	3	f	\N
1931	2024-11-19	Welder's Helper	1	500	500		0	f	\N
1946	2024-11-20	Head Welder	1	800	500		0	f	\N
1951	2024-11-20	Rod Mistri Head	5	3550	2500	সোহেল =৮০০৳,বুলবুল =৬০০৳,মিন্টু =৭৫০৳,সুরেশ =৬৫০৳,রিংকু =৭৫০৳	0	f	\N
1957	2024-11-20	Miscellaneous	0	500	500	আসাদ নাইট বিল	0	f	\N
1967	2024-11-21	Raj Mistri Head	4	2920	2000	জাহাঙ্গীর =৭৫০৳,রিয়াদ=৭৫০৳,মাসুদ =৭২০৳	0	f	\N
1972	2024-11-21	Miscellaneous	0	500	500	মোটরসাইকেল তেল 	0	f	\N
1973	2024-11-21	Rod Mistri Head	0	0	1000	রিংকু রড মিস্তিরি মাথার টাকা নভেম্বর =‌১০০০৳	0	f	\N
1961	2024-11-20	Rod Mistri Head	4	2800	2000	আনিস ৮০০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳\nআহম্মদ ৭০০৳	2	f	\N
1965	2024-11-21	Rod Mistri Head	4	2800	2000	আনিস ৮০০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳\nআহম্মদ ৭০০৳	2	f	\N
1331	2024-10-30	Rod Mistri Head	1	800	600	ইউসুফ=৮০০৳	3	f	\N
2151	2024-11-27	Project Deposit	0	0	8000	Asad avalone + Spire Khorakee	6	f	\N
2132	2024-11-26	Project Deposit	0	100000	0	MD Cash Cheque UCB	6	f	\N
2157	2024-11-27	Electrician	4	4000	4000	১০ তলা ছাদের 	0	f	\N
2172	2024-11-28	Raj Mistri Head	3	2200	1500	জাহাঙ্গীর =৭৫০৳,রিয়াদ =৭৫০৳	0	f	\N
2177	2024-11-28	Miscellaneous	0	2670	2670	ক্যাশ মেমো	0	f	\N
2140	2024-11-26	Chipping Head	1	1000	1000		3	f	\N
2145	2024-11-27	Rod Mistri Head	3	2300	1600	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
2150	2024-11-28	Chipping Head	1	1000	1000		3	f	\N
570	2024-09-29	Miscellaneous	0	100	0	সিটি করপোরেশন 	2	f	\N
572	2024-09-30	Raj Mistri Head	2	1470	1000		0	f	\N
581	2024-10-01	Raj Mistri Helper	3	1500	1500		0	f	\N
579	2024-10-01	Miscellaneous	0	250	250	স্টিল পেরেক ১০০৳\nকাটিং ব্লেড ১০টা ১৫০৳ 	2	f	\N
996	2024-10-11	Miscellaneous	0	100	100	রড মিস্ত্রি যাতায়াত ভাড়া 	3	f	\N
998	2024-10-12	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1002	2024-10-13	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1015	2024-10-17	Miscellaneous	3	15395	15395	ক্যাশ মেমো (কাঠ,বাশ,তারকাটা,সুতা)	3	f	\N
1019	2024-10-18	Rod Mistri Helper	5	2500	2500		3	f	\N
1314	2024-10-25	Miscellaneous	0	0	0	Engineer Israfil Over Time	3	f	\N
1324	2024-09-30		0	0	1000	yousuf 8-10-2024 over Tk	3	f	\N
1325	2024-09-30	Rod Mistri Head	0	0	1000	 payment date -8-10-2024 over TK. Yousuf Sep-24	3	f	\N
1336	2024-10-31	Electrician	0	0	7000	Abh Project Md. Kabir over TK Payment by Liton	6	f	\N
1351	2024-10-30	Raj Mistri Helper	6	3000	3000		0	f	\N
1345	2024-10-29	Rod Mistri Helper	3	1550	1500	ওবায়দুল ৫৫০৳	2	f	\N
1328	2024-10-29	Rod Mistri Head	2	1500	1100	ইউসুফ=৮০০৳	3	f	\N
1330	2024-10-29	Miscellaneous	2	1750	1750	সিলিন্ডার গ্যাস 1550৳\nরড মিস্ত্রি বকশিস 200৳	3	f	\N
1319	2024-10-27	Rod Mistri Helper	5	2500	2500		3	f	\N
1444	2024-09-10	Miscellaneous	0	0	540	 BRTA 2 ber Wasa off + UCb Bank Convence 	6	f	\N
1455	2024-09-15	Miscellaneous	0	0	190	 Office Biscut	6	f	\N
1460	2024-09-18	Guard Salary	0	0	11000	 Office Boy Asif Salary Month of Aug -24 RT	6	f	\N
1467	2024-09-21	Miscellaneous	0	0	515	 Office Cost Battary + Wheel + Photocopy	6	f	\N
1466	2024-09-21	Project Deposit	0	0	7000	 Asad Khorakee Cost All Project 	6	f	\N
1925	2024-07-31	Rod Mistri Head	0	0	0	মাজেদুর মাথার টাকা জুলাই=১৩০০ 	0	f	\N
1958	2024-10-31	Raj Mistri Head	0	0	0	মাসুদ মাথার টাকা =৭৫০৳	0	f	\N
1939	2024-11-19	Rod Mistri Head	3	2100	1500	আনিস ৮০০৳\nআরিফ ৬৫০৳\nসেলিম ৬৫০৳	2	f	\N
1927	2024-11-19	Raj Mistri Head	4	2920	2000	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳,রিয়াদ=৭৫০৳	0	f	\N
1932	2024-11-19	Chipping Head	1	2000	2000		0	f	\N
1947	2024-11-20	Welder's Helper	1	500	500		0	f	\N
1952	2024-11-20	Rod Mistri Helper	6	3200	3000	ওবায়দুল =৫৫০৳,মাসুদ =৫৫০৳,লাকু=৫৫০৳আশিক=৫৫০৳	0	f	\N
1968	2024-11-21	Raj Mistri Helper	4	2000	2000		0	f	\N
1974	2024-11-22	Miscellaneous	0	500	500	ইন্জি. সাফি ওভার টাইম 	0	f	\N
1962	2024-11-20	Rod Mistri Helper	5	2550	2500	বাচ্চু ৫৫০৳	2	f	\N
1966	2024-11-21	Rod Mistri Helper	3	1550	1500	বাচ্চু ৫৫০৳	2	f	\N
2133	2024-11-26	Project Deposit	0	0	35000	 Asad Cash payment office All Project Khorakee	6	f	\N
1978	2024-11-22	Rod Mistri Head	10	5200	5000	লাকু=৫৫০৳,আশিক =৫৫০৳,মাসুদ =৫৫০৳,ওবায়দুল =৫৫০৳	0	f	\N
2134	2024-11-27	Bricks Purchase	12000	130000	130000	 Mega Bricks peket 12000 pcs Rate -65000/= 6000 pcs rent at UCB Cheque no -1534348 to Bank Asia 	0	f	\N
2184	2024-11-29	Overtime Bill	0	500	0	ইন্জি.  সাফি 	0	f	\N
2193	2024-11-28	Head Welder	2	1600	1000		1	f	\N
2169	2024-11-28	Hardware Materials	0	1140	1140	ক্যাশ মেমো পেরেক ১০ কেজি,  রেত ২ টা\nমেমো নং ৭৯৫৯	2	f	\N
2162	2024-11-27	Rod Mistri Head	0	0	1000	বুলবুল রড মিস্তিরি মাথার টাকা নভেম্বর =১০০০৳	0	f	\N
2160	2024-11-27	Raj Mistri Head	0	0	1000	জাহাঙ্গীর মাথার টাকা নভেম্বর =১০০০৳	0	f	\N
2155	2024-11-27	Raj Mistri Helper	4	2000	2000		0	f	\N
2174	2024-11-28	Sanitary Mistri Head	3	1800	1800		0	f	\N
2179	2024-11-29	Rod Mistri Helper	2	1100	1000	ওবায়দুল =৫৫০৳,আশিক =৫৫০৳	0	f	\N
2201	2024-11-28	Signing Money	0	50000	50000	MD Sir Cash Waj Uddin	7	f	\N
2137	2024-11-25	Miscellaneous	0	60	60	ইন্জি. যাতায়াত ভাড়া (ড্রয়িং আনা) 	3	f	\N
2138	2024-11-26	Rod Mistri Head	4	3100	2100	ইউসুফ=850৳\nরাশেদুল=750৳\nলাভলু=800৳	3	f	\N
2143	2024-11-26	Miscellaneous	2	840	840	ক্যাশ মেমো-2	3	f	\N
2148	2024-11-28	Rod Mistri Helper	2	1000	1000		3	f	\N
2214	2024-11-30	Welder's Helper	1	500	500		0	f	\N
2219	2024-11-30	Day Labour Bill	0	3600	3600	খোয়া ভাঙা ৬ হাজার 	0	f	\N
2198	2024-11-30	Rod Mistri Helper	4	2000	2000		1	f	\N
2206	2024-12-01	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
2186	2024-11-27	Rod Mistri Helper	3	1500	1500		1	f	\N
2238	2024-12-02	Miscellaneous	0	100	100	মেশিন রিক্সা ভাড়া SSD to SAH\n	2	f	\N
2300	2024-11-16	Project Deposit	0	40000	39825		5	f	\N
574	2024-09-29	Miscellaneous	0	0	0	কাজ বন্ধ 	1	f	\N
573	2024-09-30	Raj Mistri Helper	3	1500	1500		0	f	\N
582	2024-10-01	Rod Mistri Head	2	1350	1000		0	f	\N
575	2024-09-30	Rod Mistri Head	7	4950	3500	সুরেশ ৬৫০৳\nরব্বানী ৯০০৳\nরিংকু ৭৫০৳\nমিন্টু ৭৫০৳\nজহুরুল ৭৫০৳\nশাকিল ৬০০৳\nবুলবুল ৫৫০৳	2	f	\N
1542	2024-10-16	VAT & TAX	0	0	1560	Vat Fee Sep-24	6	f	\N
1025	2024-10-19	Miscellaneous	3	2100	2100	Spire থেকে সিমেন্ট আনা =600৳\nবকশিস=500৳\nনাস্তা+খাবার=1000৳	3	f	\N
1003	2024-10-13	Rod Mistri Helper	5	2500	2500		3	f	\N
1012	2024-10-16	Miscellaneous	\N	100	100	17 টু 15 যাতায়াত ভাড়া 	3	f	\N
1014	2024-10-17	Rod Mistri Helper	5	2500	2500		3	f	\N
1350	2024-10-30	Raj Mistri Head	4	2850	2000	জাহাঙ্গীর =৭৫০৳	0	f	\N
1489	2024-11-04	Welder's Helper	1	500	500		2	f	\N
1355	2024-10-30	Miscellaneous	4	28820	28820	ক্যাশ মেমো Kazi Steel at	0	f	\N
1344	2024-10-29	Rod Mistri Head	3	2050	2000	আনিস ৭৫০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
1343	2024-10-31	Hardware Materials	0	6822	6822	মেমো নং ৭১৩৬	2	f	\N
1333	2024-10-30	Miscellaneous	0	100	100	ইন্জি. কন: =100৳	3	f	\N
1335	2024-10-31	Rod Mistri Helper	3	1500	1500		3	f	\N
1315	2024-10-26	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1318	2024-10-27	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1321	2024-10-28	Rod Mistri Helper	5	2500	2500		3	f	\N
1338	2024-10-29	Project Deposit	0	100000	50000	 Bricks Habib SAH Project + Avalon IFIC Bank Paid [ Ucb Cheque drow LitonDue total 62000 MD Sir Deposited	6	f	\N
1492	2024-09-29	Office Cost	0	0	1505	 Dir Sir Bkash	6	f	\N
1497	2024-10-01	Office Cost	0	0	90	 UCB + IBBL Convince	6	f	\N
1502	2024-11-03	Rod Mistri Helper	8	4050	4000	মাসুদ =৫৫০৳	0	f	\N
1507	2024-11-04	Raj Mistri Helper	4	2000	2000		0	f	\N
1512	2024-11-04	Miscellaneous	0	250	250	ভ্যান ভাড়া 	0	f	\N
1523	2024-10-05	Office Cost	0	0	240	 Ucb + Tea bag biscuit 	6	f	\N
1528	2024-10-08	Office Cost	0	0	2000	 Dir Sir Asif	6	f	\N
1533	2024-10-10	Office Cost	0	0	20000	 Salary Liton Sep-24 	6	f	\N
1538	2024-10-15	Engineer Salary	0	0	2000	 Eng Efath Salary oct-24 Advance -	6	f	\N
1552	2024-10-18	Razia Tower Cost	0	0	2400	Rt Lift Magnetic Contact + Razib 	6	f	\N
1564	2024-09-26	Razia Tower Cost	0	0	2000	RT Lift Service Bill Sep-24	6	f	\N
1567	2024-10-20	Office Cost	0	0	1500	 net bill Oct-24	6	f	\N
1516	2024-11-05	Welder's Helper	1	750	500	রাতে হাফ হাজিরা কাজ করেছে।	2	f	\N
1576	2024-10-28	Office Cost	0	0	270	Sugar+ Teabag+ Biscuit 	6	f	\N
1577	2024-11-05	Office Cost	0	0	1640	 Brte Car late fine 21-6757 fitness fee + Teabag tiso + BRTA Convince Lunch	6	f	\N
1550	2024-09-07	Project Deposit	0	225516	0	7-9-2024 RT Previous Balance Deposited	6	f	\N
1469	2024-09-22	MD Sir Personal Cost	0	0	83200	 Dir Sir North South University Fee Paid by Liton Pizza Burg Desco Bill	6	f	\N
1580	2024-10-17	Office Cost	0	0	280	printer 120 perper	6	f	\N
1474	2024-11-04	Raj Mistri Helper	4	2000	2000		1	f	\N
1559	2024-11-06	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
1471	2024-11-04	Rod Mistri Helper	4	2000	2000		1	f	\N
1591	2024-11-02	Guard Salary	0	0	5000	 Guard Salary Oct-24	3	f	\N
1554	2024-11-04	Guard Salary	\N	2000	2000	লালমিয়া বেতন oct- ২০২৪। \nAsad 	1	f	\N
1519	2024-10-31	Rod Mistri Head	0	0	600	over Tk Suresh Oct-24 date-3-11-24	0	f	\N
1586	2024-11-05	Electrician	2	1200	1200		0	f	\N
1547	2024-10-17	Electric Items Purchase	0	0	28500	 Spire+ Avalon + SSD Pipe + Pana Light +Bill Shukhi Elecric Shop  AvalonNet Cable at	6	f	\N
1943	2024-11-20	Steel Rod Purchase	7000	616000	0	 SSD Project 10 ml =6000kg + 12 Ml  500Kg + 16 Ml=  500Kg = 7 ton Per Kg = 88 TK.	4	f	\N
1941	2024-11-18	Guard Salary	0	1000	1000	অক্টোবর মাসের বেতন ১০০০৳ paid	2	f	\N
1940	2024-11-19	Rod Mistri Helper	5	2550	2500	বাচ্চু =৫৫০৳	2	f	\N
1928	2024-11-19	Raj Mistri Helper	6	3000	3000		0	f	\N
1933	2024-11-19	Electrician	1	600	600		0	f	\N
1949	2024-11-20	Raj Mistri Head	3	2220	1500	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳,রিয়াদ=৭৫০৳	0	f	\N
1954	2024-11-20	Miscellaneous	0	300	300	নাস্তা বাবদ রড মিস্তি	0	f	\N
1955	2024-11-20	Rod Mistri Head	0	0	500	মিন্টু রড মিস্তিরি মাথার টাকা নভেম্বর =৫০০৳	0	f	\N
1977	2024-11-22	Rod Mistri Head	6	4250	3000	একই মিস্তিরি 	0	f	\N
1964	2024-11-21	Hardware Materials	2	3235	3235	ক্যাশমেমো ২টা \nনং ৭৫৪৩ ও ৬৭১৫	2	f	\N
2136	2024-11-25	Rod Mistri Helper	2	1000	1000		3	f	\N
577	2024-10-01	Rod Mistri Head	3	2300	1500	সুরেশ ৬৫০৳\nরব্বানী ৯০০৳\nজহুরুল ৭৫০৳	2	f	\N
1021	2024-10-18	Miscellaneous	0	0	0	Engineer Israfil Over Time	3	f	\N
1022	2024-10-19	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1023	2024-10-19	Rod Mistri Helper	5	2500	2500		3	f	\N
1005	2024-10-14	Rod Mistri Helper	5	2500	2500		3	f	\N
1007	2024-10-15	Rod Mistri Helper	5	2500	2500		3	f	\N
1010	2024-10-16	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1017	2024-10-16	Miscellaneous	0	980	980	ক্যাশ মেমো (কালা পাইপ) 	3	f	\N
1326	2024-09-30	Rod Mistri Head	0	0	1440	Alamgir over Sep-24 Date -12-10-2024	3	f	\N
1327	2024-09-30	Rod Mistri Head	0	0	1000	Jahangir Over TK Sep-24 Date -14-10-24	0	f	\N
1352	2024-10-30	Head Welder	1	800	500		0	f	\N
1346	2024-10-30	Rod Mistri Head	4	2750	2000	আনিস ৭৫০৳\nআরিফ ৬৫০৳\nসেলিম ৬৫০৳\nমাহফুজ ৭০০৳	2	f	\N
1317	2024-10-26	Hardware Materials	1	805	805	ক্যাশ মেমো	3	f	\N
1479	2024-09-25	Office Cost	0	0	440	 Teabag + Sugar + Hand Wash + Lemon + Nasta bil	6	f	\N
1481	2024-11-04	Project Deposit	0	100000	0	 UCB IMp Cheque no - 1879028	6	f	\N
1483	2024-11-04	Hardware Materials	0	0	10000	 Asad Khorakee + Hardwere Goods UCb Cash	6	f	\N
1491	2024-09-29	Utility	0	0	5576	 Avalon Desco Bill  Aug-24	6	f	\N
1493	2024-09-30	Utility	0	0	20189	 SSD Wash Bill Aug-24	6	f	\N
1498	2024-10-01	Utility	0	0	4300	 SSD + SAh Project Desco  Bill Bkash	6	f	\N
1499	2024-11-03	Raj Mistri Head	5	3570	2500	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳	0	f	\N
1503	2024-11-03	Electrician	2	1200	1200		0	f	\N
1508	2024-11-04	Raj Mistri Head	6	4270	3000	মাসুদ =৭২০৳,জাহাঙ্গীর =৭৫০৳	0	f	\N
1520	2024-10-02	Office Cost	0	0	130	  biscut + Ginger	6	f	\N
1522	2024-10-04	Utility	0	0	3000	SSD Desco Bill	6	f	\N
1527	2024-10-07	Miscellaneous	0	0	10000	 Asad Tongi Bazar	6	f	\N
1539	2024-10-15	Engineer Salary	0	0	16000	 Eng Rahinur Salary  Sep-24 Over Time at	6	f	\N
1541	2024-10-15	Office Cost	0	0	150		6	f	\N
1551	2024-10-18	Electric Items Purchase	0	0	20800	 SAH Pipe Shukhi Elecrice shop Masud Rana	6	f	\N
1566	2024-10-20	Razia Tower Cost	0	0	700	 Electric Mestry Reeday	6	f	\N
1568	2024-10-20	MD Sir Personal Cost	0	0	200	 Dir Sir Breakfast Asif 	6	f	\N
1570	2024-10-21	Office Cost	0	0	1550	 Md Sir Pc Router Receiver + lemon+ Ginger Cost	6	f	\N
1578	2024-11-05	Office Cost	0	0	2500	Boa Salary oct-24	6	f	\N
1581	2024-10-13	Razia Tower Cost	0	0	4500	 Sub Station oil 23 Ltr	6	f	\N
1588	2024-11-05	Cement	100	50000	0	Spire Cement 100 Bag Rate -500	4	f	\N
1470	2024-11-04	Rod Mistri Head	2	1400	1000	কাসেম ৭০০৳\nরাসেল ৭০০৳	1	f	\N
1555	2024-11-05	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
1429	2024-11-01	Rod Mistri Head	2	1600	1100	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
1582	2024-11-05	Rod Mistri Head	6	4450	3000	মিন্টু =৭৫০৳,বুলবুল =৬০০৳,রাব্বানী =৯০০৳,সুরেশ =৬৫০৳,সোহেল =৮০০৳,জহরুল- ৭৫০৳	0	f	\N
1514	2024-11-05	Rod Mistri Helper	6	3000	3000		2	f	\N
1560	2024-11-06	Rod Mistri Helper	5	2500	2500		1	f	\N
1565	2024-11-06	Miscellaneous	0	500	500	নেট বলি (নভেম্বর ২০২৪) paid by Liton  Bkash	1	f	\N
1518	2024-10-31	Rod Mistri Head	0	0	4100	 over tk  Rabbin October -24 paymaent Date-3-11-24	0	f	\N
1589	2024-08-29	Razia Tower Cost	0	0	4100	 Sub Station Desco Braket + Sut Down Fee date-27-8-24 	6	f	\N
1334	2024-10-31	Rod Mistri Head	1	800	600	ইউসুফ=৮০০৳	3	f	\N
1016	2024-10-17	Day Labour Bill	3	4470	4470	ইঞ্জিনিয়ারের অফিস থেকে ড্রয়িং আনা 120৳\n6 হাজার ইট ভাঙ্গানো 3600৳\n3 পিস হ্যান্ডেল বানানো 750৳	3	f	\N
1532	2024-10-10	Razia Tower Cost	0	0	1450	 Lift Papus  Tongi	6	f	\N
1956	2024-11-20	Miscellaneous	0	700	0	রড আনলোড 	0	f	\N
1929	2024-11-19	Sanitary Mistri Head	5	3000	3000		0	f	\N
1934	2024-11-19	Steel Rod Purchase	0	61600	61600	১০ মি.মি. স্কয়ার বার Kazi Steet Shop Rate 90.50 tk . 655 Kg 	0	f	\N
1945	2024-11-20	Chipping Head	1	2000	2000		0	f	\N
1950	2024-11-20	Raj Mistri Helper	3	1500	1500		0	f	\N
2142	2024-11-26	Cement	150	75000	0	AValon Project Cement 150 Bag  Rate -500	4	f	\N
2164	2024-11-27	Office Cost	0	0	240	 MD Sir Picture + pen + marker pen	6	f	\N
2159	2024-11-27	Miscellaneous	2	535	535	ক্যাশ মেমো	0	f	\N
2173	2024-11-28	Raj Mistri Helper	3	1500	1500		0	f	\N
2178	2024-11-29	Rod Mistri Head	1	750	500		0	f	\N
2147	2024-11-28	Rod Mistri Head	1	850	600	ইউসুফ=৮৫০৳	3	f	\N
2183	2024-11-29	Electrician	4	4000	4000	১০ তলা ছাদের   ?????	0	f	\N
1027	2024-10-18	Welder's Helper	1	500	500		1	f	\N
606	2024-10-02	Miscellaneous	0	0	0	কাজ বন্ধ 	1	f	\N
566	2024-09-30	Project Deposit	0	13500	13500	 Raj Khoraki due-500 SSD	5	f	\N
456	2024-09-25	Raj Mistri Head	2	1470	1000		0	f	\N
520	2024-09-26	Miscellaneous	0	100	100	খাতা কেনা	0	f	\N
580	2024-10-01	Raj Mistri Head	1	750	1000		0	f	\N
584	2024-10-01	Miscellaneous	2	1580	1580	ক্যাশ মেমো	0	f	\N
514	2024-09-25	Rod Mistri Head	7	4950	3500	সুরেশ ৬৫০৳\nরব্বানী ৯০০৳\nরিংকু ৭৫০৳\nমিন্টু ৭৫০৳\nজহুরুল ৭৫০৳\nশাকিল ৬০০৳\nবুলবুল ৫৫০৳	2	f	\N
516	2024-09-27	Rod Mistri Head	7	4950	3500	সুরেশ ৬৫০৳\nরব্বানী ৯০০৳\nরিংকু ৭৫০৳\nমিন্টু ৭৫০৳\nজহুরুল ৭৫০৳\nশাকিল ৬০০৳\nবুলবুল ৫৫০৳	2	f	\N
578	2024-10-01	Rod Mistri Helper	6	3100	3000	রাসেল ৫০৳\nওবায়দুল ৫০৳	2	f	\N
613	2024-10-01	Guard Salary	0	2000	2000	 September-24	2	f	\N
614	2024-09-26	Guard Salary	0	4000	4000	 Aug-24 Shahid	3	f	\N
617	2024-10-02	Miscellaneous	0	50	0	ভ্যান ভাড়া	0	f	\N
618	2024-10-02	Am Kat	0	1458	0		0	f	\N
1028	2024-10-18	Miscellaneous	0	200	200	যাতায়াত ভাড়া 	1	f	\N
607	2024-10-02	Rod Mistri Head	2	1350	1000		0	f	\N
591	2024-08-31	Rod Mistri Head	0	0	3000	মিন্টু রড মিস্তিরি মাথার টাকা আগস্ট =৩০০০৳ 1-10-2024	0	f	\N
596	2024-08-31	Rod Mistri Head	0	0	500	মাজেদুর রড মিস্তিরি মাথার টাকা আগস্ট = ৫০০৳01-10-2024	0	f	\N
593	2024-08-31	Rod Mistri Head	0	0	2000	শাকিল -২ রড মিস্তিরি মাথার টাকা আগস্ট =২০০০৳	0	f	\N
594	2024-08-31	Rod Mistri Head	0	0	3000	জহরুল রড মিস্তিরি মাথার টাকা আগস্ট = ৩০০০৳ 01-10-2024	0	f	\N
595	2024-08-31	Rod Mistri Helper	0	0	1000	ওবায়দুল রড হেলপার মাথার টাকা জুন-জুলাই, আগস্ট = ১০০০৳ 01-10-24	0	f	\N
592	2024-08-31	Rod Mistri Head	0	0	3000	সুরেশ রড মিস্তিরি মাথার টাকা জুন-জুলাই 1-10-2024 =১৭০০৳ \nআগস্ট =১৩০০৳ 1-10-2024	0	f	\N
597	2024-08-31	Rod Mistri Head	0	0	5000	রাব্বানী রড মিস্তিরি মাথার টাকা আগস্ট = ৫০০০৳1-10-24	0	f	\N
622	2024-08-31	Rod Mistri Head	0	0	3750	রিংকু মাথার টাকা আগস্ট = ৩৭৫০৳ 3-10-2024	0	f	\N
623	2024-08-31	Rod Mistri Head	0	0	2000	মিন্টু মাথার টাকা আগস্ট =২০০০৳ 3-10-24	0	f	\N
624	2024-08-31	Rod Mistri Head	0	0	600	শাকিল মাথার টাকা আগস্ট =৬০০৳ 3-10-2024	0	f	\N
625	2024-08-31	Raj Mistri Head	0	0	2000	মাসুদ মাথার টাকা আগস্ট = ২০০০৳ 3-10-2024	0	f	\N
626	2024-08-31	Raj Mistri Head	0	0	4250	জাহাঙ্গীর মাথার টাকা আগস্ট =৪২৫০৳ 3-10-2024	0	f	\N
627	2024-08-31	Rod Mistri Helper	0	0	200	ওবায়দুল মাথার টাকা আগস্ট = ২০০৳3-10-2024	0	f	\N
608	2024-10-02	Rod Mistri Helper	2	1000	1000		0	f	\N
586	2024-09-30	Miscellaneous	0	500	500	নেট বিল 	1	f	\N
609	2024-10-02	Raj Mistri Head	2	1450	1000		0	f	\N
610	2024-10-02	Raj Mistri Helper	2	1000	1000		0	f	\N
616	2024-10-02	Miscellaneous	2	1000	1000	ব্যানার বানার কাজ কাট মিস্তি	0	f	\N
590	2024-09-30	Raj Mistri Head	0	0	500	মিরাজ আলী গাড়ি ভাড়া =৫০০৳ sep-24 1-10-24	0	f	\N
619	2024-10-03	Rod Mistri Head	1	750	500		0	f	\N
620	2024-10-03	Rod Mistri Helper	2	1050	1000	ওবায়দুল =৫৫০৳	0	f	\N
602	2024-10-02	Rod Mistri Helper	5	2600	2500	রাসেল ৫০৳\nওবায়দুল ৫০৳	2	f	\N
603	2024-10-02	Miscellaneous	0	500	500	SSD to SAH ভ্যান ভাড়া	2	f	\N
604	2024-10-02	Electric Items Purchase	2	1915	1915	২ টা ক্যাশ মেমো ১১২৫+৭৯০/= \nবৈদ্যুতিক সরঞ্জাম ও তার কাটা ৫ কেজি।	2	f	\N
605	2024-10-02	Electrician	2	1000	1000	বিদ্যুৎ এর লাইনগুলো নিচে ফিটিং করা হয়েছে। 	2	f	\N
611	2024-10-04	Rod Mistri Head	1	750	500	জহুরুল ৭৫০৳	2	f	\N
612	2024-10-04	Rod Mistri Helper	2	1000	1000		2	f	\N
587	2024-10-01	Guard Salary	0	3000	3000	সেপ্টেম্বর মাস	1	f	\N
615	2024-10-02	Miscellaneous	0	32820	32820	ক্যাশ মেমো ১০mm স্কয়ার বার	1	f	\N
598	2024-07-31	Rod Mistri Head	0	0	2000	আজাদ রড মিস্তিরি মাথার টাকা জুলাই = ২০০০৳ 1-10-2024	0	f	\N
585	2024-09-30	Rod Mistri Head	0	0	1000		1	f	\N
628	2024-08-31	Rod Mistri Helper	0	0	1000	সুজন মাথার টাকা আগস্ট =১০০০৳ 3-10-2024	0	f	\N
638	2024-10-04	Guard Salary	0	5000	5000	সেপ্টেম্বর মাস	0	f	\N
633	2024-10-04	Raj Mistri Head	3	2170	1500	জাহাঙ্গীর =৭৫০,মাসুদ =৭২০৳	0	f	\N
657	2024-10-05	Rod Mistri Head	5	3450	3000	রিংকু =৭৫০৳, মিন্টু =৭৫০৳,বুলবুল =৬০০৳, সুরেশ =৬৫০৳	0	f	\N
661	2024-10-05	Maid Salary	0	500	500	আগস্ট মাসে 	0	f	\N
642	2024-10-04	Rod Mistri Head	2	1350	1000	রিংকু =৭৫০৳, শাকিল =৬০০৳	1	f	\N
654	2024-10-01	Miscellaneous	1	100	100	রড মিস্ত্রি যাতায়াত ভাড়া 	3	f	\N
1029	2024-10-18	Miscellaneous	0	400	0	Engr. Efath Moben Over time 	1	f	\N
1043	2024-10-21	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
993	2024-10-22	Cement	0	0	50000	UCB SPDL Cheque no 1509667 SSD Project	4	f	\N
1031	2024-10-19	Rod Mistri Head	2	1400	1000	কাসেম =৭০০৳\nরাসেল =৭০০৳	1	f	\N
1032	2024-10-19	Rod Mistri Helper	6	3000	3000		1	f	\N
1030	2024-10-18	Chipping Head	1	1000	1000	সাহেব আলী 	1	f	\N
1348	2024-10-30	Rod Mistri Head	6	4450	3000	রাব্বানী =৯০০৳,সোহেল =৮০০৳,জহরুল- ৭৫০৳,সুরেশ =৬৫০৳,রিংকু =৭৫০৳,বুলবুল =৬০০৳	0	f	\N
1034	2024-10-19	Welder's Helper	2	1000	1000		1	f	\N
1035	2024-10-19	Miscellaneous	0	120	120	যাতায়াত ভাড়া 	1	f	\N
1036	2024-10-20	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
1037	2024-10-20	Rod Mistri Helper	6	3000	3000		1	f	\N
1038	2024-10-20	Raj Mistri Head	1	700	500	সালাম ৭০০৳	1	f	\N
1039	2024-10-20	Raj Mistri Helper	2	1000	1000		1	f	\N
1347	2024-10-30	Rod Mistri Helper	2	1050	1000	ওবায়দুল ৫৫০৳	2	f	\N
1044	2024-10-21	Rod Mistri Helper	6	3000	3000		1	f	\N
1041	2024-10-20	Welder's Helper	1	500	500		1	f	\N
1045	2024-10-21	Raj Mistri Head	1	700	500	সালাম ৭০০৳	1	f	\N
1046	2024-10-21	Raj Mistri Helper	2	1000	1000		1	f	\N
1047	2024-10-21	Day Labour Bill	0	5750	5750	পাথর,বালু,সিমেন্ট উঠানো ছয় তালা ২৩০ বস্তা 	1	f	\N
1048	2024-10-22	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
1049	2024-10-22	Rod Mistri Helper	7	3500	3500		1	f	\N
1050	2024-10-22	Raj Mistri Head	1	700	500	সালাম ৭০০৳	1	f	\N
1051	2024-10-22	Raj Mistri Helper	1	500	500		1	f	\N
1052	2024-10-22	Miscellaneous	0	1145	1145	ক্যাশ মেমো ১১৪৫৳	1	f	\N
1059	2024-10-21	Rod Mistri Head	8	5800	4000	জহরুল- ৭৫০৳, সুরেশ = ৬৫০৳, বুলবুল =৬০০৳,মিন্টু =৭৫০৳, সাকিল=৬০০৳, রাব্বানী =৯০০৳,সোহেল২-৮০০৳, রিংকু =৭৫০৳ 	0	f	\N
1064	2024-10-21	Electrician	2	1200	1200		0	f	\N
1066	2024-10-22	Raj Mistri Head	6	4270	3000	জাহাঙ্গীর =৭৫০৳, মাসুদ =৭২০৳	0	f	\N
1341	2024-10-31	Rod Mistri Head	3	2050	2000	আনিস ৭৫০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
1053	2024-10-23	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
1054	2024-10-23	Rod Mistri Helper	6	3000	3000		1	f	\N
1055	2024-10-23	Raj Mistri Head	1	700	500	সালাম ৭০০৳	1	f	\N
1056	2024-10-23	Raj Mistri Helper	2	1000	1000		1	f	\N
1057	2024-10-23	Chipping Head	1	1000	1000	সাহেব আলী 	1	f	\N
1058	2024-10-23	Miscellaneous	0	300	300	যাতায়াত ভাড়া 	1	f	\N
1033	2024-10-19	Head Welder	1	800	500	আল আমিন ৮০০৳	1	f	\N
1040	2024-10-20	Head Welder	1	800	500	আল আমিন ৮০০৳	1	f	\N
1071	2024-10-22	Head Welder	1	800	500		0	f	\N
1340	2024-10-30	Miscellaneous	0	0	940	 A4 paper + landowner + Dir Sir lunch cost 	6	f	\N
1353	2024-10-30	Welder's Helper	1	500	500		0	f	\N
1332	2024-10-30	Rod Mistri Helper	4	2000	2000		3	f	\N
1477	2024-09-22	Engineer Salary	0	0	3000	Spire Eng Shakib Salary-Aug-24	6	f	\N
1494	2024-09-30	Utility	0	0	5047	Avalon Wasa Bill Aug-24	6	f	\N
1504	2024-11-03	Chipping Head	1	1000	1000		0	f	\N
1524	2024-10-06	Office Cost	0	0	2500	 Boa Salary Office Cleaner Sep-24	6	f	\N
1529	2024-10-08	Engineer Salary	0	0	10000	Engineer Shakib Salary Aug-24	6	f	\N
1486	2024-11-04	Rod Mistri Head	3	2050	1500	আনিস ৭৫০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
667	2024-10-03	Steel Rod Purchase	0	0	100000	UCB Impereale  no- 1879026 Spire	4	f	\N
1042	2024-10-20	Hardware Materials	0	480	480	ওয়ালিং রড ১ প্যাকেট ৪৮০৳	1	f	\N
1515	2024-11-05	Head Welder	1	1200	500	রাতে হাফ হাজিরা কাজ করেছে। ???	2	f	\N
664	2024-09-18	Steel Rod Purchase	0	38544	0	 412 KG  Avalone 	4	f	\N
668	2024-10-03	Steel Rod Purchase	0	457500	0	 Spire Project  5 Ton GPH Rate- 91.50	4	f	\N
669	2024-10-04	Steel Rod Purchase	0	744560	0	 SAH Project - 8200 KG  Rate -90.80	4	f	\N
621	2024-08-31	Rod Mistri Head	0	0	3050	সুরেশ মাথার টাকা আগস্ট =৩০৫০৳ 03-10-2024	0	f	\N
588	2024-08-31	Raj Mistri Head	0	0	2000	মাসুদ রাজ মিস্ত্রি মাথার টাকা আগস্ট =২০০০৳ 01-10-2024	0	f	\N
629	2024-07-31	Rod Mistri Head	0	0	800	মুশত্তাক মাথার টাকা জুলাই=৮০০৳ 3-10-2024	0	f	\N
630	2024-08-31	Rod Mistri Head	0	0	2600	রবিউল মাথার টাকা জুলাই আগস্ট =২৬০০৳  1-10-2024	0	f	\N
634	2024-10-04	Raj Mistri Helper	3	1500	1500		0	f	\N
635	2024-10-04	Miscellaneous	0	1150	1150	ক্যাশ মেমো	0	f	\N
658	2024-10-05	Rod Mistri Helper	6	3050	3000	ওবায়দুল =৫৫০৳	0	f	\N
659	2024-10-05	Raj Mistri Head	3	2170	1500	জাহাঙ্গীর =৭৫০৳, মাসুদ =৭২০৳	0	f	\N
660	2024-10-05	Raj Mistri Helper	3	1500	1500		0	f	\N
662	2024-10-05	Miscellaneous	0	500	500	মোটরসাইকেল তেল 	0	f	\N
1531	2024-10-09	Office Cost	0	0	490	 Scarlet + Tuli Mam IFIC Bank + Frezze	6	f	\N
663	2024-10-05	Miscellaneous	0	500	500	আসাদ শুক্রবার ডিউটি  End of Month Last  Receive  neete hobee ....	0	f	\N
651	2024-10-05	Rod Mistri Head	1	750	500	জহুরুল ৭৫০৳	2	f	\N
652	2024-10-05	Raj Mistri Helper	2	1000	1000		2	f	\N
647	2024-10-05	Rod Mistri Helper	5	2500	2500		1	f	\N
646	2024-10-05	Rod Mistri Head	4	2900	2000	(রাসেল(700),সোহেল(700),রব্বানী(900),শাকিল(600) 	1	f	\N
643	2024-10-04	Rod Mistri Helper	5	2000	2000		1	f	\N
644	2024-10-04	Miscellaneous	0	140	140	যাতায়াত ভাড়া 	1	f	\N
649	2024-10-04	Miscellaneous	0	4125	4125	ক্যাশ মেমো	1	f	\N
656	2024-10-05	Electrician	1	500	500		3	f	\N
676	2024-10-05	Project Deposit	0	30000	28425		5	f	\N
675	2024-10-04	Project Deposit	0	25000	24190		5	f	\N
672	2024-10-01	Project Deposit	0	44000	43680		5	f	\N
1060	2024-10-21	Rod Mistri Helper	9	4550	4500	ওবায়দুল =৫৫০৳	0	f	\N
1065	2024-10-21	Maid Salary	0	2000	2000	সেপ্টেম্বর মাস	0	f	\N
1067	2024-10-22	Raj Mistri Helper	7	3500	3500		0	f	\N
1072	2024-10-22	Miscellaneous	0	500	500	মোটরসাইকেল তেল 	0	f	\N
1472	2024-09-11	Project Deposit	0	100528	0	 Pizza Burg Desco Bill Aug-24	6	f	\N
1475	2024-10-13	Project Deposit	0	120064	0	 Pizza Burg Desco Bill Sep-24	6	f	\N
1478	2024-09-24	Am Kat	0	0	10000	 Spire Pro + Ava Pro Md. Sherajul Islam Cash Office 	6	f	\N
1484	2024-11-04	Steel Rod Purchase	0	0	500000	UCB IMp Cheque no-1879031 SSD PRoject 	4	f	\N
1490	2024-09-26	Office Cost	0	0	390	 biscut+ Teso  + Brta Convince	6	f	\N
1496	2024-10-01	Office Cost	0	0	900	 Car 21-6757 Sticker Fee 	6	f	\N
1501	2024-11-03	Rod Mistri Head	5	3550	2500	জহরুল-৭৫০৳,সোহেল =৮০০৳,সুরেশ =৬৫০৳,বুলবুল =৬০০৳,রিংকু =৭৫০৳	0	f	\N
1506	2024-11-03	Guard Salary	\N	4000	4000	অক্টোবর মাসে 	0	f	\N
1521	2024-10-03	Office Cost	0	0	1880	Rehab + Brta + Registry Off + Food Bill + Ober rent Ali Emran Deed	6	f	\N
1526	2024-10-07	Office Cost	0	0	670	Fit Cary + Rok Floor  + Bricksol + teso+ Azampur + Bank 	6	f	\N
1535	2024-10-12	Utility	0	0	5050	 SSD + SAH Desco Bill 3030+2020	6	f	\N
1540	2024-10-15	Engineer Salary	0	0	12700	 Eng Bijoy Salary Sep-24 over time at	6	f	\N
1574	2024-10-24	Office Cost	0	0	1555	Stamp + Coffee Dir Sir	6	f	\N
1546	2024-08-28	Project Deposit	0	49596	0	 Finno Restaurant  Desco Bill July-24	6	f	\N
1563	2024-09-26	Office Cost	0	0	1500	 Net Bill Sep-24	6	f	\N
1572	2024-10-22	Guard Salary	0	0	3005	 SAH Guard Rabiul Salary Oct-24	6	f	\N
1573	2024-10-23	MD Sir Personal Cost	0	0	4155	Car 21-6757 Blue Book Fee -2785 + Speed Money -1000+ Lunch+ Convince 370	6	f	\N
1587	2024-10-05	Steel Rod Purchase	0	581750	0	 SSD Project  Gph 10 ml  1000 KG + 16 Ml = 3000kg + 20 Ml =2500 Kg  = Total =6500 Kg Rate -89.50 Per kG	4	f	\N
1590	2024-11-06	Bricks Purchase	6000	69000	80000	MD Sir Cash IFIC Bank Full Paid SPire +  Avalon 	1	f	\N
1557	2024-11-05	Raj Mistri Head	3	2100	1500	সালাম ৭০০৳\nসাগর ৭০০৳\nআলমগীর ৭০০৳	1	f	\N
1959	2024-08-31	Rod Mistri Head	0	0	0	আজাদ রড মিস্তিরি মাথার টাকা আগস্ট=৩০০০৳	0	f	\N
1584	2024-11-05	Raj Mistri Head	5	3520	2500	মাসুদ  =৭২০৳	0	f	\N
1488	2024-11-04	Head Welder	1	800	500	আল-আমীন ৮০০৳	2	f	\N
1513	2024-11-05	Rod Mistri Head	3	2050	1500	আনিস ৭৫০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
1562	2024-11-06	Raj Mistri Helper	3	1500	1500		1	f	\N
1511	2024-11-04	Electrician	2	1200	1200		0	f	\N
665	2024-10-01	Steel Rod Purchase	0	0	100000	IBBL  Cheque  Spire	4	f	\N
645	2024-10-04	Miscellaneous	0	0	0	Engr. Efath over time 	1	f	\N
670	2024-10-04	Steel Rod Purchase	0	76500	0	 Cement 150 Bag Rate-510 TK Per Bag SAH	4	f	\N
1963	2024-11-21	Steel Rod Purchase	0	0	350000	SSD Project  Rod + Cement Bill UCb Cheque no -1534339 100000/= + SSD Client Shahjahan IFIC cheque -no 0157617 = 250000/= Date payment -24-11-2024	4	f	\N
631	2024-10-04	Rod Mistri Head	4	2900	2000	রাব্বানী =৯০০৳, মিন্টু =৭৫০৳, সুরেশ =৬৫০৳, বুলবুল =৬০০৳	0	f	\N
636	2024-10-04	Miscellaneous	0	100	100	সিমেন্ট আনলোড বকশিস 	0	f	\N
648	2024-10-05	Miscellaneous	0	120	0	ক্যাশ মেমো Remark Liton	1	f	\N
640	2024-10-03	Rod Mistri Head	1	700	500		1	f	\N
673	2024-10-02	Project Deposit	0	85000	82270	 Liton From Office  Asad Salary =20000 Aug-24	5	f	\N
1061	2024-10-21	Raj Mistri Head	5	3570	3500	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳	0	f	\N
1068	2024-10-22	Rod Mistri Head	9	6500	4500		0	f	\N
1073	2024-10-22	Miscellaneous	3	4055	4055	ক্যাশ মেমো	0	f	\N
1026	2024-10-18	Head Welder	1	800	500	আল আমিন ৮০০৳	1	f	\N
1476	2024-09-22	Utility	0	0	4010	 Spire  Desco Bill Aug-24	6	f	\N
1480	2024-09-25	Lift + Generator / Substation	0	0	1000	 ABH Razib Switch buy	6	f	\N
1482	2024-11-04	Bricks Purchase	0	0	50000	 Bricks Habib Avalone Pro UCb Imp to IFIc Deposited Due =12000	6	f	\N
1485	2024-11-04	Steel Rod Purchase	0	0	100000	UCB Cheque no -1509678 SSD Project dwow Date 05-11-2024	4	f	\N
1495	2024-09-30	Office Cost	0	0	180	  Dir Sir Nasta + Bank Convince	6	f	\N
1500	2024-11-03	Raj Mistri Helper	7	3500	3500		0	f	\N
1505	2024-11-03	Engineer Salary	0	2000	2000	ইন্জিনিয়ার সাফি oct-24	0	f	\N
1525	2024-10-07	Lift + Generator / Substation	0	0	3620	ABH Lift Cabin Desplay+ Light + Oil kerasin	6	f	\N
1530	2024-10-09	Sign Board	0	0	8676	 SAH Steacker + SSD Pvc Scarlet 	6	f	\N
1536	2024-10-14	Staff Salary	0	0	18000	 Salary Emam Hasan Sep-24 Paid 	6	f	\N
1544	2024-10-06	Sign Board	0	0	1500	  SAH Pro Scarlet Banner Steacker labour Charge  Bkash payment	6	f	\N
1545	2024-10-17	Office Cost	0	0	18500	 Printer Brother DCP T 420 W Time Technolgy	6	f	\N
1553	2024-09-09	Steel Rod Purchase	0	0	100000	 M/S Yeasin Cash RT Service Bill From Paid By Liton Office	6	f	\N
1575	2024-10-24	Razia Tower Cost	0	0	2000	 RT Road Parking Guard Edris Ali Salary -2000 Oct-24	6	f	\N
1473	2024-11-04	Raj Mistri Head	3	2100	1500	সালাম ৭০০৳\nসাগর ৭০০৳\nআলমগীর ৭০০৳	1	f	\N
1558	2024-11-05	Raj Mistri Helper	4	2000	2000		1	f	\N
1510	2024-11-04	Rod Mistri Head	6	4400	3000	জহরুল- ৭৫০৳,বুলবুল ৬০০৳,রাব্বানী ৯০০৳,সোহেল =৮০০৳,সুরেশ =৬০০৳,রিংকু =৭৫০৳	0	f	\N
1585	2024-11-05	Raj Mistri Helper	6	3000	3000		0	f	\N
1487	2024-11-04	Rod Mistri Helper	4	2000	2000		2	f	\N
1517	2024-11-05	Miscellaneous	0	200	200	খাতা ৩ টা ক্রয় করা হয়েছে 	2	f	\N
1548	2024-10-17	MD Sir Personal Cost	0	0	4000	Dir Sir Car North pool boy Payment office 	6	f	\N
1970	2024-11-21	Rod Mistri Helper	7	3700	3500	ওবায়দুল =৫৫০৳,আশিক =৫৫০৳,মাসুদ =৫৫০৳,লাকু=৫৫০৳	0	f	\N
1976	2024-11-22	Raj Mistri Helper	2	1000	1000		0	f	\N
1936	2024-10-31	Rod Mistri Head	0	0	0	রড মিস্ত্রি অক্টোবর মাসের মাথার টাকা = 15875৳\n\n১/ রব্বানী =২৩৫০৳\n২/ জহুরুল = ৩৩৭৫৳\n৩/ বুলবুল = ২০০৳\n৪/ সুরেশ = ৩০০৳\n৫/ রিংকু = ২৫০৳\n৬/ শকিল২ = ৪০০৳\n৭/ সোহেল১ = ১৪৫০৳\n৮/ সোহেল২ = ১৭৫০৳\n৯/ ওবায়দুল = ২৫০৳\n১০/ সেলিম = ২২৫০৳\n১১/ ফিরোজ = ১৬০০৳\n১২/ আরিফ = ১২০০৳\n১৩/ আনিস = ১২০০৳	2	f	\N
2195	2024-11-28	Miscellaneous	0	530	530	ক্যাশ মেমো ৫৩০৳	1	f	\N
2171	2024-11-28	Rod Mistri Helper	4	2150	2000	ওবায়দুল =৫৫০৳,মাসুদ =৫৫০৳,লাকু=৫৫০৳	0	f	\N
2212	2024-11-30	Raj Mistri Head	4	2920	2000	জাহাঙ্গীর =৭৫০৳,রিয়াদ =৭৫০৳,মাসুদ =৭২০৳	0	f	\N
2181	2024-11-29	Raj Mistri Helper	4	2000	2000		0	f	\N
2203	2024-11-30	Rod Mistri Helper	8	4150	4000	Obaidul 550৳\nRifat 550৳\nMasud 550৳	2	f	\N
2202	2024-11-30	Rod Mistri Head	5	3500	2500	Anis 800৳\nRinku 750৳\nArif 650\nBulbul 600৳\nAhmad 700৳	2	f	\N
2176	2024-11-28	Maid Salary	0	1000	1000	নভেম্বর মাস 	0	f	\N
2217	2024-11-30	Chipping Head	1	1000	1000	৯ তলা চিপিং শেষ 	0	f	\N
2200	2024-11-30	Raj Mistri Helper	1	500	500		1	f	\N
2188	2024-11-27	Raj Mistri Helper	2	1000	1000		1	f	\N
2228	2024-10-15	Steel Rod Purchase	1086	99833	0		0	f	\N
2233	2024-11-07	Steel Rod Purchase	0	0	100000	SSD Afser 	0	f	\N
2244	2024-09-26	Steel Rod Purchase	0	0	20000	MD Sir Cash	3	f	\N
666	2024-10-03	Steel Rod Purchase	0	0	700000	 IBBL Cheque no-3824912 SAH Project	4	f	\N
2221	2024-12-01	Rod Mistri Head	3	2150	1500	Anis 800৳\nArif 650৳\nAhmad 700৳	2	f	\N
2209	2024-11-29	Overtime Bill	0	500	0	SSD Pro Dable  keno ?????	0	f	\N
2304	2024-11-20	Project Deposit	0	50000	51085		5	f	\N
637	2024-10-04	Miscellaneous	0	500	0	Engr. Rahinur over time 	0	f	\N
679	2024-10-06	Miscellaneous	0	150	150	যাতায়াত ভাড়া 	1	f	\N
677	2024-10-06	Rod Mistri Head	3	2300	1500	রাসেল = ৭০০৳\nকাসেম = ৭০০৳\nরব্বানী = ৯০০৳	1	f	\N
589	2024-08-31	Raj Mistri Head	0	0	1500	জাহাঙ্গীর রাজ মিস্ত্রি মাথার টাকা   আগস্ট = ১৫০০৳ 01-10-24	0	f	\N
686	2024-07-31	Raj Mistri Head	0	0	2500	 jahangir raz 01-10-2024 mather TK.	0	f	\N
696	2024-10-07	Steel Rod Purchase	0	0	100000	UCB IMp 1879027  Avalone Project	4	f	\N
710	2024-09-10	Rod Mistri Head	3	2300	1500	স্বাধীন ৮০০৳\n\nনজরুল ৭৫০৳\nমোতাহার ৭৫০৳	2	f	\N
702	2024-09-30	Rod Mistri Head	0	0	2000	সুরেশ রড মিস্তিরি মাথার টাকা সেপ্টেম্বর =২০০০৳ 07-10-2024	0	f	\N
697	2024-10-06	Guard Salary	0	1000	1000	সেপ্টেম্বর মাসের বেতন ১০০০৳	2	f	\N
711	2024-10-08	Steel Rod Purchase	\N	408600	0	 Gph  10 ML- 2 ton\n 12 Ml = 500 KG, 16 Ml= 500 Kg, 20 Ml - 1500 KG AValone Project  Rate-90.80 TK per Kg.	4	f	\N
639	2024-08-31	Rod Mistri Head	0	0	1000	রাব্বানী মাথার টাকা আগস্ট =১০০০৳ 8-10-2024	0	f	\N
674	2024-10-03	Project Deposit	0	50000	48700		5	f	\N
719	2024-10-08	Raj Mistri Helper	2	1000	1000		0	f	\N
721	2024-10-08	Rod Mistri Helper	4	2050	2000	ওবায়দুল =৫৫০৳	0	f	\N
699	2024-10-07	Rod Mistri Helper	7	3550	3500	ওবায়দুল =৫৫০৳	0	f	\N
700	2024-10-07	Raj Mistri Head	2	1420	1000	মাসুদ =৭২০৳	0	f	\N
701	2024-10-07	Raj Mistri Helper	3	1500	1500		0	f	\N
688	2024-10-06	Miscellaneous	0	1000	1000	রড আনা ভাড়া 	0	f	\N
689	2024-10-06	Miscellaneous	\N	500	500	রড আনলোড করা 	0	f	\N
685	2024-10-06	Miscellaneous	0	2330	2330	মোটরসাইকেল ঠিক করা 	0	f	\N
684	2024-10-06	Raj Mistri Helper	3	1500	1500		0	f	\N
683	2024-10-06	Raj Mistri Head	3	2170	1500	জাহাঙ্গীর =৭৫০৳,মাসুদ = ৭২০৳	0	f	\N
682	2024-10-06	Rod Mistri Helper	5	2550	2500	ওবায়দুল =৫৫০৳	0	f	\N
681	2024-10-06	Rod Mistri Head	4	2750	2000	সুরেশ =৬৫০৳,মিন্টু =৭৫০৳,রিংকু =৭৫০৳,বুলবুল =৬০০৳	0	f	\N
632	2024-10-04	Rod Mistri Helper	6	3050	3000	ওবায়দুল =৫৫০৳	0	f	\N
690	2024-10-06	Rod Mistri Head	3	2050	1500	জহুরুল ৭৫০৳\nশাকিল ৬০০৳\nসোহেল ৭০০৳	2	f	\N
692	2024-10-07	Rod Mistri Head	4	2950	2000	রব্বানী ৯০০৳\nজহুরুল ৭৫০৳\nসোহেল ৭০০৳\nশাকিল ৬০০৳	2	f	\N
693	2024-10-07	Rod Mistri Helper	1	500	500		2	f	\N
694	2024-10-07	Miscellaneous	0	90	90	ক্যাশ মেমো, টেপ, চক পাইপ	2	f	\N
695	2024-10-07	Miscellaneous	0	250	250	ssd থেকে মেশিন আনা ও ssd তে ১০ মিলি রড পাঠানো হয়েছে তার ভাড়া	2	f	\N
712	2024-10-08	Rod Mistri Head	4	3050	2000	রব্বানী ৯০০৳\nজহুরুল ৭৫০৳\nসোহেল-১= ৭০০৳\nসোহেল-২= ৭০০৳	2	f	\N
713	2024-10-08	Rod Mistri Helper	3	1550	1500	রাসেল ৫৫০৳	2	f	\N
691	2024-10-06	Rod Mistri Helper	2	1000	1000		2	f	\N
708	2024-10-08	Rod Mistri Helper	6	3000	3000		1	f	\N
707	2024-10-08	Rod Mistri Head	2	1400	1000	রাসেল=৭০০৳\nকাসেম=৭০০৳	1	f	\N
706	2024-10-07	Miscellaneous	0	500	500	পাম্প রিপিয়ারিং 	1	f	\N
705	2024-10-07	Rod Mistri Helper	6	3000	3000		1	f	\N
704	2024-10-07	Rod Mistri Head	2	1400	1000	রাসেল =৭০০৳\nকাসেম =৭০০৳	1	f	\N
703	2024-10-06	Miscellaneous	0	3520	3520	খোয়া ভাঙ্গা ২০৭ সিএফটি 	1	f	\N
680	2024-10-06	Miscellaneous	0	130	130	ক্যাশ মেমো	1	f	\N
678	2024-10-06	Rod Mistri Helper	6	3000	3000		1	f	\N
650	2024-10-05	Miscellaneous	0	250	250	যাতায়াত ভাড়া	1	f	\N
641	2024-10-03	Rod Mistri Helper	4	2000	2000		1	f	\N
709	2024-10-07	Miscellaneous	0	3156	3156	ক্যাশ মেমো (হাড্ওয়ার মালামাল)	1	f	\N
715	2024-10-09	Rod Mistri Helper	3	1550	1500	রাসেল ৫৫০৳	2	f	\N
716	2024-10-09	Hardware Materials	0	6261	6261	ক্যাশমেমো গুনা তার,পেরেক, সেফটি বেল্ট ইত্যাদি। 	2	f	\N
653	2024-10-01	Rod Mistri Head	2	1450	1000	রিংকু=৭৫০	3	f	\N
687	2024-10-06	Day Labour Bill	0	4200	4200	ইট উঠা ৭তলা ৩০০০ হাজার pcs	0	f	\N
1062	2024-10-21	Raj Mistri Helper	6	3000	3000		0	f	\N
1074	2024-10-22	Guard Salary	0	1000	1000	অক্টোবর মাসে  Didar	0	f	\N
1537	2024-10-05	Project Deposit	0	42824	0	 RT Carnish Top Floor Desco Bill = July+ Aug-24	6	f	\N
717	2024-10-09	Steel Rod Purchase	0	0	200000	 UCB -100000 + IBBL =50000 + Cash 50000 Tuli Mam SSD	4	f	\N
720	2024-10-08	Rod Mistri Head	3	2150	1500	মিন্টু = ৭৫০৳ রিংকু =৭৫০৳ সুরেশ =৬৫০৳	0	f	\N
730	2024-10-09	Miscellaneous	0	10770	10770	ক্যাশ মেমো	0	f	\N
725	2024-08-31	Rod Mistri Head	0	0	1000	রাব্বানী রড মিস্তিরি মাথার টাকা আগস্ট = ১০০০৳4/10/24	0	f	\N
1063	2024-10-21	Chipping Head	1	1000	1000		0	f	\N
1070	2024-10-22	Chipping Head	1	1000	1000		0	f	\N
1543	2024-10-16	Office Cost	0	0	878	 Off Hot 21 mobile net + tea bag + Bank Covenece	6	f	\N
1549	2024-10-18	Razia Tower Cost	0	0	11000	RT Office Boy Asif Salary Sep-24	6	f	\N
1569	2024-10-21	Utility	0	0	500	 Avalon project Net Bill Oct-24 Bkash Pay	6	f	\N
1571	2024-10-22	Utility	0	0	3030	SSD Desco Bill Bkash Pay	6	f	\N
1556	2024-11-05	Rod Mistri Helper	4	2000	2000		1	f	\N
1561	2024-11-06	Raj Mistri Head	3	2100	1500	সালাম ৭০০৳\nসাগর ৭০০৳\nআলমগীর ৭০০৳	1	f	\N
1583	2024-11-05	Rod Mistri Helper	11	5600	5500	জাহাঙ্গীর =৫৫০৳,মাসুদ =৫৫০৳	0	f	\N
1579	2024-11-06	Utility	0	0	8000	Spire Desco + Wasa 7500 Net Bill 500 Sep-24 Net Bill 	6	f	\N
1969	2024-11-21	Rod Mistri Head	6	4250	3000	রিংকু =৭৫০৳,বুলবুল =৬০০৳,মিন্টু =৭৫০৳,সুরেশ =৬৫০৳,সোহেল =৮০০৳	0	f	\N
1975	2024-11-22	Raj Mistri Head	2	1500	1000	জাহাঙ্গীর =৭৫০৳,রিয়াদ =৭৫০৳	0	f	\N
2187	2024-11-27	Raj Mistri Head	2	1400	1000	সাগর ৭০০৳, মোজাম্মেল ৭০০৳	1	f	\N
2189	2024-11-28	Rod Mistri Head	2	1500	1000	রাসেল ৮০০৳, সোহাগ ৭০০৳	1	f	\N
2191	2024-11-28	Raj Mistri Head	2	1400	1000	সাগর ৭০০৳, মোজাম্মেল ৭০০৳	1	f	\N
2196	2024-11-29	Miscellaneous	0	0	0	কাজ বন্ধ। Friday	1	f	\N
2152	2024-11-27	Rod Mistri Head	4	2900	2000	সোহেল =৮০০৳,রিংকু =৭৫০৳,সুরেশ =৬৫০৳,	0	f	\N
2182	2024-11-29	Head Welder	1	800	500		0	f	\N
2208	2024-11-29	Guard Salary	0	2000	2000	নভেম্বর মাস দিদার 	0	f	\N
2211	2024-11-30	Rod Mistri Helper	1	500	500		0	f	\N
2216	2024-11-30	Sanitary Mistri Head	4	2400	2400		0	f	\N
2230	2024-10-28	Steel Rod Purchase	5200	472160	0	Rate -90.80	0	f	\N
2240	2024-11-18	Steel Rod Purchase	0	0	300000	UCB SPDL 	0	f	\N
2242	2024-11-23	Cement	100	50000	0	Rate -500	0	f	\N
2246	2024-10-08	Steel Rod Purchase	4500	408600	0	90.80 Rate	3	f	\N
2235	2024-12-02	Rod Mistri Head	5	3400	2500	আনিস ৮০০৳\nআরিফ ৬৫০৳\nসেলিম ৭০০৳\nআহমেদ ৬৫০৳	2	f	\N
2239	2024-12-02	Hardware Materials	0	150	150	ক্যাশ মেমো স্কেরাপ ক্রয় ৩টা	2	f	\N
2301	2024-11-17	Project Deposit	0	50000	49035		5	f	\N
2306	2024-11-22	Project Deposit	0	40000	40000		5	f	\N
2310	2024-11-26	Project Deposit	0	35000	34765	 Office from Liton	5	f	\N
2312	2024-11-28	Project Deposit	0	85000	84875		5	f	\N
1818	2024-11-13	Project Deposit	0	74000	74990	 MD Sir =40000 + Office From Liton +20000 Hardwere Goods+14000	5	f	\N
2367	2024-11-30	Project Deposit	0	89000	84097		5	f	\N
2406	2024-12-07	Raj Mistri Head	1	700	0	সাগর ৭০০৳	1	f	\N
2408	2024-11-30	Rod Mistri Head	0	0	4000	Rod Mestry Over TK Nov-24  Rabbani Payment Date - 01-12-2024 	0	f	\N
2326	2024-12-02	Rod Mistri Helper	2	1100	1000	আশিক =৫৫০৳,মাসুদ =৫৫০৳	0	f	\N
2334	2024-12-02	Sand	1	45000	45000	১ গাড়ি লাল বালি 	0	f	\N
2339	2024-12-02	Rod Mistri Helper	3	1600	1500	আশিক =৫৫০৳,মাসুদ =৫৫০৳	0	f	\N
2356	2024-12-02	Concrete-Casting	0	97000	33000	১০ তলা ছাদের ঢালাই =৯৭০০০৳\nজমা=৩৩০০০৳	0	f	\N
2341	2024-12-03	Welder's Helper	1	500	500		0	f	\N
2362	2024-12-04	Concrete-Casting	0	0	14500	ঢালাই বাবদ জমা =১৪৫০০৳	0	f	\N
2353	2024-12-04	Raj Mistri Helper	4	2000	2000		0	f	\N
2370	2024-12-05	Raj Mistri Head	4	2900	2000	একই মিস্তিরি 	0	f	\N
2375	2024-12-05	Miscellaneous	0	10000	10000	১০০ সিট ভাড়া 	0	f	\N
2347	2024-12-03	Rod Mistri Head	5	4150	2500	Anis 800৳\nArif 650৳\nSelim 700৳\nAhmad 650৳\nRinku 750৳\nBulbul 600৳	2	f	\N
2365	2024-12-05	Hardware Materials	0	3660	3660	গুনাতার সহ \nমেমো নং ৮২৭৩	2	f	\N
2377	2024-12-06	Rod Mistri Head	2	1550	1000	সোহেল =৮০০৳,রিংকু =৭৫০৳	0	f	\N
2382	2024-12-06	Overtime Bill	0	500	500	ইন্জি.রাহিনুর 	0	f	\N
2384	2024-12-01	Miscellaneous	0	500	500	নেট বলি নভেম্বর ২০২৪.	1	f	\N
2391	2024-12-03	Rod Mistri Head	2	1500	1000	রাসেল ৮০০৳, সোহাগ ৭০০৳	1	f	\N
2396	2024-12-04	Rod Mistri Helper	2	1000	1000		1	f	\N
2401	2024-12-05	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
722	2024-10-08	Miscellaneous	0	500	500	মোটরসাইকেল তেল 	0	f	\N
698	2024-10-07	Rod Mistri Head	4	2750	2000	রিংকু =৭৫০৳ মিন্টু =৭৫০৳ বুলবুল =৬০০৳ সুরেশ =৬৫০৳	0	f	\N
727	2024-10-09	Raj Mistri Helper	4	2000	2000		0	f	\N
1069	2024-10-22	Rod Mistri Helper	8	4050	4000	ওবায়দুল =৫৫০৳	0	f	\N
990	2024-10-10	Miscellaneous	1	100	100	রড মিস্ত্রি যাতায়াত ভাড়া 	3	f	\N
1084	2024-09-30	Rod Mistri Head	0	0	1000	 Usuf  Sep-24 19-10-24	3	f	\N
1644	2024-11-07	MD Sir Personal Cost	0	0	2090	 Car -21-6757 Suplimentary Cost + Speed Money 500 Inspector	6	f	\N
1101	2024-10-01	Deed	0	198000	198000	15-10-2022 Vander Zakir 	3	f	\N
1108	2024-08-31	Raj Mistri Head	0	12500	12500	 	3	f	\N
1117	2024-08-31	Sign Board	0	28500	28500	 Scarlet + IT Yousuf 	3	f	\N
1118	2024-08-31	Electrician	0	1800	1800	 Kabir	3	f	\N
1099	2024-10-24	Electrician	0	12211	11500	 UCB Cheque no 1509668 + Cash Asad -1500 Md. Tasnom Hasan Redoy 	3	f	\N
1098	2024-10-18	Engineer Salary	0	1000	1000	সেপ্টেম্বর মাসের বেতন 	3	f	\N
1089	2024-10-21	Hardware Materials	1	800	800	ক্যাশ মোমো Md Sir Bkash	3	f	\N
1092	2024-10-22	Rod Mistri Helper	5	2500	2500		3	f	\N
1131	2024-10-25	Miscellaneous	0	0	0	কাজ বন্ধ 	0	f	\N
1122	2024-10-24	Am Kat	0	76494	70000	 AB Timber 02 Cheque Ucb 25-8-24 40000 24-10-24 30000	2	f	\N
1082	2024-10-23	Miscellaneous	3	720	720		0	f	\N
1126	2024-10-24	Rod Mistri Helper	9	4550	4500	মাসুদ =৫৫০৳	0	f	\N
1133	2024-10-24	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
1138	2024-10-26	Rod Mistri Head	2	1400	1100	কাসেম ৭০০৳\nরাসেল ৭০০৳	1	f	\N
1592	2024-10-31	Rod Mistri Head	0	0	1900	 Over TK oct-24 Rabbani Date 3-11-24	2	f	\N
1611	2024-07-31	Rod Mistri Head	0	0	0	আতাউর রড মিস্তিরি মাথার টাকা জুলাই = ৮০০৳	0	f	\N
1594	2024-11-03	Miscellaneous	1	250	250	Spire থেকে সিমেন্ট আনা (5 Bag)	3	f	\N
1599	2024-11-05	Rod Mistri Helper	3	1550	1500	জুবায়েত=550৳	3	f	\N
1612	2024-11-06	Rod Mistri Head	3	2100	1500	আনিস ৮০০৳\nসেলিস ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
1606	2024-11-06	Raj Mistri Head	5	3570	2500	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳	0	f	\N
1604	2024-11-06	Miscellaneous	1	240	240	ক্যাশ মেমো	3	f	\N
1619	2024-11-07	Hardware Materials	1	110	110	ক্যাশ মেমো	3	f	\N
1640	2024-11-04	Guard Salary	0	0	5000	 Paid Oct-24 Salary	3	f	\N
1650	2024-11-07	Raj Mistri Helper	6	3000	3000		0	f	\N
1655	2024-11-07	Miscellaneous	0	400	400	বাঁশ আনা ভ্যান ভাড়া	0	f	\N
1660	2024-11-08	Chipping Head	1	1000	1000	৮তলার চিপিং শুরু 	0	f	\N
1673	2024-11-09	Chipping Head	1	1000	1000		0	f	\N
1665	2024-11-10	Raj Mistri Head	3	2100	1500	সালাম ৭০০৳\nসাগর ৭০০৳\nহাফিজুর রহমান ৭০০৳	1	f	\N
1681	2024-11-08		1	1300	500	আলআমিন ৮০০৳\nদিনে ১ হাজিরা, ওবার টাইম ৫০০৳	2	f	\N
1668	2024-11-06	Cement	30	16650	16650	  ০৯/০৭/০২৪ সিমেন্ট কিনা ৩০ ব্যাগ, Due দেওয়া হইছে ৬৬৫০৳  Fully Paid	0	f	\N
1632	2024-11-07	Day Labour Bill	0	5700	5700	ইট উপরে তোলা হয়েছে,\n৩ তালায় ১০০০\n৫ তালায় ২৫০০\n৬ তালায় ২৫০০\n	1	f	\N
1639	2024-11-09	Raj Mistri Helper	2	1000	1000		1	f	\N
1992	2024-11-19	Office Cost	0	0	1270	 Stamp + Tea Bag, Coffee + EBL Ava Land owner Cheque + UCb 	6	f	\N
1982	2024-11-23	Raj Mistri Helper	5	2500	2500		0	f	\N
1984	2024-11-23	Rod Mistri Helper	7	3650	3500	ওবায়দুল =৫৫০৳,মাসুদ =৫৫০,আশিক =৫৫০৳	0	f	\N
1979	2024-11-23	Rod Mistri Head	4	2800	2000	আনিস ৮০০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳\nআহম্মদ ৭০০৳	2	f	\N
1980	2024-11-23	Rod Mistri Helper	2	1050	1000	রিফাত ৫৫০	2	f	\N
2185	2024-11-27	Rod Mistri Head	2	1500	1000	রাসেল ৮০০৳, সোহাগ ৭০০৳	1	f	\N
2190	2024-11-28	Rod Mistri Helper	3	1500	1500		1	f	\N
2154	2024-11-27	Raj Mistri Head	3	2200	1500	জাহাঙ্গীর =৭৫০৳,রিয়াদ =৭৫০৳	0	f	\N
2192	2024-11-28	Raj Mistri Helper	2	1000	1000		1	f	\N
2167	2024-11-28	Rod Mistri Head	4	2750	2000	আনিস ৮০০৳\nআরিফ ৬৫০৳\nবুলবুল ৬০০৳\nআহমদ ৭০০৳	2	f	\N
2210	2024-11-30	Rod Mistri Head	1	650	500		0	f	\N
2215	2024-11-30	Miscellaneous	0	100	100	সিমেন্ট আনলোড বকশিস 	0	f	\N
2197	2024-11-30	Rod Mistri Head	2	1500	1000	রাসেল ৮০০৳, সোহাগ ৭০০৳	1	f	\N
2207	2024-12-01	Raj Mistri Helper	1	500	500		1	f	\N
2220	2024-11-30	Miscellaneous	0	397	397	দিদার মেডিকেল খরচ 	0	f	\N
2229	2024-10-19	Cement	150	76500	50000	UCB Cheque	0	f	\N
718	2024-10-08	Raj Mistri Head	2	1450	1000	জাহাঙ্গীর =৭৫০৳	0	f	\N
723	2024-10-08	Guard Salary	0	3000	3000	সেপ্টেম্বর  Paid  October-24 Advance-1000	0	f	\N
728	2024-10-09	Rod Mistri Head	2	1500	1000	মিন্টু =৭৫০৳ রিংকু =৭৫০৳	0	f	\N
989	2024-10-10	Rod Mistri Helper	3	1500	1500		3	f	\N
732	2024-10-09	Miscellaneous	0	300	300	ইঞ্জিনিয়ার মোবাইল বিল সেপ্টেম্বর =৪০০৳  office	0	f	\N
1104	2024-08-31	Miscellaneous	0	90000	90000	Power Accepted  MD Jashim Brokar	3	f	\N
1106	2024-08-31	Miscellaneous	0	25000	25000	 Soil Test Seba + Woodbana Buring	3	f	\N
1115	2024-08-31	Bricks Purchase	12000	140000	140000	12000 pcs peket	3	f	\N
1111	2024-08-31	Piling Expense	0	371000	371000	 Aminul Islam	3	f	\N
1121	2024-08-31	Electric Items Purchase	0	16800	16800	 Shukhi Electric Shop	3	f	\N
1669	2024-11-09	Raj Mistri Head	5	3570	2500	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳	0	f	\N
1075	2024-10-23	Raj Mistri Head	6	4270	3000	জাহাঙ্গীর =৭৫০৳, মাসুদ =৭২০	0	f	\N
1081	2024-10-23	Welder's Helper	1	500	500		0	f	\N
1674	2024-11-09	Miscellaneous	0	500	500	কাট আনা ভাড়া 	0	f	\N
1134	2024-10-24	Rod Mistri Helper	6	3000	3000		1	f	\N
1629	2024-11-07	Rod Mistri Helper	6	3000	3000		1	f	\N
1127	2024-10-24	Head Welder	1	800	500		0	f	\N
1139	2024-10-26	Rod Mistri Helper	6	3000	3000		1	f	\N
1509	2024-11-04	Rod Mistri Helper	9	4550	4500	মাসুদ =৫৫০৳	0	f	\N
1621	2024-10-31	Rod Mistri Head	0	0	2000	 over Tk October-24 yousuf	3	f	\N
1596	2024-11-04	Rod Mistri Helper	3	1550	1500	জুবায়েত=550৳	3	f	\N
1601	2024-11-06	Rod Mistri Head	2	1450	1000	রাশেদুল=750৳	3	f	\N
1613	2024-11-06	Rod Mistri Helper	5	2500	2500		2	f	\N
1624	2024-10-31	Rod Mistri Head	0	0	2000	 Rinko Rod over Tk date-4-11-24	0	f	\N
1608	2024-11-06	Rod Mistri Head	7	5200	3500	রাব্বানী =৯০০৳,রিংকু =৭৫০৳,সুরেশ =৬৫০৳,সোহেল =৮০০৳,জহরুল-৭৫০৳,মিন্টু =৭৫০৳,বুলবুল =৬০০৳	0	f	\N
1626	2024-11-05		0	0	1000	 Atiqul Rod over Tk Nov-24 Car Rent	0	f	\N
1617	2024-11-07	Rod Mistri Head	2	1450	1100	রাশেদুল=750৳	3	f	\N
1646	2024-11-07	Broker	0	0	10000	 SSD Flat Sold MR. Mofizuddin ( Client Sakhawat Sir )	6	f	\N
1663	2024-10-15	MD Sir Personal Cost	0	0	20500	 MD Sir cash Received \n From Rt Service 	6	f	\N
1667	2024-07-31	Rod Mistri Head	0	0	800	 Rod Ataur july-24 payment Date -6-11-2024	0	f	\N
1652	2024-11-07	Rod Mistri Helper	12	6050	6000	ওবায়দুল =৫৫০৳	0	f	\N
1657	2024-11-08	Rod Mistri Helper	9	4550	4500	ওবায়দুল =৫৫০৳	0	f	\N
1662	2024-11-08	Miscellaneous	0	500	500	ইন্জি. সাফি ওভার টাইম 	0	f	\N
1678	2024-11-07	Rod Mistri Head	1	650	500	সেলিম ৬৫০৳	2	f	\N
1634	2024-11-08	Rod Mistri Helper	6	3000	3000		1	f	\N
1638	2024-11-09	Raj Mistri Head	2	1400	1000	সালাম ৭০০৳\nসাগর ৭০০৳	1	f	\N
1666	2024-11-10	Raj Mistri Helper	3	1500	1500		1	f	\N
1989	2024-11-18	Office Cost	0	0	1500	 Net Bill Nov-2024 Maisha Net	6	f	\N
1991	2024-11-19	Utility	0	0	4040	 Desco Bill SSD Project	6	f	\N
1993	2024-11-20	R.T Deposit	0	35000	0	Tacos Shop Deposited 11-11-24 to 20-11-24 = 10 days X 3500 = 35000 TK	6	f	\N
1981	2024-11-23	Raj Mistri Head	3	2170	1500	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳	0	f	\N
1983	2024-11-23	Rod Mistri Head	6	4250	3000	একই মিস্তিরি 	0	f	\N
1985	2024-11-23	Sanitary Mistri Head	3	1800	1800		0	f	\N
2168	2024-11-28	Rod Mistri Helper	9	4600	4500	রিফাত ৫৫০৳\nমাসুদ ৫৫০৳	2	f	\N
2135	2024-11-25		4	3100	2100	ইউসুফ=850৳\nরাশেদুল=750৳\nলাভলু=800৳	3	f	\N
2213	2024-11-30	Head Welder	1	800	500		0	f	\N
2218	2024-11-30	Miscellaneous	0	500	500	মোটরসাইকেল তেল 	0	f	\N
2199	2024-11-30	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
2205	2024-12-01	Rod Mistri Helper	2	1000	1000		1	f	\N
2222	2024-12-01	Rod Mistri Helper	2	1050	1000	Rifat 550	2	f	\N
2223	2024-12-01	Maid Salary	0	2650	2650	নভেম্বর মাস বুয়া বেতন ২০ দিনের ২৬৫০৳\n[মাসিক বেতন ৪০০০৳]	2	f	\N
2307	2024-11-23	Project Deposit	0	40000	39630		5	f	\N
2299	2024-12-02	Bricks Purchase	12000	130000	130000	 UCB to Asia M/S Mega Bricks Picket 6000 Pcs + No 6000 Pcs	1	f	\N
2302	2024-11-18	Project Deposit	0	50000	49700		5	f	\N
2311	2024-11-27	Project Deposit	0	30000	30000	office from Liton 8000	5	f	\N
2346	2024-12-03	Sanitary Mistri Head	4	2400	2400		0	f	\N
2352	2024-12-04	Raj Mistri Head	4	2900	2000	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭৫০৳	0	f	\N
2351	2024-12-04	Rod Mistri Helper	6	3050	3000	রিফাত ৫৫০৳	2	f	\N
2357	2024-08-31	Project Deposit	0	0	43771	 Due Upto Aug-24 	5	f	\N
724	2024-10-08	Raj Mistri Head	0	2000	2000	গাড়ি ভাড়া টাকা অক্টোবর 	0	f	\N
729	2024-10-09	Rod Mistri Helper	5	2550	2500	ওবায়দুল =৫৫০৳	0	f	\N
1651	2024-11-07	Rod Mistri Head	8	6000	4000	মিন্টু =৭৫০,সুরেশ =৬৫০৳,রিংকু =৭৫০৳,সোহেল =৮০০৳,বুলবুল =৬০০৳,রাব্বানী =৯০০৳,জহরুল- ৭৫০৳,আনিস =৮০০৳	0	f	\N
1103	2024-08-31	Plan Pass/Approval	0	400000	350000	 Rajuk Jashim uddin Brockar	3	f	\N
1110	2024-08-31	Steel Rod Purchase	0	2895375	2895375	 14-10-2024 to 28-8-24 Rod + Cement Cost at	3	f	\N
1114	2024-08-24	Guard Salary	0	162500	162500		3	f	\N
1120	2024-08-31	Am Kat	0	81115	81115		3	f	\N
1085	2024-10-20	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1097	2024-10-21	Miscellaneous	0	500	500	Internet Bill October Liton Bkash Office 	3	f	\N
1093	2024-10-22	Hardware Materials	3	1855	1855	1.ক্যাশ মেমো 1690৳\n2.ক্যাশ মেমো 140৳\n3.চক 25৳	3	f	\N
1076	2024-10-23	Raj Mistri Helper	7	3500	3500		0	f	\N
1077	2024-10-23	Rod Mistri Head	9	6500	4500	রাব্বানী =৯০০৳,মিন্টু [৭৫০৳,রিংকু =৭৫০৳, বুলবুল =৬০০৳,সাকিল-৬০০৳, জহরুল- ৭৫০৳,সোহেল ১=৭০০৳,সোহেল ২=৮০০৳,সুরেশ =৬৫০৳	0	f	\N
1078	2024-10-23	Rod Mistri Helper	9	4600	4500	ওবায়দুল =৫৫০৳,মাসুদ =৫৫০৳	0	f	\N
1083	2024-10-23	Miscellaneous	0	1275	1275	ব্যানার পাইপ কেনা	0	f	\N
1123	2024-10-24	Raj Mistri Head	6	4270	3000	জাহাঙ্গীর =৭৫০৳, মাসুদ =৭২০৳	0	f	\N
1128	2024-10-24	Welder's Helper	1	500	500		0	f	\N
1135	2024-10-24	Raj Mistri Head	2	1400	1000	সালাম ৭০০৳\nআলমগীর ৭০০৳	1	f	\N
1595	2024-11-04	Rod Mistri Head	3	2300	1600	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
1600	2024-11-05	Miscellaneous	1	1000	1000	রড মিস্ত্রি আতিকুর গাড়ি ভাড়া ১০০০৳	3	f	\N
2313	2024-11-29	Project Deposit	0	44000	43800		5	f	\N
1593	2024-11-06	Miscellaneous	0	810	810	ক্যাশ মেমো ৮১০৳ (রোশি,২ পিস ফুল ঝারু,২ পিস সলার ঝারু, ফোম)	1	f	\N
1607	2024-11-06	Raj Mistri Helper	6	3000	3000		0	f	\N
1618	2024-11-07	Rod Mistri Helper	3	1550	1500	জুবায়েত=550৳	3	f	\N
1641	2024-11-02	Guard Salary	0	10000	5000	 Salary Ocotober -24	3	f	\N
1645	2024-11-07	MD Sir Personal Cost	0	0	950	 Transfer Fee Stam + Convinece BRTA	6	f	\N
1656	2024-11-08	Rod Mistri Head	6	4450	3000	সুরেশ =৬৫০৳,বুলবুল =৬০০৳,মিন্টু =৭৫০৳,আনিস =৮০০৳,রিংকু =৭৫০৳,রাব্বানী =৯০০৳	0	f	\N
1661	2024-11-08	Miscellaneous	0	500	500	ইন্জি. রাহিনুর ওভার টাইম 	0	f	\N
1671	2024-11-09	Rod Mistri Head	9	6650	4500	রাব্বানী =৯০০৳,আরিফ =৬৫০৳,জহরুল- ৭৫০৳,বুলবুল =৬০০৳,সুরেশ =৬৫০৳,রিংকু =৭৫০৳,সোহেল =৮০০৳,মিন্টু =৭৫০৳,আনিস =৮০০৳	0	f	\N
1676	2024-11-09	Miscellaneous	0	500	500	মোটরসাইকেল তেল 	0	f	\N
1628	2024-11-07	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
1633	2024-11-08	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
1679	2024-11-07	Day Labour Bill	0	2000	2000	200 বস্তা বালু পাথর ৩য় তালা ছাদে উঠানো হয়েছে 	2	f	\N
1614	2024-11-07	Head Welder	1	1300	1000	আলআমিন রাতে দিনে ১.৫ হাজিরা।????\n	2	f	\N
1986	2024-11-17	Razia Tower Cost	0	0	180	Rosemount + UCb Convince	6	f	\N
1988	2024-11-18	Razia Tower Cost	0	0	5600	 Rosemount + Arket Swithch  Ins Box Switch	6	f	\N
1990	2024-11-19	Project Deposit	0	10000	0	 Md Sir Cash Deposted Office 	6	f	\N
1995	2024-11-20	Razia Tower Cost	0	0	700	Sweeper Bill RT Lift room Rabish Clean	6	f	\N
1997	2024-11-23	Office Cost	0	0	2000	Gift Palace Bkash Payment	6	f	\N
2000	2024-11-25	Utility	0	0	2525	Desco Bill SAH Project Recharge Bkash	6	f	\N
2001	2024-11-17	Razia Tower Cost	0	0	11000	 RT Guard Asif Salary - OCt-24	6	f	\N
2224	2024-12-01	Steel Rod Purchase	\N	0	650000	SAH Project Rod  UCB Cheque 02 1534350/1534352	4	f	\N
2231	2024-11-04	Steel Rod Purchase	0	0	500000	UCB Imp- no 1879031	0	f	\N
2236	2024-12-02	Raj Mistri Helper	7	3550	3500	রিফাত ৫৫০৳	2	f	\N
2303	2024-11-19	Project Deposit	0	95000	95460		5	f	\N
2308	2024-11-24	Project Deposit	0	37000	36938		5	f	\N
2322	2024-11-30	Raj Mistri Head	0	0	1000	মাসুদ মাথার টাকা নভেম্বর =১০০০৳ Payment date 1-12-24	0	f	\N
2278	2024-11-29	Sand	0	0	8500	সাদা বালির বকেয়া পরিশোধ 8500৳	3	f	\N
2316	2024-12-01	Rod Mistri Helper	1	250	250	হাফ হাজিরা	0	f	\N
2331	2024-12-02	Miscellaneous	0	1700	1700	ছাদ ঢালাই খাবার বাবদ Person ullekh nai ????	0	f	\N
2361	2024-12-04	Sanitary Mistri Head	2	1200	1000		0	f	\N
2354	2024-12-04	Rod Mistri Head	3	2150	1500	সোহেল =৮০০৳,লাকু=৬০০৳,রিংকু =৭৫০৳	0	f	\N
774	2024-10-11	Project Deposit	0	21000	20735		5	f	\N
734	2024-10-08	Guard Salary	0	1000	1000	 Sep-24	1	f	\N
754	2024-10-11	Miscellaneous	1	0	0	ইঞ্জিনিয়ার বিজয় ওভার টাইম ডিউটি।	2	f	\N
771	2024-10-08	Project Deposit	0	53000	52200		5	f	\N
760	2024-10-11	Miscellaneous	0	500	0	Engr.Rahinur over time 	0	f	\N
772	2024-10-09	Project Deposit	0	50000	48010		5	f	\N
773	2024-10-10	Project Deposit	0	50000	49800		5	f	\N
769	2024-10-06	Project Deposit	0	29000	28130		5	f	\N
756	2024-10-11	Rod Mistri Head	3	2100	1500		0	f	\N
775	2024-10-12	Project Deposit	0	38000	36040		5	f	\N
770	2024-10-07	Project Deposit	0	30000	29935		5	f	\N
731	2024-10-09	Miscellaneous	0	180	180	ভ্যান ভাড়া	0	f	\N
738	2024-10-10	Raj Mistri Head	5	3570	2500	জাহাঙ্গীর =৭৫০৳ মাসুদ =৭২০৳	0	f	\N
739	2024-10-10	Raj Mistri Helper	6	3000	3000		0	f	\N
740	2024-10-10	Rod Mistri Head	3	2100	1500		0	f	\N
741	2024-10-10	Rod Mistri Helper	3	1550	1500	ওবায়দুল =৫৫০৳	0	f	\N
742	2024-10-10	Miscellaneous	0	500	500	নেট বিল অক্টোবর 	0	f	\N
757	2024-10-11	Rod Mistri Helper	2	1050	1000	ওবায়দুল = ৫৫০৳	0	f	\N
758	2024-10-11	Raj Mistri Head	5	3550	2500	জাহাঙ্গীর =৭৫০৳	0	f	\N
759	2024-10-11	Raj Mistri Helper	5	2500	2500		0	f	\N
761	2024-10-12	Rod Mistri Head	2	1500	1000	মিন্টু =৭৫০৳ রিংকু = ৭৫০৳	0	f	\N
762	2024-10-12	Rod Mistri Helper	2	1000	1000		0	f	\N
733	2024-09-30	Rod Mistri Head	0	0	2000	 rod Mestri - Sep-24 2000 Over TK Rinko 13-10-2024\n	0	f	\N
764	2024-10-12	Raj Mistri Helper	6	3000	3000		0	f	\N
735	2024-10-10	Rod Mistri Head	4	2900	2000	রব্বানী ৯০০৳\nজহুরুল ৭৫০৳\nসোহেল২ ৭০০৳\nবুলবুল ৫৫০৳	2	f	\N
736	2024-10-10	Rod Mistri Helper	5	2550	2500	রাসেল ৫৫০৳	2	f	\N
737	2024-10-10	Miscellaneous	0	100	100	কনভেন্স বিজয় ABH to SAH 	2	f	\N
751	2024-10-11	Rod Mistri Head	3	1175	1500	রব্বানী ৯০০৳\nসোহেল১ ৭০০৳\nজহুরুল ৭৫০৳\n\n[বি:দ্র আজকে কাজ হাফ হাজিরা]	2	f	\N
752	2024-10-11	Rod Mistri Helper	3	750	750	[বি:দ্র আজকে কাজ হাফ হাজিরা]	2	f	\N
753	2024-10-11	Miscellaneous	0	100	100	কনভেন্স\nSAH to Spier 	2	f	\N
765	2024-10-12	Rod Mistri Head	6	4200	3000	জহুরুল ৭৫০৳\nবুলবুল ৬০০৳\nসোহেল১ ৭০০৳\nসোহেল২ ৭৫০৳\nফিরোজ ৭০০৳\nসেলিম ৭০০৳	2	f	\N
766	2024-10-12	Rod Mistri Helper	3	1550	1500	রাসেল ৫০৳	2	f	\N
767	2024-10-13	Rod Mistri Head	4	2900	2000	জহুরুল ৭৫০৳\nসোহেল২ ৭৫০৳\nফিরোজ ৭০০৳\nসেলিম ৭০০৳	2	f	\N
768	2024-10-13	Rod Mistri Helper	3	1500	1500		2	f	\N
778	2024-10-14	Rod Mistri Helper	6	3000	3000		2	f	\N
779	2024-10-14	Miscellaneous	0	340	340	ক্যাশমেমো কাপ ব্রাশ ২ টা	2	f	\N
780	2024-10-15	Rod Mistri Head	5	3500	2500	জহুরুল ৭৫০৳\nমাহফুজ ৭০০৳\nসেহেল১ ৭০০৳\nফিরোজ ৭০০৳\nসেলিম ৬৫০৳	2	f	\N
781	2024-10-15	Rod Mistri Helper	6	3000	3000		2	f	\N
743	2024-10-09	Rod Mistri Head	3	2100	1500	কাশেম=৭০০৳\nরাসেল=৭০০৳\nফিরোজ আলি=৭০০৳	1	f	\N
782	2024-10-15	Miscellaneous	0	500	500	WiFi বিল অক্টোবর-24 মাস not bill Submet	2	f	\N
746	2024-10-10	Rod Mistri Head	3	2100	1500	কাশেম =৭০০৳\nরাসেল =৭০০৳\nফিরোজ আলি =৭০০৳	1	f	\N
744	2024-10-09	Rod Mistri Helper	4	2000	2000		1	f	\N
747	2024-10-10	Rod Mistri Helper	4	2000	2000		1	f	\N
748	2024-10-11	Rod Mistri Head	3	2100	1500	কাশেম =৭০০৳\nরাসেল =৭০০৳\nফিরোজ আলি =৭০০৳	1	f	\N
749	2024-10-11	Rod Mistri Helper	4	2000	2000		1	f	\N
750	2024-10-11	Miscellaneous	0	335	335	ক্যাশ মেমো	1	f	\N
745	2024-10-09	Miscellaneous	0	200	200	যাতায়াত ভাড়া 	1	f	\N
763	2024-10-12	Raj Mistri Head	6	4270	3000	জাহাঙ্গীর =৭৫০৳ মাসুদ =৭২০৳	0	f	\N
776	2024-10-13	Project Deposit	0	59500	33390		5	f	\N
787	2024-10-14	Project Deposit	0	59000	85590		5	f	\N
1095	2024-10-22	Project Deposit	0	50000	49825		5	f	\N
1109	2024-08-31	Sand	0	293000	293000		3	f	\N
1087	2024-10-21	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
786	2024-10-15	Steel Rod Purchase	0	0	250000	UCB 200000 \nIBBL  50000 AVALON	4	f	\N
1090	2024-10-22	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
1094	2024-10-23	Rod Mistri Head	3	2200	1600	ইউসুফ=৮০০৳	3	f	\N
795	2024-10-13	Head Welder	1	1000	1000	1000 tk  over keno ????	0	f	\N
1079	2024-10-23	Electrician	2	1200	1200		0	f	\N
755	2024-10-10	Raj Mistri Head	0	0	2000	রাজ মিস্ত্রি গাড়ি ভাড়া অক্টোবর মাসে 	0	f	\N
810	2024-08-31	Rod Mistri Head	0	0	2000	 Nazrul over 10-10-2024	0	f	\N
1654	2024-11-07	Miscellaneous	0	200	200	ক্যাশ মেমো	0	f	\N
793	2024-10-13	Raj Mistri Head	5	3570	2500	জাহাঙ্গীর =৭৫০৳ মাসুদ =৭২০৳	0	f	\N
799	2024-10-14	Raj Mistri Head	5	3570	2500	জাহাঙ্গীর =৭৫০৳ মাসুদ =৭২০৳	0	f	\N
817	2024-10-14	Rod Mistri Helper	5	2550	2500	ওবায়দুল ৫৫০৳	0	f	\N
822	2024-10-15	Miscellaneous	0	500	500	মোটরসাইকেল তেল 	0	f	\N
804	2024-10-16	Miscellaneous	0	220	220	ব্রেড ও পাইপ ১ ফিট, টেপ	2	f	\N
798	2024-10-13	Miscellaneous	0	30	30	মালামাল আনা ভাড়া 	0	f	\N
788	2024-10-15	Project Deposit	0	95000	95200	 UCB Cash Cheque \nMD Sir Received 5000	5	f	\N
1105	2024-08-31	Miscellaneous	0	43000	43000	 Rajuk Clearense Md. Jashimuddin	3	f	\N
1107	2024-08-31	Miscellaneous	0	342930	342930	 Submerseble Cost + AL Amin Senatary shop	3	f	\N
1112	2024-08-31	Mati Kata	0	76485	76485	 matikata day labour	3	f	\N
1116	2024-08-31	Purchased Bamboo	0	37750	37750	 Mohon	3	f	\N
1086	2024-10-20	Rod Mistri Helper	5	2500	2500		3	f	\N
1088	2024-10-21	Rod Mistri Helper	5	2500	2500		3	f	\N
1137	2024-10-25	Miscellaneous	0	0	0	কাজ বন্ধ।	1	f	\N
1096	2024-10-23	Project Deposit	0	50000	49875		5	f	\N
1659	2024-11-08	Raj Mistri Helper	4	2000	2000		0	f	\N
1125	2024-10-24	Rod Mistri Head	9	6500	4500	মিন্টু =৭৫০৳,সোহেল =৮০০৳,জহরুল- ৭৫০৳, রাব্বানী =৯০০৳, সুরেশ =৬৫০৳, বুলবুল =৬০০৳, সাকিল-৬০০৳, রিংকু =৭৫০৳	0	f	\N
1130	2024-10-24	Miscellaneous	0	10	10	ফটোকপি 	0	f	\N
1132	2024-10-23	Day Labour Bill	0	7780	7780	ইট,বালু,সিমেন্ট ২৩১ বস্তা (৩,৪,৫,৬ তালা) উঠানো হয়েছে।	1	f	\N
1091	2024-10-23	Rod Mistri Helper	5	2500	2500		3	f	\N
1080	2024-10-23	Head Welder	1	800	500		0	f	\N
789	2024-10-12	Electrician	2	1200	1200		0	f	\N
1620	2024-11-07	Steel Rod Purchase	0	0	450000	UCB Im no 250000 + UCB =200000 = Spire Project 	4	f	\N
1597	2024-11-04	Guard Salary	0	5000	5000	October- 24	3	f	\N
1602	2024-11-06	Rod Mistri Helper	3	1550	1500	জুবায়েত=550৳	3	f	\N
1622	2024-11-07	Steel Rod Purchase	0	0	100000	Cash SSD Client Afser payment from  SSD Project 	4	f	\N
1615	2024-11-06	Welder's Helper	1	750	500	রাতে দিনে ১.৫ হাজিরা।	2	f	\N
1609	2024-11-06	Rod Mistri Helper	11	5550	5500	ওবায়দুল =৫৫০৳	0	f	\N
1643	2024-11-07	Utility	0	0	2800	SSD Desco Bill Bkash	6	f	\N
1648	2024-11-09	Office Cost	0	0	190	Teso + Biscuit	6	f	\N
2372	2024-12-05	Head Welder	1	800	500		0	f	\N
1680	2024-11-09	Door Frame Purchase	29	100000	50000	UCB Cheque no 1509682 SSD Project Chowkatt big size -05 pcs ,Small Size-24 pcs , Rate 7800, 2500 Mehegani katt	0	f	\N
1672	2024-11-09	Rod Mistri Helper	13	6600	6500	ওবায়দুল =৫৫০৳, মাসুদ =৫৫০৳	0	f	\N
1677	2024-10-31	Raj Mistri Head	0	0	2000	রাজ মিস্ত্রি মাথার টাকা অক্টোবর, (মাসুদ =১০০০৳,জাহাঙ্গীর =১০০০৳) , paid date -09/11/024	0	f	\N
1631	2024-11-07	Raj Mistri Helper	3	1500	1500		1	f	\N
1635	2024-11-08	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
1636	2024-11-08	Raj Mistri Helper	1	500	500		1	f	\N
1994	2024-11-20	Razia Tower Cost	0	0	7750	Rosemount Guad Show + Counter Show 8 pcs + Sleeper 4pcs	6	f	\N
1996	2024-11-20	Razia Tower Cost	0	0	200	 Lift worker Bakshis	6	f	\N
1998	2024-11-23	Office Cost	0	0	335	 Architect Appaion Checken + Dir Sir show polish + Teso Asif	6	f	\N
2232	2024-11-04	Steel Rod Purchase	0	0	100000	 UCB Cheque no -1509678	0	f	\N
1999	2024-11-24	Office Cost	0	0	710	RT Desco Office, IFIC + BAF + Shukhi Shop+ Uttara Stone + Biscut + Teso Bos Asif + Suger	6	f	\N
1987	2024-11-18	Razia Tower Cost	0	0	5000	RT Lift Nasir Labor Cost Control Fitting 	6	f	\N
894	2024-10-16	Project Deposit	0	53000	52775	 Remark Asad benner =700 + Labour =800 + Van Rent = 500  ?????	5	f	\N
2237	2024-11-20	Steel Rod Purchase	7000	616000	0	Rate- 88 	0	f	\N
2243	2024-09-18	Steel Rod Purchase	412	38544	0		3	f	\N
2305	2024-11-21	Project Deposit	0	40000	40349		5	f	\N
2309	2024-11-25	Project Deposit	0	55000	54860		5	f	\N
2366	2024-11-30	Guard Salary	0	2000	0	নভেম্বর মাস গার্ড বেতন ২০০০৳	2	f	\N
2403	2024-12-06	Miscellaneous	0	0	0	কাজ বন্ধ। 	1	f	\N
2379	2024-12-06	Raj Mistri Head	5	3650	2500	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭৫০৳,রিয়াদ=৭৫০৳	0	f	\N
2388	2024-12-02	Rod Mistri Helper	4	2000	2000		1	f	\N
2393	2024-12-03	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
2398	2024-12-04	Raj Mistri Helper	1	500	500		1	f	\N
811	2024-09-30	Rod Mistri Helper	0	0	400	 sujan over helper 10-10-24	0	f	\N
790	2024-10-12	Miscellaneous	0	50	50	যাতায়াত ভাড়া 	0	f	\N
794	2024-10-13	Raj Mistri Helper	6	3000	3000		0	f	\N
800	2024-10-14	Raj Mistri Helper	5	2500	2500		0	f	\N
806	2024-08-31	Rod Mistri Head	0	0	4400	 shadin over Aug-24 10/10/24	0	f	\N
818	2024-10-15	Rod Mistri Head	4	2700	2000	মিন্টু ৭৫০৳ রিংকু =৭৫০৳\n বুলবুল =৬০০৳ সাকিল-৬০০৳ 	0	f	\N
823	2024-10-15	Maid Salary	0	3000	3000	সেপ্টেম্বর মাস	0	f	\N
1113	2024-08-24	Rod Mistri Head	0	320550	320550		3	f	\N
1119	2024-08-31	Utility	0	114241	114241	 Desco + Wasa Bill	3	f	\N
1124	2024-10-24	Raj Mistri Helper	7	3500	3500		0	f	\N
1136	2024-10-24	Raj Mistri Helper	2	1000	1000		1	f	\N
1129	2024-10-24	Electrician	2	1200	1200		0	f	\N
1598	2024-11-05	Rod Mistri Head	1	750	500	রাশেদুল=750৳	3	f	\N
1603	2024-11-06	Rod Mistri Head	0	0	2000	ইউসুফ রড মিস্ত্রি মাথার টাকা October 	3	f	\N
1623	2024-10-31	Raj Mistri Head	0	0	3000	 Raz Miraz over Tk date-4-11-24	0	f	\N
1625	2024-10-31	Raj Mistri Head	0	0	1000	 Momin Raz over Tk date -4-11-2024	0	f	\N
1610	2024-11-06	Miscellaneous	0	500	500	মোটরসাইকেল মেরামত 	0	f	\N
1627	2024-11-03	Sand	0	0	12500	 Red Sand payment  Due -7500	2	f	\N
1637	2024-11-08	Miscellaneous	0	0	0	Engr. Efath overtime. 	1	f	\N
601	2024-10-02	Rod Mistri Head	3	3050	2000	সুরেশ ৬৫০৳\nরব্বানী ৯০০৳\nরিংকু ৭৫০৳\nজহুরুল ৭৫০৳  Remark	2	f	\N
1642	2024-11-06	MD Sir Personal Cost	0	0	340	Dir Sir Foodi Bill	6	f	\N
1647	2024-11-07	Razia Tower Cost	0	0	4200	 Wasa Top Tankiy Moter Service + Mestry Cost 	6	f	\N
1664	2024-11-09	Am Kat	28	12770	30000	 UCb Cheque no-1509681 Rate =460 TK 27.77 Kb  AmmKatt AB Timber	0	f	\N
1653	2024-11-07	Chipping Head	1	1000	1000	৭তলা চিপিং শেষ, প্রতি তলা চিপিং করা ৭০০০৳	0	f	\N
1658	2024-11-08	Raj Mistri Head	4	2820	2000	মাসুদ =৭২০৳	0	f	\N
1616	2024-10-31	Rod Mistri Head	0	0	2000	ইউসুফ রড মিস্ত্রি মাথার টাকা October-24 payment date-6-11-2024	3	f	\N
1670	2024-11-09	Raj Mistri Helper	7	3500	3500		0	f	\N
1675	2024-11-09	Miscellaneous	0	5995	5995	ক্যাশ মেমো	0	f	\N
1630	2024-11-07	Raj Mistri Head	2	1400	1000	সালাম ৭০০৳\nসাগর ৭০০৳	1	f	\N
1971	2024-11-21	Sanitary Mistri Head	3	1800	1800		0	f	\N
2038	2024-09-30	Rod Mistri Helper	0	0	1250	 Rod Helper over Tk Sep-24 payment date 18-11-24	2	f	\N
2042	2024-10-31	Rod Mistri Head	0	0	200	over Rod mest oct-24	1	f	\N
2032	2024-11-24	Raj Mistri Helper	7	3500	3500		0	f	\N
2033	2024-11-24	Electrician	2	1200	1200		0	f	\N
2050	2024-11-20	Guard Salary	0	2000	0	MD Sir দিয়েছে 	2	f	\N
2087	2024-11-22	Miscellaneous	0	0	0	Asadul Manager Over Time 	1	f	\N
2049	2024-11-25	Miscellaneous	0	1000	1000	পিকআপ ভাড়া আম কাঠ 	2	f	\N
2047	2024-11-25	Rod Mistri Helper	3	1550	1500	রিফাত ৫৫০৳	2	f	\N
2116	2024-11-26	Hardware Materials	0	625	625	ক্যাশমেমো পেরেক ৫ কেজি\nকসটেপ ২ টা।	2	f	\N
2071	2024-11-21	Rod Mistri Head	3	2250	1500	রাসেল ৮০০৳,কাসেম ৭৫০৳,সোহাগ ৭০০৳	1	f	\N
2073	2024-11-21	Electrician	4	2000	2000		1	f	\N
2075	2024-11-21	Welder's Helper	1	500	500		1	f	\N
2077	2024-11-21	Sanitary Mistri Head	1	600	600		1	f	\N
2079	2024-11-22	Rod Mistri Head	2	1500	1000	রাসেল ৮০০,সোহাগ ৭০০৳	1	f	\N
2081	2024-11-22	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
2083	2024-11-22	Electrician	1	1000	1000		1	f	\N
2085	2024-11-22	Miscellaneous	0	250	250	যাতায়াত ভাড়া ২৫০৳	1	f	\N
2069	2024-11-20	Miscellaneous	0	4500	4500	পাম্প রিপিয়ার ৪৫০০৳	1	f	\N
2089	2024-11-23	Rod Mistri Head	3	2250	1500	রাসেল ৮০০৳,কাসেম ৭৫০৳,সোহাগ ৭০০৳	1	f	\N
2091	2024-11-23	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
2112	2024-11-26	Head Welder	1	800	500	আল আমিন ৮০০৳	1	f	\N
2100	2024-11-25	Rod Mistri Head	3	2250	1500	রাসেল ৮০০৳,কাসেম ৭৫০৳,সোহাগ ৭০০৳	1	f	\N
2015	2024-11-21	Miscellaneous	0	80	80	 রড মিস্ত্রি গাড়ি ভাড়া 	3	f	\N
2017	2024-10-31	Rod Mistri Head	0	0	2000	রড মিস্ত্রি দুলাল মাথার টাকা October-3500৳ payment date-22-11-24 	3	f	\N
2024	2024-11-24	Sanitary Goods	0	5387	5387	ক্যাশ মেমো	3	f	\N
2026	2024-11-24	Sanitary Mistri Head	1	700	700		3	f	\N
2028	2024-11-24	Hardware Materials	0	4000	4000	ক্যাশ মেমো	3	f	\N
2234	2024-11-07	Cement	150	75000	0	Rate - 500	0	f	\N
805	2024-10-02	Engineer Salary	0	20000	20000	 Asad Salary -20000 Office	0	f	\N
726	2024-10-09	Raj Mistri Head	5	3570	2500	জাহাঙ্গীর =৭৫০৳ মাসুদ =৭২০৳	0	f	\N
808	2024-08-31	Rod Mistri Head	0	0	500	 SahAlam over Aug-500 10-10-2024	0	f	\N
813	2024-08-31	Rod Mistri Helper	0	0	450	 Mostafa -Helper 10/10/24	0	f	\N
791	2024-10-13	Rod Mistri Head	4	2700	2000	মিন্টু =৭৫০৳ রিংকু =৭৫০৳\nবুলবুল =৬০০৳  সাকিল= ৬০০৳	0	f	\N
825	2024-10-16	Miscellaneous	0	220	220	মালামাল আনা ভাড়া 	0	f	\N
820	2024-10-15	Raj Mistri Head	4	2870	2000	জাহাঙ্গীর =৭৫০৳ মাসুদ =৭২০৳	0	f	\N
802	2024-10-16	Rod Mistri Helper	6	3000	3000		2	f	\N
796	2024-10-13	Day Labour Bill	0	4000	4000	বালি উঠা ৪তলা ১ গাড় day labour	0	f	\N
1755	2024-11-12	Rod Mistri Helper	3	1500	1500		1	f	\N
1144	2024-10-26	Am Kat	21	0	0	09-09-2024 AB Timber Shop 21 KB  SSD Project  Bill Copy nai ??? Challan no -242	0	f	\N
1145	2024-10-22	Am Kat	0	1458	0	 ALl Project Banner 3X3 Feston 2-10-2024	2	f	\N
1140	2024-10-26	Raj Mistri Head	2	1400	1000	সালাম ৭০০৳\nআলমগীর ৭০০৳	1	f	\N
1157	2024-10-27	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
1153	2024-10-24	Rod Mistri Helper	3	1500	1500		2	f	\N
1148	2024-10-22	Rod Mistri Head	3	2000	1500	মাহফুজ ৭০০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
1698	2024-10-31	Rod Mistri Head	0	0	1000	 Rod Mestry over TK	3	f	\N
1686	2024-11-07	Welder's Helper	0	750	500	দিনে ১ হাজিরা, + ওভার টাইম ২৫০৳	2	f	\N
1688	2024-11-09	Welder's Helper	0	500	500		2	f	\N
1697	2024-11-10	Hardware Materials	0	4119	2000	Riaz Shop hardware  Due 2119	2	f	\N
1702	2024-11-08	Overtime Bill	0	0	0	Engr.Israfil Over Time	3	f	\N
1714	2024-11-06	Project Deposit	0	50000	50500		5	f	\N
1721	2024-11-11	Office Cost	0	0	650	SSD Pervez + Full Zaro 02pcs  + Landowner Mofiz picture 24 pcs	6	f	\N
1725	2024-11-12	Office Cost	0	0	198	Sugar+ biscuit+ Ginger	6	f	\N
1726	2024-10-25		0	0	400	Avalone CC Camera Service FEE	6	f	\N
1694	2024-11-10	Welder's Helper	1	500	500		2	f	\N
2040	2024-09-30	Rod Mistri Head	0	0	1600	Rod mestry over Tk Sep-24 Feroz payment Date -19-11-24	2	f	\N
1740	2024-11-11	Rod Mistri Head	3	2100	1500	আনিস ৮০০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳\n	2	f	\N
1682	2024-11-08	Welder's Helper	0	250	250	ওভার টাইম হেল্পার ২৫০৳	2	f	\N
1745	2024-11-11	Miscellaneous	0	200	200	লেবার নাস্তা খরচ ২০০৳	2	f	\N
1761	2024-11-12	Steel Rod Purchase	0	0	100000	 Spire Rod Paid by MD Sir Cash house	4	f	\N
1737	2024-11-10	Project Deposit	0	65000	35082		5	f	\N
1750	2024-11-11	Raj Mistri Head	3	2100	1500	সালাম ৭০০৳ সাগর ৭০০৳ হাফিজুর রহমান ৭০০৳	1	f	\N
1765	2024-11-11	Rod Mistri Helper	12	6100	6000	ওবায়দুল ৫৫০৳,মাসুদ =৫৫০৳	0	f	\N
2029	2024-11-24	Rod Mistri Head	4	2900	2000	সোহেল =৮০০৳,সুরেশ =৬৫০৳,রিংকু =৭৫০৳	0	f	\N
2034	2024-11-24	Guard Salary	0	2000	2000	দিদার নভেম্বর 	0	f	\N
1733	2024-11-10	Raj Mistri Helper	7	3500	3500	 	0	f	\N
1770	2024-11-11	Sanitary Mistri Head	3	1800	1800	 Contact	0	f	\N
2002	2024-10-31	Rod Mistri Head	0	0	3500	 Oct 24 Over Tk Dulal payment date -21-11-2024	3	f	\N
2006	2024-11-24	Bricks Purchase	12000	140000	120000	 UCB Cheque no-1534341 Habib Bricks RSB Peket	0	f	\N
2019	2024-11-22	Overtime Bill	0	0	0	Engr.Israfil Over Time 	3	f	\N
2039	2024-10-31	Rod Mistri Head	0	0	3400	rod mestry over Tk oct-24 Salim + Arif payment -19-11-24	2	f	\N
2051	2024-11-25	Raj Mistri Head	4	2920	2000	একই মিস্তিরি 	0	f	\N
2055	2024-11-25	Sanitary Mistri Head	2	1200	1200		0	f	\N
2057	2024-11-25	Sand	1	14500	14500	সাদা বালি ১গাড়ি	0	f	\N
2059	2024-11-25	Head Welder	0	0	500	মাথার টাকা নভেম্বর =৫০০৳	0	f	\N
2045	2024-11-24	Rod Mistri Helper	3	1550	1500	রিফাত ৫৫০	2	f	\N
2063	2024-11-18	Rod Mistri Helper	5	2500	2500		1	f	\N
2065	2024-11-19	Rod Mistri Head	3	2250	1500	রাসেল ৮০০৳,কাসেম ৭৫০৳,সোহাগ ৭০০৳	1	f	\N
2004	2024-11-19	Rod Mistri Head	4	3000	2100	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
2008	2024-11-19	Miscellaneous	3	660	660	ক্যাশ মেমো	3	f	\N
2010	2024-11-20	Rod Mistri Helper	4	2000	2000		3	f	\N
2012	2024-11-21	Rod Mistri Head	4	3100	2100	ইউসুফ=850৳\nলাভলু =800৳\nরাশেদুল=750৳	3	f	\N
2014	2024-11-22	Rod Mistri Head	4	3100	2100	ইউসুফ=850৳\nলাভলু =800৳\nরাশেদুল=750৳	3	f	\N
2021	2024-11-23	Rod Mistri Helper	2	1000	1000		3	f	\N
2023	2024-11-24	Rod Mistri Helper	2	1000	1000		3	f	\N
2241	2024-11-21		0	0	350000	UCB Cheque  1534339 + IFIC Shahjahan	0	f	\N
2245	2024-10-07	Steel Rod Purchase	0	0	100000	UCb Imbp 1879027	3	f	\N
809	2024-07-31	Rod Mistri Head	0	0	2500	 Shah Alam july -10-10-24	0	f	\N
814	2024-08-31	Rod Mistri Helper	0	0	300	Rajo Helper -10/10/24	0	f	\N
815	2024-10-10	Rod Mistri Head	0	5000	5000	 Samso Accident Cost	0	f	\N
792	2024-10-13	Rod Mistri Helper	4	2050	2000	ওবায়দুল =৫৫০৳	0	f	\N
797	2024-10-13	Miscellaneous	0	2140	2140	ক্যাশ মেমো	0	f	\N
816	2024-10-14	Rod Mistri Head	4	2700	2000		0	f	\N
821	2024-10-15	Raj Mistri Helper	6	3000	3000		0	f	\N
803	2024-10-16	Hardware Materials	0	4670	4670	টঙ্গী থেকে \n১/ গুনাতার ১ কয়েল\n২/ কাটিং ব্লেড ২ টা\n৩/ কাটিং ব্লেড ৫০ টি\n৪/ টেপ, বীট	2	f	\N
1141	2024-10-26	Raj Mistri Helper	2	1000	1000		1	f	\N
1158	2024-10-27	Rod Mistri Helper	6	3000	3000		1	f	\N
1152	2024-10-24	Rod Mistri Head	2	1300	1000	সেলিম ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
1683	2024-11-08	Day Labour Bill	0	1000	1000	৩য় তালা ছাদে পাথর উঠানো হয়েছে ১০০ বস্তা	2	f	\N
1690	2024-11-10	Rod Mistri Head	3	2100	1500	আনিস ৮০০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
1709	2024-11-01	Project Deposit	0	0	0	 Friday 	5	f	\N
1716	2024-11-08	Project Deposit	0	13000	13000	 Friday	5	f	\N
2031	2024-11-24	Raj Mistri Head	4	2920	2000	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳,রিয়াদ=৭৫০৳	0	f	\N
1723	2024-11-11	Office Cost	0	0	120	 Dir Sir Nasta	6	f	\N
1724	2024-11-11	Office Cost	0	0	80	Scarlet Convinece	6	f	\N
1699	2024-11-08	Rod Mistri Head	2	1450	1000	রাশেদুল=750৳	3	f	\N
1704	2024-11-09	Rod Mistri Helper	3	1550	1500	জুবায়েত=550৳	3	f	\N
1735	2024-11-10	Rod Mistri Helper	12	6100	6000	ওবায়দুল =৫৫০৳,মাসুদ =৫৫০৳	0	f	\N
1738	2024-11-10	Electrician	0	0	12000	 UCB Cheque Md Sir Paid	0	f	\N
1742	2024-11-11	Head Welder	1	800	500	আল-আমীন রাতের ফুল হাজিরা	2	f	\N
1762	2024-11-11	Project Deposit	0	53000	78150		5	f	\N
1752	2024-11-12	Raj Mistri Head	1	700	500	সাগর ৭০০৳ 	1	f	\N
1757	2024-11-13	Rod Mistri Helper	2	1000	1000		1	f	\N
1707	2024-11-09	Cement	150	75000	0	 SSD Project Received by Guard Didar Shah Cement Rate-500	4	f	\N
1772	2024-10-31	Rod Mistri Helper	0	0	0	মাথার টাকা অক্টোবর মাসে =১৩৫০৳	0	f	\N
1767	2024-11-11	Head Welder	1	800	500		0	f	\N
1711	2024-11-03	Project Deposit	0	90000	89730	 Liton From Liton \n Ava+ Spire Khorakee-10000	5	f	\N
2003	2024-10-31	Rod Mistri Head	0	0	100	Rod Mestry over Tk Oct-24 Payment date-18-11-2024	3	f	\N
2035	2024-10-31	Rod Mistri Head	0	0	4200	 Rod mestry over tk oct-24 , payment date-17-11-2024	2	f	\N
2036	2024-09-30	Rod Mistri Head	0	0	500	over Helper Sep-24 payment Date-17-11-24	2	f	\N
2041	2024-11-17	Signing Money	0	0	100000	UCB Cheque no -1534336 EBL Deposited	3	f	\N
2088	2024-11-22	Miscellaneous	0	0	0	Engr. Efath Overtime 	1	f	\N
2110	2024-07-31	Raj Mistri Head	0	0	9000	Raz over Tk July-24 Payment Date- 23-11-24	0	f	\N
2053	2024-11-25	Rod Mistri Head	5	3500	3500	সোহেল =৮০০৳,বুলবুল =৬০০৳,সুরেশ =৬৫০৳,রিংকু =৭৫০৳	0	f	\N
2123	2024-11-26	Miscellaneous	0	500	500	মোটরসাইকেল তেল 	0	f	\N
2046	2024-11-25	Rod Mistri Head	3	2150	1500	আনিস ৮০০৳\nআরিফ ৬৫০৳\nআহমেদ ৭০০৳	2	f	\N
2074	2024-11-21	Head Welder	1	800	500	আল আমিন ৮০০৳	1	f	\N
2076	2024-11-21	Chipping Head	1	2000	2000	সাহেব আলী ২০০০৳	1	f	\N
2078	2024-11-21	Sanitary Goods	0	3439	3439	ক্যাশ মেমো (১০০+২৪৮৪+৮৫৫)=৩৪৩৯৳	1	f	\N
2080	2024-11-22	Rod Mistri Helper	4	2000	2000		1	f	\N
2068	2024-11-20	Rod Mistri Helper	3	1500	1500		1	f	\N
2070	2024-11-20	Miscellaneous	0	100	100	সিমেন্ট নেয়র লেবার ১০০৳	1	f	\N
2082	2024-11-22	Raj Mistri Helper	1	500	500		1	f	\N
2084	2024-11-22	Concrete-Casting	0	26000	26000	সাত তালা ছাদ ঢালাই বাবদ ২৬০০০৳	1	f	\N
2086	2024-11-22	Miscellaneous	0	1200	1200	খাবার বাবদ ১২০০৳	1	f	\N
2090	2024-11-23	Rod Mistri Helper	4	2000	2000		1	f	\N
2092	2024-11-23	Raj Mistri Helper	1	500	500		1	f	\N
2101	2024-11-25	Rod Mistri Helper	1	500	500		1	f	\N
2106	2024-11-26	Rod Mistri Helper	2	1000	1000		1	f	\N
2107	2024-11-26	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
2016	2024-11-22	Rod Mistri Helper	2	1000	1000		3	f	\N
2025	2024-11-24	Miscellaneous	4	665	665	ক্যাশ মেমো-4	3	f	\N
2027	2024-11-24	Sanitary Mistri Helper	1	500	500		3	f	\N
2126	2024-11-27	Rod Mistri Helper	8	4050	4000	Rifat 550	2	f	\N
2048	2024-11-25	Am Kat	52	23947	30000	আম কাঠ ক্রয় ৫২.০৬ কেবি UCB Cheque Received by Asad Office 	2	f	\N
812	2024-09-30	Rod Mistri Helper	0	0	50	 mostafa Sep-24 over 10/10/24	0	f	\N
852	2024-10-18	Day Labour Bill	0	7200	7200	খোয়া ভাঙ্গা ১২০০০ পিস।	2	f	\N
854	2024-10-18	Miscellaneous	0	200	0	দুপুরে খাবার বিল \nগার্ড ও ইঞ্জিনিয়ার \nOnly for one day.	2	f	\N
831	2024-10-15	Door Frame Purchase	56	141200	120000	M.H Timber Mosharrf 03 Cheque UCB  	0	f	\N
832	2024-10-12	Door Frame Purchase	5	0	0	M.H Timber Mosharrf 03 Cheque UCB	0	f	\N
834	2024-09-30	Bricks Purchase	12000	125000	50000	 From Tuli mam IFIC Bank Deposited cash	0	f	\N
835	2024-10-16	Bricks Purchase	0	0	50000	 SSD From Sakawat  Cash IFIC Bank Deposited	0	f	\N
836	2024-10-16	Bricks Purchase	12000	138000	120000	 MD Sir Cash Night Memo no -11491,11489 peket	2	f	\N
714	2024-10-09	Rod Mistri Head	5	3650	2500	রব্বানী ৯০০৳\nজহুরুল ৭৫০৳\nশাকিল-২ ৬০০৳\nসোহেল১ ৭০০৳\nসোহেল২ ৭০০৳	2	f	\N
777	2024-10-14	Rod Mistri Head	6	4250	3000	জহুরুল ৭৫০৳\nমাহফুজ ৭০০৳\nসোহেল১ ৭০০৳\nসোহেল২ ৭৫০৳\nফিরোজ ৭০০৳\nসেলিম ৬৫০৳	2	f	\N
839	2024-07-31	Rod Mistri Head	0	0	7250	June July-24	0	f	\N
845	2024-10-15	Steel Rod Purchase	1086	99833	0	 Challan no -714 ,10 Ml -1012 Kg + 16 ML 74 Kg = 1086 Rate  SSD PRoject	4	f	\N
807	2024-07-30	Rod Mistri Head	0	0	900	shadin july 24 over Tk 10/10/24	0	f	\N
840	2024-08-31	Rod Mistri Head	0	0	750	 Minto Rod Mestry Aug-24	0	f	\N
841	2024-08-31	Rod Mistri Head	0	0	200	 obaidul 3/10/24	0	f	\N
842	2024-08-31	Rod Mistri Head	0	0	3220	 Mustak Aug-24 4/10/2024	0	f	\N
843	2024-08-31	Rod Mistri Head	0	0	400	Mustak Aug-24 4/10/2024	2	f	\N
844	2024-10-17	Steel Rod Purchase	0	0	200000	 UCB No -1509663 SAH Project	4	f	\N
847	2024-10-11	Cement	200	102000	0	200 Bag Spire project  Challan no -1860535 Dhalai Top Floor	4	f	\N
871	2024-10-14	Miscellaneous	0	140	140	ক্যাশ মেমো	1	f	\N
853	2024-10-18	Miscellaneous	0	400	0	ইঞ্জি. বিজয় ওভার টাইম 	2	f	\N
819	2024-10-15	Rod Mistri Helper	7	3550	3500	ওবায়দুল =৫৫০৳	0	f	\N
826	2024-10-16	Miscellaneous	3	3715	3715	ক্যাশ মেমো	0	f	\N
827	2024-10-16	Raj Mistri Head	4	2870	2000	জাহাঙ্গীর ৭৫০৳ মাসুদ = ৭২০৳	0	f	\N
828	2024-10-16	Raj Mistri Helper	7	3500	3500		0	f	\N
829	2024-10-16	Rod Mistri Helper	7	3550	3500	ওবায়দুল ৫৫০৳	0	f	\N
801	2024-10-16	Rod Mistri Head	6	4250	3000	জহুরুল ৭৫০৳\nমাহফুজ ৭০০৳\nসোহেল১ ৭০০৳\nসোহেল২ ৭৫০৳\nফিরোজ ৭০০৳\nসেলিম ৬৫০৳	2	f	\N
848	2024-10-17	Rod Mistri Head	2	1350	1000	ফিরোজ ৭০০৳\nসেলিম ৬৫০৳	2	f	\N
850	2024-10-18	Rod Mistri Head	3	2050	1500	মাহফুজ ৭০০৳\nসেলিম ৬৫০৳\nফিরোজ ৭০০৳	2	f	\N
855	2024-10-12	Rod Mistri Head	2	1400	1000	কাসেম=৭০০৳\nরাসেল=৭০০৳	1	f	\N
856	2024-10-12	Rod Mistri Helper	6	3000	3000		1	f	\N
857	2024-10-12	Miscellaneous	0	2000	2000	বুয়া বিল (জুলাই ২০২৪)	1	f	\N
860	2024-10-13	Electrician	4	2000	2000		1	f	\N
861	2024-10-13	Miscellaneous	0	120	120	যাতায়াত ভাড়া (পাইপ আনা)	1	f	\N
858	2024-10-13	Rod Mistri Head	2	1400	1000	রাসেল =৭০০৳\nকাসেম =৭০০৳	1	f	\N
859	2024-10-13	Rod Mistri Helper	6	3000	3000		1	f	\N
862	2024-10-13	Miscellaneous	0	300	300	যাতায়াত ভাড়া (রড আনা- ১৭ থেকে ১৫)	1	f	\N
863	2024-10-14	Rod Mistri Head	2	1400	1000	কাসেম =৭০০৳\nরাসেল =৭০০৳	1	f	\N
864	2024-10-14	Rod Mistri Helper	6	3000	3000		1	f	\N
874	2024-10-15	Head Welder	1	800	500	আল আমিন ৮০০৳	1	f	\N
866	2024-10-14	Welder's Helper	2	1000	1000		1	f	\N
867	2024-10-14	Electrician	1	1000	1000		1	f	\N
868	2024-10-14	Concrete-Casting	0	25000	25000		1	f	\N
872	2024-10-15	Rod Mistri Head	2	1400	1000	রাসেল =৭০০৳\nকাসেম =৭০০৳	1	f	\N
869	2024-10-14	Miscellaneous	0	1000	1000	খাবার বাবদ	1	f	\N
870	2024-10-14	Miscellaneous	0	350	350	যাতায়াত ভাড়া 	1	f	\N
873	2024-10-15	Rod Mistri Helper	6	3000	3000		1	f	\N
1146	2024-10-24	Project Deposit	0	35000	32410		5	f	\N
875	2024-10-15	Welder's Helper	2	1000	1000		1	f	\N
849	2024-10-17	Rod Mistri Helper	5	2500	2500		2	f	\N
851	2024-10-18	Rod Mistri Helper	6	3000	3000		2	f	\N
838	2024-08-31	Rod Mistri Head	0	0	750	Rabbani over Tk.11-10-2024	0	f	\N
833	2024-10-09	Bricks Purchase	6000	50000	0	 Number Habib bricks Quality Valo na Due Return dheetee hobee	1	f	\N
846	2024-10-15	Steel Rod Purchase	958	87873	0	Spire Project 10 Ml - 506 Kg + 16 Ml  -452 = 958 Kg Challan no -715	4	f	\N
865	2024-10-14	Head Welder	1	800	500	আল আমিন =৮০০৳	1	f	\N
837	2024-10-16	Bricks Purchase	6000	69000	69000	Memo no -11490 ,Peket Habib Bricks 6000 pcs Due	3	f	\N
876	2024-10-16	Rod Mistri Head	2	1400	1000	কাসেম =৭০০৳\nরাসেল =৭০০৳	1	f	\N
881	2024-10-17	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
886	2024-10-18	Rod Mistri Head	2	1400	1000	কাসেম ৭০০৳\nরাসেল ৭০০৳	1	f	\N
1143	2024-10-20	Am Kat	9	4255	0	29-8-2024 AB Timber SSD Project   Challan no 240 Rate-460 tk per kb	0	f	\N
1160	2024-10-27	Raj Mistri Helper	2	1000	1000		1	f	\N
1151	2024-10-23	Rod Mistri Helper	4	2000	2000		2	f	\N
1147	2024-10-24	Guard Salary	0	11000	3000	 Bkash  Liton Office Guard Rabiul Salary oct-24	2	f	\N
1691	2024-11-10	Rod Mistri Helper	4	2000	2000		2	f	\N
1710	2024-11-02	Project Deposit	0	70000	69655		5	f	\N
1713	2024-11-05	Project Deposit	0	30000	29700		5	f	\N
1717	2024-11-09	Project Deposit	0	50000	49770		5	f	\N
1720	2024-11-11	Utility	0	0	3000	SSD Project Desco 	6	f	\N
1722	2024-11-12	Marketing Expenses	0	0	700	 SSD PVC Baner 4X8 =32 fit  X 22 =	6	f	\N
1701	2024-11-08	Miscellaneous	1	650	650	Spire থেকে সিমেন্ট (২০ব্যাগ) আনা হয়েছে ভ্যান ভাড়া	3	f	\N
1706	2024-11-09	Hardware Materials	0	185	185	ক্যাশ মেমো	3	f	\N
1739	2024-11-10	Sanitary Mistri Head	0	0	10000	 Monsur Paid By D. Sir Cash Office present Due- 10200	8	f	\N
1744	2024-11-11	Hardware Materials	2	200	200	ডিজেল ১ লিটার\nজুট ৬০ টাকার।	2	f	\N
1747	2024-11-12	Rod Mistri Helper	5	2500	2500		2	f	\N
1760	2024-08-31	Head Welder	0	14300	11000	 11 Days Aug-24 Paid-11000	0	f	\N
1749	2024-11-11	Rod Mistri Helper	3	1500	1500		1	f	\N
1754	2024-11-12	Rod Mistri Head	2	1050	1000	রাসেল 35০৳ কাসেম ৭০০৳	1	f	\N
1759	2024-11-13	Raj Mistri Helper	4	2000	2000		1	f	\N
2037	2024-10-31	Rod Mistri Head	0	0	4125	Rod over Tk  Oct-24 Payment Date - 18-11-24	2	f	\N
1764	2024-11-11	Rod Mistri Head	7	5200	3500	Mestry Name Nai ????	0	f	\N
1769	2024-11-11	Miscellaneous	2	1000	1000	ক্যাশ মেমো	0	f	\N
1774	2024-11-11	Raj Mistri Helper	7	3500	3500		0	f	\N
2043	2024-10-31	Raj Mistri Head	0	0	5600	 Raz over Tk Oct-24 Payment date-18-11-2024	0	f	\N
2030	2024-11-24	Rod Mistri Helper	8	4200	4000	ওবায়দুল =৫৫০৳,মাসুদ =৫৫০৳,আশিক =৫৫০৳,লাকু=৫৫০৳	0	f	\N
2060	2024-11-25	Raj Mistri Head	0	0	1000	জাহাঙ্গীর মাথার টাকা নভেম্বর =১০০০৳	0	f	\N
2052	2024-11-25	Raj Mistri Helper	5	2500	2500		0	f	\N
2054	2024-11-25	Rod Mistri Helper	9	4700	4500	একই হেলপার 	0	f	\N
2056	2024-11-25	Day Labour Bill	0	6500	6500	বালি উঠা ৭ তলা	0	f	\N
2058	2024-11-25	Day Labour Bill	0	7200	7200	খোয়া ভাঙা ১২ হাজার ইট 	0	f	\N
2120	2024-11-26	Rod Mistri Head	5	3500	3500	সোহেল =৮০০৳,রিংকু =৭৫০৳,সুরেশ =৬৫০৳,বুলবুল =৬০০৳	0	f	\N
2044	2024-11-24	Rod Mistri Head	4	2800	2000	আনিস ৮০০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳\nআহমেদ ৭০০৳	2	f	\N
2115	2024-11-26	Rod Mistri Helper	3	1550	1500	Rifat 550৳	2	f	\N
2062	2024-11-18	Rod Mistri Head	3	2350	1500	রাসেল ৮০০৳,কাসেম ৭৫০৳,লাবলু ৮০০৳	1	f	\N
2064	2024-11-18	Miscellaneous	0	225	225	ক্যাশ মেমো ২২৫৳	1	f	\N
2066	2024-11-19	Rod Mistri Helper	5	2500	2500		1	f	\N
2094	2024-11-24	Rod Mistri Head	3	2250	1500	রাসেল ৮০০৳,কাসেম ৭৫০৳,সোহাগ ৭০০৳	1	f	\N
2096	2024-11-24	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
2098	2024-11-24	Sanitary Mistri Head	1	700	700	 ??????	1	f	\N
2102	2024-11-25	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
2104	2024-11-25	Miscellaneous	0	1000	1000	চৌকাঠ আনার পিকাপ ভাড়া ১০০০৳	1	f	\N
2108	2024-11-26	Raj Mistri Helper	1	500	500		1	f	\N
2005	2024-11-19	Rod Mistri Helper	4	2050	2000	জুবায়েত=550৳	3	f	\N
2007	2024-11-19	Miscellaneous	0	500	500	রাতে রড পাহারা দেওয়া	3	f	\N
2009	2024-11-20	Rod Mistri Head	3	2300	1600	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
2011	2024-11-20	Miscellaneous	2	105	105	রড মিস্ত্রি গাড়ি ভাড়া 80৳\nক্যাশ মেমো 25৳	3	f	\N
2013	2024-11-21	Rod Mistri Helper	4	2000	2000		3	f	\N
2018	2024-11-22	Miscellaneous	0	280	280	ক্যাশ মেমো	3	f	\N
2020	2024-11-23	Rod Mistri Head	4	3100	2100	ইউসুফ=850৳\nলাভলু =800৳\nরাশেদুল=750৳	3	f	\N
2022	2024-11-24	Rod Mistri Head	4	3100	2100	ইউসুফ=850৳\nলাভলু =800৳\nরাশেদুল=750৳	3	f	\N
2247	2024-10-15	Steel Rod Purchase	0	0	250000	UCB + IBBL 	3	f	\N
2251	2024-10-29	Steel Rod Purchase	0	0	200000	UCB -Cheque	3	f	\N
2260	2024-10-15	Steel Rod Purchase	958	87873	0	91 Rate	1	f	\N
2265	2024-11-11	Steel Rod Purchase	5000	442500	0	Rate -88	1	f	\N
877	2024-10-16	Rod Mistri Helper	5	2500	2500		1	f	\N
882	2024-10-17	Rod Mistri Helper	5	2500	2500		1	f	\N
887	2024-10-18	Rod Mistri Helper	5	2500	2500		1	f	\N
1159	2024-10-27	Raj Mistri Head	2	1400	1000	সালাম ৭০০৳\nআলমগীর ৭০০৳	1	f	\N
1149	2024-10-22	Rod Mistri Helper	4	2000	2000		2	f	\N
1154	2024-10-26	Rod Mistri Head	2	1300	1000	সেলিম ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
2109	2024-09-30	Rod Mistri Head	0	0	1000	 Rod Lovelo over Tk- Sep-24 payment Date -19-11-2024 	1	f	\N
2111	2024-11-26	Marketing Expenses	0	32500	32500	 Gift Palace 30 pcs Dairy set Cheque UCB 30500 + Cash Liton payment Bkash -2000 22-11-2024	6	f	\N
1692	2024-11-10	Rod Mistri Helper	4	2000	2000		2	f	\N
1696	2024-11-10	Hardware Materials	0	200	200	তেল ১ লিটার ও জুট	2	f	\N
1708	2024-11-11	Steel Rod Purchase	5000	442500	0	Spire Project GPH Rod 10 ml=3000Kg + 12 Ml =500kg + 16ml= 500kg + 20ml =1000Kg Rate 88.50  TK Per Kg	4	f	\N
1719	2024-11-10	Office Cost	0	0	630	 Mofiz Landowner + Stamp Cartize 	6	f	\N
1695	2024-11-10	Hardware Materials	1	1022	1022	মেমো নং ৬৫৫৩	2	f	\N
1687	2024-11-09	Head Welder	1	800	500	আল-আমীন দিনে	2	f	\N
1700	2024-11-08	Rod Mistri Helper	3	1550	1500	জুবায়েত=550৳	3	f	\N
1705	2024-11-09	Electric Items Purchase	0	1560	1560	ক্যাশ মেমো	3	f	\N
1743	2024-11-11	Welder's Helper	1	500	500		2	f	\N
1746	2024-11-12	Rod Mistri Head	3	2100	1500	আনিস ৮০০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
1748	2024-11-11	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳ কাসেম ৭০০৳	1	f	\N
1753	2024-11-12	Raj Mistri Helper	1	500	500		1	f	\N
1758	2024-11-13	Raj Mistri Head	4	2800	2000	সালাম ৭০০৳ সাগর ৭০০৳ হাফিজুর রহমান ৭০০৳ \nকালাম ৭০০৳	1	f	\N
1736	2024-11-10	Chipping Head	1	2000	2000		0	f	\N
1768	2024-11-11	Welder's Helper	1	500	500		0	f	\N
1773	2024-11-11	Raj Mistri Head	4	2850	2000	জাহাঙ্গীর =৭৫০৳	0	f	\N
1712	2024-11-04	Project Deposit	0	46500	47550	 UCB From Liton 10000	5	f	\N
2093	2024-10-31	Rod Mistri Head	0	0	2650	Rod Yousuf 2400 & Rinko 250 over Tk. Oct-24 Payment Date 13-11-24 	3	f	\N
2067	2024-11-20	Rod Mistri Head	3	2250	1500	রাসেল ৮০০৳,কাসেম ৭৫০৳,সোহাগ ৭০০৳	1	f	\N
2095	2024-11-24	Rod Mistri Helper	2	1000	1000		1	f	\N
2097	2024-11-24	Raj Mistri Helper	1	500	500		1	f	\N
2099	2024-11-24	Sanitary Goods	0	2586	2586	ক্যাশ মেমো ২৫৮৬৳	1	f	\N
2103	2024-11-25	Raj Mistri Helper	1	500	500		1	f	\N
2113	2024-11-26	Welder's Helper	1	500	500		1	f	\N
2105	2024-11-26	Rod Mistri Head	1	800	500	রাসেল ৮০০৳	1	f	\N
2248	2024-10-18	Cement	150	76500	0	Rate 510	3	f	\N
2252	2024-11-17	Steel Rod Purchase	5000	440000	0	Rate -88	3	f	\N
2256	2024-10-01	Steel Rod Purchase	0	0	100000	IBBL 	1	f	\N
2261	2024-10-23	Cement	20	10600	0		1	f	\N
2274	2024-11-29	Overtime Bill	0	0	0	Engr.Rahinur Over time 	3	f	\N
2285	2024-10-17	Steel Rod Purchase	0	0	200000	UCB SPDL Cheque	2	f	\N
2293	2024-09-25	Cement	0	0	360000	SSD Mahmuda Siddiqa cheque	2	f	\N
2281	2024-12-02	Cement	0	0	100000	Spire Project 	4	f	\N
2405	2024-12-07	Rod Mistri Helper	1	500	0		1	f	\N
2314	2024-11-30	Raj Mistri Helper	5	2500	2500		0	f	\N
2317	2024-12-01	Head Welder	1	800	500		0	f	\N
2327	2024-12-02	Raj Mistri Head	4	2900	2000	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭৫০৳	0	f	\N
2332	2024-12-02	Electrician	1	1000	1000		0	f	\N
2335	2024-12-02	Sand	2	29000	29000	২ গাড়ি সাদা বালি 	0	f	\N
2340	2024-12-03	Head Welder	1	800	500		0	f	\N
2343	2024-12-03	Miscellaneous	0	1700	1700	ছাদ ঢালাই খাবার বাবদ 	0	f	\N
2374	2024-12-05	Sanitary Mistri Head	2	1200	1200		0	f	\N
2369	2024-12-05	Rod Mistri Helper	3	1600	1500	একই হেলপার 	0	f	\N
2349	2024-12-03	Day Labour Bill	0	3400	3400	রড ক্লাবমোড় টু প্রজেক্ট আনা বাবদ খরচ।	2	f	\N
2350	2024-12-04	Rod Mistri Head	5	3400	2500	আনিস ৮০০৳\nআরিফ ৬৫০৳\nসেলিম ৭০০৳\nআহমেদ ৬৫০৳\nবুলবুল ৬০০৳	2	f	\N
2381	2024-12-06	Head Welder	1	800	500		0	f	\N
2383	2024-12-01	Rod Mistri Head	2	1500	1000	রাসেল ৮০০৳,সোহাগ ৭০০৳	1	f	\N
2385	2024-12-01	Miscellaneous	0	1000	1000	পিকাপ ভাড়া ১০০০৳	1	f	\N
2390	2024-12-02	Raj Mistri Helper	1	500	500		1	f	\N
2395	2024-12-04	Rod Mistri Head	2	1500	1000	রাসেল ৮০০৳,সোহাগ ৭০০৳	1	f	\N
2400	2024-12-05	Rod Mistri Head	2	1500	1000	রাসেল ৮০০৳,সোহাগ ৭০০৳	1	f	\N
2402	2024-12-05	Raj Mistri Helper	1	500	500		1	f	\N
883	2024-10-17	Head Welder	1	800	500	আল আমিন ৮০০৳	1	f	\N
1156	2024-10-26	Hardware Materials	0	1300	1300	পেরেক ২", ২.৫" (১০ কেজি)\nস্টিল পেরেক ১ কেজি 	1	f	\N
878	2024-10-16	Head Welder	1	800	500	আল আমিন ৮০০৳	1	f	\N
1155	2024-10-26	Rod Mistri Helper	2	1000	1000		2	f	\N
1150	2024-10-23	Rod Mistri Head	3	2000	1500	মাহফুজ ৭০০৳\nসেলিম ৬৫০৳\nআরিফ ৬৫০৳	2	f	\N
1689	2024-11-09	Miscellaneous	4	400	400	কোড়াবাড়ি মেরামত 	2	f	\N
1715	2024-11-07	Project Deposit	0	36500	36200		5	f	\N
1718	2024-11-10	Office Cost	0	0	1000	 Daraz payment spray office	6	f	\N
1693	2024-11-10	Head Welder	1	800	500	আল-আমীন ৮০০৳	2	f	\N
1703	2024-11-09	Rod Mistri Head	2	1450	1000	রাশেদুল=750৳	3	f	\N
1734	2024-11-10	Rod Mistri Head	7	5200	3500	সোহেল =৮০০৳,মিন্টু =৭৫০৳,রব্বানী =৯০০৳,বুলবুল =৬০০৳,জহরুল- ৭৫০৳,সুরেশ =৬৫০৳,রিংকু =৭৫০,	0	f	\N
1741	2024-11-11	Rod Mistri Helper	4	2000	2000		2	f	\N
1763	2024-11-13	Office Cost	0	0	420	 Hot Line Recharge Hasan Nov-24	6	f	\N
1751	2024-11-11	Raj Mistri Helper	3	1500	1500		1	f	\N
1756	2024-11-13	Rod Mistri Head	1	700	500	কাসেম ৭০০৳	1	f	\N
1771	2024-10-31	Rod Mistri Head	0	0	0	মাথার টাকা অক্টোবর মাসে ২৩০০০৳	0	f	\N
1766	2024-11-11	Chipping Head	1	1000	1000		0	f	\N
2124	2024-11-26	Mobile Bill	0	300	0	ইন্জি. রাহিনুর অক্টোবর মাসে 	0	f	\N
2119	2024-11-26	Raj Mistri Helper	5	2500	2500		0	f	\N
2114	2024-11-26	Rod Mistri Head	4	2800	2000	Anis 800৳\nSelim 650৳\nArif 650৳\nAhommod 700৳	2	f	\N
2249	2024-10-24	Steel Rod Purchase	1326	121497	0	Rate -90.80	3	f	\N
2253	2024-11-17	Steel Rod Purchase	0	0	450000	UCB Cheque	3	f	\N
2257	2024-10-03	Steel Rod Purchase	0	0	100000	UCB Imp	1	f	\N
2262	2024-10-26	Cement	50	25500	0	Rate-510	1	f	\N
2275	2024-11-29	Overtime Bill	0	0	0	Asad over time 	3	f	\N
2286	2024-10-19	Cement	350	182000	0	Rate 520 Super create	2	f	\N
2289	2024-10-27	Steel Rod Purchase	0	0	300000	UCB cheque	2	f	\N
1942	2024-11-19	Steel Rod Purchase	0	0	100000	UCB  Cheque spire	4	f	\N
2296	2024-10-05	Steel Rod Purchase	6500	581750	0	89.5 Rate	0	f	\N
2298	2024-10-09	Steel Rod Purchase	0	0	200000	 UCB + IBBL + TUli Mam	0	f	\N
2295	2024-12-02	Steel Rod Purchase	0	0	100000	UCB Spdl Yeasin 	1	f	\N
2270	2024-11-29	Rod Mistri Head	1	850	600	ইউসুফ=850৳	3	f	\N
2404	2024-12-07	Rod Mistri Head	1	800	0	রাসেল ৮০০৳	1	f	\N
2407	2024-12-07	Raj Mistri Helper	1	500	0		1	f	\N
1649	2024-11-07	Raj Mistri Head	5	3570	2500	জাহাঙ্গীর =৭৫০, মাসুদ= ৭২০৳	0	f	\N
1732	2024-11-10	Raj Mistri Head	5	3570	2500	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭২০৳	0	f	\N
2315	2024-11-30	Sand	1	44000	44000	১ গাড়ি লাল বালি 	0	f	\N
2323	2024-12-01	Sand	1	14500	14500	সাদা বালি  ১ গাড়ি 	0	f	\N
2318	2024-12-01	Welder's Helper	1	500	500		0	f	\N
2328	2024-12-02	Raj Mistri Helper	5	2500	2500		0	f	\N
2333	2024-12-02	Miscellaneous	0	100	100	সিমেন্ট আনলোড বকশিস 	0	f	\N
2344	2024-12-03	Miscellaneous	0	400	400	সিমেন্ট আনলোড বকশিস 	0	f	\N
2336	2024-12-03	Raj Mistri Head	4	2900	2000	একই মিস্তিরি 	0	f	\N
2342	2024-12-03	Electrician	1	1000	1000		0	f	\N
2355	2024-12-04	Rod Mistri Helper	3	1600	1500	ওবায়দুল =৫৫০৳,আশিক =৫৫০৳	0	f	\N
2359	2024-12-04	Head Welder	1	800	500		0	f	\N
2376	2024-12-05	Day Labour Bill	0	12000	12000	পাথর ১/২ গাড়ি, সাদা বালি ১গাড়ি, কিছু খোয়া উঠানো	0	f	\N
2368	2024-12-05	Rod Mistri Head	3	2150	1500	একই মিস্তিরি 	0	f	\N
2411	2024-12-01	Raj Mistri Head	0	0	3000	রাজ মিস্ত্রি সাকিম গাড়ি ভাড়া 3000৳  December-24	3	f	\N
2409	2024-12-01	Rod Mistri Head	1	850	600	ইউসুফ=850৳	3	f	\N
2414	2024-12-02	Raj Mistri Head	2	1500	0		3	f	\N
2412	2024-12-02	Rod Mistri Head	1	850	600	ইউসুফ=850৳	3	f	\N
2413	2024-12-02	Rod Mistri Helper	3	1550	1500	তারেক 550৳	3	f	\N
2348	2024-12-03	Rod Mistri Helper	7	3600	3500	Rifat 550৳\nObaidul 550৳	2	f	\N
2364	2024-12-05	Rod Mistri Helper	5	2600	2500	Rifat 550৳\nMasud 550৳	2	f	\N
2373	2024-12-05	Welder's Helper	1	500	500		0	f	\N
2380	2024-12-06	Raj Mistri Helper	5	2500	2500		0	f	\N
2389	2024-12-02	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
2394	2024-12-03	Raj Mistri Helper	1	500	500		1	f	\N
824	2024-10-16	Guard Salary	0	1000	1000	সেপ্টেম্বর মাস	0	f	\N
879	2024-10-16	Miscellaneous	0	2000	2000	বুয়া বিল (আগস্ট ২০২৪)	1	f	\N
884	2024-10-17	Welder's Helper	2	1000	1000		1	f	\N
1167	2024-10-26	Welder's Helper	1	500	500		0	f	\N
1161	2024-10-26	Raj Mistri Head	4	2820	2000	মাসুদ =৭২০৳	0	f	\N
1164	2024-10-26	Rod Mistri Helper	7	3550	3500	মাসুদ =৫৫০৳	0	f	\N
1182	2024-10-26	Cement	50	25500	0	Avalone 50 Bag .Rate 510 tk	4	f	\N
1184	2024-10-28	Steel Rod Purchase	5200	472160	0	SSD=1300 kg  SAH =3900Kg=Total =5200 KG	4	f	\N
1204	2024-07-31	RAJUK clearance	0	90500	90500		0	f	\N
1170	2024-10-27	Raj Mistri Head	6	4270	3000	জাহাঙ্গীর =৭৫০৳, মাসুদ =৭২০৳	0	f	\N
1195	2024-10-28	Raj Mistri Helper	6	3000	3000	3000	0	f	\N
1200	2024-10-28	Miscellaneous	2	1530	1530	ক্যাশ মেমো	0	f	\N
1775	2024-11-13	MD Sir Personal Cost	0	0	3000	 MD Sir Received From Office Paid by Liton	6	f	\N
1815	2024-10-31	Rod Mistri Helper	0	0	1350	Rod Helper Over Tk Extra -400 ????	0	f	\N
1778	2024-11-12	Rod Mistri Helper	11	5600	5500	 Mestry Name Ullekh nai ??	0	f	\N
1783	2024-11-12	Head Welder	1	800	500		0	f	\N
1788	2024-11-12	Miscellaneous	0	500	500	নেট বিল নভেম্বর 	0	f	\N
1791	2024-11-13	Rod Mistri Head	3	2100	1500	আনিস ৮০০৳\nসেলিম ৬৫০৳\nআরিফ  ৬৫০৳	2	f	\N
1798	2024-11-10	Miscellaneous	3	540	540	রেজিস্ট্রার খাতা 200৳\nরড মিস্ত্রি যাতায়াত ভাড়া 140৳\nরড মিস্ত্রি বকশিস 200৳	3	f	\N
1803	2024-11-12	Rod Mistri Helper	3	1550	1500	জুবায়েত=550৳	3	f	\N
1808	2024-11-14	Rod Mistri Head	4	3000	2100	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
1821	2024-11-14	Razia Tower Cost	0	0	5000	 Lift Nasir 4000+1000	6	f	\N
1824	2024-11-13	Rod Mistri Helper	11	5700	5500	মাসুদ =৫৫০৳,ওবায়দুল =৫৫০৳,আশিক ৫৫০৳,লাকু=৫৫০৳	0	f	\N
1830	2024-11-13	Miscellaneous	0	500	500	মোটরসাইকেল তেল 	0	f	\N
1833	2024-11-13	Maid Salary	0	3000	3000	অক্টোবর মাসে 	0	f	\N
1845	2024-11-14	Welder's Helper	1	500	500		0	f	\N
1846	2024-11-14	Sanitary Mistri Head	3	1800	1800		0	f	\N
1855	2024-11-15	Chipping Head	1	1000	1000	৯ তলা চিপিং শুরু 	0	f	\N
1857	2024-11-15	Miscellaneous	0	500	500	ইন্জি.রাহিনুর ওভার টাইম    SAH project 	0	f	\N
1858	2024-11-16	Rod Mistri Head	6	4250	3000	মিন্টু =৭৫০,রিংকু =৭৫০৳,সোহেল =৮০০৳,সুরেশ =৬৫০৳,বুলবুল =৬০০৳	0	f	\N
1896	2024-11-17	Raj Mistri Helper	6	3000	3000		0	f	\N
1867	2024-11-14	Rod Mistri Helper	4	2000	2000		1	f	\N
1872	2024-11-15	Rod Mistri Head	1	700	500	কাসেম ৭০০৳	1	f	\N
1878	2024-11-16	Raj Mistri Head	1	700	700	সাগর ৭০০৳	1	f	\N
1883	2024-11-17	Raj Mistri Head	1	700	500	সাগর ৭০০৳	1	f	\N
1903	2024-11-16	Rod Mistri Helper	4	2050	2000	জুবায়েত=550৳	3	f	\N
1907	2024-11-17	Miscellaneous	0	65	65	ক্যাশ মেমো	3	f	\N
1864	2024-11-16	Miscellaneous	0	2610	2610	ক্যাশ মেমো	0	f	\N
1913	2024-11-18	Rod Mistri Helper	9	4700	4500	মাসুদ =৫৫০৳,ওবায়দুল =৫৫০৳,লাকু=৫৫০,আশিক =৫৫০৳	0	f	\N
1918	2024-11-18	Welder's Helper	1	500	500		0	f	\N
1889	2024-11-17	VAT & TAX	0	0	3060	 Month of October-24 Ali Emran Flat Ragistration 3100000 / vat = 62000 	6	f	\N
2117	2024-11-26	Overtime Bill	0	2100	0	Eng. Bijoy Over time+Mob. Bill= 2100৳\n[26/07/24 = 400৳\nJuly mobile bill= 300৳\n09/08/24 = 400৳\nAugust mobile bill= 300৳\n18/10/24 = 400৳\nOctober mobile bill= 300৳]	2	f	\N
2121	2024-11-26	Rod Mistri Helper	10	5200	5000	ওবায়দুল =৫৫০৳,মাসুদ =৫৫০৳,লাকু=৫৫০৳,আশিক =৫৫০৳	0	f	\N
2250	2024-10-26	Cement	50	25500	0	Rate-510	3	f	\N
2254	2024-11-26	Cement	150	75000	0	 Rate-500	3	f	\N
2258	2024-10-03	Steel Rod Purchase	5000	457500	0	Rate -91.5	1	f	\N
2263	2024-11-05	Cement	100	50000	0	Rate-500	1	f	\N
2282	2024-10-03	Steel Rod Purchase	0	0	700000	IBBL Cheque no-3824912	2	f	\N
2287	2024-10-20	Cement	0	0	150000	UCB Cheque no-1509666	2	f	\N
1888	2024-11-17	Steel Rod Purchase	0	0	450000	Cash Md Sir 400000+ UCb Cheque 50000 Avalone	4	f	\N
2297	2024-10-06	Steel Rod Purchase	0	0	300000	IBBL	0	f	\N
2290	2024-12-01	Steel Rod Purchase	0	0	650000	UCB Cheque 02 pcs MS Taioba Steel Corporation Yeasin	2	f	\N
2271	2024-11-29	Rod Mistri Helper	2	1000	1000		3	f	\N
2276	2024-11-30	Rod Mistri Head	1	850	600	ইউসুফ=850৳	3	f	\N
1819	2024-11-14	Project Deposit	0	45000	45075		5	f	\N
2321	2024-12-01	Sanitary Mistri Head	0	4000	4000	হোল্ড কাটিং ব্লেড 	0	f	\N
2410	2024-12-01	Rod Mistri Helper	3	1550	1500	তারেক 550৳	3	f	\N
830	2024-10-16	Raj Mistri Head	6	4250	3000	মিন্টু =৭৫০৳ রিংকু =৭৫০৳ সুরেশ =৬৫০৳ সাকিল-৬০০৳ বুলবুল =৬০০৳ রব্বানী =৯০০৳	0	f	\N
888	2024-09-30	Rod Mistri Head	0	0	4050	 rod Mestry Rabbani Sep-24 Over TK. 15-10-2024	0	f	\N
889	2024-08-31	Rod Mistri Head	0	0	400	 Rod Rabbani Aug-24 over tk 15-10-2024	3	f	\N
891	2024-09-30	Raj Mistri Head	0	0	1000	 Masud Raj over Tk. Sep-24 Payment -15-10-2024	0	f	\N
892	2024-09-30	Rod Mistri Head	0	0	400	 Rod Suresh over Tk Sep-24 payment date-16-10-2024	0	f	\N
893	2024-09-30	Rod Mistri Head	0	0	600	 Rod Mestry Suresh over tk . Sep-24 16-10-2024	2	f	\N
1188	2024-10-26	Project Deposit	0	38000	37510		5	f	\N
885	2024-10-17	Miscellaneous	0	160	160	যাতায়াত ভাড়া ১৬০৳	1	f	\N
1190	2024-10-20	Architect	0	750000	700000	Architect Nasima Islam  14-9-2024 last payment	0	f	\N
1174	2024-10-27	Miscellaneous	0	80	80	ক্যাশ মেমো	0	f	\N
898	2024-10-15	Signing Money	0	10000000	9400000	 22-12-2020 to 08-06-2024	0	f	\N
899	2024-10-15	Signing Money	0	0	200000	UCB IM cheque no	0	f	\N
900	2024-10-20	Signing Money	0	3000000	2700000	05-06-2022 to 14-12-2023 	1	f	\N
880	2024-10-16	Hardware Materials	0	3790	3790	ক্যাশ মেমো (হাড্ওয়ার মালামাল)	1	f	\N
1201	2024-10-28	Miscellaneous	0	500	500	মোটরসাইকেল তেল 	0	f	\N
907	2024-08-20	Stone	0	961986	961986	 SK Enterprise  4 Track 	1	f	\N
906	2023-09-17	Stone	0	1729800	1729800	 18-6-2023 to 17-09-2023	1	f	\N
905	2024-10-11	Stone	0	149158	149158	 SK Enterprise 697 Cft , Rate =214  	1	f	\N
908	2024-08-21	Stone	0	1301526	1301526	Sk Enterprise 10 Track Pailing at	3	f	\N
909	2024-08-20	Stone	0	1082000	1082000	22-5-23 to 20-6-2023	2	f	\N
911	2024-10-20	Stone	0	5291935	5291935	21-3-2022 to 8-4-2024 Nazim + Khaleque + Z.S Enterprise + Japan Others 	0	f	\N
912	2024-10-20	Stone	0	906307	906307	 SK Enterprise  18-8-2024  8 Track 	0	f	\N
913	2024-10-20	Stone	0	5000	5000	 MD Sir Bkash Japan	0	f	\N
910	2024-08-20	Stone	0	464511	464511	 SK Enterprise 4 Track Stone  SSD Client 	2	f	\N
916	2024-08-15	Bricks Purchase	0	6913000	6913000	06-04-2022 to 15-8-2024 	0	f	\N
917	2024-08-30	Chipping Head	0	6500	6500	up to -30-8-2023	0	f	\N
918	2024-07-01	Rod Mistri Head	0	4492120	4492120	 up to 31-07-2024	0	f	\N
919	2024-10-20	Plan Pass/Approval	0	50000	50000	31-12-2021 Brokar Rasel 	0	f	\N
920	2024-10-20	Deed	0	140000	140000	26-9-2023 vander Aowlad Power Deed + Agreement	0	f	\N
895	2024-10-17	Project Deposit	0	100000	98175		5	f	\N
914	2024-07-31	Piling Expense	0	1244500	1244500	23-5-22 to 11-10-2022 B. M Pailing Cost 	0	f	\N
1820	2024-11-15	Project Deposit	0	26000	25950	Friday	5	f	\N
896	2024-10-18	Project Deposit	0	42300	37040	 MD Sir Deposited Only Side visit Friday	5	f	\N
915	2024-07-31	Day Labour Bill	0	1467404	1467404	up to -14-7-2024 day labour 	0	f	\N
922	2024-10-19	Cement	150	76500	0	 SSD Project Cement , Rate -510 Tk per Bag	4	f	\N
904	2024-08-20	Signing Money	0	2000000	1600000	04-10-2022 to 11-12-2023  Landownner Badrunnaher Gong 	3	f	\N
902	2024-08-20	Architect	0	190000	110000	 Eng Nurullah  150000+ Revised 40000 = 190000 Contract	3	f	\N
890	2024-08-31	Rod Mistri Head	0	0	1550	 Road Rabbani Aug-24 over TK -15-10-2024	0	f	\N
1162	2024-10-26	Raj Mistri Helper	4	2000	2000		0	f	\N
1179	2024-10-23	Cement	20	10600	0	 Spire Project	4	f	\N
1165	2024-10-26	Electrician	1	600	600	27-10-24 Paid	0	f	\N
921	2024-07-31	Plan Pass/Approval	0	585000	585000	 Nazmul Rajuk Office 8-2-2021+ Speed Money + Pervez Inspector at	0	f	\N
1169	2024-10-27	Raj Mistri Helper	7	3500	3500		0	f	\N
1175	2024-10-28	Rod Mistri Head	2	1400	1000	রাসেল ৭০০৳\nকাসেম ৭০০৳	1	f	\N
1186	2024-10-28	Rod Mistri Helper	1	500	500		2	f	\N
1196	2024-10-28	Rod Mistri Head	7	5000	3500	মিন্টু =৭৫০৳,রিংকু =৭৫০৳,বুলবুল =৬০০৳জহরুল=৭৫০৳,সোহেল =৮০০৳,সুরেশ =৬৫০৳,	0	f	\N
1776	2024-11-13	Miscellaneous	0	0	20000	Asad Khorakee Avalon+ Spire Received from Office Paid by Liton	6	f	\N
1801	2024-10-02		0	0	20000	Asad Salary Aug-24 From Office Cash Paid by Liton	6	f	\N
1812	2024-11-14	Project Deposit	0	20300	0	 Pizza Burg Desco Bill Oct-24  20300+ Bank Alfalah Deposited -120000	6	f	\N
1781	2024-11-12	Raj Mistri Helper	7	3500	3500		0	f	\N
1786	2024-11-12	Sanitary Mistri Head	3	1800	1800		0	f	\N
1811	2024-11-14	Rod Mistri Helper	5	2500	2500		2	f	\N
1800	2024-11-11	Rod Mistri Helper	3	1550	1500	জুবায়েত=550৳	3	f	\N
1804	2024-10-31	Rod Mistri Head	0	0	4000	রাশেদুল রড মিস্ত্রি মাথার টাকা -October =4000৳ Payment Date 11-11-24	3	f	\N
1809	2024-11-14	Rod Mistri Helper	4	2050	2000	জুবায়েত=550৳	3	f	\N
1822	2024-11-14	Engineer Salary	0	0	5000	Engineer Esrafil Salary Avalon Project Due 7000	6	f	\N
1827	2024-11-13	Sanitary Mistri Head	3	1800	1800		0	f	\N
2255	2024-11-28	Cement	0	0	100000	UCB Dir Sir Imp 	3	f	\N
2426	2024-12-01	Project Deposit	0	64000	47150		5	f	\N
2429	2024-12-04	Project Deposit	0	40000	42550		5	f	\N
2430	2024-12-07	Day Labour Bill	0	6870	0	দিনমজুর (ইট ও পাথর উঠানো হয়েছে) \n১/ ৫৫০০ ইট ৬ তালায় = ৫৬৮০৳\n২/ ৫০০ ইট ৮ তালায় = ৬৫০৳\n৩/ ২০ ব্যাগ পাথর ৮ তালায় =৫৪০৳\n★ দিনমজুর মোট বিল = ৬৮৭০৳	1	f	\N
2415	2024-12-02	Raj Mistri Helper	2	1100	1000		3	f	\N
2416	2024-12-03	Rod Mistri Head	2	1600	1100	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
2420	2024-12-03	Rod Mistri Head	0	0	2000	রড মিস্ত্রি রাশেদুল গাড়ি ভাড়া 2000৳(December )	3	f	\N
2423	2024-12-04	Raj Mistri Head	2	1500	1000		3	f	\N
2432	2024-12-07	Rod Mistri Helper	3	1550	1500	Rifat 550৳	2	f	\N
2435	2024-12-05	Concrete-Casting	0	2500	2500	৯৭০০০ হাজার paid	0	f	\N
2438	2024-12-07	Raj Mistri Head	5	3600	2500	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭৫০৳	0	f	\N
2441	2024-12-07	Miscellaneous	0	260	260	ক্যাশ মেমো	0	f	\N
2427	2024-12-02	Project Deposit	0	100000	116650		5	f	\N
2419	2024-12-03	Raj Mistri Helper	2	1100	1000		3	f	\N
2417	2024-12-03	Rod Mistri Helper	5	2600	2500	তারেক 550৳\nমান্নান =550৳	3	f	\N
2418	2024-12-03	Raj Mistri Head	2	1500	1000		3	f	\N
2421	2024-12-04	Rod Mistri Head	2	1600	1100	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
2424	2024-12-04	Raj Mistri Helper	2	1500	1000		3	f	\N
2433	2024-12-06	Rod Mistri Head	4	2700	2000	Anis 800৳\nArif 650৳\nAhmad 650৳\nBulbul 600৳	2	f	\N
2436	2024-12-07	Rod Mistri Head	3	2150	1500	সোহেল =৮০০৳,রিংকু =৭৫০৳,লাকু=৬০০৳	0	f	\N
2439	2024-12-07	Raj Mistri Helper	5	2500	2500		0	f	\N
2442	2024-12-07	Head Welder	1	800	500		0	f	\N
2428	2024-12-03	Project Deposit	0	96000	98400		5	f	\N
2425	2024-12-04	Miscellaneous	0	50	50	লে- আউট সুতা	3	f	\N
2445	2024-12-05	Bricks Purchase	15000	162500	162500	Mega Bricks Pecket  Rate 28500 only bricks 3000 pcs 	2	f	\N
2434	2024-12-06	Rod Mistri Helper	3	1550	1500	Masud 550৳	2	f	\N
2431	2024-12-07	Rod Mistri Head	5	3400	2500	Anis 800৳\nSelim 700৳\nArif 650৳\nBulbul 600৳\nAhmad 650৳	2	f	\N
2446	2024-12-04	Bricks Purchase	9000	97500	97500	 Mega Bricks no 9000 pcs SSD Project Ucb to Asia 	0	f	\N
2447	2024-12-02	Bricks Purchase	12000	130000	130000	 Mega Bricks no 12000 pcs UCB to Asia	3	f	\N
2448	2024-12-02	Bricks Purchase	6000	67000	80000	 RSB Bricks Habib Due UCB to IFIC Bank Rate 67000 TK  Pecket 6000 pcs	0	f	\N
2449	2024-11-27	Office Cost	0	12000	12000	 Softwere Muthashim Ucb Cheque Payfor December-24	6	f	\N
2450	2024-11-28	Office Cost	0	0	160	Tea+ Biscuit	6	f	\N
2452	2024-11-29	Office Cost	0	0	150	Dalai vist Avalon Friday Convince	6	f	\N
2453	2024-11-30	Marketing Expenses	0	0	1920	 Avalon PVC Banner Scarlet	6	f	\N
2454	2024-11-30	Razia Tower Cost	0	0	95	Md Sir House 572 Azampur Drowing Photocopy Asad	6	f	\N
2451	2024-11-28	R.T Deposit	0	28000	0	 Tacos Shop Pervez Deposited  21 -11-24 to 28-11-24 = 8 days X3500= 28000	6	f	\N
2455	2024-12-01	Utility	0	0	4000	SSD Project Desco Bill	6	f	\N
2456	2024-12-01	MD Sir Personal Cost	0	0	280	 Dir Sir Lunch	6	f	\N
2457	2024-12-02	Office Cost	0	0	1230	 500 ml Water 04 case ginger + buscuit	6	f	\N
2458	2024-12-02	Razia Tower Cost	0	0	400	 Uttara Stone Diabari Werehouse + Cermic Tali Labour Baksis	6	f	\N
2459	2024-12-03	MD Sir Personal Cost	0	0	2700	 Car Gas Recharge + Dir Sir Bluetuth 	6	f	\N
2460	2024-12-03	Office Cost	0	0	3400	TP Link AR cher C6 Office	6	f	\N
2461	2024-12-04	MD Sir Personal Cost	0	0	750	 MD Sir Orange + Show Mozza	6	f	\N
2462	2024-12-05	Office Cost	0	0	2500	 Boa Salary Month of Nov-24	6	f	\N
2463	2024-12-05	Office Cost	0	0	180	 Tuli mam house Payment Received + Azampur	6	f	\N
2464	2024-12-07	Razia Tower Cost	0	0	2200	 RT Stair Wale Tali Advance + Uttara Stone Labour Baksis 	6	f	\N
2465	2024-12-07	Utility	0	0	4000	SSD Desco Bill Recharge	6	f	\N
2466	2024-12-07	Office Cost	0	0	1155	Off Router Self + A4 120 Gsm paper + Buscuit + Suger + Coffee	6	f	\N
2467	2024-12-04	Sanitary Goods	0	399284	300000	UCB Cheeque 02 pcs 250000+ 50000 N. Poly pipe Al Amin Senatary	0	f	\N
2468	2024-12-04		0	116200	115000	 SSD Project UCB Cheque  Kazi Steel Corporation Squreber Rate -88.50 Per Kg	0	f	\N
2469	2024-12-04	Signing Money	0	50000	50000	 Landowner Rasel UCB Cash Cheque UCB Bank in Pay	7	f	\N
2437	2024-12-07	Rod Mistri Helper	3	1600	1500	ওবায়দুল =৫৫০৳,মাসুদ =৫৫০৳	0	f	\N
2440	2024-12-07	Miscellaneous	0	500	500	মোটরসাইকেল তেল 	0	f	\N
2443	2024-12-07	Welder's Helper	1	500	500		0	f	\N
2444	2024-12-07	Miscellaneous	0	500	500	WiFi bill Month of December-24	0	f	\N
2470	2024-12-02	Cement	150	75000	0	 SSD Project rate -500	4	f	\N
2471	2024-12-03	Cement	450	225000	0	 SSD Rate 500 Top Floor	4	f	\N
2472	2024-12-03	Cement	50	25000	0	Spire Rate 500	4	f	\N
2473	2024-12-04	Cement	50	25000	0	Avalon rate 500	4	f	\N
2474	2024-12-05	Cement	0	0	100000	SSD Project UCB Cheque Sir	4	f	\N
2475	2024-12-08	Cement	0	0	200000	 SSD Project UCB Cheque no - 1534366	4	f	\N
2477	2024-12-08	Rod Mistri Helper	5	2650	0	মাসুদ =৫৫০৳,ওবায়দুল =৫৫০৳,আশিক =৫৫০৳	0	f	\N
2478	2024-12-08	Raj Mistri Head	5	3600	0	একই মিস্তিরি 	0	f	\N
2481	2024-12-08	Welder's Helper	2	1000	0		0	f	\N
2482	2024-12-08	Maid Salary	0	2000	0	নভেম্বর মাস 	0	f	\N
2386	2024-12-01	Guard Salary	0	4000	4000	লালমিয়া নভেম্বর মাসের বেতন ৪০০০৳.	1	f	\N
2483	2024-12-05	Rod Mistri Head	2	1600	0	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
2484	2024-12-05	Rod Mistri Helper	4	2050	0	মান্নান ৫৫০৳	3	f	\N
2485	2024-12-05	Raj Mistri Head	2	1500	0		3	f	\N
2486	2024-12-05	Raj Mistri Helper	2	1100	0		3	f	\N
2487	2024-12-05	Miscellaneous	0	1630	0		3	f	\N
2488	2024-12-05	Miscellaneous	0	100	0	ড্রয়িং শিট কনভেন্স	3	f	\N
2489	2024-12-05	Mobile Bill	2	600	0	October, November 	3	f	\N
2490	2024-12-05	Guard Salary	0	0	0	গার্ড শামসুল গাড়ি ভাড়া বাবদ1000৳	3	f	\N
2491	2024-12-05	Miscellaneous	0	200	0	রড মিস্ত্রি বকশিস 	3	f	\N
2492	2024-12-06	Rod Mistri Head	2	1600	0	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
2493	2024-12-06	Rod Mistri Helper	4	2050	0	মান্নান ৫৫০৳	3	f	\N
2494	2024-12-06	Raj Mistri Head	2	1500	0		3	f	\N
2495	2024-12-06	Raj Mistri Helper	2	1100	0		3	f	\N
2496	2024-12-06	Overtime Bill	0	0	0	Engineer Israfil Over time 400৳	3	f	\N
2497	2024-12-06	Miscellaneous	0	1500	0	SSD থেকে লাকড়ি আনা পিকাপ ভাড়া	3	f	\N
2480	2024-12-08	Sanitary Mistri Head	2	1200	1200		0	f	\N
2476	2024-12-08	Rod Mistri Head	3	2150	1500	একই মিস্তিরি 	0	f	\N
2498	2024-12-07	Rod Mistri Head	2	1600	0	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
2504	2024-12-08	Rod Mistri Head	2	1600	0	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
2509	2024-12-08	Hardware Materials	2	875	0	ক্যাশ মেমো	3	f	\N
2514	2024-12-09	Raj Mistri Head	3	2250	0		3	f	\N
2524	2024-12-08	Raj Mistri Head	0	0	0	গাড়ি ভাড়া ডিসেম্বর =১৫০০৳	0	f	\N
2529	2024-12-09	Sanitary Mistri Head	2	1200	0		0	f	\N
2519	2024-12-08	Day Labour Bill	0	12500	12500	পিকেট ইট ভাঙ্গা ১৫০০০ ইট Rate 1000 Pcs =600	2	f	\N
2522	2024-12-09	Rod Mistri Helper	6	3050	3000	রিফাত ৫৫০৳	2	f	\N
2499	2024-12-07	Rod Mistri Helper	4	2050	0	মান্নান ৫৫০৳	3	f	\N
2505	2024-12-08	Rod Mistri Helper	4	2050	0	মান্নান ৫৫০৳	3	f	\N
2510	2024-12-08	Cement	0	0	0	পাশের দোকানে সিমেন্টের বাকি ছিলো  1600৳ পাইলিং এর সময় 	3	f	\N
2515	2024-12-09	Raj Mistri Helper	2	1100	0		3	f	\N
2523	2024-12-08	Miscellaneous	0	1775	0	ক্যাশ মেমো	0	f	\N
2528	2024-12-09	Raj Mistri Helper	5	2550	0	মাসুম =৫৫০৳	0	f	\N
2399	2024-12-04	Miscellaneous	0	5200	5200	৬০০০ পিকেট ইট ভাঙ্গা হয়েছে ৩৬০০৳ + ৯৬ সিএফটি খোয়া ভাঙ্গা হয়েছে ১৬০০৳। মোটঃ ৫২০০৳	1	f	\N
2520	2024-12-07	Miscellaneous	0	500	500	WiFi বিল ডিসেম্বর মাস	2	f	\N
2521	2024-12-09	Rod Mistri Head	5	3400	2500	আনিস ৮০০৳\nআরিফ ৬৫০৳\nসেলিম ৭০০৳\nআহমেদ ৬৫০৳\nবুলবুল ৬০০৳	2	f	\N
2500	2024-12-07	Raj Mistri Head	2	1500	0		3	f	\N
2502	2024-12-07	Miscellaneous	0	500	0	কাঠ,মাচা আনা পিকাপ ভাড়া 	3	f	\N
2506	2024-12-08	Raj Mistri Head	2	1500	0		3	f	\N
2511	2024-12-08	Electrician	1	600	0		3	f	\N
2516	2024-12-09	Miscellaneous	0	170	0	ক্যাশ মেমো	3	f	\N
2526	2024-12-09	Rod Mistri Helper	5	2650	0	ওবায়দুল =৫৫০৳,মাসুদ =৫৫০৳,আশিক =৫৫০৳	0	f	\N
2531	2024-12-09	Miscellaneous	1	710	0	মোটরসাইকেল মেরামত 	0	f	\N
2501	2024-12-07	Raj Mistri Helper	2	1100	0		3	f	\N
2503	2024-12-07	Guard Salary	0	0	0	গার্ড শামসুল বেতন 1500 -December 24	3	f	\N
2507	2024-12-08	Raj Mistri Helper	2	1100	0		3	f	\N
2512	2024-12-09	Rod Mistri Head	2	1600	0	ইউসুফ=850৳\nরাশেদুল=750৳	3	f	\N
2527	2024-12-09	Raj Mistri Head	5	3600	0	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭৫০৳	0	f	\N
2532	2024-12-09	Miscellaneous	0	100	0	ইন্জি.  সাফি কন.	0	f	\N
2517	2024-12-08	Rod Mistri Head	4	2750	2000	আনিস ৮০০৳\nসেলিম ৭০০৳\nআহম্মদ ৬৫০৳\nবুলবুল ৬০০৳	2	f	\N
2508	2024-12-08	Electric Items Purchase	0	2364	0	ক্যাশ মেমো	3	f	\N
2513	2024-12-09	Rod Mistri Helper	4	2050	0	মান্নান ৫৫০৳	3	f	\N
2525	2024-12-09	Rod Mistri Head	3	2150	0	সোহেল =৮০০৳,রিংকু =৭৫০৳,লাকু=৬০০৳	0	f	\N
2530	2024-12-09	Welder's Helper	2	1000	0		0	f	\N
2536	2024-12-08	Steel Rod Purchase	208	17626	0	 Spire	4	f	\N
2537	2024-12-08		474	39884	0	Avalone	4	f	\N
2538	2024-12-11	Steel Rod Purchase	0	0	100000	SAH Project  Rad Bill	4	f	\N
2539	2024-11-30	Rod Mistri Head	0	0	4000	 Over Tk Rasel 2600+ Kasem =1400/= Payment Date -5-12-2024	1	f	\N
2540	2024-11-23	Rod Mistri Head	0	0	2000	Over TK Rasel 2000 Payment date 23-11-2024 Nov-24	1	f	\N
1796	2024-11-10	Rod Mistri Helper	8	4050	4000	জুবায়েত=550৳	3	f	\N
2542	2024-12-10	Rod Mistri Head	2	1550	0	সোহেল =৮০০৳,রিংকু =৭৫০৳	0	f	\N
2543	2024-12-10	Rod Mistri Helper	5	2650	0	আশিক =৫৫০৳,মাসুদ =৫৫০৳,ওবায়দুল =৫৫০৳	0	f	\N
2544	2024-12-10	Raj Mistri Head	5	3600	0	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭৫০৳	0	f	\N
2545	2024-12-10	Raj Mistri Helper	6	3050	0	মাসুম =৫৫০৳	0	f	\N
2546	2024-12-10	Miscellaneous	0	200	0	SSD টু SAH মালামাল আনা নেওয়া ভাড়া 	0	f	\N
2547	2024-12-10	Miscellaneous	0	100	0	ইন্জি.  কন	0	f	\N
2548	2024-12-10	Day Labour Bill	0	13000	0	৯ হাজার ইট উঠা ৬,৭ তলা	0	f	\N
2549	2024-12-10	Guard Salary	0	2000	0	নভেম্বর মাস 	0	f	\N
2550	2024-12-10	Cement	300	148500	148500	Cement Lafarge Holcim  Rate 495/= Per Bag with TDS 2% UCB Cheque to Pubali Bank AC Pay 	2	f	\N
2518	2024-12-08	Rod Mistri Helper	5	2550	2500	রিফাত ৫৫০৳	2	f	\N
2533	2024-12-10	Rod Mistri Head	4	2800	2000	আনিস ৮০০৳\nআরিফ ৬৫০৳\nসেলিম ৭০০৳\nআহমেদ ৬৫০৳	2	f	\N
2534	2024-12-10	Rod Mistri Helper	5	2550	2500	রিফাত ৫৫০৳	2	f	\N
2535	2024-12-10	Guard Salary	0	7000	7000	নভেম্বর মাসের বেতন ৭০০০৳ From Office Liton by Received Asad\n(আসাদ সাহেব।)	2	f	\N
2551	2024-12-10	Cement	100	49500	49500	Lafarge Holcim Cement Ucb to Pubali Bank Rate 495 With TDS 2% at	0	f	\N
2479	2024-12-08	Raj Mistri Helper	5	2550	2500	মাসুম =৫৫০৳	0	f	\N
2552	2024-12-05		0	57000	56990		5	f	\N
2553	2024-12-06		0	17000	17000		5	f	\N
2554	2024-12-07		0	33000	33230		5	f	\N
2555	2024-12-08	Project Deposit	0	50000	49844		5	f	\N
2556	2024-12-09	Project Deposit	0	30000	30200		5	f	\N
2557	2024-12-10	Project Deposit	0	40000	41450		5	f	\N
2558	2024-12-11	Rod Mistri Head	4	2900	0	 সোহেল =৮০০৳,রিংকু =৭৫০৳,মিন্টু =৭৫০৳,লাকু=৬০০৳	0	f	\N
2559	2024-12-11	Rod Mistri Helper	5	2650	0	ওবায়দুল =৫৫০৳,আশিক =৫৫০৳,মাসুদ =৫৫০৳	0	f	\N
2560	2024-12-11	Raj Mistri Head	5	3600	0	জাহাঙ্গীর =৭৫০৳,মাসুদ =৭৫০৳	0	f	\N
2561	2024-12-11	Raj Mistri Helper	6	3050	0	মাসুম =৫৫০৳	0	f	\N
2562	2024-12-11	Miscellaneous	0	200	0	স্ল্যাব মেরামত করা লেবার নাস্তা বাবদ 	0	f	\N
2563	2024-12-11	Day Labour Bill	0	3600	0	৬ হাজার খোয়া ভাঙা 	0	f	\N
2564	2024-12-11	Miscellaneous	0	100	0	ইন্জি. কন	0	f	\N
2565	2024-12-11	Day Labour Bill	0	1140	0	৭৬ cft খোয়া ভাঙা ১৫ টাকা প্রতি cft	0	f	\N
2566	2024-12-11	Miscellaneous	0	100	0	সিমেন্ট আনলোড বকশিস 	0	f	\N
2567	2024-12-11	Guard Salary	0	4000	0	নভেম্বর =৩০০০৳\nডিসেম্বর =১০০০৳\nদিদার গার্ড বেতন	0	f	\N
2568	2024-11-30	Rod Mistri Head	0	0	0	রিংকু মাথার টাকা নভেম্বর =৩০০০৳	0	f	\N
2569	2024-12-12	Rod Mistri Head	4	2900	0	একই মিস্তিরি 	0	f	\N
2570	2024-12-12	Rod Mistri Helper	5	2650	0	আশিক =৫৫০৳,ওবায়দুল =৫৫০৳,মাসুদ =৫৫০৳	0	f	\N
2571	2024-12-12	Raj Mistri Head	6	4300	0	জাহাঙ্গীর =৭৫০৳, মাসুদ =৭৫০৳	0	f	\N
2572	2024-12-12	Raj Mistri Helper	7	3550	0	মাসুম =৫৫০৳	0	f	\N
2573	2024-12-12	Sanitary Mistri Head	2	1200	0		0	f	\N
2574	2024-12-12	Miscellaneous	0	100	0	ইন্জি. কন.	0	f	\N
2575	2024-12-12	Raj Mistri Head	0	0	0	রাজ মিস্ত্রি গাড়ি ভাড়া =২০০০৳ ডিসেম্বর মাসে 	0	f	\N
2576	2024-12-13	Raj Mistri Head	6	4300	0	একই মিস্তিরি 	0	f	\N
2577	2024-12-13	Raj Mistri Helper	5	2550	0	মাসুম =৫৫০৳	0	f	\N
2578	2024-12-13	Rod Mistri Head	4	2900	0	একই মিস্তিরি 	0	f	\N
2579	2024-12-13	Rod Mistri Helper	6	3150	0	ওবায়দুল =৫৫০৳,মাসুদ =৫৫০৳,আশিক =৫৫০৳	0	f	\N
2580	2024-12-13	Miscellaneous	0	200	0	রড আনলোড করা 	0	f	\N
2581	2024-12-13	Miscellaneous	0	500	0	মোটরসাইকেল তেল 	0	f	\N
2582	2024-12-13	Miscellaneous	0	500	0	ক্যাশ মেমো	0	f	\N
2583	2024-11-30	Rod Mistri Head	0	0	0	মাথার টাকা নভেম্বর =১৪০০০৳	0	f	\N
2584	2024-11-30	Rod Mistri Helper	0	0	0	রড হেলপার মাথার টাকা =৩৫০০৳	0	f	\N
2585	2024-11-30	Raj Mistri Head	0	0	0	মাসুদ রাজ মিস্ত্রি মাথার টাকা নভেম্বর =৫০০৳	0	f	\N
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.payments (id, project_id, unit_id, amount, date, description, cash_bank, remarks) FROM stdin;
1	0	1	200000	2024-05-19	Booking 	Cash	
2	0	1	1800000	2024-05-26	Down payment - SPDL UCB	Bank	
3	0	1	1000000	2024-05-26	Down payment - UCB Imperial(Director) 	Bank	
4	0	1	200000	2024-03-07	SPDL - UCB _7178204	Bank	
6	0	1	200000	2024-09-04	OFFICE	Cash	
80	2	3	150000	2024-01-21	UCB SPDL- RTGS	Bank	
81	2	3	1000000	2023-02-16	Booking Money	Cash	
82	2	3	150000	2024-02-20	UCB SPDL- RTGS	Bank	
83	2	3	150000	2024-03-03	UCB SPDL- RTGS	Bank	
84	2	3	150000	2024-04-28	UCB SPDL- RTGS	Bank	
22	0	4	200000	2023-11-09	Booking Money , UCB SPDL	Bank	
23	0	4	4800000	2023-12-10	Down Payment  UCb  SPDL / BAF personal	Bank	
24	0	4	400000	2024-02-20	IFIC 	Cash	
25	0	4	500000	2024-04-04	RTGS UCB SPDL	Bank	
26	0	4	400000	2024-06-09	Cash MD SIr House	Cash	
27	0	4	200000	2024-07-27	Cash MD Sir House	Cash	
28	0	4	200000	2024-08-14	Cash MD Sir 	Cash	
29	0	4	200000	2024-09-24	MD Sir Cash Car	Cash	
30	0	5	1000000	2024-02-02	Booking Money UCB SPDL	Bank	
31	0	5	8500000	2024-03-05	Down Payment ,  UCB Personal	Bank	
32	0	5	8000000	2024-03-05	P.O  UCB SPDL	Bank	
33	0	5	500000	2024-03-03	RTGS  UCB SPDL	Bank	
34	0	5	1000000	2024-06-05	RTGS UCB Personal	Bank	
35	0	5	1000000	2024-07-09	RTGS UCB Personal	Bank	
36	0	6	400000	2022-12-01	 Booking Money IBBL SPDL	Bank	
37	0	6	900000	2022-12-18	office	Cash	
38	0	6	700000	2022-12-28	MD Personal IBBL	Cash	
39	0	6	200000	2023-02-28	MD Sir Cash Sonali Bank	Cash	
40	0	6	700000	2023-04-17	Sonali Bank  Cash Cheque	Cash	
41	0	6	800000	2023-05-14	UCB SPDL 	Bank	
42	0	6	200000	2024-02-03	office	Cash	
43	0	6	200000	2024-04-03	office	Cash	
44	0	6	200000	2024-06-03	RTGS UCB Personal	Bank	
45	0	6	400000	2024-07-30	RTGS UCB Personal	Bank	
11	2	3	100000	2023-06-18	UCB SPDL- RTGS	Bank	
12	2	3	100000	2023-08-01	UCB SPDL- RTGS	Bank	
10	2	3	150000	2023-10-14	UCB SPDL- RTGS	Cash	
46	0	6	100000	2024-08-01	RTGS UCB Personal	Bank	
14	2	3	300000	2023-05-22	UCB SPDL(MR-46)	Bank	
13	2	3	150000	2023-08-08	UCB SPDL- RTGS	Bank	
8	2	3	150000	2023-11-19	UCB SPDL- RTGS	Bank	
47	0	7	50000	2023-04-05	Booking Money  IBBL SPDL	Bank	
48	0	7	500000	2023-05-14	 Exim to UCB Personal	Bank	
49	0	7	1000000	2023-04-18	Exim  Cash Cheque 	Cash	
50	0	7	450000	2023-06-01	IBBL SPDL Deposited	Bank	
51	0	7	250000	2023-08-08	Exim Bank Cash	Cash	
52	0	7	300000	2023-10-05	IBBL To SPDL Deposited	Bank	
53	0	7	300000	2023-10-31	IFIC Cash Cheque	Cash	
54	0	7	300000	2023-12-03	UCB SPDL	Bank	
55	0	7	300000	2024-01-11	IBBL To SPDL 	Bank	
56	0	7	900000	2024-01-18	IBBL To SPDL + Cash	Bank	
57	0	7	250000	2024-03-07	IBBL TO SPDL	Bank	
58	0	1	300000	2024-09-24	Office	Cash	
96	2	3	150000	2024-10-24	UCB SPDL- RTGS	Bank	
59	0	1	200000	2024-09-04	Office	Cash	
60	0	7	250000	2024-04-04	Cash Office	Cash	
61	0	7	150000	2024-04-28	Cash office	Cash	
62	0	7	250000	2024-05-13	IFIC Cheque Cash	Cash	
63	0	7	250000	2024-07-30	IFIC 	Cash	
64	0	7	250000	2024-08-01	IBBL Transfer SPDL	Bank	
65	0	8	500000	2023-07-22	Booking Money	Cash	
66	0	8	1000000	2023-08-15	Down Payment  Cash	Cash	
67	0	8	1000000	2023-08-24	Exim Bank Cash Cheque	Cash	
68	0	8	3634330	2024-07-30	 All Project Stone 30 Track  17996 CFT Rate=202	Cash	
85	2	3	150000	2024-05-28	UCB SPDL- RTGS	Bank	
72	1	2	5000000	2024-08-13	Booking Money  Pay Order  Ucb SPDl/ Ucb Personal  02	Bank	
73	1	2	0	2024-08-12	After 03 Months  Installment	Cash	
7	2	3	150000	2023-09-18	UCB SPDL- RTGS	Bank	
74	2	12	1500000	2024-09-30	Down Payment- UCB SPDL, IBBL No- MCK 1505563, 	Bank	
86	2	3	150000	2024-06-29	UCB SPDL- RTGS	Bank	
75	2	12	1500000	2024-09-30	Down Imperial - UCB Personal, IBBL No- MCK 1505564	Bank	
76	0	5	300000	2024-09-30	RTGS UCB SPDL	Bank	
79	2	3	150000	2023-12-21	UCB SPDL- RTGS	Bank	
87	2	3	150000	2024-07-31	UCB SPDL- RTGS	Bank	
88	2	3	150000	2024-08-22	UCB SPDL- RTGS	Bank	
89	2	3	150000	2024-09-22	UCB SPDL- RTGS	Bank	
90	0	4	100000	2024-10-09	Cash MD Sir	Cash	
91	0	8	289378	2024-09-30	All Project  03 Track Stone =1348 Cft Rate=215 TK Per Cft 	Cash	
94	1	13	500000	2024-10-12	Booking Money- SPDL UCB RTGS	Bank	
95	0	8	149293	2024-10-11	Spire Project 01 Track Stone =697.63 Cft Rate=215 TK Per Cft	Bank	
97	1	13	950000	2024-10-27	Down Payment SPDL UCB	Bank	
98	1	13	1000000	2024-10-27	Down Payment SPDL Imperial	Bank	
100	1	13	500000	2024-10-28	Down Payment SPDL UCB RTGS	Bank	
99	1	13	450000	2024-10-27	Down Payment 	Cash	
101	0	9	2100000	2024-11-02	Down payment	Cash	
102	0	14	100000	2024-11-03	Booking Money	Cash	
103	0	9	1000000	2024-11-04	Down payment	Cash	
105	0	1	200000	2024-11-07	Office	Cash	
106	0	9	350000	2024-11-16	Down payment	Cash	
107	0	14	1950000	2024-11-17	Down payment(City Bank po- 5141397)	Bank	
108	0	14	1400000	2024-11-17	Down payment(DBBL Po- 3381965)	Bank	
109	1	13	1000000	2024-11-18	Down Payment SPDL UCB RTGS	Bank	
120	0	4	300000	2024-12-05		Cash	
123	0	1	200000	2024-12-11		Bank	
111	2	3	150000	2024-11-24	UCB SPDL- RTGS	Bank	
112	1	13	600000	2024-11-27	Down Payment SPDL UCB RTGS	Bank	
110	0	7	250000	2024-11-20	Bank IFIC no -0157617 Yeasin Received cash cheque	Cash	
113	1	2	1000000	2024-11-28	Pay Order Ucb SPDl by Received AIBL	Bank	
114	1	2	500000	2024-11-28	AIBL Cheque Personal; Dir Sir 	Bank	
115	0	8	149372	2024-11-28	Avalon Project 01 Track Stone =698 Cft Rate=214 TK Per Cft	Cash	
116	0	8	149586	2024-10-30	Spire Project 01 Track Stone =699 Cft Rate=214 TK Per Cft	Cash	
117	0	8	101650	2024-10-21	SAH Project 01 Track Stone =475 Cft Rate=214 TK Per Cft	Cash	
118	0	8	123624	2024-11-28	Spire Project 01 Track Stone =612 Cft Rate=202TK Per Cft	Cash	
119	0	7	2000000	2024-12-03	NBR Bank Pay Order No- 0012619	Bank	
121	0	9	450000	2024-12-05	Office Cash	Cash	
122	2	12	320000	2024-12-09	UCB SPDL , IBBL- 1505565	Bank	
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.projects (id, name, location, start_date, status) FROM stdin;
1	Sarker Spire	Sector 15E	2023-05-18	In Progress
2	Sarker Afroza Heights	Faydabad, Dakshinkhan	2024-06-18	In Progress
3	Sarker Avalon	Sector 17H	2024-03-22	In Progress
0	Sarker Siraj Dream	Azampur	2024-09-07	In Progress
7	New Proposed 	Azampur	2024-10-30	In Progress
5	All Project  Deposit( ASAD)/Cost/Balance/Remark	All Project	2024-09-21	In Progress
6	Office Deposit/Cost/Balance/Remark	House -41,Road - Gareb-E-Newaz Avenue, Sector-11, Uttara, Dhaka-1230	2024-09-26	In Progress
4	M/S Taioba Steel Corporation	House-33, Road-09, Block-E,Sector-15,Uttara, Dhaka 1230	2024-09-17	In Progress
8	Sarker A.B. House	Dakkhin Khan, Uttara, Dhaka	2023-12-31	Completed
\.


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.units (id, project_id, unit_name, date, client_name, client_number, client_nid, amount, paid, sold) FROM stdin;
1	0	7th Floor, Unit-A	2024-06-10	Mahmuda Siddika	01558960882	3313686226315	11100000	337500	t
5	0	2nd Floor, Unit -A+B	2024-02-14	Parvez Ahmed	01781925944	1961454665	22000000	0	t
6	0	8th Floor, Unit -A	2022-12-01	MD. Hasibul Hasan Parag	01858200404	2611038814745	10200000	238000	t
7	0	4th Floor , Unit -A	2023-04-05	MD. Shah jahan	01713667893	7372993589	10500000	250000	t
8	0	5th Floor, Unit-A	2023-07-22	MD. Sheikh Majibar Rahman	01711239795	8681708106	10597800	270000	t
4	0	3rd Floor , Unit-A	2023-11-09	MRs, Tuli Hossain	01995650068	4649783414	10750000	460000	t
2	1	4th Floor, Type- A	2024-08-13	MD.Abu Jafar Miraj	01684786212	4646202954	12500000	1500000	t
12	2	2nd Floor, Unit-A	2024-09-30	Apel Mahamud	01818268084	4631526565	7700000	160000	t
3	2	7th Floor, Type- A	2023-02-16	Mahedi Hasan Polin	01680757795	4192988600	7200000	150000	t
13	1	2nd Floor, Type-A	2024-10-12	Md. Nawshad Parvej	 01717-525920	1942558055	12750000	527778	t
9	0	7th Floor, Unit-B	2023-07-22	Mohammad Shakhawat Hossain	01682558999    	1914065141936	11500000	447223	t
14	0	6th Floor, Unit- B	2024-11-03	Ujjal Suttra Dhar	01717585731	4188723847	11500000	447223	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.users (id, username, password, usertype) FROM stdin;
1	Emam Hasan	$2b$12$H4GgTJ8r85syHmNdfsqRoO5HuKY0FAR/2HTHh4fVmbVv7bHzfpNcS	accountant
2	Shafiqul Islam	$2b$12$RFWSHvXRzj1uH5Sqy8WkM.iQUmbNRUoK8KkUYiEv0mrE3RnX.25.G	accountant
3	Sajid Sarker	$2b$12$IbWoCQD6akjpgvxYSO3BWuhD0N1sNTcx.gVrPxOMoMOnZc71o2NVS	admin
4	sakib	$2b$12$idpWVjPUigxp5EjDSBZtR.Q96mzUwCTnXuKgmvO5ENB2V5oktuTQS	site engineer
5	bijoy	$2b$12$oCNTFfQAkLxK4U.kf5hwmuMQ4i05KHOKg.cUp2B0AoTLVqbOGD9lC	site engineer
6	rahinur	$2b$12$GcTJLL8fJmz3Wzul2Hj/3e/AMjQeF2KSRc//VdKsrI.hqOZg8qCK2	site engineer
7	murad	$2b$12$ujeMKmE.SlRJKqc110U42uOQjhzl3CEKAKofNf5krWbhDbMezMt0G	site engineer
8	string	$2b$12$ffbmk6KlfJAhfXPcO7ggm.YTDEnHCl7ScA/FPCQbnSZKjiYP6MDka	string
9	Israfil	$2b$12$u908Dau9ccVQ0AUFOE90gu.UrlFdj2mSHd6X7Sfupbi/dx2Uirnsm	site engineer
10	efath	$2b$12$0OH0aDL5wlfpgV61bLw4h.A/hPXScSOto/CUKZCHOUCYiYSMXItWG	site engineer
11	SPDLMD	$2b$12$Px8P8Nx2ohDq5YGRL.iSeeoeIggGWBhlweTHvJx36O.9shUHxnjC2	admin
12	demo	$2b$12$osV/TyEHpD3XeyO4Qlboiub/187Xl8B1WJMIP4ux0D6eiZrWXHboy	admin
\.


--
-- Name: daily_billings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.daily_billings_id_seq', 2585, true);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.payments_id_seq', 123, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.projects_id_seq', 8, true);


--
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.units_id_seq', 14, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: daily_billings daily_billings_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.daily_billings
    ADD CONSTRAINT daily_billings_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ix_daily_billings_id; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX ix_daily_billings_id ON public.daily_billings USING btree (id);


--
-- Name: ix_payments_id; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX ix_payments_id ON public.payments USING btree (id);


--
-- Name: ix_projects_id; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX ix_projects_id ON public.projects USING btree (id);


--
-- Name: ix_units_id; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX ix_units_id ON public.units USING btree (id);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- Name: ix_users_username; Type: INDEX; Schema: public; Owner: myuser
--

CREATE UNIQUE INDEX ix_users_username ON public.users USING btree (username);


--
-- Name: daily_billings daily_billings_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.daily_billings
    ADD CONSTRAINT daily_billings_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: daily_billings daily_billings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.daily_billings
    ADD CONSTRAINT daily_billings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: payments payments_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: payments payments_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(id);


--
-- Name: units units_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- PostgreSQL database dump complete
--

