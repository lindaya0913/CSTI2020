--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3 (Debian 12.3-1.pgdg100+1)
-- Dumped by pg_dump version 12.3 (Debian 12.3-1.pgdg100+1)

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
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    id integer NOT NULL,
    name text NOT NULL,
    isad integer
);


ALTER TABLE public.company OWNER TO postgres;

--
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_id_seq OWNER TO postgres;

--
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_id_seq OWNED BY public.company.id;


--
-- Name: httpconnection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.httpconnection (
    id integer NOT NULL,
    company_id integer NOT NULL,
    package_id integer NOT NULL,
    url text NOT NULL,
    ip text
);


ALTER TABLE public.httpconnection OWNER TO postgres;

--
-- Name: httpconnection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.httpconnection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.httpconnection_id_seq OWNER TO postgres;

--
-- Name: httpconnection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.httpconnection_id_seq OWNED BY public.httpconnection.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    company_id integer NOT NULL,
    package_id integer NOT NULL,
    permission_id integer NOT NULL,
    result integer NOT NULL
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO postgres;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- Name: package; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.package (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.package OWNER TO postgres;

--
-- Name: package_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.package_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.package_id_seq OWNER TO postgres;

--
-- Name: package_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.package_id_seq OWNED BY public.package.id;


--
-- Name: permissionlevel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissionlevel (
    id integer NOT NULL,
    constantvalue text NOT NULL,
    level text NOT NULL
);


ALTER TABLE public.permissionlevel OWNER TO postgres;

--
-- Name: permissionlevel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissionlevel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissionlevel_id_seq OWNER TO postgres;

--
-- Name: permissionlevel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissionlevel_id_seq OWNED BY public.permissionlevel.id;


--
-- Name: company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company ALTER COLUMN id SET DEFAULT nextval('public.company_id_seq'::regclass);


--
-- Name: httpconnection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.httpconnection ALTER COLUMN id SET DEFAULT nextval('public.httpconnection_id_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- Name: package id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package ALTER COLUMN id SET DEFAULT nextval('public.package_id_seq'::regclass);


--
-- Name: permissionlevel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissionlevel ALTER COLUMN id SET DEFAULT nextval('public.permissionlevel_id_seq'::regclass);


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (id, name, isad) FROM stdin;
1	facebook	\N
2	google	\N
3	unity3d_rollic	\N
4	unity3d	\N
5	adjust_unity3d	\N
6	vungle	\N
7	tapjoy_mopub	\N
8	applovin	\N
9	tapjoy	\N
10	mopub	\N
11	applovin_mopub	\N
12	fyber	\N
13	fyber_mopub	\N
14	facebook_mopub	\N
15	mintegral_mopub	\N
16	mintegral	\N
17	ironsource	\N
18	quickscanner	\N
19	bumptech_quickscanner	\N
20	gameanalytics_unity3d	\N
21	chartboost_mopub	\N
22	moat	\N
23	integralads_mopub	\N
24	moat_mopub	\N
25	zjlib	\N
26	tencent	\N
27	appsflyer	\N
28	microsoft	\N
29	adjust	\N
30	tenjin	\N
31	gameanalytics	\N
32	chartboost	\N
33	squareup	\N
34	facebook_amberweather_cleanteam	\N
35	mopub_amberweather_cleanteam	\N
36	mopub_admob	\N
37	bytedance	\N
38	inmobi_amberweather_mopub	\N
39	inmobi	\N
40	amber_cleanteam	\N
41	facebook_amber_cleanteam	\N
42	cleanteam	\N
43	amberweather_amber_cleanteam	\N
44	amberweather_cleanteam	\N
45	monet	\N
46	applovin_unity3d	\N
47	amazon_applovin	\N
48	amazon	\N
49	mintegral_applovin	\N
50	smaato_applovin	\N
51	facebook_applovin	\N
52	fyber_applovin	\N
53	google_tvbs	\N
54	flurry_tvbs	\N
55	flurry	\N
56	yanzhenjie_tvbs	\N
57	bumptech_tvbs	\N
58	tvbs	\N
59	adjust_dzbook	\N
60	umeng_dzbook	\N
61	ta_ut_alibaba	\N
62	gyf_dzbook	\N
63	dzbook	\N
64	umeng	\N
65	bumptech_dzbook	\N
66	integralads	\N
67	smaato	\N
68	amazonaws_tvbs	\N
69	comscore	\N
70	bumptech	\N
71	alibaba	\N
72	instabug	\N
\.


--
-- Data for Name: httpconnection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.httpconnection (id, company_id, package_id, url, ip) FROM stdin;
1	1	2	https://graph.facebook.com/v6.0/149224629006453	\N
2	1	2	https://graph.facebook.com/v6.0/149224629006453/mobile_sdk_gk	\N
3	1	2	https://graph.facebook.com/v6.0/149224629006453/activities	\N
4	2	2	https://asia-east2-invoice-analytics.cloudfunctions.net/log-v2	\N
5	2	2	https://api.invoice.tw/invoice/v008/profile.php	\N
6	2	2	https://api.invoice.tw/invoice/v010/dashboard.php	\N
7	2	2	https://forum.invos.com.tw/article/v1/user/firestore_id	\N
8	2	2	https://api.invoice.tw/invoice/v010/eventlist.php	\N
9	2	2	https://firebaseremoteconfig.googleapis.com/v1/projects/614044787482/namespaces/firebase:fetch	\N
10	2	2	https://api.invoice.tw/invoice/v006/regtcode.php	\N
11	2	2	https://api.invoice.tw/invoice/v010/bestchoice.php	\N
12	2	2	https://api.invoice.tw/invoice/v009/ibhome.php	\N
13	1	4	https://graph.facebook.com/v5.0/2830689017001407/mobile_sdk_gk	\N
14	1	4	https://graph.facebook.com/v5.0/2830689017001407	\N
15	1	4	https://graph.facebook.com/v5.0/2830689017001407/model_asset	\N
16	26	4	http://android.bugly.qq.com/rqd/async	\N
17	27	4	https://launches.appsflyer.com/api/v4.11/androidevent	\N
18	2	5	https://firebaseremoteconfig.googleapis.com/v1/projects/783500596517/namespaces/firebase:fetch	\N
19	1	1	https://graph.facebook.com/v6.0/1693867790760604/mobile_sdk_gk	\N
20	1	1	https://graph.facebook.com/v6.0/1693867790760604	\N
21	1	1	https://graph.facebook.com/v6.0/1693867790760604/activities	\N
22	1	1	https://web.facebook.com/adnw_sync	\N
23	1	1	https://graph.facebook.com/network_ads_common	\N
24	28	1	https://in.appcenter.ms/logs	\N
25	29	1	https://app.adjust.com/session	\N
26	29	1	https://app.adjust.com	\N
27	29	1	https://app.adjust.com/attribution	\N
28	10	1	https://ads.mopub.com/m/open	\N
29	10	1	https://ads.mopub.com/m/ad	\N
30	10	1	https://ads.mopub.com/m/attempt	\N
31	10	1	https://cb.mopub.com/load	\N
32	10	1	https://ads.mopub.com/m/imp	\N
33	8	1	https://ms.applovin.com/5.0/i	\N
34	8	1	https://d.applovin.com/2.0/device	\N
35	8	1	https://rt.applovin.com/4.0/pix	\N
36	8	1	https://a.applovin.com/4.0/ad	\N
37	9	1	https://connect.tapjoy.com/api/connect/v3.json	\N
38	9	1	https://rpc.tapjoy.com/	\N
39	9	1	https://content.tapjoy.com/assets/rtb_mraid_unit/behavior-3d0683016551dc35aa00cb75686d44eff1f217a1d5a2ec25d209f73507aaeec5.js	\N
40	9	1	https://content.tapjoy.com/offerwall_assets/472-462576ba3c/manifest_build.js	\N
41	9	1	https://content.tapjoy.com/assets/custom_html_unit/behavior-823aeb56d292384a7ce1829fd86d3e97b4e94a2a04258cd1fc3b6f6e2c48f701.js	\N
42	9	1	https://content.tapjoy.com/compound/assets/316-6456ad17d5/compound.min.css	\N
43	9	1	https://content.tapjoy.com/offerwall_assets/472-462576ba3c/offerwall_build.css	\N
44	9	1	https://content.tapjoy.com/offerwall_assets/470-8948660bd8/history_page_build.js	\N
45	9	1	https://content.tapjoy.com/assets/adunit-full-10bd82e9576d5e8e49216b77cd004308142532e36d7b30e6b662c5109a36cc58.js	\N
46	9	1	https://content.tapjoy.com/offerwall_assets/470-8948660bd8/manifest_build.js	\N
47	9	1	https://content.tapjoy.com/offerwall_assets/470-8948660bd8/offerwall_build.css	\N
48	9	1	https://content.tapjoy.com/offerwall_assets/470-8948660bd8/offerwall_build.js	\N
49	9	1	https://content.tapjoy.com/assets/ad_unit/vast_unit-12ba5a1497409a13ce1f5300359af7ce972f3755f4e217aaae7d5c4a2f004587.css	\N
50	9	1	https://content.tapjoy.com/offerwall_assets/470-8948660bd8/polyfill_build.js	\N
51	9	1	https://content.tapjoy.com/assets/compound_unit/behavior-da9209e3e2f61bdda613f6bbaf32c205fc403fbaf160b27f5be0d4c6fe207ff6.js	\N
52	9	1	https://content.tapjoy.com/offerwall_assets/472-462576ba3c/offerwall_build.js	\N
53	9	1	https://content.tapjoy.com/assets/mraid-4575df9e2bed1e84e755911ebb33d374fd0b07f73b9c6d4901894ac1708a83d1.js	\N
54	9	1	https://content.tapjoy.com/offerwall_assets/472-462576ba3c/vendor_build.js	\N
55	9	1	https://content.tapjoy.com/assets/shared/interstitial-595d11bbdc67fb3c41a076fd88e891e02ccbf53363925fbec96a49834ce8cdc3.js	\N
56	9	1	https://content.tapjoy.com/assets/omsdk-e79ebe7b1b1e138d7cb4ea12d92b69bb64ebc16737b958fcdf8b01d494ac0eec.js	\N
57	9	1	https://content.tapjoy.com/offerwall_assets/472-462576ba3c/polyfill_build.js	\N
58	9	1	https://content.tapjoy.com/assets/vast_unit/behavior-35198f4663d22cd5c771faa4757fc67166162198a0428533d11ce4c7bdb421f0.js	\N
59	9	1	https://content.tapjoy.com/compound/assets/316-6456ad17d5/modular_ad.min.js	\N
60	9	1	https://content.tapjoy.com/offerwall_assets/472-462576ba3c/history_page_build.js	\N
61	9	1	https://content.tapjoy.com/assets/ad_unit/loader-634117884ad6e001da18755836bfb8a3ab8140a00d8e8e8a5ff401fb8fe31a4d.css	\N
62	9	1	https://content.tapjoy.com/offerwall_assets/470-8948660bd8/vendor_build.js	\N
63	9	1	https://placements.tapjoy.com/v1/apps/3a339713-022d-4859-b37a-73ff84800713/content	\N
64	22	1	https://z.moatads.com/VNG/android/fe5b19d/status.json	\N
65	12	1	https://cdn2.inner-active.mobi/ia-sdk-config/config_android.json	\N
66	12	1	https://cdn2.inner-active.mobi/ia-sdk-config/apps/113578/113578.json	\N
67	12	1	https://wv.inner-active.mobi/simpleM2M/clientRequestEnhancedXmlAd	\N
68	4	1	https://config.unityads.unity3d.com/webview/3.4.2/release/config.json	\N
69	4	1	https://webview.unityads.unity3d.com/webview/3.4.0/e2a7a9dcf0df0b16ce592852bb9939334d58c35c/release/index.html	\N
70	4	1	https://publisher-config.unityads.unity3d.com/games/3606833/configuration	\N
71	4	1	https://httpkafka.unityads.unity3d.com/v1/events	\N
72	4	1	https://sdk-diagnostics.prd.mz.internal.unity3d.com/v1/timing	\N
73	4	1	https://sdk-diagnostics.prd.mz.internal.unity3d.com/v1/metrics	\N
74	4	1	https://auction.unityads.unity3d.com/v5/games/3606833/requests	\N
75	4	1	https://auction.unityads.unity3d.com/v6/games/3606833/requests	\N
76	4	1	https://auiopt.unityads.unity3d.com/v1/category/experiment	\N
77	4	1	https://tracking.prd.mz.internal.unity3d.com/operative/TangleMaster3D_drd_RW_12	\N
78	4	1	https://tracking.prd.mz.internal.unity3d.com/impression/TangleMaster3D_drd_RW_12	\N
79	4	1	https://publisher-event.unityads.unity3d.com/events/v2/video/video_start/3606833/5e4747360868e86d785edfcd-5ede0adf0b6145070c2162de	\N
80	17	1	https://init.supersonicads.com/sdk/v6.16.1	\N
81	17	1	https://outcome-ssp.supersonicads.com/mediation	\N
82	17	1	https://networksdk.ssacdn.com/mobileSDKController/mobileController.html	\N
83	17	1	https://networksdk.ssacdn.com/mobileSDKController/abTestMap.json	\N
84	17	1	https://networksdk.ssacdn.com/users/microjob/sdkconfig.json	\N
85	17	1	https://logs.supersonic.com/logs	\N
86	17	1	https://rv-gateway.supersonicads.com/gateway/sdk/request	\N
87	17	1	https://is-gateway.supersonicads.com/gateway/sdk/request/	\N
88	1	3	https://graph.facebook.com/v4.0/678836092696068	\N
89	1	3	https://graph.facebook.com/v4.0/678836092696068/mobile_sdk_gk	\N
90	1	3	https://graph.facebook.com/v4.0/678836092696068/activities	\N
91	1	3	https://www.facebook.com/adnw_sync	\N
92	4	3	https://config.uca.cloud.unity3d.com	\N
93	4	3	https://api-gdpr.voodoo-tech.io/need_consent	\N
94	4	3	https://ecommerce.iap.unity3d.com/catalog	\N
95	4	3	https://cdp.cloud.unity3d.com/v1/events	\N
96	4	3	https://config.unityads.unity3d.com/webview/3.4.2/release/config.json	\N
97	4	3	https://publisher-config.unityads.unity3d.com/games/3710951/configuration	\N
98	4	3	https://httpkafka.unityads.unity3d.com/v1/events	\N
99	4	3	https://auction.unityads.unity3d.com/v6/games/3710951/requests	\N
100	4	3	https://auiopt.unityads.unity3d.com/v1/category/experiment	\N
101	30	3	https://track.tenjin.io/v0/event	\N
102	29	3	https://app.adjust.com/session	\N
103	29	3	https://app.adjust.com	\N
104	29	3	https://app.adjust.com/attribution	\N
105	29	3	https://app.adjust.com/ad_revenue	\N
106	29	3	https://app.adjust.com/event	\N
107	10	3	https://ads.mopub.com/m/open	\N
108	10	3	https://ads.mopub.com/m/ad	\N
109	10	3	https://ads.mopub.com/m/attempt	\N
110	10	3	https://ads.mopub.com/m/imp	\N
111	31	3	https://rubick.gameanalytics.com/v2/command_center	\N
112	31	3	https://api.gameanalytics.com/v2/12f6a55101c88da135bd9994d205480e/events	\N
113	22	3	https://z.moatads.com/VNG/android/fe5b19d/status.json	\N
114	22	3	https://z.moatads.com/CHA/android/35d4829/status.json	\N
115	8	3	https://ms.applovin.com/5.0/i	\N
116	8	3	https://d.applovin.com/2.0/s	\N
117	8	3	https://d.applovin.com/2.0/device	\N
118	8	3	https://rt.applovin.com/4.0/pix	\N
119	8	3	https://a.applovin.com/4.0/ad	\N
120	17	3	https://init.supersonicads.com/sdk/v6.16.1	\N
121	17	3	https://outcome-ssp.supersonicads.com/mediation	\N
122	17	3	https://networksdk.ssacdn.com/mobileSDKController/mobileController.html	\N
123	17	3	https://networksdk.ssacdn.com/mobileSDKController/abTestMap.json	\N
124	17	3	https://networksdk.ssacdn.com/users/microjob/sdkconfig.json	\N
125	17	3	https://logs.supersonic.com/logs	\N
126	17	3	https://is-gateway.supersonicads.com/gateway/sdk/request/	\N
127	17	3	https://rv-gateway.supersonicads.com/gateway/sdk/request	\N
128	32	3	https://live.chartboost.com/api/config	\N
129	32	3	https://live.chartboost.com/api/install	\N
130	32	3	https://live.chartboost.com/webview/v2/reward/get	\N
131	32	3	https://live.chartboost.com/webview/v2/prefetch	\N
132	32	3	https://live.chartboost.com/webview/v2/interstitial/get	\N
133	2	3	https://googleads.g.doubleclick.net/pagead/adview	\N
134	1	7	https://graph.facebook.com/network_ads_common	\N
135	1	7	https://graph.facebook.com/v3.1/545093112975385/activities	\N
136	10	7	https://ads.mopub.com/m/ad	\N
137	10	7	https://ads.mopub.com/m/attempt	\N
138	22	7	https://z.moatads.com/MPUB/android/9d24c90/status.json	\N
139	22	7	https://sejs.moatads.com/MPUB/android/9d24c90/status.json	\N
140	66	7	https://mobile-static.adsafeprotected.com/avid-v2.js	\N
141	39	7	https://ads.inmobi.com/sdk	\N
142	2	7	https://googleads.g.doubleclick.net/pagead/conversion/	\N
143	2	7	https://r7---sn-ipoxu-un5z.googlevideo.com/videoplayback	\N
144	2	7	https://pagead2.googleadservices.com/pagead/adview	\N
145	2	7	https://csi.gstatic.com/csi	\N
146	8	8	https://ms.applovin.com/5.0/i	\N
147	8	8	https://d.applovin.com/2.0/s	\N
148	8	8	https://a.applovin.com/4.0/ad	\N
149	8	8	https://d.applovin.com/2.0/device	\N
150	8	8	https://rt.applovin.com/4.0/pix	\N
151	8	8	https://res1.applovin.com/o6a0a833/9cbb10b279d97e8b1345cde9d29c795ca53d0c01_raw11.gif	\N
152	8	8	https://ms.applovin.com/1.0/mediate	\N
153	8	8	https://prod-ms.applovin.com/1.0/event/lerr	\N
154	8	8	https://prod-ms.applovin.com/1.0/event/load	\N
155	8	8	https://prod-ms.applovin.com/1.0/event/mimp	\N
156	8	8	https://prod-ms.applovin.com/1.0/event/cimp	\N
157	48	8	https://mads.amazon-adsystem.com/msdk/getConfig	\N
158	48	8	https://aax-fe-sin.amazon-adsystem.com/e/msdk/ads	\N
159	48	8	https://aax-fe-sin.amazon-adsystem.com/x/px/p/QiXVew6njmDje58YyGq0VOUAAAFzwoqaxgUAAA-iAsFP2PU/%22c%22%3A%22msdk%22%2C%22v%22%3A%225.9.0%22%2C%22llfsl%22%3A111%2C%22lfsul%22%3A1%2C%22lcaul%22%3A3%2C%22lfsasl%22%3A3%2C%22al%22%3A325%2C%22nrtr%22%3A10000%2C%22laefel%22%3A3%2C%22lffsul%22%3A0%2C%22tl%22%3A447%2C%22lffsfl%22%3A0%2C%22tfl%22%3A447%2C%22vs%22%3A%22n%22%2C%22wifi%22%3A1%2C%22lf%22%3A1%2C%22ahz%22%3A1%2C%22id%22%3A1%2C%22tls%22%3A1%2C%22lfnf%22%3A1%2C%22acl%22%3A1280%2C%22lael%22%3A0	\N
160	4	8	https://config.unityads.unity3d.com/webview/3.4.6/release/config.json	\N
161	4	8	https://publisher-config.unityads.unity3d.com/games/3690759/configuration	\N
162	4	8	https://httpkafka.unityads.unity3d.com/v1/events	\N
163	4	8	https://auction.unityads.unity3d.com/v6/games/3690759/requests	\N
164	4	8	https://auiopt.unityads.unity3d.com/v1/category/experiment	\N
165	12	8	https://cdn2.inner-active.mobi/ia-sdk-config/config_android.json	\N
166	12	8	https://cdn2.inner-active.mobi/ia-sdk-config/apps/114395/114395.json	\N
167	12	8	https://wv.inner-active.mobi/simpleM2M/clientRequestEnhancedXmlAd	\N
168	12	8	http://cdn.liftoff.io/customers/9b11ad22de/videos/mobile/039d52f5b76d8647d5f4.mp4	\N
169	12	8	http://cdn.liftoff.io/customers/9b11ad22de/images/v1/10c600fa158283430b58.jpg	\N
170	12	8	https://sdk-events.inner-active.mobi/Event	\N
171	12	8	https://vast-events.inner-active.mobi/Event	\N
172	12	8	http://impression-east.liftoff.io/inneractive-direct/beacon	\N
173	12	8	https://event.inner-active.mobi/impression	\N
174	1	8	https://www.facebook.com/adnw_sync2	\N
175	67	8	https://sdk-android.ad.smaato.net/oapi/v6/ad	\N
176	1	9	https://graph.facebook.com/v5.0/1691416027601000/mobile_sdk_gk	\N
177	1	9	https://graph.facebook.com/v5.0/1691416027601000	\N
178	1	9	https://graph.facebook.com/v5.0/1691416027601000/activities	\N
179	1	9	https://graph.facebook.com/v5.0/1691416027601000/model_asset	\N
180	55	9	https://data.flurry.com/v1/flr.do	\N
181	55	9	https://service.cmp.oath.com/cmp/v0/location/eu	\N
182	68	9	https://kinesis.ap-northeast-1.amazonaws.com/	\N
183	69	9	https://sb.scorecardresearch.com/p2	\N
184	70	9	https://cc.tvbs.com.tw/img/program/upload/2020/08/06/20200806130112-880a8e20.jpg	\N
185	70	9	https://cc.tvbs.com.tw/img/program/upload/2020/08/06/20200806121345-5232d9e5.jpg	\N
186	70	9	https://cc.tvbs.com.tw/img/program/upload/2020/08/06/20200806144635-e1fe3161.jpg	\N
187	70	9	https://cc.tvbs.com.tw/img/program/upload/2020/08/06/20200806104652-f89ee2b4.jpg	\N
188	70	9	https://cc.tvbs.com.tw/img/program/upload/2020/08/04/20200804173205-2f906d41.jpg	\N
189	70	9	https://cc.tvbs.com.tw/img/program/upload/2020/08/04/20200804144042-5a3a5656.jpg	\N
190	70	9	https://cc.tvbs.com.tw/img/program/upload/2020/08/05/20200805205051-1c8d1e10.jpg	\N
191	70	9	https://cc.tvbs.com.tw/img/program/upload/2020/08/05/20200805145243-a0a2af38.jpg	\N
192	70	9	https://cc.tvbs.com.tw/img/program/upload/2020/08/03/20200803130803-3f0f3e17.jpg	\N
193	70	9	https://cc.tvbs.com.tw/img/program/upload/2020/07/29/20200729150320-f39e7a3e.jpg	\N
194	70	9	https://cc.tvbs.com.tw/img/program/upload/2020/05/18/20200518104219-6db69b54.jpg	\N
195	70	9	https://cc.tvbs.com.tw/img/program/upload/2020/08/06/20200806121401-49eb07cf.jpg	\N
196	1	10	https://graph.facebook.com/v5.0/1069241123251013	\N
197	1	10	https://graph.facebook.com/v5.0/1069241123251013/mobile_sdk_gk	\N
198	1	10	https://graph.facebook.com/v5.0/1069241123251013/activities	\N
199	1	10	https://graph.facebook.com/v5.0/1069241123251013/model_asset	\N
200	71	10	http://adash.man.aliyuncs.com:80/man/api	\N
201	71	10	http://adash.man.aliyuncs.com/man/api	\N
202	71	10	http://203.107.1.65:80/144522/d	\N
203	71	10	http://203.107.1.65/144522/d	\N
204	64	10	https://ulogs.umeng.com/unify_logs	\N
205	70	10	https://hws3.dzhwread.com/pubres/picture/Activity/XXmALxyoU4.jpg	\N
206	70	10	http://bookimg.dzhwread.com/cppartner/1x1/11x0/110x1/11010030519/11010030519.jpg	\N
207	70	10	http://bookimg.dzhwread.com/cppartner/1x1/11x0/110x1/11010036469/11010036469.jpg	\N
208	55	6	https://data.flurry.com/v1/flr.do	\N
209	1	6	https://www.facebook.com/adnw_sync	\N
210	1	6	https://graph.facebook.com/v6.0/381238885220488/activities	\N
211	72	6	https://play.google.com/store/apps/details	\N
212	72	6	https://api.instabug.com/api/sdk/v3/surveys/v6	\N
213	72	6	https://api.instabug.com/api/sdk/v3/announcements/v1	\N
214	72	6	https://api.instabug.com/api/sdk/v3/chats/sync	\N
215	10	6	https://ads.mopub.com/m/open	\N
216	10	6	https://ads.mopub.com/m/ad	\N
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs (id, company_id, package_id, permission_id, result) FROM stdin;
1	1	1	84	0
2	1	1	8	0
3	1	1	16	-1
4	2	1	167	-1
5	2	1	84	0
6	2	1	8	0
7	2	1	5	-1
8	3	1	168	-1
9	3	1	169	-1
10	4	1	46	-1
11	4	1	170	-1
12	4	1	84	0
13	5	1	84	0
14	6	1	8	0
15	7	1	84	0
16	7	1	8	0
17	7	1	10	0
18	8	1	111	-1
19	8	1	161	-1
20	9	1	84	0
21	10	1	8	0
22	10	1	5	-1
23	10	1	4	-1
24	10	1	84	0
25	11	1	161	-1
26	12	1	161	-1
27	12	1	84	0
28	12	1	8	0
29	12	1	111	-1
30	12	1	5	-1
31	12	1	4	-1
32	13	1	84	0
33	13	1	8	0
34	13	1	111	-1
35	14	1	8	0
36	15	1	161	-1
37	16	1	161	-1
38	16	1	8	0
39	16	1	77	-1
40	16	1	4	-1
41	16	1	111	-1
42	17	1	84	0
43	17	1	8	0
44	2	2	167	-1
45	2	2	84	0
46	2	2	8	0
47	1	2	84	0
48	18	2	168	-1
49	18	2	169	-1
50	19	2	8	0
51	2	3	167	-1
52	2	3	84	0
53	2	3	8	0
54	1	3	84	0
55	1	3	8	0
56	1	3	16	-1
57	4	3	168	-1
58	4	3	169	-1
59	4	3	170	-1
60	4	3	84	0
61	20	3	161	-1
62	20	3	107	-1
63	5	3	84	0
64	6	3	8	0
65	8	3	111	-1
66	8	3	161	-1
67	10	3	8	0
68	10	3	5	-1
69	10	3	4	-1
70	10	3	84	0
71	11	3	161	-1
72	11	3	84	0
73	17	3	84	0
74	17	3	8	0
75	21	3	161	-1
76	21	3	8	0
77	21	3	84	0
78	21	3	111	-1
79	22	3	5	-1
80	22	3	4	-1
81	15	3	161	-1
82	15	3	84	0
83	16	3	161	-1
84	16	3	8	0
85	16	3	77	-1
86	16	3	4	-1
87	16	3	111	-1
88	23	3	84	0
89	24	3	5	-1
90	24	3	4	-1
91	2	5	167	-1
92	2	5	84	0
93	2	5	8	0
94	2	5	10	-1
95	1	5	8	0
96	1	5	16	-1
97	25	5	8	0
98	1	6	8	0
99	1	6	16	-1
100	2	6	8	0
101	2	6	84	0
102	33	6	8	0
103	10	6	84	0
104	10	6	8	0
105	10	6	5	-1
106	10	6	4	-1
107	2	7	8	0
108	2	7	84	0
109	2	7	161	0
110	2	7	167	-1
111	34	7	8	0
112	1	7	8	0
113	1	7	16	-1
114	1	7	84	0
115	35	7	8	0
116	35	7	5	-1
117	35	7	4	-1
118	36	7	8	0
119	36	7	5	-1
120	36	7	4	-1
121	37	7	84	0
122	10	7	84	0
123	38	7	4	-1
124	38	7	5	-1
125	39	7	4	-1
126	39	7	5	-1
127	39	7	10	0
128	39	7	63	-1
129	39	7	8	0
130	40	7	111	-1
131	41	7	84	0
132	42	7	147	-1
133	43	7	168	-1
134	43	7	169	-1
135	43	7	8	0
136	43	7	10	0
137	43	7	84	0
138	44	7	5	-1
139	44	7	4	-1
140	45	7	84	0
141	45	7	4	-1
142	45	7	5	-1
143	4	8	168	-1
144	4	8	169	-1
145	4	8	46	-1
146	4	8	170	-1
147	4	8	84	0
148	2	8	167	-1
149	2	8	84	0
150	2	8	8	0
151	5	8	84	0
152	46	8	111	-1
153	8	8	8	0
154	8	8	10	0
155	8	8	84	0
156	8	8	161	-1
157	47	8	84	0
158	12	8	161	-1
159	12	8	5	-1
160	12	8	4	-1
161	12	8	8	0
162	48	8	84	0
163	49	8	161	-1
164	16	8	161	-1
165	16	8	8	0
166	16	8	77	-1
167	16	8	4	-1
168	16	8	111	-1
169	50	8	84	0
170	50	8	8	0
171	51	8	8	0
172	51	8	16	-1
173	1	8	8	0
174	1	8	16	-1
175	52	8	84	0
176	52	8	8	0
177	52	8	111	-1
178	2	9	167	-1
179	2	9	84	0
180	2	9	8	0
181	1	9	84	0
182	1	9	8	0
183	1	9	16	-1
184	53	9	171	0
185	54	9	8	0
186	55	9	8	0
187	55	9	5	-1
188	55	9	4	-1
189	56	9	161	0
190	56	9	122	0
191	57	9	8	0
192	58	9	84	0
193	2	10	167	-1
194	2	10	84	0
195	2	10	8	0
196	1	10	84	0
197	59	10	84	0
198	60	10	8	0
199	61	10	164	-1
200	62	10	168	-1
201	62	10	169	-1
202	63	10	8	0
203	63	10	10	0
204	63	10	84	0
205	63	10	161	0
206	63	10	111	0
207	64	10	111	0
208	64	10	8	0
209	65	10	8	0
\.


--
-- Data for Name: package; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.package (id, name) FROM stdin;
1	com.rollic.tanglemaster3D
2	tw.com.quickscanner.invoice
3	com.tapped.drawrider
4	net.moftech.app
5	homeworkout.homeworkouts.noequipment
6	mbinc12.mb32
7	com.cleanteam.oneboost
8	com.lightningstrikegames.fruitsurgeon
9	com.tvbs.news.food.topnews.bestfood.restaurant.news.supertaste.news.ratings.news
10	com.yj.xskd
\.


--
-- Data for Name: permissionlevel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissionlevel (id, constantvalue, level) FROM stdin;
1	android.permission.ACCEPT_HANDOVER	dangerous
2	android.permission.ACCESS_BACKGROUND_LOCATION	dangerous
3	android.permission.ACCESS_CHECKIN_PROPERTIES	Not for use by third-party applications.
4	android.permission.ACCESS_COARSE_LOCATION	dangerous
5	android.permission.ACCESS_FINE_LOCATION	dangerous
6	android.permission.ACCESS_LOCATION_EXTRA_COMMANDS	normal
7	android.permission.ACCESS_MEDIA_LOCATION	dangerous
8	android.permission.ACCESS_NETWORK_STATE	normal
9	android.permission.ACCESS_NOTIFICATION_POLICY	normal
10	android.permission.ACCESS_WIFI_STATE	normal
11	android.permission.ACCOUNT_MANAGER	Not for use by third-party applications.
12	android.permission.ACTIVITY_RECOGNITION	dangerous
13	com.android.voicemail.permission.ADD_VOICEMAIL	dangerous
14	android.permission.ANSWER_PHONE_CALLS	dangerous
15	android.permission.BATTERY_STATS	signature|privileged|development
16	android.permission.BIND_ACCESSIBILITY_SERVICE	signature
17	android.permission.BIND_APPWIDGET	Not for use by third-party applications.
18	android.permission.BIND_AUTOFILL_SERVICE	signature
19	android.permission.BIND_CALL_REDIRECTION_SERVICE	signature|privileged
20	android.permission.BIND_CARRIER_MESSAGING_CLIENT_SERVICE	signature
21	android.permission.BIND_CARRIER_MESSAGING_SERVICE	Not for use by third-party applications.
22	android.permission.BIND_CARRIER_SERVICES	signature|privileged
23	android.permission.BIND_CHOOSER_TARGET_SERVICE	signature
24	android.permission.BIND_CONDITION_PROVIDER_SERVICE	signature
25	android.permission.BIND_CONTROLS	Not for use by third-party applications.
26	android.permission.BIND_DEVICE_ADMIN	signature
27	android.permission.BIND_DREAM_SERVICE	signature
28	android.permission.BIND_INCALL_SERVICE	signature|privileged
29	android.permission.BIND_INPUT_METHOD	signature
30	android.permission.BIND_MIDI_DEVICE_SERVICE	signature
31	android.permission.BIND_NFC_SERVICE	signature
32	android.permission.BIND_NOTIFICATION_LISTENER_SERVICE	signature
33	android.permission.BIND_PRINT_SERVICE	signature
34	android.permission.BIND_QUICK_ACCESS_WALLET_SERVICE	signature
35	android.permission.BIND_QUICK_SETTINGS_TILE	Not for use by third-party applications.
36	android.permission.BIND_REMOTEVIEWS	signature|privileged
37	android.permission.BIND_SCREENING_SERVICE	signature|privileged
38	android.permission.BIND_TELECOM_CONNECTION_SERVICE	signature|privileged
39	android.permission.BIND_TEXT_SERVICE	signature
40	android.permission.BIND_TV_INPUT	signature|privileged
41	android.permission.BIND_VISUAL_VOICEMAIL_SERVICE	signature|privileged
42	android.permission.BIND_VOICE_INTERACTION	signature
43	android.permission.BIND_VPN_SERVICE	signature
44	android.permission.BIND_VR_LISTENER_SERVICE	signature
45	android.permission.BIND_WALLPAPER	signature|privileged
46	android.permission.BLUETOOTH	normal
47	android.permission.BLUETOOTH_ADMIN	normal
48	android.permission.BLUETOOTH_PRIVILEGED	Not for use by third-party applications.
49	android.permission.BODY_SENSORS	dangerous
50	android.permission.BROADCAST_PACKAGE_REMOVED	Not for use by third-party applications.
51	android.permission.BROADCAST_SMS	Not for use by third-party applications.
52	android.permission.BROADCAST_STICKY	normal
53	android.permission.BROADCAST_WAP_PUSH	Not for use by third-party applications.
54	android.permission.CALL_COMPANION_APP	normal
55	android.permission.CALL_PHONE	dangerous
56	android.permission.CALL_PRIVILEGED	Not for use by third-party applications.
57	android.permission.CAMERA	dangerous
58	android.permission.CAPTURE_AUDIO_OUTPUT	Not for use by third-party applications.
59	android.permission.CHANGE_COMPONENT_ENABLED_STATE	Not for use by third-party applications.
60	android.permission.CHANGE_CONFIGURATION	signature|privileged|development
61	android.permission.CHANGE_NETWORK_STATE	normal
62	android.permission.CHANGE_WIFI_MULTICAST_STATE	normal
63	android.permission.CHANGE_WIFI_STATE	normal
64	android.permission.CLEAR_APP_CACHE	signature|privileged
65	android.permission.CONTROL_LOCATION_UPDATES	Not for use by third-party applications.
66	android.permission.DELETE_CACHE_FILES	signature|privileged
67	android.permission.DELETE_PACKAGES	Not for use by third-party applications.
68	android.permission.DIAGNOSTIC	Not for use by third-party applications.
69	android.permission.DISABLE_KEYGUARD	normal
70	android.permission.DUMP	Not for use by third-party applications.
71	android.permission.EXPAND_STATUS_BAR	normal
72	android.permission.FACTORY_TEST	Not for use by third-party applications.
73	android.permission.FOREGROUND_SERVICE	normal
74	android.permission.GET_ACCOUNTS	dangerous
75	android.permission.GET_ACCOUNTS_PRIVILEGED	signature|privileged
76	android.permission.GET_PACKAGE_SIZE	normal
77	android.permission.GET_TASKS	Not for use by third-party applications.
78	android.permission.GLOBAL_SEARCH	signature|privileged
79	android.permission.INSTALL_LOCATION_PROVIDER	Not for use by third-party applications.
80	android.permission.INSTALL_PACKAGES	Not for use by third-party applications.
81	com.android.launcher.permission.INSTALL_SHORTCUT	normal
82	android.permission.INSTANT_APP_FOREGROUND_SERVICE	signature|development|instant|appop
83	android.permission.INTERACT_ACROSS_PROFILES	Not for use by third-party applications.
84	android.permission.INTERNET	normal
85	android.permission.KILL_BACKGROUND_PROCESSES	normal
86	android.permission.LOADER_USAGE_STATS	signature|privileged|appop
87	android.permission.LOCATION_HARDWARE	Not for use by third-party applications.
88	android.permission.MANAGE_DOCUMENTS	Not for use by third-party applications.
89	android.permission.MANAGE_EXTERNAL_STORAGE	signature|appop|preinstalled
90	android.permission.MANAGE_OWN_CALLS	normal
91	android.permission.MASTER_CLEAR	Not for use by third-party applications.
92	android.permission.MEDIA_CONTENT_CONTROL	Not for use by third-party applications.
93	android.permission.MODIFY_AUDIO_SETTINGS	normal
94	android.permission.MODIFY_PHONE_STATE	Not for use by third-party applications.
95	android.permission.MOUNT_FORMAT_FILESYSTEMS	Not for use by third-party applications.
96	android.permission.MOUNT_UNMOUNT_FILESYSTEMS	Not for use by third-party applications.
97	android.permission.NFC	normal
98	android.permission.NFC_PREFERRED_PAYMENT_INFO	normal
99	android.permission.NFC_TRANSACTION_EVENT	normal
100	android.permission.PACKAGE_USAGE_STATS	signature|privileged|development|appop|retailDemo
101	android.permission.PERSISTENT_ACTIVITY	Not for use by third-party applications.
102	android.permission.PROCESS_OUTGOING_CALLS	dangerous
103	android.permission.QUERY_ALL_PACKAGES	normal
104	android.permission.READ_CALENDAR	dangerous
105	android.permission.READ_CALL_LOG	dangerous
106	android.permission.READ_CONTACTS	dangerous
107	android.permission.READ_EXTERNAL_STORAGE	dangerous
108	android.permission.READ_INPUT_STATE	Not for use by third-party applications.
109	android.permission.READ_LOGS	Not for use by third-party applications.
110	android.permission.READ_PHONE_NUMBERS	dangerous
111	android.permission.READ_PHONE_STATE	dangerous
112	android.permission.READ_PRECISE_PHONE_STATE	Not for use by third-party applications.
113	android.permission.READ_SMS	dangerous
114	android.permission.READ_SYNC_SETTINGS	normal
115	android.permission.READ_SYNC_STATS	normal
116	com.android.voicemail.permission.READ_VOICEMAIL	signature|privileged
117	android.permission.REBOOT	Not for use by third-party applications.
118	android.permission.RECEIVE_BOOT_COMPLETED	normal
119	android.permission.RECEIVE_MMS	dangerous
120	android.permission.RECEIVE_SMS	dangerous
121	android.permission.RECEIVE_WAP_PUSH	dangerous
122	android.permission.RECORD_AUDIO	dangerous
123	android.permission.REORDER_TASKS	normal
124	android.permission.REQUEST_COMPANION_RUN_IN_BACKGROUND	normal
125	android.permission.REQUEST_COMPANION_USE_DATA_IN_BACKGROUND	normal
126	android.permission.REQUEST_DELETE_PACKAGES	normal
127	android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS	normal
128	android.permission.REQUEST_INSTALL_PACKAGES	signature
129	android.permission.REQUEST_PASSWORD_COMPLEXITY	normal
130	android.permission.RESTART_PACKAGES	Not for use by third-party applications.
131	android.permission.SEND_RESPOND_VIA_MESSAGE	Not for use by third-party applications.
132	android.permission.SEND_SMS	dangerous
133	com.android.alarm.permission.SET_ALARM	normal
134	android.permission.SET_ALWAYS_FINISH	Not for use by third-party applications.
135	android.permission.SET_ANIMATION_SCALE	Not for use by third-party applications.
136	android.permission.SET_DEBUG_APP	Not for use by third-party applications.
137	android.permission.SET_PREFERRED_APPLICATIONS	Not for use by third-party applications.
138	android.permission.SET_PROCESS_LIMIT	Not for use by third-party applications.
139	android.permission.SET_TIME	Not for use by third-party applications.
140	android.permission.SET_TIME_ZONE	Not for use by third-party applications.
141	android.permission.SET_WALLPAPER	normal
142	android.permission.SET_WALLPAPER_HINTS	normal
143	android.permission.SIGNAL_PERSISTENT_PROCESSES	Not for use by third-party applications.
144	android.permission.SMS_FINANCIAL_TRANSACTIONS	signature|appop
145	android.permission.START_VIEW_PERMISSION_USAGE	signature|installer
146	android.permission.STATUS_BAR	Not for use by third-party applications.
147	android.permission.SYSTEM_ALERT_WINDOW	signature|preinstalled|appop|pre23|development
148	android.permission.TRANSMIT_IR	normal
149	com.android.launcher.permission.UNINSTALL_SHORTCUT	Not for use by third-party applications.
150	android.permission.UPDATE_DEVICE_STATS	Not for use by third-party applications.
151	android.permission.USE_BIOMETRIC	normal
152	android.permission.USE_FINGERPRINT	normal
153	android.permission.USE_FULL_SCREEN_INTENT	normal
154	android.permission.USE_SIP	dangerous
155	android.permission.VIBRATE	normal
156	android.permission.WAKE_LOCK	normal
157	android.permission.WRITE_APN_SETTINGS	Not for use by third-party applications.
158	android.permission.WRITE_CALENDAR	dangerous
159	android.permission.WRITE_CALL_LOG	dangerous
160	android.permission.WRITE_CONTACTS	dangerous
161	android.permission.WRITE_EXTERNAL_STORAGE	dangerous
162	android.permission.WRITE_GSERVICES	Not for use by third-party applications.
163	android.permission.WRITE_SECURE_SETTINGS	Not for use by third-party applications.
164	android.permission.WRITE_SETTINGS	signature|preinstalled|appop|pre23
165	android.permission.WRITE_SYNC_SETTINGS	normal
166	com.android.voicemail.permission.WRITE_VOICEMAIL	signature|privileged
167	com.google.android.providers.gsf.permission.READ_GSERVICES	None
168	android.permission.INTERACT_ACROSS_USERS	None
169	android.permission.INTERACT_ACROSS_USERS_FULL	None
170	android.permission.CONFIGURE_WIFI_DISPLAY	None
171	com.google.android.c2dm.permission.SEND	None
\.


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_id_seq', 72, true);


--
-- Name: httpconnection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.httpconnection_id_seq', 216, true);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_id_seq', 209, true);


--
-- Name: package_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.package_id_seq', 10, true);


--
-- Name: permissionlevel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissionlevel_id_seq', 171, true);


--
-- Name: company company_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_name_key UNIQUE (name);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: httpconnection httpconnection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.httpconnection
    ADD CONSTRAINT httpconnection_pkey PRIMARY KEY (id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: package package_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package
    ADD CONSTRAINT package_name_key UNIQUE (name);


--
-- Name: package package_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package
    ADD CONSTRAINT package_pkey PRIMARY KEY (id);


--
-- Name: permissionlevel permissionlevel_constantvalue_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissionlevel
    ADD CONSTRAINT permissionlevel_constantvalue_key UNIQUE (constantvalue);


--
-- Name: permissionlevel permissionlevel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissionlevel
    ADD CONSTRAINT permissionlevel_pkey PRIMARY KEY (id);


--
-- Name: logs logs_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company(id);


--
-- Name: logs logs_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.package(id);


--
-- Name: logs logs_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permissionlevel(id);


--
-- PostgreSQL database dump complete
--

