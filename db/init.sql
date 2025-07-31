--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: agamas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.agamas (
    id uuid NOT NULL,
    kode character varying(255) NOT NULL,
    nama character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: backups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.backups (
    id bigint NOT NULL,
    filename character varying(255) NOT NULL,
    version character varying(255) NOT NULL,
    detail text NOT NULL,
    generated_date character varying(255) NOT NULL,
    bak_type character varying(255) DEFAULT 'BACKUP'::character varying NOT NULL,
    status character varying(255) DEFAULT 'SUCCESS'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: banksoal_chains; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.banksoal_chains (
    id character varying(26) NOT NULL,
    banksoal_id uuid NOT NULL,
    chain text
);


--
-- Name: banksoal_summaries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.banksoal_summaries (
    id uuid NOT NULL,
    banksoal_id uuid NOT NULL,
    total_done integer NOT NULL,
    avg_duration numeric(19,4) NOT NULL,
    total_schedule integer NOT NULL,
    lowest_duration integer NOT NULL,
    highest_duration integer NOT NULL,
    ds_duration numeric(19,6) NOT NULL,
    avg_result numeric(19,2) NOT NULL,
    ds_result numeric(19,6) NOT NULL,
    created_at timestamp(0) without time zone,
    avg_point numeric(19,2) NOT NULL,
    ds_point numeric(19,6) NOT NULL,
    lowest_result numeric(19,2) NOT NULL,
    highest_result numeric(19,2) NOT NULL,
    max_point numeric(19,2) NOT NULL,
    lowest_point numeric(19,2) NOT NULL,
    highest_point numeric(19,2) NOT NULL
);


--
-- Name: banksoals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.banksoals (
    id uuid NOT NULL,
    kode_banksoal character varying(100) NOT NULL,
    key_lock character varying(255),
    lock_by character varying(255),
    persen character varying(255) NOT NULL,
    matpel_id uuid NOT NULL,
    author uuid NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    competence_id uuid,
    code01_max integer DEFAULT 0 NOT NULL,
    code02_max integer DEFAULT 0 NOT NULL,
    code03_max integer DEFAULT 0 NOT NULL,
    code04_max integer DEFAULT 0 NOT NULL,
    code05_max integer DEFAULT 0 NOT NULL,
    code06_max integer DEFAULT 0 NOT NULL,
    code07_max integer DEFAULT 0 NOT NULL,
    code08_max integer DEFAULT 0 NOT NULL,
    code09_max integer DEFAULT 0 NOT NULL,
    code10_max integer DEFAULT 0 NOT NULL,
    code11_max integer DEFAULT 0 NOT NULL,
    code12_max integer DEFAULT 0 NOT NULL,
    code13_max integer DEFAULT 0 NOT NULL,
    code14_max integer DEFAULT 0 NOT NULL,
    is_locked boolean DEFAULT false NOT NULL,
    supports text
);


--
-- Name: check_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.check_answers (
    id uuid NOT NULL,
    banksoal_id uuid NOT NULL,
    peserta_id uuid NOT NULL,
    jawab_id uuid NOT NULL,
    corrected_by uuid NOT NULL,
    point numeric(19,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    jadwal_id uuid NOT NULL
);


--
-- Name: competence_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.competence_items (
    id uuid NOT NULL,
    competence_id uuid NOT NULL,
    tipe_soal integer NOT NULL,
    total_soal integer NOT NULL,
    code character varying(255) NOT NULL,
    point integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    wrong_point integer DEFAULT 0 NOT NULL,
    part integer DEFAULT 1 NOT NULL,
    index integer DEFAULT 0 NOT NULL
);


--
-- Name: competences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.competences (
    id uuid NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    created_by uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    total_part integer DEFAULT 1 NOT NULL
);


--
-- Name: devices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.devices (
    id uuid NOT NULL,
    device_id character varying(255) NOT NULL,
    device_os character varying(255) NOT NULL,
    device_name character varying(255) NOT NULL,
    ip_address character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    peserta_id uuid,
    out_count integer NOT NULL,
    last_verified_at timestamp(6) without time zone
);


--
-- Name: ecosystem_keys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ecosystem_keys (
    id character varying(100) NOT NULL,
    payload text NOT NULL,
    public_key text NOT NULL,
    signature text NOT NULL
);


--
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: exo_backups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exo_backups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exo_backups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exo_backups_id_seq OWNED BY public.backups.id;


--
-- Name: feature_infos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.feature_infos (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    content text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: feature_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.feature_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feature_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.feature_infos_id_seq OWNED BY public.feature_infos.id;


--
-- Name: group_members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_members (
    id uuid NOT NULL,
    group_id uuid NOT NULL,
    student_id uuid NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.groups (
    id uuid NOT NULL,
    parent_id uuid,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: hasil_ujians; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hasil_ujians (
    id uuid NOT NULL,
    ujian_id uuid,
    banksoal_id uuid NOT NULL,
    peserta_id uuid NOT NULL,
    jadwal_id uuid NOT NULL,
    check_point numeric(19,2) DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    check_point_auto numeric(19,2) DEFAULT 0,
    check_point_manual numeric(19,2) DEFAULT 0 NOT NULL,
    code01_correct integer DEFAULT 0 NOT NULL,
    code01_wrong integer DEFAULT 0 NOT NULL,
    code01_point numeric(19,2) DEFAULT 0 NOT NULL,
    code01_void integer DEFAULT 0 NOT NULL,
    code02_correct integer DEFAULT 0 NOT NULL,
    code02_wrong integer DEFAULT 0 NOT NULL,
    code02_point numeric(19,2) DEFAULT 0 NOT NULL,
    code02_void integer DEFAULT 0 NOT NULL,
    code03_correct integer DEFAULT 0 NOT NULL,
    code03_wrong integer DEFAULT 0 NOT NULL,
    code03_point numeric(19,2) DEFAULT 0 NOT NULL,
    code03_void integer DEFAULT 0 NOT NULL,
    code04_correct integer DEFAULT 0 NOT NULL,
    code04_wrong integer DEFAULT 0 NOT NULL,
    code04_point numeric(19,2) DEFAULT 0 NOT NULL,
    code04_void integer DEFAULT 0 NOT NULL,
    code05_correct integer DEFAULT 0 NOT NULL,
    code05_wrong integer DEFAULT 0 NOT NULL,
    code05_point numeric(19,2) DEFAULT 0 NOT NULL,
    code05_void integer DEFAULT 0 NOT NULL,
    code06_correct integer DEFAULT 0 NOT NULL,
    code06_wrong integer DEFAULT 0 NOT NULL,
    code06_point numeric(19,2) DEFAULT 0 NOT NULL,
    code06_void integer DEFAULT 0 NOT NULL,
    code07_correct integer DEFAULT 0 NOT NULL,
    code07_wrong integer DEFAULT 0 NOT NULL,
    code07_point numeric(19,2) DEFAULT 0 NOT NULL,
    code07_void integer DEFAULT 0 NOT NULL,
    code08_correct integer DEFAULT 0 NOT NULL,
    code08_wrong integer DEFAULT 0 NOT NULL,
    code08_point numeric(19,2) DEFAULT 0 NOT NULL,
    code08_void integer DEFAULT 0 NOT NULL,
    code09_correct integer DEFAULT 0 NOT NULL,
    code09_wrong integer DEFAULT 0,
    code09_point numeric(19,2) DEFAULT 0 NOT NULL,
    code09_void integer DEFAULT 0 NOT NULL,
    code10_correct integer DEFAULT 0 NOT NULL,
    code10_wrong integer DEFAULT 0 NOT NULL,
    code10_point numeric(19,2) DEFAULT 0 NOT NULL,
    code10_void integer DEFAULT 0 NOT NULL,
    code11_correct integer DEFAULT 0 NOT NULL,
    code11_wrong integer DEFAULT 0 NOT NULL,
    code11_point numeric(19,2) DEFAULT 0 NOT NULL,
    code11_void integer DEFAULT 0 NOT NULL,
    code12_correct integer DEFAULT 0 NOT NULL,
    code12_wrong integer DEFAULT 0 NOT NULL,
    code12_point numeric(19,2) DEFAULT 0 NOT NULL,
    code12_void integer DEFAULT 0 NOT NULL,
    code13_correct integer DEFAULT 0 NOT NULL,
    code13_wrong integer DEFAULT 0 NOT NULL,
    code13_point numeric(19,2) DEFAULT 0 NOT NULL,
    code13_void integer DEFAULT 0 NOT NULL,
    code14_correct integer DEFAULT 0 NOT NULL,
    code14_wrong integer DEFAULT 0 NOT NULL,
    code14_point numeric(19,2) DEFAULT 0 NOT NULL,
    code14_void integer DEFAULT 0 NOT NULL,
    check_point_max numeric(19,2) DEFAULT 0 NOT NULL,
    duration character varying(50) DEFAULT '-'::character varying NOT NULL
);


--
-- Name: jadwals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jadwals (
    id uuid NOT NULL,
    banksoal_id text NOT NULL,
    group_ids text,
    alias character varying(50) NOT NULL,
    tanggal character varying(50) NOT NULL,
    mulai character varying(50) NOT NULL,
    lama integer NOT NULL,
    min_test integer DEFAULT 0 NOT NULL,
    status_ujian integer NOT NULL,
    event_id uuid,
    sesi integer DEFAULT 1 NOT NULL,
    setting text NOT NULL,
    mulai_sesi text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    view_result boolean DEFAULT false NOT NULL,
    created_by uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    participant character varying(5) DEFAULT 'CP'::character varying NOT NULL,
    paused_at timestamp(6) without time zone,
    transition_time integer DEFAULT 0 NOT NULL
);


--
-- Name: jadwals_peserta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jadwals_peserta (
    id uuid NOT NULL,
    jadwal_id uuid NOT NULL,
    peserta_id uuid NOT NULL
);


--
-- Name: jawaban_pesertas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jawaban_pesertas (
    id uuid NOT NULL,
    banksoal_id uuid NOT NULL,
    soal_id uuid NOT NULL,
    peserta_id uuid NOT NULL,
    jadwal_id uuid NOT NULL,
    jawab text,
    answered boolean DEFAULT false NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    checked boolean DEFAULT false NOT NULL,
    point numeric(19,2) DEFAULT 0 NOT NULL,
    ragu_ragu boolean DEFAULT false NOT NULL,
    iscorrect boolean DEFAULT false NOT NULL,
    part integer DEFAULT 1 NOT NULL
);


--
-- Name: jawaban_soals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jawaban_soals (
    id uuid NOT NULL,
    soal_id uuid NOT NULL,
    text_jawaban text NOT NULL,
    correct boolean NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    label_mark character varying(255)
);


--
-- Name: jurusans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jurusans (
    id uuid NOT NULL,
    kode character varying(255) NOT NULL,
    nama character varying(255) NOT NULL
);


--
-- Name: matpels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.matpels (
    id uuid NOT NULL,
    kode_mapel character varying(100) NOT NULL,
    jurusan_id text,
    agama_id uuid,
    correctors text,
    nama character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: medias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.medias (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_directory boolean DEFAULT false,
    parent_id uuid
);


--
-- Name: menus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.menus (
    code character varying(255) NOT NULL,
    title text NOT NULL,
    "order" integer NOT NULL
);


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id uuid NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: pesertas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pesertas (
    id uuid NOT NULL,
    sesi integer NOT NULL,
    no_ujian character varying(50) NOT NULL,
    agama_id uuid NOT NULL,
    jurusan_id uuid NOT NULL,
    nama character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    api_token character varying(255),
    status integer DEFAULT 1 NOT NULL,
    block_reason character varying(255),
    antiblock boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    ava text,
    blocked_at timestamp(0) without time zone
);


--
-- Name: role_menus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role_menus (
    role_code character varying(255) NOT NULL,
    menu_code character varying(255) NOT NULL
);


--
-- Name: room_members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.room_members (
    id uuid NOT NULL,
    room_id uuid NOT NULL,
    event_id uuid NOT NULL,
    student_id uuid NOT NULL,
    created_at timestamp(6) without time zone
);


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rooms (
    id uuid NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: sesi_schedules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sesi_schedules (
    id uuid NOT NULL,
    jadwal_id uuid NOT NULL,
    sesi integer DEFAULT 1 NOT NULL,
    student_id uuid NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.settings (
    code character varying(255) NOT NULL,
    value text NOT NULL
);


--
-- Name: siswa_ujians; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.siswa_ujians (
    id uuid NOT NULL,
    peserta_id uuid NOT NULL,
    jadwal_id uuid NOT NULL,
    mulai_ujian character varying(255) NOT NULL,
    mulai_ujian_shadow character varying(255) NOT NULL,
    selesai_ujian character varying(255),
    sisa_waktu integer NOT NULL,
    status_ujian integer NOT NULL,
    out_ujian_counter integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    banksoal_id uuid NOT NULL,
    token character varying(100),
    last_part integer DEFAULT 1 NOT NULL,
    transition_state boolean DEFAULT false NOT NULL,
    transition_start bigint DEFAULT 0 NOT NULL
);


--
-- Name: soal_summaries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.soal_summaries (
    id uuid NOT NULL,
    banksoal_id uuid NOT NULL,
    soal_id uuid NOT NULL,
    total_void integer NOT NULL,
    total_correct integer NOT NULL,
    total_wrong integer NOT NULL,
    highest_point numeric(19,2) NOT NULL,
    lowest_point numeric(19,2) NOT NULL,
    avg_point numeric(19,4) NOT NULL,
    ds_point numeric(19,6) NOT NULL,
    addons text,
    created_at timestamp(0) without time zone,
    total_done integer DEFAULT 0 NOT NULL
);


--
-- Name: soals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.soals (
    id uuid NOT NULL,
    banksoal_id uuid NOT NULL,
    tipe_soal integer NOT NULL,
    pertanyaan text NOT NULL,
    layout integer DEFAULT 1 NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    competence_item_id uuid,
    absolute_eval boolean DEFAULT true NOT NULL,
    case_sensitive boolean DEFAULT true NOT NULL,
    supports text
);


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tokens (
    id uuid NOT NULL,
    token character varying(255) NOT NULL,
    status integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    expired_at timestamp(0) without time zone,
    CONSTRAINT tokens_status_check CHECK (((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])))
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'EVAL'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: backups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.backups ALTER COLUMN id SET DEFAULT nextval('public.exo_backups_id_seq'::regclass);


--
-- Name: feature_infos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feature_infos ALTER COLUMN id SET DEFAULT nextval('public.feature_infos_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Data for Name: agamas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.agamas (id, kode, nama, created_at, updated_at) VALUES ('3aed771a-9458-4cce-9811-8b0b50bfe462', 'ISLAM', 'Islam', '2023-08-13 20:49:43', '2023-08-13 20:49:43');
INSERT INTO public.agamas (id, kode, nama, created_at, updated_at) VALUES ('6e4c117b-b057-44a3-98ab-d54d197030de', 'PROTESTAN', 'Protestan', '2023-08-13 20:49:43', '2023-08-13 20:49:43');
INSERT INTO public.agamas (id, kode, nama, created_at, updated_at) VALUES ('dae66fe2-5785-4b44-892b-6a40c1c2e1f1', 'KATOLIK', 'Katolik', '2023-08-13 20:49:43', '2023-08-13 20:49:43');
INSERT INTO public.agamas (id, kode, nama, created_at, updated_at) VALUES ('8194f3f2-501b-420f-a496-85fded97beb0', 'HINDU', 'Hindu', '2023-08-13 20:49:43', '2023-08-13 20:49:43');
INSERT INTO public.agamas (id, kode, nama, created_at, updated_at) VALUES ('b835ff17-369c-4250-a565-000a06953adf', 'BUDHA', 'Budha', '2023-08-13 20:49:43', '2023-08-13 20:49:43');


--
-- Data for Name: backups; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: banksoal_chains; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: banksoal_summaries; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: banksoals; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: check_answers; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: competence_items; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: competences; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: ecosystem_keys; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: feature_infos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (13, 'Testing klik', 'AA001', 'tutorial-in-app/AA001.mp3', '2024-02-29 17:10:02', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (14, 'Info halaman peserta', 'AB001', 'tutorial-in-app/AB001.mp3', '2024-02-29 21:06:35', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (15, 'Sesi default peserta', 'AB002', 'tutorial-in-app/AB002.mp3', '2024-02-29 21:13:21', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (16, 'Info halaman group', 'AC001', 'tutorial-in-app/AC001.mp3', '2024-02-29 21:37:07', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (17, 'Info halaman matpel', 'AD001', 'tutorial-in-app/AD001.mp3', '2024-02-29 22:04:18', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (18, 'Target agama di matpel', 'AD002', 'tutorial-in-app/AD002.mp3', '2024-02-29 22:17:36', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (19, 'Target jurusan di matpel', 'AD003', 'tutorial-in-app/AD003.mp3', '2024-02-29 22:22:21', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (20, 'Tim pengoreksi di matpel', 'AD004', 'tutorial-in-app/AD004.mp3', '2024-02-29 22:26:19', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (21, 'Info halaman jurusan', 'AE001', 'tutorial-in-app/AE001.mp3', '2024-03-01 21:03:00', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (22, 'Info halaman pengguna', 'AF001', 'tutorial-in-app/AF001.mp3', '2024-03-01 21:11:25', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (23, 'Info halaman kompetensi', 'AG001', 'tutorial-in-app/AG001.mp3', '2024-03-01 21:15:43', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (24, 'Tambah kompetensi tipe soal', 'AG002', 'tutorial-in-app/AG002.mp3', '2024-03-01 21:20:58', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (25, 'Tambah kompetensi total soal', 'AG003', 'tutorial-in-app/AG003.mp3', '2024-03-01 21:32:36', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (26, 'Tambah kompetensi point', 'AG004', 'tutorial-in-app/AG004.mp3', '2024-03-01 21:36:32', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (27, 'Tambah kompetensi jawab tapi salah', 'AG005', 'tutorial-in-app/AG005.mp3', '2024-03-01 21:43:43', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (28, 'Info halaman banksoal', 'AH001', 'tutorial-in-app/AH001.mp3', '2024-03-02 11:10:02', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (29, 'Tambah banksoal kompetensi', 'AH002', 'tutorial-in-app/AH002.mp3', '2024-03-02 12:49:11', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (30, 'Tambah banksoal setting max persen', 'AH003', 'tutorial-in-app/AH003.mp3', '2024-03-02 12:49:12', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (31, 'Info halaman referensi banksoal', 'AH004', 'tutorial-in-app/AH004.mp3', '2024-03-02 20:29:29', NULL);
INSERT INTO public.feature_infos (id, name, code, content, created_at, updated_at) VALUES (32, 'Info waktu ujian di jadwal ujian event', 'AI001', 'tutorial-in-app/AI001.mp3', '2024-03-10 20:49:58', NULL);


--
-- Data for Name: group_members; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: hasil_ujians; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: jadwals; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: jadwals_peserta; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: jawaban_pesertas; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: jawaban_soals; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: jurusans; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jurusans (id, kode, nama) VALUES ('3e41ce1d-af1b-4d2c-80e1-46f6dd261403', '1945', 'UMUM');


--
-- Data for Name: matpels; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: medias; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.medias (id, name, created_at, updated_at, is_directory, parent_id) VALUES ('00000000-0000-0000-0000-000000000001', 'directory-generic-gen', '2023-11-11 22:29:43', NULL, true, '00000000-0000-0000-0000-000000000000');


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.menus (code, title, "order") VALUES ('0001A', 'Daftar master peserta', 11000);
INSERT INTO public.menus (code, title, "order") VALUES ('0001B', 'Tambah master peserta', 11001);
INSERT INTO public.menus (code, title, "order") VALUES ('0001C', 'Upload master peserta', 11002);
INSERT INTO public.menus (code, title, "order") VALUES ('0001D', 'Edit master peserta', 11003);
INSERT INTO public.menus (code, title, "order") VALUES ('0001E', 'Hapus master peserta', 11004);
INSERT INTO public.menus (code, title, "order") VALUES ('0002A', 'Daftar master menu', 12000);
INSERT INTO public.menus (code, title, "order") VALUES ('0003A', 'Daftar master role-menu', 13000);
INSERT INTO public.menus (code, title, "order") VALUES ('0003B', 'Update master role-menu', 13001);
INSERT INTO public.menus (code, title, "order") VALUES ('0004A', 'Daftar master group', 14001);
INSERT INTO public.menus (code, title, "order") VALUES ('0005A', 'Daftar master matpel', 15001);
INSERT INTO public.menus (code, title, "order") VALUES ('0006A', 'Daftar master jurusan', 16001);
INSERT INTO public.menus (code, title, "order") VALUES ('0007A', 'Daftar master pengguna', 17001);
INSERT INTO public.menus (code, title, "order") VALUES ('0008A', 'Daftar master agama', 18001);
INSERT INTO public.menus (code, title, "order") VALUES ('0009A', 'Daftar kompetensi', 19001);
INSERT INTO public.menus (code, title, "order") VALUES ('0010A', 'Daftar banksoal', 20001);
INSERT INTO public.menus (code, title, "order") VALUES ('0011A', 'Daftar jadwal ujian', 21001);
INSERT INTO public.menus (code, title, "order") VALUES ('0012A', 'Daftar token ujian', 22001);
INSERT INTO public.menus (code, title, "order") VALUES ('0013A', 'Monitor peserta', 23001);
INSERT INTO public.menus (code, title, "order") VALUES ('0014A', 'Ujian peserta', 24001);
INSERT INTO public.menus (code, title, "order") VALUES ('0015A', 'Reset login peserta', 25001);
INSERT INTO public.menus (code, title, "order") VALUES ('0016A', 'Koreksi jawaban peserta', 26001);
INSERT INTO public.menus (code, title, "order") VALUES ('0017A', 'Daftar Hasil ujian', 27001);
INSERT INTO public.menus (code, title, "order") VALUES ('0018A', 'Daftar summary banksoal', 28001);
INSERT INTO public.menus (code, title, "order") VALUES ('0019A', 'Daftar ledger peserta', 29001);
INSERT INTO public.menus (code, title, "order") VALUES ('0020A', 'Settings system', 30001);
INSERT INTO public.menus (code, title, "order") VALUES ('0021A', 'Daftar event ujian', 32001);
INSERT INTO public.menus (code, title, "order") VALUES ('0010B', 'Tambah banksoal', 20002);
INSERT INTO public.menus (code, title, "order") VALUES ('0010C', 'Edit banksoal', 20003);
INSERT INTO public.menus (code, title, "order") VALUES ('0010D', 'Hapus banksoal', 20004);
INSERT INTO public.menus (code, title, "order") VALUES ('0001F', 'Upload photo peserta', 11005);
INSERT INTO public.menus (code, title, "order") VALUES ('0004B', 'Tambah master group', 14002);
INSERT INTO public.menus (code, title, "order") VALUES ('0004C', 'Hapus master group', 14003);
INSERT INTO public.menus (code, title, "order") VALUES ('0004D', 'Edit master group', 14004);
INSERT INTO public.menus (code, title, "order") VALUES ('0022A', 'Daftar anggota group', 33001);
INSERT INTO public.menus (code, title, "order") VALUES ('0022B', 'Tambah anggota group', 33002);
INSERT INTO public.menus (code, title, "order") VALUES ('0022C', 'Hapus anggota group', 33003);
INSERT INTO public.menus (code, title, "order") VALUES ('0022D', 'Upload anggota group', 33004);
INSERT INTO public.menus (code, title, "order") VALUES ('0005B', 'Tambah master matpel', 15002);
INSERT INTO public.menus (code, title, "order") VALUES ('0005C', 'Update master matpel', 15003);
INSERT INTO public.menus (code, title, "order") VALUES ('0005D', 'Hapus master matpel', 15004);
INSERT INTO public.menus (code, title, "order") VALUES ('0005E', 'Upload master matpel', 15005);
INSERT INTO public.menus (code, title, "order") VALUES ('0006B', 'Tambah master jurusan', 16002);
INSERT INTO public.menus (code, title, "order") VALUES ('0006C', 'Hapus master jurusan', 16003);
INSERT INTO public.menus (code, title, "order") VALUES ('0006D', 'Edit master jurusan', 16004);
INSERT INTO public.menus (code, title, "order") VALUES ('0007B', 'Tambah master pengguna', 17002);
INSERT INTO public.menus (code, title, "order") VALUES ('0007C', 'Hapus master pengguna', 17003);
INSERT INTO public.menus (code, title, "order") VALUES ('0007D', 'Edit master pengguna', 17004);
INSERT INTO public.menus (code, title, "order") VALUES ('0009B', 'Tambah kompetensi', 19002);
INSERT INTO public.menus (code, title, "order") VALUES ('0009C', 'Hapus kompetensi', 19003);
INSERT INTO public.menus (code, title, "order") VALUES ('0009D', 'Tambah item kompetensi', 19004);
INSERT INTO public.menus (code, title, "order") VALUES ('0009E', 'Edit item kompetensi', 19005);
INSERT INTO public.menus (code, title, "order") VALUES ('0009F', 'Hapus item kompetensi', 19006);
INSERT INTO public.menus (code, title, "order") VALUES ('0010E', 'Daftar soal', 20005);
INSERT INTO public.menus (code, title, "order") VALUES ('0010F', 'Duplikat banksoal', 20006);
INSERT INTO public.menus (code, title, "order") VALUES ('0010G', 'Kunci banksoal', 20007);
INSERT INTO public.menus (code, title, "order") VALUES ('0010H', 'Tambah soal', 20008);
INSERT INTO public.menus (code, title, "order") VALUES ('0010I', 'Edit soal', 20009);
INSERT INTO public.menus (code, title, "order") VALUES ('0010J', 'Hapus soal', 20010);
INSERT INTO public.menus (code, title, "order") VALUES ('0021B', 'Tambah event ujian', 32002);
INSERT INTO public.menus (code, title, "order") VALUES ('0021C', 'Edit event ujian', 32003);
INSERT INTO public.menus (code, title, "order") VALUES ('0021D', 'Hapus event ujian', 32004);
INSERT INTO public.menus (code, title, "order") VALUES ('0021F', 'Kartu peserta event ujian', 32006);
INSERT INTO public.menus (code, title, "order") VALUES ('0021E', 'Daftar sesi peserta ujian', 32005);
INSERT INTO public.menus (code, title, "order") VALUES ('0021G', 'Tambah sesi peserta ujian', 32007);
INSERT INTO public.menus (code, title, "order") VALUES ('0021H', 'Hapus sesi peserta ujian', 32008);
INSERT INTO public.menus (code, title, "order") VALUES ('0021I', 'Copy sesi peserta ujian', 32009);
INSERT INTO public.menus (code, title, "order") VALUES ('0021J', 'Upload sesi peserta ujian', 32010);
INSERT INTO public.menus (code, title, "order") VALUES ('0011B', 'Tambah jadwal ujian', 21002);
INSERT INTO public.menus (code, title, "order") VALUES ('0011C', 'Edit jadwal ujian', 21003);
INSERT INTO public.menus (code, title, "order") VALUES ('0011D', 'Hapus jadwal ujian', 21004);
INSERT INTO public.menus (code, title, "order") VALUES ('0012B', 'Generate token ujian', 22002);
INSERT INTO public.menus (code, title, "order") VALUES ('0014B', 'Reset ujian peserta', 24002);
INSERT INTO public.menus (code, title, "order") VALUES ('0014C', 'Force finish ujian peserta', 24003);
INSERT INTO public.menus (code, title, "order") VALUES ('0016B', 'Simpan koreksi jawaban peserta', 26002);
INSERT INTO public.menus (code, title, "order") VALUES ('0016C', 'Daftar jawaban bisa dikoreksi', 26003);
INSERT INTO public.menus (code, title, "order") VALUES ('0017B', 'Detail hasil ujian', 27002);
INSERT INTO public.menus (code, title, "order") VALUES ('0018B', 'Detail summary banksoal', 28002);
INSERT INTO public.menus (code, title, "order") VALUES ('0018C', 'Generate summary banksoal', 28003);
INSERT INTO public.menus (code, title, "order") VALUES ('0010K', 'Import banksoal', 20011);
INSERT INTO public.menus (code, title, "order") VALUES ('0021L', 'Upload event ujian ruangan', 32012);
INSERT INTO public.menus (code, title, "order") VALUES ('0021K', 'Member event ujian ruangan', 32011);
INSERT INTO public.menus (code, title, "order") VALUES ('0021M', 'Hapus member event ujian ruangan', 32013);
INSERT INTO public.menus (code, title, "order") VALUES ('0001G', 'Aktifkan master peserta', 11006);
INSERT INTO public.menus (code, title, "order") VALUES ('0001H', 'Nonaktifkan master peserta', 11007);
INSERT INTO public.menus (code, title, "order") VALUES ('0010L', 'Tambah banksoal support', 20012);
INSERT INTO public.menus (code, title, "order") VALUES ('0010M', 'Hapus banksoal support', 20013);
INSERT INTO public.menus (code, title, "order") VALUES ('0023A', 'Backup master system', 34001);
INSERT INTO public.menus (code, title, "order") VALUES ('0023B', 'Restore master system', 34002);
INSERT INTO public.menus (code, title, "order") VALUES ('0024A', 'Verified device client', 35001);
INSERT INTO public.menus (code, title, "order") VALUES ('0010N', 'Backup banksoal', 20014);
INSERT INTO public.menus (code, title, "order") VALUES ('0010O', 'Restore banksoal', 20015);
INSERT INTO public.menus (code, title, "order") VALUES ('0001I', 'Regenerate password master peserta', 11008);
INSERT INTO public.menus (code, title, "order") VALUES ('0021N', 'Edit data ruangan', 32014);
INSERT INTO public.menus (code, title, "order") VALUES ('0011E', 'Pause jadwal ujian', 21005);
INSERT INTO public.menus (code, title, "order") VALUES ('0011F', 'Resume jadwal ujian', 21006);
INSERT INTO public.menus (code, title, "order") VALUES ('0009G', 'Edit kompetensi', 19007);


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: pesertas; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: role_menus; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0001A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0005A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0008A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0006A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0009A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0009B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0009C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0009D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0009E');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0009F');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0010A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0010B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0010C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0010D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0010E');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0010F');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0010G');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0010H');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0010I');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0010J');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0010K');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0010L');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0010M');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0016C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0017A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0017B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0018A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0019A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0003B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0001A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0001B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0001C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0001D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0001E');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0004A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0005A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0006A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0007A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0008A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0009A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0011A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0012A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0013A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0014A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0016A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0015A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0017A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0018A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0019A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0020A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0004B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0004C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0004D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0022A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0022B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0022C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0022D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0005B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0005C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0005D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0005E');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0006B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0006C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0006D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0007B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0007C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0007D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0009C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0009B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0009D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0009E');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0009F');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0001F');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010E');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010F');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010G');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010H');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010I');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010J');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021E');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021F');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021G');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021H');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021I');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021J');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0011B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0011C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0011D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0012B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0014B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0014C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0017B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0016C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0016B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0018B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0018C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010K');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021L');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021K');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021M');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0001H');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0001G');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0002A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010L');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010M');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0003A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0023A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0023B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0001A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0001G');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0001H');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0004A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0005A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0006A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0007A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0011A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0011B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0011C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0011D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0012A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0012B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0013A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0014A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0014B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0014C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0015A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0017A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0017B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0018A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0018B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0021A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0021B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0021C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0021D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0021E');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0021F');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0021G');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0021H');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0021I');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0021J');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0021K');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0021L');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0021M');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0022A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0022B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0022C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('OPRA', '0022D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0011A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0011B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0011C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVAL', '0011D');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0024A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010N');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010O');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0001I');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021N');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0011E');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0011F');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0009G');


--
-- Data for Name: room_members; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: sesi_schedules; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.settings (code, value) VALUES ('EXAM_THEME', '1');
INSERT INTO public.settings (code, value) VALUES ('EXAM_TEXT_WELCOME_PARSEDXX88', '');
INSERT INTO public.settings (code, value) VALUES ('EXAM_TEXT_FINISH_PARSEDXX88', '');
INSERT INTO public.settings (code, value) VALUES ('SECRET_EXO_BROWSER', 'XX11');
INSERT INTO public.settings (code, value) VALUES ('BROWSER_AGENT', '');
INSERT INTO public.settings (code, value) VALUES ('VERIFIED_DEVICE', 'N');
INSERT INTO public.settings (code, value) VALUES ('TRANSITION_TIME', '60');
INSERT INTO public.settings (code, value) VALUES ('INSTANT_CITY', '');
INSERT INTO public.settings (code, value) VALUES ('INSTANT_LOGO_1712LGX', '');
INSERT INTO public.settings (code, value) VALUES ('TOKEN_EXPIRED', '900');
INSERT INTO public.settings (code, value) VALUES ('SECRET_EXO_LOGOUT', '1945');
INSERT INTO public.settings (code, value) VALUES ('MAX_COUNTER_OUT', '1');
INSERT INTO public.settings (code, value) VALUES ('INSTANT_ADDRESS', '');
INSERT INTO public.settings (code, value) VALUES ('INSTANT_KOP_1712LGX', '');
INSERT INTO public.settings (code, value) VALUES ('INSTANT_NAME', '');
INSERT INTO public.settings (code, value) VALUES ('BROWSER_ALLOW_TYPE', '[{"code":"","value":""}]');
INSERT INTO public.settings (code, value) VALUES ('LOGIN_ONCE_ATIME', 'Y');
INSERT INTO public.settings (code, value) VALUES ('SECRET_EXO_LOGOUT_ACTIVE', '01');


--
-- Data for Name: siswa_ujians; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: soal_summaries; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: soals; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tokens (id, token, status, created_at, updated_at, expired_at) VALUES ('df30bea7-5002-4dad-920b-6d82133dbe26', 'XGIF', 0, '2024-04-27 03:03:15', '2024-05-18 01:23:52', '2024-04-27 03:11:35');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users (id, name, email, password, role, created_at, updated_at) VALUES ('3bdf7c0e-c22e-4643-869e-10dd8ea25b4d', 'Senandika Selesa', 'admin@shellrean.id', '$2y$10$ZBv9j2Pm6eqBDGFrEXr3V.a.TE5AnPEOH30qcJdIg00jQnkX0U75K', 'EVIL', '2023-08-13 20:49:43', '2023-11-13 09:32:23');


--
-- Name: exo_backups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.exo_backups_id_seq', 1, true);


--
-- Name: feature_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.feature_infos_id_seq', 32, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 145, true);


--
-- Name: agamas agamas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agamas
    ADD CONSTRAINT agamas_pkey PRIMARY KEY (id);


--
-- Name: banksoal_chains banksoal_chains_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.banksoal_chains
    ADD CONSTRAINT banksoal_chains_pk PRIMARY KEY (id);


--
-- Name: banksoal_summaries banksoal_summaries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.banksoal_summaries
    ADD CONSTRAINT banksoal_summaries_pkey PRIMARY KEY (id);


--
-- Name: banksoals banksoals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.banksoals
    ADD CONSTRAINT banksoals_pkey PRIMARY KEY (id);


--
-- Name: competence_items competence_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.competence_items
    ADD CONSTRAINT competence_items_pkey PRIMARY KEY (id);


--
-- Name: competences competences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.competences
    ADD CONSTRAINT competences_pkey PRIMARY KEY (id);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: medias directories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medias
    ADD CONSTRAINT directories_pkey PRIMARY KEY (id);


--
-- Name: ecosystem_keys ecosystem_keys_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ecosystem_keys
    ADD CONSTRAINT ecosystem_keys_pk PRIMARY KEY (id);


--
-- Name: events event_ujians_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT event_ujians_pkey PRIMARY KEY (id);


--
-- Name: backups exo_backups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.backups
    ADD CONSTRAINT exo_backups_pkey PRIMARY KEY (id);


--
-- Name: feature_infos feature_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feature_infos
    ADD CONSTRAINT feature_infos_pkey PRIMARY KEY (id);


--
-- Name: group_members group_members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: hasil_ujians hasil_ujians_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hasil_ujians
    ADD CONSTRAINT hasil_ujians_pkey PRIMARY KEY (id);


--
-- Name: jadwals_peserta jadwals_peserta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jadwals_peserta
    ADD CONSTRAINT jadwals_peserta_pkey PRIMARY KEY (id);


--
-- Name: jadwals jadwals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jadwals
    ADD CONSTRAINT jadwals_pkey PRIMARY KEY (id);


--
-- Name: jawaban_pesertas jawaban_pesertas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jawaban_pesertas
    ADD CONSTRAINT jawaban_pesertas_pkey PRIMARY KEY (id);


--
-- Name: jawaban_soals jawaban_soals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jawaban_soals
    ADD CONSTRAINT jawaban_soals_pkey PRIMARY KEY (id);


--
-- Name: jurusans jurusans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jurusans
    ADD CONSTRAINT jurusans_pkey PRIMARY KEY (id);


--
-- Name: jurusans kode; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jurusans
    ADD CONSTRAINT kode UNIQUE (kode);


--
-- Name: matpels matpels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matpels
    ADD CONSTRAINT matpels_pkey PRIMARY KEY (id);


--
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (code);


--
-- Name: check_answers penilaian_argument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.check_answers
    ADD CONSTRAINT penilaian_argument_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: pesertas pesertas_no_ujian_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesertas
    ADD CONSTRAINT pesertas_no_ujian_unique UNIQUE (no_ujian);


--
-- Name: pesertas pesertas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesertas
    ADD CONSTRAINT pesertas_pkey PRIMARY KEY (id);


--
-- Name: room_members room_members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_members
    ADD CONSTRAINT room_members_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: sesi_schedules sesi_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_schedules
    ADD CONSTRAINT sesi_schedules_pkey PRIMARY KEY (id);


--
-- Name: settings settings_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_code_key UNIQUE (code);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (code);


--
-- Name: siswa_ujians siswa_ujians_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siswa_ujians
    ADD CONSTRAINT siswa_ujians_pkey PRIMARY KEY (id);


--
-- Name: soal_summaries soal_summaries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.soal_summaries
    ADD CONSTRAINT soal_summaries_pkey PRIMARY KEY (id);


--
-- Name: soals soals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.soals
    ADD CONSTRAINT soals_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: agamas_kode_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX agamas_kode_index ON public.agamas USING btree (kode);


--
-- Name: feature_infos_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX feature_infos_name_index ON public.feature_infos USING btree (name);


--
-- Name: group_members_group_id_student_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX group_members_group_id_student_id_index ON public.group_members USING btree (group_id, student_id);


--
-- Name: groups_parent_id_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX groups_parent_id_name_index ON public.groups USING btree (parent_id, name);


--
-- Name: hasil_ujians_banksoal_id_peserta_id_jadwal_id_ujian_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX hasil_ujians_banksoal_id_peserta_id_jadwal_id_ujian_id_index ON public.hasil_ujians USING btree (banksoal_id, peserta_id, jadwal_id, ujian_id);


--
-- Name: jadwals_tanggal_status_ujian_event_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX jadwals_tanggal_status_ujian_event_id_index ON public.jadwals USING btree (tanggal, status_ujian, event_id);


--
-- Name: jawaban_pesertas_banksoal_id_soal_id_peserta_id_jadwal_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX jawaban_pesertas_banksoal_id_soal_id_peserta_id_jadwal_id_index ON public.jawaban_pesertas USING btree (banksoal_id, soal_id, peserta_id, jadwal_id);


--
-- Name: jawaban_soals_soal_id_correct_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX jawaban_soals_soal_id_correct_index ON public.jawaban_soals USING btree (soal_id, correct);


--
-- Name: jurusans_kode_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX jurusans_kode_index ON public.jurusans USING btree (kode);


--
-- Name: matpels_kode_mapel_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX matpels_kode_mapel_index ON public.matpels USING btree (kode_mapel);


--
-- Name: penilaian_argument_banksoal_id_peserta_id_jawab_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX penilaian_argument_banksoal_id_peserta_id_jawab_id_index ON public.check_answers USING btree (banksoal_id, peserta_id, jawab_id);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: pesertas_no_ujian_api_token_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pesertas_no_ujian_api_token_index ON public.pesertas USING btree (no_ujian, api_token);


--
-- Name: sesi_schedules_jadwal_id_sesi_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sesi_schedules_jadwal_id_sesi_index ON public.sesi_schedules USING btree (jadwal_id, sesi);


--
-- Name: siswa_ujians_peserta_id_jadwal_id_status_ujian_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX siswa_ujians_peserta_id_jadwal_id_status_ujian_index ON public.siswa_ujians USING btree (peserta_id, jadwal_id, status_ujian);


--
-- Name: soals_banksoal_id_tipe_soal_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX soals_banksoal_id_tipe_soal_index ON public.soals USING btree (banksoal_id, tipe_soal);


--
-- Name: users_email_role_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_email_role_index ON public.users USING btree (email, role);


--
-- PostgreSQL database dump complete
--

