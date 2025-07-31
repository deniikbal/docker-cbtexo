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
    persen character varying(350) NOT NULL,
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
    supports text,
    last_sequence integer DEFAULT 0 NOT NULL,
    sequence_type integer DEFAULT 0 NOT NULL,
    code15_max integer DEFAULT 0 NOT NULL,
    code16_max integer DEFAULT 0 NOT NULL
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
    jadwal_id uuid NOT NULL,
    ai_opinion text
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
    duration character varying(50) DEFAULT '-'::character varying NOT NULL,
    code15_correct integer DEFAULT 0 NOT NULL,
    code15_wrong integer DEFAULT 0 NOT NULL,
    code15_point numeric(19,2) DEFAULT 0 NOT NULL,
    code15_void integer DEFAULT 0 NOT NULL,
    code16_correct integer DEFAULT 0 NOT NULL,
    code16_wrong integer DEFAULT 0 NOT NULL,
    code16_point numeric(19,2) DEFAULT 0 NOT NULL,
    code16_void integer DEFAULT 0 NOT NULL
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
    part integer DEFAULT 1 NOT NULL,
    ai_opinion text,
    paper_code character varying(100)
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
-- Name: prompts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prompts (
    id character(26) NOT NULL,
    user_id character varying(36) NOT NULL,
    side character varying(100) NOT NULL,
    secondary_id character varying(36),
    content text NOT NULL,
    hide boolean NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    session_id character(26) NOT NULL,
    location_id character varying(100) DEFAULT ''::character varying NOT NULL
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
-- Name: shortcuts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shortcuts (
    id character(26) NOT NULL,
    user_id character(36) NOT NULL,
    name character varying(255) NOT NULL,
    destination text NOT NULL,
    icon text
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
    supports text,
    sequence bigint DEFAULT 0 NOT NULL,
    paper_answer boolean DEFAULT false NOT NULL
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
-- Name: tools; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tools (
    id character(26) NOT NULL,
    type character varying(100) DEFAULT 'function'::character varying NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    parameters text NOT NULL,
    script text,
    required text,
    location character varying(100) DEFAULT ''::character varying NOT NULL
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

INSERT INTO public.devices (id, device_id, device_os, device_name, ip_address, created_at, peserta_id, out_count, last_verified_at) VALUES ('daa1181c-504c-465a-a7ed-26a4b1e23e20', 'M841RQ9fuyVEa5V4sX6VBnj5', 'Mac OS', 'Chrome', '', '2025-04-08 15:37:16', NULL, 0, NULL);


--
-- Data for Name: ecosystem_keys; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ecosystem_keys (id, payload, public_key, signature) VALUES ('01JRB0QH9JYVSKJ4VD0NS4HJV5', '{"name":"SMKN 43 JAKARTA","address":"JL. CIPULIR 1","city":"KOTA JAKARTA SELATAN","expired_at":1751116818}', '', 'ZPZLiOG+/TNV6ZmxLO5dgyHPFgCnEQ4IBLy/F1ds0w6QLwCkhH0YDWrAYu6ambOJtc5t9yXYrcXLr4CIjU770ILuQ/WVozcOGKF5MRpfyQ6paPlTI0fPhC3I7p7IAL+MigdzxwXP53k=');


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
INSERT INTO public.menus (code, title, "order") VALUES ('0025A', 'Daftar shortcut', 36001);
INSERT INTO public.menus (code, title, "order") VALUES ('0025B', 'Tambah shortcut', 36002);
INSERT INTO public.menus (code, title, "order") VALUES ('0025C', 'Delete shortcut', 36003);


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: pesertas; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: prompts; Type: TABLE DATA; Schema: public; Owner: -
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
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0025B');
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
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0024A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010N');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010O');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0001I');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021N');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0011E');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0011F');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0009G');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0025A');
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
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010K');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021L');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021K');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0021M');
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
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0001H');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0001G');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0002A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010L');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0010M');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0003A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0023A');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0023B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0018C');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0003B');
INSERT INTO public.role_menus (role_code, menu_code) VALUES ('EVIL', '0025C');


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
INSERT INTO public.settings (code, value) VALUES ('TRANSITION_TIME', '60');
INSERT INTO public.settings (code, value) VALUES ('TOKEN_EXPIRED', '900');
INSERT INTO public.settings (code, value) VALUES ('SECRET_EXO_BROWSER', 'XX11');
INSERT INTO public.settings (code, value) VALUES ('BROWSER_ALLOW_TYPE', '[{"code":"","value":""}]');
INSERT INTO public.settings (code, value) VALUES ('BROWSER_AGENT', '');
INSERT INTO public.settings (code, value) VALUES ('LOGIN_ONCE_ATIME', 'Y');
INSERT INTO public.settings (code, value) VALUES ('SECRET_EXO_LOGOUT', '1945');
INSERT INTO public.settings (code, value) VALUES ('SECRET_EXO_LOGOUT_ACTIVE', '01');
INSERT INTO public.settings (code, value) VALUES ('VERIFIED_DEVICE', 'N');
INSERT INTO public.settings (code, value) VALUES ('AUTO_BLOCK', 'Y');
INSERT INTO public.settings (code, value) VALUES ('MAX_COUNTER_OUT', '1');
INSERT INTO public.settings (code, value) VALUES ('INSTANT_LOGO_1712LGX', '');
INSERT INTO public.settings (code, value) VALUES ('INSTANT_NAME', 'SMKN 43 JAKARTA');
INSERT INTO public.settings (code, value) VALUES ('INSTANT_CITY', 'KOTA JAKARTA SELATAN');
INSERT INTO public.settings (code, value) VALUES ('INSTANT_ADDRESS', 'JL. CIPULIR 1');
INSERT INTO public.settings (code, value) VALUES ('INSTANT_KOP_1712LGX', '');


--
-- Data for Name: shortcuts; Type: TABLE DATA; Schema: public; Owner: -
--



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

INSERT INTO public.tokens (id, token, status, created_at, updated_at, expired_at) VALUES ('9e0c2164-ef1f-4251-8e12-c9a5275312b7', 'QQWR', 0, '2025-03-30 19:19:41', '2025-03-31 14:09:03', '2025-03-30 19:34:41');


--
-- Data for Name: tools; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tools (id, type, name, description, parameters, script, required, location) VALUES ('01JMS067812BG668YH9ZG1HX4S', 'system', 'knowledge_base', NULL, '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
', NULL, NULL, '0001');
INSERT INTO public.tools (id, type, name, description, parameters, script, required, location) VALUES ('01JMMBYWD3GSA0SXJX5APN8QNA', 'function', 'generate_question', 'yalEdqcu+9WDtwXp9mCCXZCZg6lj8Q4x0Zr2EyM35m1eczFRmPA1ILdae67ST4f+E88Sj3397Qba+9gwDiCFeqw6', 'wIHYdwOpaKld7tyZj3WLr939YRptvC5Q8SSoWIjxr0PBwzqC31VGyTkmqHmuV3qL0wO0S0OyEwQFh0NZLOcuOKw2EoGciABtC5PY2YY5K4ovWgHBRDkMYmPBlKAFQO1FdVZnuksGltkhfF8+FJKqv2xIQy3YV/W4c3pDYwyDwAD6rEnEa/8sy9xt7gm0b8usj9D3TJn4UnQnjhd7WD2qIKIzLEEqhjxQn/FnouSLuldFK9JjUhWEo/FUJ8Xb+Qe1nYY+g/QuG8hTRBn9sklkRP3iuS6wfuHfZ3kkE6+M+MDve40mjtnc89SUryplGvxMt7ukTCNpsYHXu98R7d43e+I5dcGXYd/thGTnlEnyAIqWEeg2ycCZRQtm6nVjM4VJN9Zxx0YvQRW2dyxhPpaPoGZfpBvZSnjkZWDLWRQV1FEk8gOCzoQIe36l3drHJ1k0ze59mxZ4uqEGS8Szqn0v8wL6ga5bQs3ibC5OvJmP59vE2NTP3uB8+o4zQy93MzPudjfsSyNRpljfdh2Jf/vqIf8=', NULL, 'xX6KNk1Utpj1G9rVO5LnuWUd+0OVUm7ir+LTPcmiB4cleqniapwdBB3TU/D93NAg1XGHNFkY9wYhejScec6kk9YAHNubqBKOpkyN/UJo0g==', '0001');
INSERT INTO public.tools (id, type, name, description, parameters, script, required, location) VALUES ('01JM5159ZXS9J91B4D1J9NAXG0', 'function', 'detail_student', 'rpy2fPCgIZGXaOaj8hOYHolgi7pruhzfRUKAliId7FXSAofPF+4dfEoVdNZaXg==', 'LZYAaGG8WZSVjXY+4dZA7xRo8Niha2vdFiVzu9AKrr3bYM4hDbxZesECBZB/d+gIdWRFvhL4FLf2O/L6ERIWywdsXo68NjyFBN6F+JIPqfWU0PvkLWdi18JAAdSrejRcJEeb7w==', 'e2fdC/ubFDc6IBUI/qo5k0pc9uQzujwR/sCF9CrECqqlnyZkptpBAU7x6IN2A5IR8vAJvqD7WgQkgrzwnQQQCvpLDo445OVcMk8KF1rUv/ewdlW1ppBb1uKXD4k=', 'jqvlrGk2XzuwKqlDuMQmfWafmYGIqdHmqc1Gr7G/dFJumjpA', '0001');
INSERT INTO public.tools (id, type, name, description, parameters, script, required, location) VALUES ('01JM4H63V4PCTTZ1DY82T57NCQ', 'function', 'total_student', '/uvdtKM1EjdDcQdoHDzZ32UZ1QqCrQTDAynHLNujPuPW/c+hL9TVCHZRFS+w/NjdwdfX8K8=', '5oM26WqWYXb983Xkeps+k5ZNCPdalY8AsleG1Dil', 'zoXkWwJjUwOuTaNOpj0pqLV7qj4B8POV103ybDFHZzipUFdJPC+6UpXvGhT5+NjDNPlThp58MvYP', 'mbrK0sPlzDGrDalmsnhsx60jHcLqCSPMbYTT2Z8Z', '0001');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users (id, name, email, password, role, created_at, updated_at) VALUES ('3bdf7c0e-c22e-4643-869e-10dd8ea25b4d', 'Senandika Selesa', 'admin@shellrean.id', '$2y$10$ZBv9j2Pm6eqBDGFrEXr3V.a.TE5AnPEOH30qcJdIg00jQnkX0U75K', 'EVIL', '2023-08-13 20:49:43', '2025-03-30 07:21:51');


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

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 176, true);


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
-- Name: prompts prompts_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompts
    ADD CONSTRAINT prompts_pk PRIMARY KEY (id);


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
-- Name: shortcuts shortcuts_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shortcuts
    ADD CONSTRAINT shortcuts_pk PRIMARY KEY (id);


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
-- Name: tools tools_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_pk PRIMARY KEY (id);


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
