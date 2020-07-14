--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY micadoapp.user_types_translation DROP CONSTRAINT IF EXISTS user_types_translation_lang_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.user_types_translation DROP CONSTRAINT IF EXISTS user_types_translation_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.topic_translation DROP CONSTRAINT IF EXISTS topic_translation_lang_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.topic_translation DROP CONSTRAINT IF EXISTS topic_translation_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.step_translation DROP CONSTRAINT IF EXISTS step_translation_lang_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.step_translation DROP CONSTRAINT IF EXISTS step_translation_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.step_link_translation DROP CONSTRAINT IF EXISTS step_link_translation_step_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.step_link_translation DROP CONSTRAINT IF EXISTS step_link_translation_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.step_link DROP CONSTRAINT IF EXISTS step_link_to_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.step_link DROP CONSTRAINT IF EXISTS step_link_from_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.step_link DROP CONSTRAINT IF EXISTS step_link_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.step DROP CONSTRAINT IF EXISTS step_id_process_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.step_document DROP CONSTRAINT IF EXISTS step_document_id_document_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.step_document DROP CONSTRAINT IF EXISTS step_document_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.ratings DROP CONSTRAINT IF EXISTS ratings_um_user_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.process_users DROP CONSTRAINT IF EXISTS process_users_id_user_types_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.process_users DROP CONSTRAINT IF EXISTS process_users_id_process_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.process_translation DROP CONSTRAINT IF EXISTS process_translation_lang_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.process_translation DROP CONSTRAINT IF EXISTS process_translation_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.process_topic DROP CONSTRAINT IF EXISTS process_topic_id_topic_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.process_topic DROP CONSTRAINT IF EXISTS process_topic_id_process_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.picture_hotspot_translation DROP CONSTRAINT IF EXISTS picture_hotspot_translation_fk_1;
ALTER TABLE IF EXISTS ONLY micadoapp.picture_hotspot_translation DROP CONSTRAINT IF EXISTS picture_hotspot_translation_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.picture_hotspot DROP CONSTRAINT IF EXISTS picture_hotspot_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.intervention_types_translation DROP CONSTRAINT IF EXISTS intervention_types_translation_lang_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.intervention_types_translation DROP CONSTRAINT IF EXISTS intervention_types_translation_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.intervention_types DROP CONSTRAINT IF EXISTS intervention_types_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.intervention_type_validator DROP CONSTRAINT IF EXISTS intervention_type_validator_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.intervention_processes DROP CONSTRAINT IF EXISTS intervention_processes_process_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.intervention_processes DROP CONSTRAINT IF EXISTS intervention_processes_intervention_type_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.intervention_category_translation DROP CONSTRAINT IF EXISTS intervention_category_translation_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.intervention_category_translation DROP CONSTRAINT IF EXISTS intervention_category_id_translation_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.individual_intervention_plan DROP CONSTRAINT IF EXISTS individual_intervention_plan_um_user_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.individual_intervention_plan_interventions DROP CONSTRAINT IF EXISTS individual_intervention_plan_interventions_um_user_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.individual_intervention_plan_interventions DROP CONSTRAINT IF EXISTS individual_intervention_plan_interventions_list_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.individual_intervention_plan_interventions DROP CONSTRAINT IF EXISTS individual_intervention_plan_interventions_intervention_type_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.glossary_translation DROP CONSTRAINT IF EXISTS glossary_translation_fk_1;
ALTER TABLE IF EXISTS ONLY micadoapp.glossary_translation DROP CONSTRAINT IF EXISTS glossary_translation_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.features_flags_translation DROP CONSTRAINT IF EXISTS features_flags_translation_lang_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.features_flags_translation DROP CONSTRAINT IF EXISTS features_flags_translation_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.event_translation DROP CONSTRAINT IF EXISTS event_translation_lang_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.event_translation DROP CONSTRAINT IF EXISTS event_translation_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.event_topic DROP CONSTRAINT IF EXISTS event_topic_id_topic_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.event_topic DROP CONSTRAINT IF EXISTS event_topic_id_process_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.event_event_category DROP CONSTRAINT IF EXISTS event_event_category_id_process_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.event_event_category DROP CONSTRAINT IF EXISTS event_event_category_id_event_category_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.event_category_translation DROP CONSTRAINT IF EXISTS event_category_translation_lang_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.event_category_translation DROP CONSTRAINT IF EXISTS event_category_translation_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.document DROP CONSTRAINT IF EXISTS document_validated_um_user_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.document DROP CONSTRAINT IF EXISTS document_um_user_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.document_type_validator DROP CONSTRAINT IF EXISTS document_type_validator_validable_by_tenant_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.document_type_validator DROP CONSTRAINT IF EXISTS document_type_validator_document_type_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.document_type_translation DROP CONSTRAINT IF EXISTS document_type_translation_lang_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.document_type_translation DROP CONSTRAINT IF EXISTS document_type_translation_id_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.document_type_picture DROP CONSTRAINT IF EXISTS document_type_picture_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.document_pictures DROP CONSTRAINT IF EXISTS document_pictures_fk;
ALTER TABLE IF EXISTS ONLY micadoapp.document DROP CONSTRAINT IF EXISTS document_document_type_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.document DROP CONSTRAINT IF EXISTS document_ask_validate_by_tenant_fkey;
ALTER TABLE IF EXISTS ONLY micadoapp.user_types_translation DROP CONSTRAINT IF EXISTS user_types_translation_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.user_types DROP CONSTRAINT IF EXISTS user_types_pkey;
ALTER TABLE IF EXISTS ONLY micadoapp.topic_translation DROP CONSTRAINT IF EXISTS topic_translation_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.topic DROP CONSTRAINT IF EXISTS topic_pkey;
ALTER TABLE IF EXISTS ONLY micadoapp.step_translation DROP CONSTRAINT IF EXISTS step_translation_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.step DROP CONSTRAINT IF EXISTS step_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.step_link_translation DROP CONSTRAINT IF EXISTS step_link_translation_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.step_link DROP CONSTRAINT IF EXISTS step_link_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.step_document DROP CONSTRAINT IF EXISTS step_document_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.settings DROP CONSTRAINT IF EXISTS settings_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.process_users DROP CONSTRAINT IF EXISTS process_users_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.process_translation DROP CONSTRAINT IF EXISTS process_translation_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.process_topic DROP CONSTRAINT IF EXISTS process_topic_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.process DROP CONSTRAINT IF EXISTS process_pkey;
ALTER TABLE IF EXISTS ONLY micadoapp.picture_hotspot_translation DROP CONSTRAINT IF EXISTS picture_hotspot_translation_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.picture_hotspot DROP CONSTRAINT IF EXISTS picture_hotspot_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.migrant_app_config DROP CONSTRAINT IF EXISTS migrant_app_config_pkey;
ALTER TABLE IF EXISTS ONLY micadoapp.languages DROP CONSTRAINT IF EXISTS languages_pkey;
ALTER TABLE IF EXISTS ONLY micadoapp.intervention_types_translation DROP CONSTRAINT IF EXISTS intervention_types_translation_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.intervention_types DROP CONSTRAINT IF EXISTS intervention_types_pkey;
ALTER TABLE IF EXISTS ONLY micadoapp.intervention_type_validator DROP CONSTRAINT IF EXISTS intervention_type_validator_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.intervention_category_translation DROP CONSTRAINT IF EXISTS intervention_category_translation_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.intervention_category DROP CONSTRAINT IF EXISTS intervention_category_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.individual_intervention_plan DROP CONSTRAINT IF EXISTS individual_intervention_plan_pkey;
ALTER TABLE IF EXISTS ONLY micadoapp.individual_intervention_plan_interventions DROP CONSTRAINT IF EXISTS individual_intervention_plan_interventions_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.glossary_translation DROP CONSTRAINT IF EXISTS glossary_translation_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.glossary DROP CONSTRAINT IF EXISTS glossary_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.features_flags_translation DROP CONSTRAINT IF EXISTS features_flags_translation_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.features_flags DROP CONSTRAINT IF EXISTS features_flag_pkey;
ALTER TABLE IF EXISTS ONLY micadoapp.event DROP CONSTRAINT IF EXISTS event_pkey;
ALTER TABLE IF EXISTS ONLY micadoapp.event_category DROP CONSTRAINT IF EXISTS event_category_pkey;
ALTER TABLE IF EXISTS ONLY micadoapp.document_type_translation DROP CONSTRAINT IF EXISTS document_type_translation_pkey;
ALTER TABLE IF EXISTS ONLY micadoapp.document_type DROP CONSTRAINT IF EXISTS document_type_pkey;
ALTER TABLE IF EXISTS ONLY micadoapp.document_type_picture DROP CONSTRAINT IF EXISTS document_type_picture_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.document DROP CONSTRAINT IF EXISTS document_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.document_pictures DROP CONSTRAINT IF EXISTS document_pictures_pk;
ALTER TABLE IF EXISTS ONLY micadoapp.charts DROP CONSTRAINT IF EXISTS charts_pkey;
ALTER TABLE IF EXISTS micadoapp.user_types_translation ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.user_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.topic_translation ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.topic ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.ratings ALTER COLUMN content_id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.process_users ALTER COLUMN id_user_types DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.process_users ALTER COLUMN id_process DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.process_translation ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.process_topic ALTER COLUMN id_topic DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.process_topic ALTER COLUMN id_process DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.process ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.picture_hotspot ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.intervention_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.intervention_processes ALTER COLUMN process_id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.intervention_processes ALTER COLUMN intervention_type DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.intervention_category ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.individual_intervention_plan_interventions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.individual_intervention_plan_interventions ALTER COLUMN intervention_type DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.individual_intervention_plan_interventions ALTER COLUMN list_id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.individual_intervention_plan ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.glossary ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.features_flags ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.event_translation ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.event_topic ALTER COLUMN id_topic DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.event_topic ALTER COLUMN id_event DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.event_event_category ALTER COLUMN id_event_category DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.event_event_category ALTER COLUMN id_event DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.event_category_translation ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.event_category ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.event ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.document_type_picture ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.document_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.document ALTER COLUMN document_type DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.document ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS micadoapp.comments ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS micadoapp.user_types_translation_id_seq;
DROP TABLE IF EXISTS micadoapp.user_types_translation;
DROP SEQUENCE IF EXISTS micadoapp.user_types_id_seq;
DROP TABLE IF EXISTS micadoapp.user_types;
DROP SEQUENCE IF EXISTS micadoapp.topic_translation_id_seq;
DROP VIEW IF EXISTS micadoapp.topic_translated;
DROP TABLE IF EXISTS micadoapp.topic_translation;
DROP SEQUENCE IF EXISTS micadoapp.topic_id_seq;
DROP TABLE IF EXISTS micadoapp.topic;
DROP TABLE IF EXISTS micadoapp.step_translation;
DROP TABLE IF EXISTS micadoapp.step_link_translation;
DROP TABLE IF EXISTS micadoapp.step_link;
DROP TABLE IF EXISTS micadoapp.step_document;
DROP TABLE IF EXISTS micadoapp.step;
DROP TABLE IF EXISTS micadoapp.settings;
DROP SEQUENCE IF EXISTS micadoapp.ratings_content_id_seq;
DROP TABLE IF EXISTS micadoapp.ratings;
DROP SEQUENCE IF EXISTS micadoapp.process_users_id_user_types_seq;
DROP SEQUENCE IF EXISTS micadoapp.process_users_id_process_seq;
DROP TABLE IF EXISTS micadoapp.process_users;
DROP SEQUENCE IF EXISTS micadoapp.process_translation_id_seq;
DROP VIEW IF EXISTS micadoapp.process_translated;
DROP TABLE IF EXISTS micadoapp.process_translation;
DROP SEQUENCE IF EXISTS micadoapp.process_topic_id_topic_seq;
DROP SEQUENCE IF EXISTS micadoapp.process_topic_id_process_seq;
DROP TABLE IF EXISTS micadoapp.process_topic;
DROP SEQUENCE IF EXISTS micadoapp.process_id_seq;
DROP TABLE IF EXISTS micadoapp.process_comments;
DROP TABLE IF EXISTS micadoapp.process;
DROP VIEW IF EXISTS micadoapp.picture_hotspot_translated;
DROP TABLE IF EXISTS micadoapp.picture_hotspot_translation;
DROP SEQUENCE IF EXISTS micadoapp.picture_hotspot_id_seq;
DROP TABLE IF EXISTS micadoapp.picture_hotspot;
DROP TABLE IF EXISTS micadoapp.migrant_app_config;
DROP TABLE IF EXISTS micadoapp.languages;
DROP TABLE IF EXISTS micadoapp.intervention_types_translation;
DROP SEQUENCE IF EXISTS micadoapp.intervention_types_id_seq;
DROP TABLE IF EXISTS micadoapp.intervention_types;
DROP TABLE IF EXISTS micadoapp.intervention_type_validator;
DROP SEQUENCE IF EXISTS micadoapp.intervention_processes_process_id_seq;
DROP SEQUENCE IF EXISTS micadoapp.intervention_processes_intervention_type_seq;
DROP TABLE IF EXISTS micadoapp.intervention_processes;
DROP TABLE IF EXISTS micadoapp.intervention_category_translation;
DROP SEQUENCE IF EXISTS micadoapp.intervention_category_id_seq;
DROP TABLE IF EXISTS micadoapp.intervention_category;
DROP SEQUENCE IF EXISTS micadoapp.individual_intervention_plan_interventions_list_id_seq;
DROP SEQUENCE IF EXISTS micadoapp.individual_intervention_plan_interventions_id_seq;
DROP SEQUENCE IF EXISTS micadoapp.individual_intervention_plan_intervention_intervention_type_seq;
DROP TABLE IF EXISTS micadoapp.individual_intervention_plan_interventions;
DROP SEQUENCE IF EXISTS micadoapp.individual_intervention_plan_id_seq;
DROP TABLE IF EXISTS micadoapp.individual_intervention_plan;
DROP TABLE IF EXISTS micadoapp.glossary_translation;
DROP SEQUENCE IF EXISTS micadoapp.glossary_id_seq;
DROP TABLE IF EXISTS micadoapp.glossary;
DROP VIEW IF EXISTS micadoapp.features_flags_translated;
DROP TABLE IF EXISTS micadoapp.features_flags_translation;
DROP SEQUENCE IF EXISTS micadoapp.features_flags_id_seq;
DROP SEQUENCE IF EXISTS micadoapp.event_translation_id_seq;
DROP TABLE IF EXISTS micadoapp.event_translation;
DROP SEQUENCE IF EXISTS micadoapp.event_topic_id_topic_seq;
DROP SEQUENCE IF EXISTS micadoapp.event_topic_id_event_seq;
DROP TABLE IF EXISTS micadoapp.event_topic;
DROP SEQUENCE IF EXISTS micadoapp.event_id_seq;
DROP SEQUENCE IF EXISTS micadoapp.event_event_category_id_event_seq;
DROP SEQUENCE IF EXISTS micadoapp.event_event_category_id_event_category_seq;
DROP TABLE IF EXISTS micadoapp.event_event_category;
DROP SEQUENCE IF EXISTS micadoapp.event_category_translation_id_seq;
DROP TABLE IF EXISTS micadoapp.event_category_translation;
DROP SEQUENCE IF EXISTS micadoapp.event_category_id_seq;
DROP TABLE IF EXISTS micadoapp.event_category;
DROP TABLE IF EXISTS micadoapp.event;
DROP TABLE IF EXISTS micadoapp.document_type_validator;
DROP VIEW IF EXISTS micadoapp.document_type_translated;
DROP TABLE IF EXISTS micadoapp.document_type_translation;
DROP SEQUENCE IF EXISTS micadoapp.document_type_picture_id_seq;
DROP TABLE IF EXISTS micadoapp.document_type_picture;
DROP SEQUENCE IF EXISTS micadoapp.document_type_id_seq;
DROP TABLE IF EXISTS micadoapp.document_type;
DROP TABLE IF EXISTS micadoapp.document_pictures;
DROP SEQUENCE IF EXISTS micadoapp.document_id_seq;
DROP SEQUENCE IF EXISTS micadoapp.document_document_type_seq;
DROP TABLE IF EXISTS micadoapp.document;
DROP TABLE IF EXISTS micadoapp.comments_translation;
DROP SEQUENCE IF EXISTS micadoapp.comments_id_seq;
DROP TABLE IF EXISTS micadoapp.comments;
DROP TABLE IF EXISTS micadoapp.charts;
DROP VIEW IF EXISTS micadoapp.active_features;
DROP TABLE IF EXISTS micadoapp.features_flags;
DROP SCHEMA IF EXISTS micadoapp;
--
-- Name: micadoapp; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA micadoapp;


SET default_with_oids = false;

--
-- Name: features_flags; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.features_flags (
    id smallint NOT NULL,
    flag_key text,
    enabled boolean DEFAULT false NOT NULL
);


--
-- Name: active_features; Type: VIEW; Schema: micadoapp; Owner: -
--

CREATE VIEW micadoapp.active_features AS
 SELECT json_agg(features_flags.flag_key) AS features
   FROM micadoapp.features_flags
  WHERE (features_flags.enabled = true);


--
-- Name: charts; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.charts (
    id smallint NOT NULL,
    title character(255) NOT NULL,
    content character varying NOT NULL,
    description character varying,
    category character(255),
    format character(255),
    type character(255),
    xistime boolean,
    x character(255),
    y character(255),
    board character(255)
);


--
-- Name: comments; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.comments (
    published boolean,
    publicationdate date,
    id smallint NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.comments_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.comments_id_seq OWNED BY micadoapp.comments.id;


--
-- Name: comments_translation; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.comments_translation (
    id smallint NOT NULL,
    lang character varying(10) NOT NULL,
    comment text,
    translationdate date
);


--
-- Name: document; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.document (
    id smallint NOT NULL,
    document_type smallint NOT NULL,
    user_id integer,
    user_tenant integer,
    ask_validate_by_tenant smallint,
    validated boolean DEFAULT false NOT NULL,
    validation_date timestamp without time zone,
    validated_by_tenant integer,
    validated_by_user integer,
    uploaded_by_me boolean DEFAULT false NOT NULL,
    expiration_date timestamp without time zone
);


--
-- Name: COLUMN document.user_id; Type: COMMENT; Schema: micadoapp; Owner: -
--

COMMENT ON COLUMN micadoapp.document.user_id IS 'id of the user owner of the document';


--
-- Name: COLUMN document.ask_validate_by_tenant; Type: COMMENT; Schema: micadoapp; Owner: -
--

COMMENT ON COLUMN micadoapp.document.ask_validate_by_tenant IS 'if the document is of a type that is validable here is where the owner can ask a potential validator to validate it';


--
-- Name: COLUMN document.uploaded_by_me; Type: COMMENT; Schema: micadoapp; Owner: -
--

COMMENT ON COLUMN micadoapp.document.uploaded_by_me IS 'this is used to uinderstand if is uploaded by the owner so that he can edit';


--
-- Name: COLUMN document.expiration_date; Type: COMMENT; Schema: micadoapp; Owner: -
--

COMMENT ON COLUMN micadoapp.document.expiration_date IS 'this will be inserted by hand';


--
-- Name: document_document_type_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.document_document_type_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: document_document_type_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.document_document_type_seq OWNED BY micadoapp.document.document_type;


--
-- Name: document_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.document_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: document_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.document_id_seq OWNED BY micadoapp.document.id;


--
-- Name: document_pictures; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.document_pictures (
    id smallint NOT NULL,
    picture text,
    doc_id smallint NOT NULL,
    "order" smallint
);


--
-- Name: document_type; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.document_type (
    id smallint NOT NULL,
    icon text,
    issuer character varying(20),
    model text,
    validable boolean DEFAULT false NOT NULL,
    validity_duration smallint,
    published boolean DEFAULT false NOT NULL,
    publication_date date
);


--
-- Name: COLUMN document_type.issuer; Type: COMMENT; Schema: micadoapp; Owner: -
--

COMMENT ON COLUMN micadoapp.document_type.issuer IS 'free text since not all issuers will have a tenant in MICADO';


--
-- Name: COLUMN document_type.validable; Type: COMMENT; Schema: micadoapp; Owner: -
--

COMMENT ON COLUMN micadoapp.document_type.validable IS 'if trhis document can be validated';


--
-- Name: COLUMN document_type.validity_duration; Type: COMMENT; Schema: micadoapp; Owner: -
--

COMMENT ON COLUMN micadoapp.document_type.validity_duration IS 'the duration of the document in days';


--
-- Name: document_type_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.document_type_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: document_type_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.document_type_id_seq OWNED BY micadoapp.document_type.id;


--
-- Name: document_type_picture; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.document_type_picture (
    id smallint NOT NULL,
    image text,
    document_type_id smallint NOT NULL,
    "order" integer
);


--
-- Name: document_type_picture_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.document_type_picture_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: document_type_picture_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.document_type_picture_id_seq OWNED BY micadoapp.document_type_picture.id;


--
-- Name: document_type_translation; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.document_type_translation (
    id smallint NOT NULL,
    lang character varying(10) NOT NULL,
    document character varying(50),
    description text,
    translation_date timestamp without time zone
);


--
-- Name: document_type_translated; Type: VIEW; Schema: micadoapp; Owner: -
--

CREATE VIEW micadoapp.document_type_translated AS
 SELECT dt.id,
    dt.icon,
    dt.issuer,
    dt.model,
    dt.validable,
    dt.validity_duration,
    dtt.lang,
    dtt.document,
    dtt.description
   FROM micadoapp.document_type dt,
    micadoapp.document_type_translation dtt
  WHERE (dt.id = dtt.id);


--
-- Name: document_type_validator; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.document_type_validator (
    document_type_id smallint NOT NULL,
    validable_by_tenant integer
);


--
-- Name: TABLE document_type_validator; Type: COMMENT; Schema: micadoapp; Owner: -
--

COMMENT ON TABLE micadoapp.document_type_validator IS 'this table map all the organizations that are eligible to validate that tenant';


--
-- Name: event; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.event (
    id smallint NOT NULL,
    link character varying(70),
    published boolean DEFAULT false NOT NULL,
    publication_date timestamp without time zone
);


--
-- Name: TABLE event; Type: COMMENT; Schema: micadoapp; Owner: -
--

COMMENT ON TABLE micadoapp.event IS 'this is the generic event table for courses, news,  etc that each organization wants to publish';


--
-- Name: event_category; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.event_category (
    id smallint NOT NULL,
    icon text
);


--
-- Name: event_category_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.event_category_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_category_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.event_category_id_seq OWNED BY micadoapp.event_category.id;


--
-- Name: event_category_translation; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.event_category_translation (
    id smallint NOT NULL,
    lang character varying(10),
    event_category character varying(20),
    translation_date timestamp without time zone
);


--
-- Name: event_category_translation_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.event_category_translation_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_category_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.event_category_translation_id_seq OWNED BY micadoapp.event_category_translation.id;


--
-- Name: event_event_category; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.event_event_category (
    id_event smallint NOT NULL,
    id_event_category smallint NOT NULL
);


--
-- Name: event_event_category_id_event_category_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.event_event_category_id_event_category_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_event_category_id_event_category_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.event_event_category_id_event_category_seq OWNED BY micadoapp.event_event_category.id_event_category;


--
-- Name: event_event_category_id_event_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.event_event_category_id_event_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_event_category_id_event_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.event_event_category_id_event_seq OWNED BY micadoapp.event_event_category.id_event;


--
-- Name: event_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.event_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.event_id_seq OWNED BY micadoapp.event.id;


--
-- Name: event_topic; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.event_topic (
    id_event smallint NOT NULL,
    id_topic smallint NOT NULL
);


--
-- Name: event_topic_id_event_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.event_topic_id_event_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_topic_id_event_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.event_topic_id_event_seq OWNED BY micadoapp.event_topic.id_event;


--
-- Name: event_topic_id_topic_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.event_topic_id_topic_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_topic_id_topic_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.event_topic_id_topic_seq OWNED BY micadoapp.event_topic.id_topic;


--
-- Name: event_translation; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.event_translation (
    id smallint NOT NULL,
    lang character varying(10),
    event character varying(20),
    description text,
    translation_date timestamp without time zone
);


--
-- Name: event_translation_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.event_translation_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.event_translation_id_seq OWNED BY micadoapp.event_translation.id;


--
-- Name: features_flags_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.features_flags_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: features_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.features_flags_id_seq OWNED BY micadoapp.features_flags.id;


--
-- Name: features_flags_translation; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.features_flags_translation (
    id smallint NOT NULL,
    lang character varying(10) NOT NULL,
    feature character varying(30),
    translation_date timestamp without time zone
);


--
-- Name: features_flags_translated; Type: VIEW; Schema: micadoapp; Owner: -
--

CREATE VIEW micadoapp.features_flags_translated AS
 SELECT f.id,
    f.flag_key,
    f.enabled,
    ft.lang,
    ft.feature
   FROM micadoapp.features_flags f,
    micadoapp.features_flags_translation ft
  WHERE (f.id = ft.id);


--
-- Name: glossary; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.glossary (
    id smallint NOT NULL,
    published boolean DEFAULT false NOT NULL,
    publication_date date
);


--
-- Name: glossary_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.glossary_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: glossary_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.glossary_id_seq OWNED BY micadoapp.glossary.id;


--
-- Name: glossary_translation; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.glossary_translation (
    id smallint NOT NULL,
    lang character varying(10) NOT NULL,
    title character varying(25),
    description text,
    translation_date timestamp without time zone
);


--
-- Name: individual_intervention_plan; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.individual_intervention_plan (
    id smallint NOT NULL,
    title character varying(30),
    creation_date timestamp without time zone,
    end_date timestamp without time zone,
    case_manager character varying(30),
    user_id integer,
    user_tenant integer,
    completed boolean DEFAULT false NOT NULL
);


--
-- Name: individual_intervention_plan_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.individual_intervention_plan_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: individual_intervention_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.individual_intervention_plan_id_seq OWNED BY micadoapp.individual_intervention_plan.id;


--
-- Name: individual_intervention_plan_interventions; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.individual_intervention_plan_interventions (
    list_id smallint NOT NULL,
    intervention_type smallint NOT NULL,
    validation_date timestamp without time zone,
    completed boolean,
    validating_user_id integer,
    validating_user_tenant integer,
    assignment_date timestamp without time zone,
    id smallint NOT NULL,
    validationrequestdate date
);


--
-- Name: individual_intervention_plan_intervention_intervention_type_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.individual_intervention_plan_intervention_intervention_type_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: individual_intervention_plan_intervention_intervention_type_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.individual_intervention_plan_intervention_intervention_type_seq OWNED BY micadoapp.individual_intervention_plan_interventions.intervention_type;


--
-- Name: individual_intervention_plan_interventions_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.individual_intervention_plan_interventions_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: individual_intervention_plan_interventions_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.individual_intervention_plan_interventions_id_seq OWNED BY micadoapp.individual_intervention_plan_interventions.id;


--
-- Name: individual_intervention_plan_interventions_list_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.individual_intervention_plan_interventions_list_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: individual_intervention_plan_interventions_list_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.individual_intervention_plan_interventions_list_id_seq OWNED BY micadoapp.individual_intervention_plan_interventions.list_id;


--
-- Name: intervention_category; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.intervention_category (
    id smallint NOT NULL,
    published boolean DEFAULT false NOT NULL,
    publication_date date
);


--
-- Name: intervention_category_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.intervention_category_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: intervention_category_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.intervention_category_id_seq OWNED BY micadoapp.intervention_category.id;


--
-- Name: intervention_category_translation; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.intervention_category_translation (
    id smallint NOT NULL,
    lang character varying(10) NOT NULL,
    title character varying(30),
    translation_date timestamp without time zone
);


--
-- Name: intervention_processes; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.intervention_processes (
    intervention_type smallint NOT NULL,
    process_id smallint NOT NULL
);


--
-- Name: intervention_processes_intervention_type_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.intervention_processes_intervention_type_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: intervention_processes_intervention_type_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.intervention_processes_intervention_type_seq OWNED BY micadoapp.intervention_processes.intervention_type;


--
-- Name: intervention_processes_process_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.intervention_processes_process_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: intervention_processes_process_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.intervention_processes_process_id_seq OWNED BY micadoapp.intervention_processes.process_id;


--
-- Name: intervention_type_validator; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.intervention_type_validator (
    tenant_id integer NOT NULL,
    intervention_type_id smallint NOT NULL
);


--
-- Name: intervention_types; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.intervention_types (
    id smallint NOT NULL,
    published boolean DEFAULT false NOT NULL,
    publication_date date,
    category_type smallint
);


--
-- Name: intervention_types_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.intervention_types_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: intervention_types_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.intervention_types_id_seq OWNED BY micadoapp.intervention_types.id;


--
-- Name: intervention_types_translation; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.intervention_types_translation (
    id smallint NOT NULL,
    lang character varying(10) NOT NULL,
    intervention_title character varying(20),
    description text,
    translation_date timestamp without time zone
);


--
-- Name: languages; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.languages (
    lang character varying(10) NOT NULL,
    iso_code character varying(10),
    name character varying(25),
    active boolean DEFAULT false NOT NULL,
    is_default boolean DEFAULT false NOT NULL
);


--
-- Name: migrant_app_config; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.migrant_app_config (
    id integer NOT NULL,
    features json
);


--
-- Name: picture_hotspot; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.picture_hotspot (
    id smallint NOT NULL,
    x smallint,
    y smallint,
    picture_id smallint
);


--
-- Name: picture_hotspot_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.picture_hotspot_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: picture_hotspot_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.picture_hotspot_id_seq OWNED BY micadoapp.picture_hotspot.id;


--
-- Name: picture_hotspot_translation; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.picture_hotspot_translation (
    pht_id smallint NOT NULL,
    lang character varying(10) NOT NULL,
    title character varying(20),
    message text
);


--
-- Name: picture_hotspot_translated; Type: VIEW; Schema: micadoapp; Owner: -
--

CREATE VIEW micadoapp.picture_hotspot_translated AS
 SELECT ph.id,
    ph.x,
    ph.y,
    ph.picture_id,
    pht.lang,
    pht.title,
    pht.message
   FROM micadoapp.picture_hotspot ph,
    micadoapp.picture_hotspot_translation pht
  WHERE (ph.id = pht.pht_id);


--
-- Name: process; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.process (
    id smallint NOT NULL,
    link character varying(70),
    published boolean DEFAULT false NOT NULL,
    publication_date timestamp without time zone
);


--
-- Name: process_comments; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.process_comments (
    idcomment smallint NOT NULL,
    idprocess smallint NOT NULL
);


--
-- Name: process_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.process_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: process_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.process_id_seq OWNED BY micadoapp.process.id;


--
-- Name: process_topic; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.process_topic (
    id_process smallint NOT NULL,
    id_topic smallint NOT NULL
);


--
-- Name: process_topic_id_process_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.process_topic_id_process_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: process_topic_id_process_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.process_topic_id_process_seq OWNED BY micadoapp.process_topic.id_process;


--
-- Name: process_topic_id_topic_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.process_topic_id_topic_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: process_topic_id_topic_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.process_topic_id_topic_seq OWNED BY micadoapp.process_topic.id_topic;


--
-- Name: process_translation; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.process_translation (
    id smallint NOT NULL,
    lang character varying(10) NOT NULL,
    process character varying(30),
    description text,
    translation_date timestamp without time zone
);


--
-- Name: process_translated; Type: VIEW; Schema: micadoapp; Owner: -
--

CREATE VIEW micadoapp.process_translated AS
 SELECT p.id,
    p.link,
    p.published,
    p.publication_date,
    pt.lang,
    pt.process,
    pt.description
   FROM micadoapp.process p,
    micadoapp.process_translation pt
  WHERE (p.id = pt.id);


--
-- Name: process_translation_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.process_translation_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: process_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.process_translation_id_seq OWNED BY micadoapp.process_translation.id;


--
-- Name: process_users; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.process_users (
    id_process smallint NOT NULL,
    id_user_types smallint NOT NULL
);


--
-- Name: process_users_id_process_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.process_users_id_process_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: process_users_id_process_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.process_users_id_process_seq OWNED BY micadoapp.process_users.id_process;


--
-- Name: process_users_id_user_types_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.process_users_id_user_types_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: process_users_id_user_types_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.process_users_id_user_types_seq OWNED BY micadoapp.process_users.id_user_types;


--
-- Name: ratings; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.ratings (
    user_id integer,
    user_tenant integer,
    content_id smallint NOT NULL,
    content_type integer,
    value integer
);


--
-- Name: ratings_content_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.ratings_content_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ratings_content_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.ratings_content_id_seq OWNED BY micadoapp.ratings.content_id;


--
-- Name: settings; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.settings (
    key character varying NOT NULL,
    value character varying(1500)
);


--
-- Name: step; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.step (
    id uuid NOT NULL,
    cost real,
    location_specific boolean,
    location character varying(100),
    location_lon real,
    location_lat real,
    id_process smallint NOT NULL
);


--
-- Name: step_document; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.step_document (
    id_document smallint NOT NULL,
    is_out boolean NOT NULL,
    cost money,
    id_step uuid NOT NULL
);


--
-- Name: step_link; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.step_link (
    id uuid NOT NULL,
    from_step uuid NOT NULL,
    to_step uuid NOT NULL,
    id_process smallint NOT NULL
);


--
-- Name: step_link_translation; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.step_link_translation (
    lang character varying(10) NOT NULL,
    description character varying(25),
    id uuid NOT NULL
);


--
-- Name: step_translation; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.step_translation (
    lang character varying(10) NOT NULL,
    step character varying(25),
    description text,
    translation_date timestamp without time zone,
    id uuid NOT NULL
);


--
-- Name: topic; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.topic (
    id smallint NOT NULL,
    icon text,
    published boolean DEFAULT false NOT NULL,
    publication_date date
);


--
-- Name: topic_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.topic_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: topic_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.topic_id_seq OWNED BY micadoapp.topic.id;


--
-- Name: topic_translation; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.topic_translation (
    id smallint NOT NULL,
    lang character varying(10) NOT NULL,
    topic character varying(20),
    translation_date timestamp without time zone
);


--
-- Name: topic_translated; Type: VIEW; Schema: micadoapp; Owner: -
--

CREATE VIEW micadoapp.topic_translated AS
 SELECT t.id,
    t.icon,
    tt.lang,
    tt.topic
   FROM micadoapp.topic t,
    micadoapp.topic_translation tt
  WHERE (t.id = tt.id);


--
-- Name: topic_translation_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.topic_translation_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: topic_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.topic_translation_id_seq OWNED BY micadoapp.topic_translation.id;


--
-- Name: user_types; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.user_types (
    id smallint NOT NULL,
    icon text,
    published boolean DEFAULT false NOT NULL,
    publication_date date
);


--
-- Name: user_types_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.user_types_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_types_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.user_types_id_seq OWNED BY micadoapp.user_types.id;


--
-- Name: user_types_translation; Type: TABLE; Schema: micadoapp; Owner: -
--

CREATE TABLE micadoapp.user_types_translation (
    id smallint NOT NULL,
    lang character varying(10) NOT NULL,
    user_type character varying(20),
    description text,
    translation_date timestamp without time zone
);


--
-- Name: user_types_translation_id_seq; Type: SEQUENCE; Schema: micadoapp; Owner: -
--

CREATE SEQUENCE micadoapp.user_types_translation_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_types_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: micadoapp; Owner: -
--

ALTER SEQUENCE micadoapp.user_types_translation_id_seq OWNED BY micadoapp.user_types_translation.id;


--
-- Name: comments id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.comments ALTER COLUMN id SET DEFAULT nextval('micadoapp.comments_id_seq'::regclass);


--
-- Name: document id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document ALTER COLUMN id SET DEFAULT nextval('micadoapp.document_id_seq'::regclass);


--
-- Name: document document_type; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document ALTER COLUMN document_type SET DEFAULT nextval('micadoapp.document_document_type_seq'::regclass);


--
-- Name: document_type id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document_type ALTER COLUMN id SET DEFAULT nextval('micadoapp.document_type_id_seq'::regclass);


--
-- Name: document_type_picture id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document_type_picture ALTER COLUMN id SET DEFAULT nextval('micadoapp.document_type_picture_id_seq'::regclass);


--
-- Name: event id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event ALTER COLUMN id SET DEFAULT nextval('micadoapp.event_id_seq'::regclass);


--
-- Name: event_category id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_category ALTER COLUMN id SET DEFAULT nextval('micadoapp.event_category_id_seq'::regclass);


--
-- Name: event_category_translation id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_category_translation ALTER COLUMN id SET DEFAULT nextval('micadoapp.event_category_translation_id_seq'::regclass);


--
-- Name: event_event_category id_event; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_event_category ALTER COLUMN id_event SET DEFAULT nextval('micadoapp.event_event_category_id_event_seq'::regclass);


--
-- Name: event_event_category id_event_category; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_event_category ALTER COLUMN id_event_category SET DEFAULT nextval('micadoapp.event_event_category_id_event_category_seq'::regclass);


--
-- Name: event_topic id_event; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_topic ALTER COLUMN id_event SET DEFAULT nextval('micadoapp.event_topic_id_event_seq'::regclass);


--
-- Name: event_topic id_topic; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_topic ALTER COLUMN id_topic SET DEFAULT nextval('micadoapp.event_topic_id_topic_seq'::regclass);


--
-- Name: event_translation id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_translation ALTER COLUMN id SET DEFAULT nextval('micadoapp.event_translation_id_seq'::regclass);


--
-- Name: features_flags id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.features_flags ALTER COLUMN id SET DEFAULT nextval('micadoapp.features_flags_id_seq'::regclass);


--
-- Name: glossary id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.glossary ALTER COLUMN id SET DEFAULT nextval('micadoapp.glossary_id_seq'::regclass);


--
-- Name: individual_intervention_plan id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.individual_intervention_plan ALTER COLUMN id SET DEFAULT nextval('micadoapp.individual_intervention_plan_id_seq'::regclass);


--
-- Name: individual_intervention_plan_interventions list_id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.individual_intervention_plan_interventions ALTER COLUMN list_id SET DEFAULT nextval('micadoapp.individual_intervention_plan_interventions_list_id_seq'::regclass);


--
-- Name: individual_intervention_plan_interventions intervention_type; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.individual_intervention_plan_interventions ALTER COLUMN intervention_type SET DEFAULT nextval('micadoapp.individual_intervention_plan_intervention_intervention_type_seq'::regclass);


--
-- Name: individual_intervention_plan_interventions id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.individual_intervention_plan_interventions ALTER COLUMN id SET DEFAULT nextval('micadoapp.individual_intervention_plan_interventions_id_seq'::regclass);


--
-- Name: intervention_category id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_category ALTER COLUMN id SET DEFAULT nextval('micadoapp.intervention_category_id_seq'::regclass);


--
-- Name: intervention_processes intervention_type; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_processes ALTER COLUMN intervention_type SET DEFAULT nextval('micadoapp.intervention_processes_intervention_type_seq'::regclass);


--
-- Name: intervention_processes process_id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_processes ALTER COLUMN process_id SET DEFAULT nextval('micadoapp.intervention_processes_process_id_seq'::regclass);


--
-- Name: intervention_types id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_types ALTER COLUMN id SET DEFAULT nextval('micadoapp.intervention_types_id_seq'::regclass);


--
-- Name: picture_hotspot id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.picture_hotspot ALTER COLUMN id SET DEFAULT nextval('micadoapp.picture_hotspot_id_seq'::regclass);


--
-- Name: process id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process ALTER COLUMN id SET DEFAULT nextval('micadoapp.process_id_seq'::regclass);


--
-- Name: process_topic id_process; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process_topic ALTER COLUMN id_process SET DEFAULT nextval('micadoapp.process_topic_id_process_seq'::regclass);


--
-- Name: process_topic id_topic; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process_topic ALTER COLUMN id_topic SET DEFAULT nextval('micadoapp.process_topic_id_topic_seq'::regclass);


--
-- Name: process_translation id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process_translation ALTER COLUMN id SET DEFAULT nextval('micadoapp.process_translation_id_seq'::regclass);


--
-- Name: process_users id_process; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process_users ALTER COLUMN id_process SET DEFAULT nextval('micadoapp.process_users_id_process_seq'::regclass);


--
-- Name: process_users id_user_types; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process_users ALTER COLUMN id_user_types SET DEFAULT nextval('micadoapp.process_users_id_user_types_seq'::regclass);


--
-- Name: ratings content_id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.ratings ALTER COLUMN content_id SET DEFAULT nextval('micadoapp.ratings_content_id_seq'::regclass);


--
-- Name: topic id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.topic ALTER COLUMN id SET DEFAULT nextval('micadoapp.topic_id_seq'::regclass);


--
-- Name: topic_translation id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.topic_translation ALTER COLUMN id SET DEFAULT nextval('micadoapp.topic_translation_id_seq'::regclass);


--
-- Name: user_types id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.user_types ALTER COLUMN id SET DEFAULT nextval('micadoapp.user_types_id_seq'::regclass);


--
-- Name: user_types_translation id; Type: DEFAULT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.user_types_translation ALTER COLUMN id SET DEFAULT nextval('micadoapp.user_types_translation_id_seq'::regclass);


--
-- Data for Name: charts; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.charts VALUES (3, 'Homeless + YAP(Young Adults Project)                                                                                                                                                                                                                           ', '[{"mic:datum":["2015-06"],"mic:wert":["2543"]},{"mic:datum":["2015-07"],"mic:wert":["2586"]},{"mic:datum":["2015-08"],"mic:wert":["2634"]},{"mic:datum":["2015-09"],"mic:wert":["2649"]},{"mic:datum":["2015-10"],"mic:wert":["2709"]},{"mic:datum":["2015-11"],"mic:wert":["2791"]},{"mic:datum":["2015-12"],"mic:wert":["2982"]},{"mic:datum":["2016-01"],"mic:wert":["2908"]},{"mic:datum":["2016-02"],"mic:wert":["3003"]},{"mic:datum":["2016-03"],"mic:wert":["3010"]},{"mic:datum":["2016-04"],"mic:wert":["3095"]},{"mic:datum":["2016-05"],"mic:wert":["3114"]},{"mic:datum":["2016-06"],"mic:wert":["3151"]},{"mic:datum":["2016-07"],"mic:wert":["3226"]},{"mic:datum":["2016-08"],"mic:wert":["3269"]},{"mic:datum":["2016-09"],"mic:wert":["3251"]},{"mic:datum":["2016-10"],"mic:wert":["3282"]},{"mic:datum":["2016-11"],"mic:wert":["3303"]},{"mic:datum":["2016-12"],"mic:wert":["3319"]},{"mic:datum":["2017-01"],"mic:wert":["3366"]},{"mic:datum":["2017-02"],"mic:wert":["3405"]},{"mic:datum":["2017-03"],"mic:wert":["3580"]},{"mic:datum":["2017-04"],"mic:wert":["3660"]},{"mic:datum":["2017-05"],"mic:wert":["3716"]},{"mic:datum":["2017-06"],"mic:wert":["3897"]},{"mic:datum":["2017-07"],"mic:wert":["4027"]},{"mic:datum":["2017-08"],"mic:wert":["4173"]},{"mic:datum":["2017-09"],"mic:wert":["4294"]},{"mic:datum":["2017-10"],"mic:wert":["4321"]},{"mic:datum":["2017-11"],"mic:wert":["4442"]},{"mic:datum":["2017-12"],"mic:wert":["4505"]},{"mic:datum":["2018-01"],"mic:wert":["4625"]},{"mic:datum":["2018-02"],"mic:wert":["4652"]},{"mic:datum":["2018-03"],"mic:wert":["4649"]},{"mic:datum":["2018-04"],"mic:wert":["4612"]},{"mic:datum":["2018-05"],"mic:wert":["4676"]},{"mic:datum":["2018-06"],"mic:wert":["4716"]},{"mic:datum":["2018-07"],"mic:wert":["4762"]},{"mic:datum":["2018-08"],"mic:wert":["4810"]},{"mic:datum":["2018-09"],"mic:wert":["4926"]},{"mic:datum":["2018-10"],"mic:wert":["4966"]},{"mic:datum":["2018-11"],"mic:wert":["5008"]},{"mic:datum":["2018-12"],"mic:wert":["4954"]},{"mic:datum":["2019-01"],"mic:wert":["4991"]},{"mic:datum":["2019-02"],"mic:wert":["5007"]},{"mic:datum":["2019-03"],"mic:wert":["5051"]},{"mic:datum":["2019-04"],"mic:wert":["5164"]},{"mic:datum":["2019-05"],"mic:wert":["5210"]},{"mic:datum":["2019-06"],"mic:wert":["5276"]},{"mic:datum":["2019-07"],"mic:wert":["5289"]},{"mic:datum":["2019-08"],"mic:wert":["5274"]},{"mic:datum":["2019-09"],"mic:wert":["5257"]},{"mic:datum":["2019-10"],"mic:wert":["5310"]},{"mic:datum":["2019-11"],"mic:wert":["5358"]},{"mic:datum":["2019-12"],"mic:wert":["5436"]},{"mic:datum":["2020-01"],"mic:wert":["5466"]},{"mic:datum":["2020-02"],"mic:wert":["5474"]},{"mic:datum":["2020-03"],"mic:wert":["5506"]}]', NULL, 'integration                                                                                                                                                                                                                                                    ', NULL, 'LINE                                                                                                                                                                                                                                                           ', true, 'mic:datum                                                                                                                                                                                                                                                      ', 'mic:wert                                                                                                                                                                                                                                                       ', 'hamburg                                                                                                                                                                                                                                                        ');
INSERT INTO micadoapp.charts VALUES (1, 'Influx Hamburg                                                                                                                                                                                                                                                 ', '[{"mic:datum":"2015-06","mic:wert":56},{"mic:datum":"2015-07","mic:wert":88},{"mic:datum":"2015-08","mic:wert":101},{"mic:datum":"2015-09","mic:wert":122},{"mic:datum":"2015-10","mic:wert":"112"},{"mic:datum":"2015-11","mic:wert":"89"},{"mic:datum":"2015-12","mic:wert":"113"},{"mic:datum":"2016-01","mic:wert":"106"},{"mic:datum":"2016-02","mic:wert":"82"},{"mic:datum":"2016-03","mic:wert":"91"},{"mic:datum":"2016-04","mic:wert":"110"},{"mic:datum":"2016-05","mic:wert":"123"},{"mic:datum":"2016-06","mic:wert":"158"},{"mic:datum":"2016-07","mic:wert":"91"},{"mic:datum":"2016-08","mic:wert":"150"},{"mic:datum":"2016-09","mic:wert":"145"},{"mic:datum":"2016-10","mic:wert":"128"},{"mic:datum":"2016-11","mic:wert":"147"},{"mic:datum":"2016-12","mic:wert":"206"},{"mic:datum":"2017-01","mic:wert":"105"},{"mic:datum":"2017-02","mic:wert":"132"},{"mic:datum":"2017-03","mic:wert":"157"},{"mic:datum":"2017-04","mic:wert":"92"},{"mic:datum":"2017-05","mic:wert":"164"},{"mic:datum":"2017-06","mic:wert":"128"},{"mic:datum":"2017-07","mic:wert":"162"},{"mic:datum":"2017-08","mic:wert":"129"},{"mic:datum":"2017-09","mic:wert":"142"},{"mic:datum":"2017-10","mic:wert":"146"},{"mic:datum":"2017-11","mic:wert":"102"},{"mic:datum":"2017-12","mic:wert":"90"},{"mic:datum":"2018-01","mic:wert":"76"},{"mic:datum":"2018-02","mic:wert":"64"},{"mic:datum":"2018-03","mic:wert":"125"},{"mic:datum":"2018-04","mic:wert":"67"},{"mic:datum":"2018-05","mic:wert":"83"},{"mic:datum":"2018-06","mic:wert":"83"},{"mic:datum":"2018-07","mic:wert":"64"},{"mic:datum":"2018-08","mic:wert":"54"},{"mic:datum":"2018-09","mic:wert":"48"},{"mic:datum":"2018-10","mic:wert":"46"},{"mic:datum":"2018-11","mic:wert":"91"},{"mic:datum":"2018-12","mic:wert":"67"},{"mic:datum":"2019-01","mic:wert":"46"},{"mic:datum":"2019-02","mic:wert":"62"},{"mic:datum":"2019-03","mic:wert":"41"},{"mic:datum":"2019-04","mic:wert":"58"},{"mic:datum":"2019-05","mic:wert":"79"},{"mic:datum":"2019-06","mic:wert":"34"},{"mic:datum":"2019-07","mic:wert":"74"},{"mic:datum":"2019-08","mic:wert":"60"},{"mic:datum":"2019-09","mic:wert":"79"},{"mic:datum":"2019-10","mic:wert":"82"},{"mic:datum":"2019-11","mic:wert":"74"},{"mic:datum":"2019-12","mic:wert":"109"},{"mic:datum":"2020-01","mic:wert":"26"},{"mic:datum":"2020-02","mic:wert":"76"},{"mic:datum":"2020-03","mic:wert":"25"}]', NULL, 'incoming                                                                                                                                                                                                                                                       ', NULL, 'BAR                                                                                                                                                                                                                                                            ', true, 'mic:datum                                                                                                                                                                                                                                                      ', 'mic:wert                                                                                                                                                                                                                                                       ', 'hamburg                                                                                                                                                                                                                                                        ');
INSERT INTO micadoapp.charts VALUES (2, 'influx_for_family_reunion                                                                                                                                                                                                                                      ', '[{"mic:datum":"2015-06","mic:wert":25},{"mic:datum":"2015-07","mic:wert":54},{"mic:datum":"2015-08","mic:wert":47},{"mic:datum":"2015-09","mic:wert":44},{"mic:datum":"2015-10","mic:wert":43},{"mic:datum":"2015-11","mic:wert":29},{"mic:datum":"2015-12","mic:wert":66},{"mic:datum":"2016-01","mic:wert":22},{"mic:datum":"2016-02","mic:wert":34},{"mic:datum":"2016-03","mic:wert":56},{"mic:datum":"2016-04","mic:wert":51},{"mic:datum":"2016-05","mic:wert":68},{"mic:datum":"2016-06","mic:wert":73},{"mic:datum":"2016-07","mic:wert":29},{"mic:datum":"2016-08","mic:wert":70},{"mic:datum":"2016-09","mic:wert":76},{"mic:datum":"2016-10","mic:wert":65},{"mic:datum":"2016-11","mic:wert":95},{"mic:datum":"2016-12","mic:wert":151},{"mic:datum":"2017-01","mic:wert":75},{"mic:datum":"2017-02","mic:wert":77},{"mic:datum":"2017-03","mic:wert":84},{"mic:datum":"2017-04","mic:wert":70},{"mic:datum":"2017-05","mic:wert":81},{"mic:datum":"2017-06","mic:wert":76},{"mic:datum":"2017-07","mic:wert":114},{"mic:datum":"2017-08","mic:wert":76},{"mic:datum":"2017-09","mic:wert":85},{"mic:datum":"2017-10","mic:wert":68},{"mic:datum":"2017-11","mic:wert":57},{"mic:datum":"2017-12","mic:wert":60},{"mic:datum":"2018-01","mic:wert":33},{"mic:datum":"2018-02","mic:wert":23},{"mic:datum":"2018-03","mic:wert":74},{"mic:datum":"2018-04","mic:wert":36},{"mic:datum":"2018-05","mic:wert":51},{"mic:datum":"2018-06","mic:wert":37},{"mic:datum":"2018-07","mic:wert":29},{"mic:datum":"2018-08","mic:wert":21},{"mic:datum":"2018-09","mic:wert":14},{"mic:datum":"2018-10","mic:wert":6},{"mic:datum":"2018-11","mic:wert":31},{"mic:datum":"2018-12","mic:wert":17},{"mic:datum":"2019-01","mic:wert":23},{"mic:datum":"2019-02","mic:wert":29},{"mic:datum":"2019-03","mic:wert":26},{"mic:datum":"2019-04","mic:wert":26},{"mic:datum":"2019-05","mic:wert":32},{"mic:datum":"2019-06","mic:wert":15},{"mic:datum":"2019-07","mic:wert":34},{"mic:datum":"2019-08","mic:wert":19},{"mic:datum":"2019-09","mic:wert":20},{"mic:datum":"2019-10","mic:wert":28},{"mic:datum":"2019-11","mic:wert":20},{"mic:datum":"2019-12","mic:wert":55},{"mic:datum":"2020-01","mic:wert":6},{"mic:datum":"2020-02","mic:wert":15},{"mic:datum":"2020-03","mic:wert":4}]', NULL, 'incoming                                                                                                                                                                                                                                                       ', NULL, 'LINE                                                                                                                                                                                                                                                           ', true, 'mic:datum                                                                                                                                                                                                                                                      ', 'mic:wert                                                                                                                                                                                                                                                       ', 'hamburg                                                                                                                                                                                                                                                        ');
INSERT INTO micadoapp.charts VALUES (6, 'Total immigrants and homeless                                                                                                                                                                                                                                  ', '[{"mic:datum":["2018-04"],"mic:wert":["29725"]},{"mic:datum":["2018-05"],"mic:wert":["30137"]},{"mic:datum":["2018-06"],"mic:wert":["30313"]},{"mic:datum":["2018-07"],"mic:wert":["30686"]},{"mic:datum":["2015-06"],"mic:wert":["13424"]},{"mic:datum":["2015-07"],"mic:wert":["13740"]},{"mic:datum":["2015-08"],"mic:wert":["13832"]},{"mic:datum":["2015-09"],"mic:wert":["14094"]},{"mic:datum":["2015-10"],"mic:wert":["14719"]},{"mic:datum":["2015-11"],"mic:wert":["15511"]},{"mic:datum":["2015-12"],"mic:wert":["16242"]},{"mic:datum":["2016-01"],"mic:wert":["16642"]},{"mic:datum":["2016-02"],"mic:wert":["17226"]},{"mic:datum":["2016-03"],"mic:wert":["18144"]},{"mic:datum":["2016-04"],"mic:wert":["18260"]},{"mic:datum":["2016-05"],"mic:wert":["19565"]},{"mic:datum":["2016-06"],"mic:wert":["20279"]},{"mic:datum":["2016-07"],"mic:wert":["21253"]},{"mic:datum":["2016-08"],"mic:wert":["22338"]},{"mic:datum":["2016-09"],"mic:wert":["22757"]},{"mic:datum":["2016-10"],"mic:wert":["22917"]},{"mic:datum":["2016-11"],"mic:wert":["23259"]},{"mic:datum":["2016-12"],"mic:wert":["23816"]},{"mic:datum":["2017-01"],"mic:wert":["24409"]},{"mic:datum":["2017-02"],"mic:wert":["25228"]},{"mic:datum":["2017-03"],"mic:wert":["26104"]},{"mic:datum":["2017-04"],"mic:wert":["26422"]},{"mic:datum":["2017-05"],"mic:wert":["26717"]},{"mic:datum":["2017-06"],"mic:wert":["27078"]},{"mic:datum":["2017-07"],"mic:wert":["27279"]},{"mic:datum":["2017-08"],"mic:wert":["27490"]},{"mic:datum":["2017-09"],"mic:wert":["28095"]},{"mic:datum":["2017-10"],"mic:wert":["28442"]},{"mic:datum":["2017-11"],"mic:wert":["28957"]},{"mic:datum":["2017-12"],"mic:wert":["29243"]},{"mic:datum":["2018-01"],"mic:wert":["29436"]},{"mic:datum":["2018-02"],"mic:wert":["29479"]},{"mic:datum":["2018-03"],"mic:wert":["29627"]},{"mic:datum":["2018-08"],"mic:wert":["30987"]},{"mic:datum":["2018-09"],"mic:wert":["31159"]},{"mic:datum":["2018-10"],"mic:wert":["31342"]},{"mic:datum":["2018-11"],"mic:wert":["31732"]},{"mic:datum":["2018-12"],"mic:wert":["31529"]},{"mic:datum":["2019-01"],"mic:wert":["31598"]},{"mic:datum":["2019-02"],"mic:wert":["31678"]},{"mic:datum":["2019-03"],"mic:wert":["31475"]},{"mic:datum":["2019-04"],"mic:wert":["31384"]},{"mic:datum":["2019-05"],"mic:wert":["31345"]},{"mic:datum":["2019-06"],"mic:wert":["31222"]},{"mic:datum":["2019-07"],"mic:wert":["31071"]},{"mic:datum":["2019-08"],"mic:wert":["30833"]},{"mic:datum":["2019-09"],"mic:wert":["30752"]},{"mic:datum":["2019-10"],"mic:wert":["30741"]},{"mic:datum":["2019-11"],"mic:wert":["30631"]},{"mic:datum":["2019-12"],"mic:wert":["30601"]},{"mic:datum":["2020-01"],"mic:wert":["30628"]},{"mic:datum":["2020-02"],"mic:wert":["30627"]},{"mic:datum":["2020-03"],"mic:wert":["30477"]}]', NULL, 'integration                                                                                                                                                                                                                                                    ', NULL, 'LINE                                                                                                                                                                                                                                                           ', true, 'mic:datum                                                                                                                                                                                                                                                      ', 'mic:wert                                                                                                                                                                                                                                                       ', 'hamburg                                                                                                                                                                                                                                                        ');
INSERT INTO micadoapp.charts VALUES (4, 'Immigrants entitled residence                                                                                                                                                                                                                                  ', '[{"mic:datum":["2015-06"],"mic:wert":["3395"]},{"mic:datum":["2015-07"],"mic:wert":["3420"]},{"mic:datum":["2015-08"],"mic:wert":["3478"]},{"mic:datum":["2015-09"],"mic:wert":["3533"]},{"mic:datum":["2015-10"],"mic:wert":["3563"]},{"mic:datum":["2015-11"],"mic:wert":["3632"]},{"mic:datum":["2015-12"],"mic:wert":["3635"]},{"mic:datum":["2016-01"],"mic:wert":["3886"]},{"mic:datum":["2016-02"],"mic:wert":["4021"]},{"mic:datum":["2016-03"],"mic:wert":["4103"]},{"mic:datum":["2016-04"],"mic:wert":["4069"]},{"mic:datum":["2016-05"],"mic:wert":["4499"]},{"mic:datum":["2016-06"],"mic:wert":["4592"]},{"mic:datum":["2016-07"],"mic:wert":["4779"]},{"mic:datum":["2016-08"],"mic:wert":["5101"]},{"mic:datum":["2016-09"],"mic:wert":["5678"]},{"mic:datum":["2016-10"],"mic:wert":["6190"]},{"mic:datum":["2016-11"],"mic:wert":["6976"]},{"mic:datum":["2016-12"],"mic:wert":["7344"]},{"mic:datum":["2017-01"],"mic:wert":["7904"]},{"mic:datum":["2017-02"],"mic:wert":["8493"]},{"mic:datum":["2017-03"],"mic:wert":["9475"]},{"mic:datum":["2017-04"],"mic:wert":["9949"]},{"mic:datum":["2017-05"],"mic:wert":["12128"]},{"mic:datum":["2017-06"],"mic:wert":["12314"]},{"mic:datum":["2017-07"],"mic:wert":["12828"]},{"mic:datum":["2017-08"],"mic:wert":["13317"]},{"mic:datum":["2017-09"],"mic:wert":["14014"]},{"mic:datum":["2017-10"],"mic:wert":["14693"]},{"mic:datum":["2017-11"],"mic:wert":["15112"]},{"mic:datum":["2017-12"],"mic:wert":["15218"]},{"mic:datum":["2018-01"],"mic:wert":["15302"]},{"mic:datum":["2018-02"],"mic:wert":["15282"]},{"mic:datum":["2018-03"],"mic:wert":["15459"]},{"mic:datum":["2018-04"],"mic:wert":["15461"]},{"mic:datum":["2018-05"],"mic:wert":["15522"]},{"mic:datum":["2018-06"],"mic:wert":["15616"]},{"mic:datum":["2018-07"],"mic:wert":["15562"]},{"mic:datum":["2018-08"],"mic:wert":["15493"]},{"mic:datum":["2018-09"],"mic:wert":["15450"]},{"mic:datum":["2018-10"],"mic:wert":["15406"]},{"mic:datum":["2018-11"],"mic:wert":["15524"]},{"mic:datum":["2018-12"],"mic:wert":["15439"]},{"mic:datum":["2019-01"],"mic:wert":["15397"]},{"mic:datum":["2019-02"],"mic:wert":["15399"]},{"mic:datum":["2019-03"],"mic:wert":["15369"]},{"mic:datum":["2019-04"],"mic:wert":["15267"]},{"mic:datum":["2019-05"],"mic:wert":["15338"]},{"mic:datum":["2019-06"],"mic:wert":["15275"]},{"mic:datum":["2019-07"],"mic:wert":["15090"]},{"mic:datum":["2019-08"],"mic:wert":["14953"]},{"mic:datum":["2019-09"],"mic:wert":["14842"]},{"mic:datum":["2019-10"],"mic:wert":["14877"]},{"mic:datum":["2019-11"],"mic:wert":["14756"]},{"mic:datum":["2019-12"],"mic:wert":["14631"]},{"mic:datum":["2020-01"],"mic:wert":["14590"]},{"mic:datum":["2020-02"],"mic:wert":["14721"]},{"mic:datum":["2020-03"],"mic:wert":["14535"]}]', NULL, 'integration                                                                                                                                                                                                                                                    ', NULL, 'LINE                                                                                                                                                                                                                                                           ', true, 'mic:datum                                                                                                                                                                                                                                                      ', 'mic:wert                                                                                                                                                                                                                                                       ', 'hamburg                                                                                                                                                                                                                                                        ');
INSERT INTO micadoapp.charts VALUES (5, 'Immigrants not entitled residence                                                                                                                                                                                                                              ', '[{"mic:datum":["2015-06"],"mic:wert":["7486"]},{"mic:datum":["2015-07"],"mic:wert":["7734"]},{"mic:datum":["2015-08"],"mic:wert":["7720"]},{"mic:datum":["2015-09"],"mic:wert":["7912"]},{"mic:datum":["2015-10"],"mic:wert":["8447"]},{"mic:datum":["2015-11"],"mic:wert":["9088"]},{"mic:datum":["2015-12"],"mic:wert":["9625"]},{"mic:datum":["2016-01"],"mic:wert":["9848"]},{"mic:datum":["2016-02"],"mic:wert":["10202"]},{"mic:datum":["2016-03"],"mic:wert":["11031"]},{"mic:datum":["2016-04"],"mic:wert":["11096"]},{"mic:datum":["2016-05"],"mic:wert":["11952"]},{"mic:datum":["2016-06"],"mic:wert":["12536"]},{"mic:datum":["2016-07"],"mic:wert":["13248"]},{"mic:datum":["2016-08"],"mic:wert":["13968"]},{"mic:datum":["2016-09"],"mic:wert":["13828"]},{"mic:datum":["2016-10"],"mic:wert":["13445"]},{"mic:datum":["2016-11"],"mic:wert":["12980"]},{"mic:datum":["2016-12"],"mic:wert":["13153"]},{"mic:datum":["2017-01"],"mic:wert":["13139"]},{"mic:datum":["2017-02"],"mic:wert":["13330"]},{"mic:datum":["2017-03"],"mic:wert":["13049"]},{"mic:datum":["2017-04"],"mic:wert":["12813"]},{"mic:datum":["2017-05"],"mic:wert":["10873"]},{"mic:datum":["2017-06"],"mic:wert":["10867"]},{"mic:datum":["2017-07"],"mic:wert":["10424"]},{"mic:datum":["2017-08"],"mic:wert":["10000"]},{"mic:datum":["2017-09"],"mic:wert":["9787"]},{"mic:datum":["2017-10"],"mic:wert":["9428"]},{"mic:datum":["2017-11"],"mic:wert":["9403"]},{"mic:datum":["2017-12"],"mic:wert":["9520"]},{"mic:datum":["2018-01"],"mic:wert":["9509"]},{"mic:datum":["2018-02"],"mic:wert":["9545"]},{"mic:datum":["2018-03"],"mic:wert":["9519"]},{"mic:datum":["2018-04"],"mic:wert":["9652"]},{"mic:datum":["2018-05"],"mic:wert":["9939"]},{"mic:datum":["2018-06"],"mic:wert":["9981"]},{"mic:datum":["2018-07"],"mic:wert":["10362"]},{"mic:datum":["2018-08"],"mic:wert":["10684"]},{"mic:datum":["2018-09"],"mic:wert":["10783"]},{"mic:datum":["2018-10"],"mic:wert":["10970"]},{"mic:datum":["2018-11"],"mic:wert":["11200"]},{"mic:datum":["2018-12"],"mic:wert":["11136"]},{"mic:datum":["2019-01"],"mic:wert":["11210"]},{"mic:datum":["2019-02"],"mic:wert":["11272"]},{"mic:datum":["2019-03"],"mic:wert":["11055"]},{"mic:datum":["2019-04"],"mic:wert":["10953"]},{"mic:datum":["2019-05"],"mic:wert":["10797"]},{"mic:datum":["2019-06"],"mic:wert":["10671"]},{"mic:datum":["2019-07"],"mic:wert":["10692"]},{"mic:datum":["2019-08"],"mic:wert":["10606"]},{"mic:datum":["2019-09"],"mic:wert":["10653"]},{"mic:datum":["2019-10"],"mic:wert":["10554"]},{"mic:datum":["2019-11"],"mic:wert":["10517"]},{"mic:datum":["2019-12"],"mic:wert":["10534"]},{"mic:datum":["2020-01"],"mic:wert":["10572"]},{"mic:datum":["2020-02"],"mic:wert":["10432"]},{"mic:datum":["2020-03"],"mic:wert":["10436"]}]', NULL, 'integration                                                                                                                                                                                                                                                    ', NULL, 'LINE                                                                                                                                                                                                                                                           ', true, 'mic:datum                                                                                                                                                                                                                                                      ', 'mic:wert                                                                                                                                                                                                                                                       ', 'hamburg                                                                                                                                                                                                                                                        ');
INSERT INTO micadoapp.charts VALUES (7, 'Real influx government residence                                                                                                                                                                                                                               ', '[{"mic:datum":["2015-06"],"mic:wert":["786"]},{"mic:datum":["2015-07"],"mic:wert":["617"]},{"mic:datum":["2015-08"],"mic:wert":["444"]},{"mic:datum":["2015-09"],"mic:wert":["739"]},{"mic:datum":["2015-10"],"mic:wert":["1158"]},{"mic:datum":["2015-11"],"mic:wert":["1198"]},{"mic:datum":["2015-12"],"mic:wert":["1141"]},{"mic:datum":["2016-01"],"mic:wert":["807"]},{"mic:datum":["2016-02"],"mic:wert":["1042"]},{"mic:datum":["2016-03"],"mic:wert":["1442"]},{"mic:datum":["2016-04"],"mic:wert":["759"]},{"mic:datum":["2016-05"],"mic:wert":["1478"]},{"mic:datum":["2016-06"],"mic:wert":["1367"]},{"mic:datum":["2016-07"],"mic:wert":["1130"]},{"mic:datum":["2016-08"],"mic:wert":["1588"]},{"mic:datum":["2016-09"],"mic:wert":["739"]},{"mic:datum":["2016-10"],"mic:wert":["598"]},{"mic:datum":["2016-11"],"mic:wert":["882"]},{"mic:datum":["2016-12"],"mic:wert":["868"]},{"mic:datum":["2017-01"],"mic:wert":["669"]},{"mic:datum":["2017-02"],"mic:wert":["869"]},{"mic:datum":["2017-03"],"mic:wert":["1136"]},{"mic:datum":["2017-04"],"mic:wert":["506"]},{"mic:datum":["2017-05"],"mic:wert":["502"]},{"mic:datum":["2017-06"],"mic:wert":["670"]},{"mic:datum":["2017-07"],"mic:wert":["569"]},{"mic:datum":["2017-08"],"mic:wert":["663"]},{"mic:datum":["2017-09"],"mic:wert":["986"]},{"mic:datum":["2017-10"],"mic:wert":["708"]},{"mic:datum":["2017-11"],"mic:wert":["812"]},{"mic:datum":["2017-12"],"mic:wert":["555"]},{"mic:datum":["2018-01"],"mic:wert":["626"]},{"mic:datum":["2018-02"],"mic:wert":["495"]},{"mic:datum":["2018-03"],"mic:wert":["634"]},{"mic:datum":["2018-04"],"mic:wert":["541"]},{"mic:datum":["2018-05"],"mic:wert":["791"]},{"mic:datum":["2018-06"],"mic:wert":["572"]},{"mic:datum":["2018-07"],"mic:wert":["832"]},{"mic:datum":["2018-08"],"mic:wert":["769"]},{"mic:datum":["2018-09"],"mic:wert":["563"]},{"mic:datum":["2018-10"],"mic:wert":["569"]},{"mic:datum":["2018-11"],"mic:wert":["758"]},{"mic:datum":["2018-12"],"mic:wert":["267"]},{"mic:datum":["2019-01"],"mic:wert":["479"]},{"mic:datum":["2019-02"],"mic:wert":["490"]},{"mic:datum":["2019-03"],"mic:wert":["221"]},{"mic:datum":["2019-04"],"mic:wert":["323"]},{"mic:datum":["2019-05"],"mic:wert":["326"]},{"mic:datum":["2019-06"],"mic:wert":["294"]},{"mic:datum":["2019-07"],"mic:wert":["420"]},{"mic:datum":["2019-08"],"mic:wert":["368"]},{"mic:datum":["2019-09"],"mic:wert":["416"]},{"mic:datum":["2019-10"],"mic:wert":["464"]},{"mic:datum":["2019-11"],"mic:wert":["355"]},{"mic:datum":["2019-12"],"mic:wert":["437"]},{"mic:datum":["2020-01"],"mic:wert":["443"]},{"mic:datum":["2020-02"],"mic:wert":["444"]},{"mic:datum":["2020-03"],"mic:wert":["306"]}]', NULL, 'accommodation                                                                                                                                                                                                                                                  ', NULL, 'LINE                                                                                                                                                                                                                                                           ', true, 'mic:datum                                                                                                                                                                                                                                                      ', 'mic:wert                                                                                                                                                                                                                                                       ', 'hamburg                                                                                                                                                                                                                                                        ');
INSERT INTO micadoapp.charts VALUES (8, 'Real influx government residences from CIR/CR/IR                                                                                                                                                                                                               ', '[{"mic:datum":["2015-06"],"mic:wert":["786"]},{"mic:datum":["2015-07"],"mic:wert":["617"]},{"mic:datum":["2015-08"],"mic:wert":["444"]},{"mic:datum":["2015-09"],"mic:wert":["739"]},{"mic:datum":["2015-10"],"mic:wert":["1158"]},{"mic:datum":["2015-11"],"mic:wert":["1198"]},{"mic:datum":["2015-12"],"mic:wert":["1141"]},{"mic:datum":["2016-01"],"mic:wert":["807"]},{"mic:datum":["2016-02"],"mic:wert":["1042"]},{"mic:datum":["2016-03"],"mic:wert":["1442"]},{"mic:datum":["2016-04"],"mic:wert":["759"]},{"mic:datum":["2016-05"],"mic:wert":["1478"]},{"mic:datum":["2016-06"],"mic:wert":["1367"]},{"mic:datum":["2016-07"],"mic:wert":["1130"]},{"mic:datum":["2016-08"],"mic:wert":["1588"]},{"mic:datum":["2016-09"],"mic:wert":["739"]},{"mic:datum":["2016-10"],"mic:wert":["598"]},{"mic:datum":["2016-11"],"mic:wert":["882"]},{"mic:datum":["2016-12"],"mic:wert":["868"]},{"mic:datum":["2017-01"],"mic:wert":["669"]},{"mic:datum":["2017-02"],"mic:wert":["869"]},{"mic:datum":["2017-03"],"mic:wert":["1136"]},{"mic:datum":["2017-04"],"mic:wert":["506"]},{"mic:datum":["2017-05"],"mic:wert":["502"]},{"mic:datum":["2017-06"],"mic:wert":["670"]},{"mic:datum":["2017-07"],"mic:wert":["569"]},{"mic:datum":["2017-08"],"mic:wert":["663"]},{"mic:datum":["2017-09"],"mic:wert":["986"]},{"mic:datum":["2017-10"],"mic:wert":["708"]},{"mic:datum":["2017-11"],"mic:wert":["812"]},{"mic:datum":["2017-12"],"mic:wert":["555"]},{"mic:datum":["2018-01"],"mic:wert":["626"]},{"mic:datum":["2018-02"],"mic:wert":["495"]},{"mic:datum":["2018-03"],"mic:wert":["634"]},{"mic:datum":["2018-04"],"mic:wert":["541"]},{"mic:datum":["2018-05"],"mic:wert":["791"]},{"mic:datum":["2018-06"],"mic:wert":["572"]},{"mic:datum":["2018-07"],"mic:wert":["832"]},{"mic:datum":["2018-08"],"mic:wert":["769"]},{"mic:datum":["2018-09"],"mic:wert":["563"]},{"mic:datum":["2018-10"],"mic:wert":["569"]},{"mic:datum":["2018-11"],"mic:wert":["758"]},{"mic:datum":["2018-12"],"mic:wert":["267"]},{"mic:datum":["2019-01"],"mic:wert":["479"]},{"mic:datum":["2019-02"],"mic:wert":["490"]},{"mic:datum":["2019-03"],"mic:wert":["221"]},{"mic:datum":["2019-04"],"mic:wert":["323"]},{"mic:datum":["2019-05"],"mic:wert":["326"]},{"mic:datum":["2019-06"],"mic:wert":["294"]},{"mic:datum":["2019-07"],"mic:wert":["420"]},{"mic:datum":["2019-08"],"mic:wert":["368"]},{"mic:datum":["2019-09"],"mic:wert":["416"]},{"mic:datum":["2019-10"],"mic:wert":["464"]},{"mic:datum":["2019-11"],"mic:wert":["355"]},{"mic:datum":["2019-12"],"mic:wert":["437"]},{"mic:datum":["2020-01"],"mic:wert":["443"]},{"mic:datum":["2020-02"],"mic:wert":["444"]},{"mic:datum":["2020-03"],"mic:wert":["306"]}]', NULL, 'accommodation                                                                                                                                                                                                                                                  ', NULL, 'LINE                                                                                                                                                                                                                                                           ', true, 'mic:datum                                                                                                                                                                                                                                                      ', 'mic:wert                                                                                                                                                                                                                                                       ', 'hamburg                                                                                                                                                                                                                                                        ');
INSERT INTO micadoapp.charts VALUES (9, 'Demographic composition - including parents origin                                                                                                                                                                                                             ', '[{"group":"native","percentage":48.9},{"group":"immigrant","percentage":51.1}]', NULL, 'Demographics                                                                                                                                                                                                                                                   ', NULL, 'PIE                                                                                                                                                                                                                                                            ', NULL, 'group                                                                                                                                                                                                                                                          ', 'percentage                                                                                                                                                                                                                                                     ', 'Antwerp                                                                                                                                                                                                                                                        ');
INSERT INTO micadoapp.charts VALUES (12, 'percentage of unemployed belgian nationals (18-64)                                                                                                                                                                                                             ', '[{"year":2015,"percentage":7},{"year":2016,"percentage":6.9},{"year":2017,"percentage":6.5},{"year":2018,"percentage":6.1},{"year":2019,"percentage":5.7}]', NULL, 'employment                                                                                                                                                                                                                                                     ', NULL, 'BAR                                                                                                                                                                                                                                                            ', false, 'year                                                                                                                                                                                                                                                           ', 'percentage                                                                                                                                                                                                                                                     ', 'antwerp                                                                                                                                                                                                                                                        ');
INSERT INTO micadoapp.charts VALUES (16, 'people with social replacement income - 2020 Q1                                                                                                                                                                                                                ', '[{"group":"Belgian national","percentage":37},{"group":"EU national","percentage":6},{"group":"non-EU national","percentage":57}]', NULL, 'financial aid                                                                                                                                                                                                                                                  ', NULL, 'PIE                                                                                                                                                                                                                                                            ', false, 'group                                                                                                                                                                                                                                                          ', 'percentage                                                                                                                                                                                                                                                     ', 'antwerp                                                                                                                                                                                                                                                        ');
INSERT INTO micadoapp.charts VALUES (14, 'percentage of unemployed non-EU nationals (18-64)                                                                                                                                                                                                              ', '[{"year":2015,"percentage":16.9},{"year":2016,"percentage":17},{"year":2017,"percentage":15.9},{"year":2018,"percentage":15.3},{"year":2019,"percentage":13.7}]', NULL, 'employment                                                                                                                                                                                                                                                     ', NULL, 'BAR                                                                                                                                                                                                                                                            ', false, 'year                                                                                                                                                                                                                                                           ', 'percentage                                                                                                                                                                                                                                                     ', 'antwerp                                                                                                                                                                                                                                                        ');
INSERT INTO micadoapp.charts VALUES (10, 'Percentage of migrants - including parents origin                                                                                                                                                                                                              ', '[{"year":"2015","percentage":45.8},{"year":"2016","percentage":46.9},{"year":"2017","percentage":48},{"year":"2018","percentage":49.1},{"year":"2019","percentage":50.1},{"year":"2020","percentage":50.1}]', NULL, 'Demographics                                                                                                                                                                                                                                                   ', NULL, 'BAR                                                                                                                                                                                                                                                            ', false, 'year                                                                                                                                                                                                                                                           ', 'percentage                                                                                                                                                                                                                                                     ', 'antwerp                                                                                                                                                                                                                                                        ');
INSERT INTO micadoapp.charts VALUES (11, 'Participant in integration lessons Atlas                                                                                                                                                                                                                       ', '[{"month":"2019-05","number":2070},{"month":"2019-06","number":1971},{"month":"2019-07","number":1917},{"month":"2019-08","number":1951},{"month":"2019-09","number":1975},{"month":"2019-10","number":1985},{"month":"2019-11","number":1940},{"month":"2019-12","number":1952},{"month":"2020-01","number":1900},{"month":"2020-02","number":1812},{"month":"2020-03","number":1760},{"month":"2020-04","number":1752},{"month":"2020-05","number":1743}]', NULL, 'ATLAS                                                                                                                                                                                                                                                          ', NULL, 'BAR                                                                                                                                                                                                                                                            ', false, 'month                                                                                                                                                                                                                                                          ', 'number                                                                                                                                                                                                                                                         ', 'Antwerp                                                                                                                                                                                                                                                        ');
INSERT INTO micadoapp.charts VALUES (13, 'percentage of unemployed EU nationals (18-64)                                                                                                                                                                                                                  ', '[{"year":2015,"percentage":11.1},{"year":2016,"percentage":10.7},{"year":2017,"percentage":10.1},{"year":2018,"percentage":9.2},{"year":2019,"percentage":8.4}]', NULL, 'employment                                                                                                                                                                                                                                                     ', NULL, 'BAR                                                                                                                                                                                                                                                            ', false, 'year                                                                                                                                                                                                                                                           ', 'percentage                                                                                                                                                                                                                                                     ', 'antwerp                                                                                                                                                                                                                                                        ');


--
-- Data for Name: comments; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: comments_translation; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: document; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: document_pictures; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: document_type; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.document_type VALUES (2, 'data:image/png;base64,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', NULL, NULL, false, -1, false, NULL);
INSERT INTO micadoapp.document_type VALUES (1, 'data:image/png;base64,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', NULL, NULL, false, -1, false, NULL);
INSERT INTO micadoapp.document_type VALUES (3, 'data:image/png;base64,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', NULL, NULL, false, -1, false, NULL);
INSERT INTO micadoapp.document_type VALUES (5, 'data:image/png;base64,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', NULL, NULL, false, -1, false, NULL);
INSERT INTO micadoapp.document_type VALUES (4, 'data:image/png;base64,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', NULL, NULL, false, -1, false, NULL);


--
-- Data for Name: document_type_picture; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.document_type_picture VALUES (1, ' data:image/jpeg;base64,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Umx0AAAAAAAAAAAAAAAAU2NsIFVudEYjUHJjQFkAAAAAAAAAAAAQY3JvcFdoZW5QcmludGluZ2Jvb2wAAAAADmNyb3BSZWN0Qm90dG9tbG9uZwAAAAAAAAAMY3JvcFJlY3RMZWZ0bG9uZwAAAAAAAAANY3JvcFJlY3RSaWdodGxvbmcAAAAAAAAAC2Nyb3BSZWN0VG9wbG9uZwAAAAAAOEJJTQPtAAAAAAAQAMgAAAABAAIAyAAAAAEAAjhCSU0EJgAAAAAADgAAAAAAAAAAAAA/gAAAOEJJTQPyAAAAAAAKAAD///////8AADhCSU0EDQAAAAAABAAAAB44QklNBBkAAAAAAAQAAAAeOEJJTQPzAAAAAAAJAAAAAAAAAAABADhCSU0nEAAAAAAACgABAAAAAAAAAAI4QklNA/UAAAAAAEgAL2ZmAAEAbGZmAAYAAAAAAAEAL2ZmAAEAoZmaAAYAAAAAAAEAMgAAAAEAWgAAAAYAAAAAAAEANQAAAAEALQAAAAYAAAAAAAE4QklNA/gAAAAAAHAAAP////////////////////////////8D6AAAAAD/////////////////////////////A+gAAAAA/////////////////////////////wPoAAAAAP////////////////////////////8D6AAAOEJJTQQAAAAAAAACAAE4QklNBAIAAAAAAAQAAAAAOEJJTQQwAAAAAAACAQE4QklNBC0AAAAAAAIAADhCSU0ECAAAAAAAEAAAAAEAAAJAAAACQAAAAAA4QklNBB4AAAAAAAQAAAAAOEJJTQQaAAAAAANHAAAABgAAAAAAAAAAAAABrAAAAqYAAAAJAEMASQAgAGYAcgBvAG4AdABlAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAKmAAABrAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAABAAAAABAAAAAAAAbnVsbAAAAAIAAAAGYm91bmRzT2JqYwAAAAEAAAAAAABSY3QxAAAABAAAAABUb3AgbG9uZwAAAAAAAAAATGVmdGxvbmcAAAAAAAAAAEJ0b21sb25nAAABrAAAAABSZ2h0bG9uZwAAAqYAAAAGc2xpY2VzVmxMcwAAAAFPYmpjAAAAAQAAAAAABXNs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U3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjMtYzAxMSA2Ni4xNDU2NjEsIDIwMTIvMDIvMDYtMTQ6NTY6MjcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpNaWNyb3NvZnRQaG90bz0iaHR0cDovL25zLm1pY3Jvc29mdC5jb20vcGhvdG8vMS4wLyIgeG1wTU06RG9jdW1lbnRJRD0iNDM0N0U3OUM0MTc4NTMwRkU0RjIxODQ4NDg1Q0VDMjYiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MDUzNjM3MzE2NzQ2RTkxMUI5ODhFNDREQkU0QjI0OUIiIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0iNDM0N0U3OUM0MTc4NTMwRkU0RjIxODQ4NDg1Q0VDMjYiIGRjOmZvcm1hdD0iaW1hZ2UvanBlZyIgcGhvdG9zaG9wOkxlZ2FjeUlQVENEaWdlc3Q9IkRFRkZENDkwOEY5OUIyQjQ1OEMzQ0E5NkY4OTY4RkI2IiBwaG90b3Nob3A6Q29sb3JNb2RlPSIzIiBwaG90b3Nob3A6SUNDUHJvZmlsZT0iRVBTT04gIHNSR0IiIHhtcDpDcmVhdGVEYXRlPSIyMDE5LTAzLTA3VDA5OjA2OjE4KzAxOjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAxOS0wMy0xNFQxNTo1NTo1MyswMTowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAxOS0wMy0xNFQxNTo1NTo1MyswMTowMCIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgTWljcm9zb2Z0UGhvdG86RGF0ZUFjcXVpcmVkPSIyMDE5LTAzLTE0VDEzOjMzOjE3Ij4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6NjkwQjIzM0Y1MTQ2RTkxMUI5ODhFNDREQkU0QjI0OUIiIHN0RXZ0OndoZW49IjIwMTktMDMtMTRUMTM6MzM6MDgrMDE6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDUzYgKFdpbmRvd3MpIiBzdEV2dDpjaGFuZ2VkPSIvIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDowNTM2MzczMTY3NDZFOTExQjk4OEU0NERCRTRCMjQ5QiIgc3RFdnQ6d2hlbj0iMjAxOS0wMy0xNFQxNTo1NTo1MyswMTowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPC9yZGY6U2VxPiA8L3htcE1NOkhpc3Rvcnk+IDxwaG90b3Nob3A6RG9jdW1lbnRBbmNlc3RvcnM+IDxyZGY6QmFnPiA8cmRmOmxpPjBFMDJBMzI2MTREMUJEMjg0Q0ZBOTRGRDI3OEVBNjJFPC9yZGY6bGk+IDxyZGY6bGk+NDM0N0U3OUM0MTc4NTMwRkU0RjIxODQ4NDg1Q0VDMjY8L3JkZjpsaT4gPHJkZjpsaT54bXAuZGlkOjAyMzYzNzMxNjc0NkU5MTFCOTg4RTQ0REJFNEIyNDlCPC9yZGY6bGk+IDwvcmRmOkJhZz4gPC9waG90b3Nob3A6RG9jdW1lbnRBbmNlc3RvcnM+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDw/eHBhY2tldCBlbmQ9InciPz7/4iIUSUNDX1BST0ZJTEUAAQEAACIEQVBQTAIgAABtbnRyUkdCIFhZWiAH1gACAAIAAgAUAABhY3NwQVBQTAAAAABub25lAAAAAAAAAAAAAAAAAAAAAAAA9tYAAQAAAADTLUVQU08AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAApkZXNjAAAhbAAAAEdyWFlaAAAA/AAAABRnWFlaAAABEAAAABRiWFlaAAABJAAAABR3dHB0AAABOAAAABRjcHJ0AAAhtAAAAFByVFJDAAABTAAAIAxnVFJDAAABTAAAIAxiVFJDAAABTAAAIAxia3B0AAAhWAAAABRYWVogAAAAAAAAb6IAADj1AAADkFhZWiAAAAAAAABimQAAt4UAABjaWFlaIAAAAAAAACSgAAAPhAAAts9YWVogAAAAAAAA81EAAQAAAAEWzGN1cnYAAAAAAAAQAAAAAAEAAgAEAAUABgAHAAkACgALAAwADgAPABAAEQATABQAFQAWABgAGQAaABsAHAAeAB8AIAAhACMAJAAlACYAKAApACoAKwAtAC4ALwAwADIAMwA0ADUANwA4ADkAOgA7AD0APgA/AEAAQgBDAEQARQBHAEgASQBKAEwATQBOAE8AUQBSAFMAVABVAFcAWABZAFoAXABdAF4AXwBhAGIAYwBkAGYAZwBoAGkAawBsAG0AbgBvAHEAcgBzAHQAdgB3AHgAeQB7AHwAfQB+AIAAgQCCAIMAhQCGAIcAiACJAIsAjACNAI4AkACRAJIAkwCVAJYAlwCYAJoAmwCcAJ0AnwCgAKEAogCkAKUApgCnAKgAqgCrAKwArQCvALAAsQCyALQAtQC2ALcAuQC6ALsAvAC+AL8AwADBAMIAxADFAMYAxwDJAMoAywDMAM4AzwDQANEA0wDUANUA1wDYANkA2gDcAN0A3gDgAOEA4gDkAOUA5gDoAOkA6gDsAO0A7wDwAPEA8wD0APYA9wD4APoA+wD9AP4A/wEBAQIBBAEFAQcBCAEKAQsBDQEOAQ8BEQESARQBFQEXARgBGgEbAR0BHwEgASIBIwElASYBKAEpASsBLQEuATABMQEzATQBNgE4ATkBOwE8AT4BQAFBAUMBRQFGAUgBSgFLAU0BTwFQAVIBVAFVAVcBWQFaAVwBXgFgAWEBYwFlAWcBaAFqAWwBbgFvAXEBcwF1AXYBeAF6AXwBfgF/AYEBgwGFAYcBiQGKAYwBjgGQAZIBlAGWAZcBmQGbAZ0BnwGhAaMBpQGnAakBqwGsAa4BsAGyAbQBtgG4AboBvAG+AcABwgHEAcYByAHKAcwBzgHQAdIB1AHWAdgB2gHcAd4B4QHjAeUB5wHpAesB7QHvAfEB8wH1AfgB+gH8Af4CAAICAgQCBwIJAgsCDQIPAhICFAIWAhgCGgIdAh8CIQIjAiUCKAIqAiwCLgIxAjMCNQI4AjoCPAI+AkECQwJFAkgCSgJMAk8CUQJTAlYCWAJaAl0CXwJhAmQCZgJpAmsCbQJwAnICdQJ3AnkCfAJ+AoECgwKGAogCiwKNApACkgKVApcCmgKcAp8CoQKkAqYCqQKrAq4CsAKzArUCuAK7Ar0CwALCAsUCyALKAs0CzwLSAtUC1wLaAt0C3wLiAuQC5wLqAuwC7wLyAvUC9wL6Av0C/wMCAwUDCAMKAw0DEAMTAxUDGAMbAx4DIAMjAyYDKQMsAy4DMQM0AzcDOgM9Az8DQgNFA0gDSwNOA1EDVANWA1kDXANfA2IDZQNoA2sDbgNxA3QDdwN6A30DgAOCA4UDiAOLA44DkQOUA5gDmwOeA6EDpAOnA6oDrQOwA7MDtgO5A7wDvwPCA8UDyQPMA88D0gPVA9gD2wPfA+ID5QPoA+sD7gPyA/UD+AP7A/4EAgQFBAgECwQPBBIEFQQYBBwEHwQiBCUEKQQsBC8EMwQ2BDkEPQRABEMERwRKBE0EUQRUBFcEWwReBGIEZQRoBGwEbwRzBHYEeQR9BIAEhASHBIsEjgSSBJUEmQScBKAEowSnBKoErgSxBLUEuAS8BL8EwwTGBMoEzgTRBNUE2ATcBOAE4wTnBOoE7gTyBPUE+QT9BQAFBAUIBQsFDwUTBRYFGgUeBSIFJQUpBS0FMQU0BTgFPAVABUMFRwVLBU8FUgVWBVoFXgViBWYFaQVtBXEFdQV5BX0FgQWEBYgFjAWQBZQFmAWcBaAFpAWoBawFrwWzBbcFuwW/BcMFxwXLBc8F0wXXBdsF3wXjBecF6wXvBfQF+AX8BgAGBAYIBgwGEAYUBhgGHAYhBiUGKQYtBjEGNQY5Bj4GQgZGBkoGTgZTBlcGWwZfBmMGaAZsBnAGdAZ5Bn0GgQaFBooGjgaSBpcGmwafBqQGqAasBrEGtQa5Br4GwgbGBssGzwbUBtgG3AbhBuUG6gbuBvIG9wb7BwAHBAcJBw0HEgcWBxsHHwckBygHLQcxBzYHOgc/B0MHSAdNB1EHVgdaB18HYwdoB20HcQd2B3sHfweEB4kHjQeSB5cHmwegB6UHqQeuB7MHtwe8B8EHxgfKB88H1AfZB90H4gfnB+wH8Qf1B/oH/wgECAkIDQgSCBcIHAghCCYIKwgvCDQIOQg+CEMISAhNCFIIVwhcCGEIZghrCHAIdQh6CH8IhAiJCI4IkwiYCJ0IoginCKwIsQi2CLsIwAjFCMoIzwjUCNkI3wjkCOkI7gjzCPgI/QkDCQgJDQkSCRcJHQkiCScJLAkxCTcJPAlBCUYJTAlRCVYJWwlhCWYJawlxCXYJewmBCYYJiwmRCZYJmwmhCaYJqwmxCbYJvAnBCcYJzAnRCdcJ3AniCecJ7QnyCfgJ/QoCCggKDQoTChkKHgokCikKLwo0CjoKPwpFCkoKUApWClsKYQpmCmwKcgp3Cn0KgwqICo4KlAqZCp8KpQqqCrAKtgq8CsEKxwrNCtMK2AreCuQK6grvCvUK+wsBCwcLDAsSCxgLHgskCyoLLws1CzsLQQtHC00LUwtZC18LZAtqC3ALdgt8C4ILiAuOC5QLmgugC6YLrAuyC7gLvgvEC8oL0AvWC9wL4gvpC+8L9Qv7DAEMBwwNDBMMGQwgDCYMLAwyDDgMPgxFDEsMUQxXDF0MZAxqDHAMdgx9DIMMiQyPDJYMnAyiDKgMrwy1DLsMwgzIDM4M1QzbDOEM6AzuDPUM+w0BDQgNDg0VDRsNIQ0oDS4NNQ07DUINSA1PDVUNXA1iDWkNbw12DXwNgw2JDZANlg2dDaQNqg2xDbcNvg3FDcsN0g3ZDd8N5g3sDfMN+g4BDgcODg4VDhsOIg4pDi8ONg49DkQOSg5RDlgOXw5mDmwOcw56DoEOiA6ODpUOnA6jDqoOsQ64Dr4OxQ7MDtMO2g7hDugO7w72Dv0PBA8LDxIPGQ8gDycPLg81DzwPQw9KD1EPWA9fD2YPbQ90D3sPgg+JD5APmA+fD6YPrQ+0D7sPwg/KD9EP2A/fD+YP7Q/1D/wQAxAKEBIQGRAgECcQLxA2ED0QRBBMEFMQWhBiEGkQcBB4EH8QhhCOEJUQnRCkEKsQsxC6EMIQyRDQENgQ3xDnEO4Q9hD9EQURDBEUERsRIxEqETIRORFBEUgRUBFXEV8RZxFuEXYRfRGFEY0RlBGcEaQRqxGzEbsRwhHKEdIR2RHhEekR8BH4EgASCBIPEhcSHxInEi4SNhI+EkYSThJVEl0SZRJtEnUSfRKEEowSlBKcEqQSrBK0ErwSxBLMEtQS2xLjEusS8xL7EwMTCxMTExsTIxMrEzMTOxNEE0wTVBNcE2QTbBN0E3wThBOME5QTnROlE60TtRO9E8UTzRPWE94T5hPuE/YT/xQHFA8UFxQgFCgUMBQ4FEEUSRRRFFoUYhRqFHMUexSDFIwUlBScFKUUrRS2FL4UxhTPFNcU4BToFPEU+RUBFQoVEhUbFSMVLBU0FT0VRRVOFVcVXxVoFXAVeRWBFYoVkxWbFaQVrBW1Fb4VxhXPFdgV4BXpFfIV+hYDFgwWFBYdFiYWLxY3FkAWSRZSFloWYxZsFnUWfhaGFo8WmBahFqoWsxa7FsQWzRbWFt8W6BbxFvoXAxcMFxQXHRcmFy8XOBdBF0oXUxdcF2UXbhd3F4AXiReSF5wXpReuF7cXwBfJF9IX2xfkF+0X9xgAGAkYEhgbGCQYLhg3GEAYSRhSGFwYZRhuGHcYgRiKGJMYnBimGK8YuBjCGMsY1BjeGOcY8Bj6GQMZDBkWGR8ZKRkyGTsZRRlOGVgZYRlrGXQZfhmHGZEZmhmkGa0ZtxnAGcoZ0xndGeYZ8Bn6GgMaDRoWGiAaKhozGj0aRhpQGloaYxptGncagRqKGpQanhqnGrEauxrFGs4a2BriGuwa9Rr/GwkbExsdGycbMBs6G0QbThtYG2IbbBt1G38biRuTG50bpxuxG7sbxRvPG9kb4xvtG/ccARwLHBUcHxwpHDMcPRxHHFEcWxxlHHAcehyEHI4cmByiHKwcthzBHMsc1RzfHOkc9Bz+HQgdEh0cHScdMR07HUUdUB1aHWQdbx15HYMdjh2YHaIdrR23HcEdzB3WHeEd6x31HgAeCh4VHh8eKh40Hj4eSR5THl4eaB5zHn0eiB6THp0eqB6yHr0exx7SHtwe5x7yHvwfBx8SHxwfJx8yHzwfRx9SH1wfZx9yH3wfhx+SH50fpx+yH70fyB/SH90f6B/zH/4gCCATIB4gKSA0ID8gSiBUIF8gaiB1IIAgiyCWIKEgrCC3IMIgzSDYIOMg7iD5IQQhDyEaISUhMCE7IUYhUSFcIWchciF+IYkhlCGfIaohtSHAIcwh1yHiIe0h+CIEIg8iGiIlIjAiPCJHIlIiXiJpInQifyKLIpYioSKtIrgiwyLPItoi5iLxIvwjCCMTIx8jKiM1I0EjTCNYI2MjbyN6I4YjkSOdI6gjtCO/I8sj1iPiI+4j+SQFJBAkHCQoJDMkPyRLJFYkYiRuJHkkhSSRJJwkqCS0JL8kyyTXJOMk7iT6JQYlEiUeJSklNSVBJU0lWSVlJXAlfCWIJZQloCWsJbglxCXQJdwl5yXzJf8mCyYXJiMmLyY7JkcmUyZfJmsmdyaEJpAmnCaoJrQmwCbMJtgm5CbwJv0nCScVJyEnLSc5J0YnUideJ2ondieDJ48nmyenJ7QnwCfMJ9kn5SfxJ/0oCigWKCMoLyg7KEgoVChgKG0oeSiGKJIoniirKLcoxCjQKN0o6Sj2KQIpDykbKSgpNClBKU0pWilnKXMpgCmMKZkppimyKb8pzCnYKeUp8Sn+KgsqGCokKjEqPipKKlcqZCpxKn0qiiqXKqQqsSq9Ksoq1yrkKvEq/isKKxcrJCsxKz4rSytYK2Urcit/K4wrmSulK7IrvyvMK9kr5ivzLAEsDiwbLCgsNSxCLE8sXCxpLHYsgyyQLJ4sqyy4LMUs0izfLO0s+i0HLRQtIS0vLTwtSS1WLWQtcS1+LYstmS2mLbMtwS3OLdst6S32LgQuES4eLiwuOS5HLlQuYS5vLnwuii6XLqUusi7ALs0u2y7oLvYvAy8RLx4vLC86L0cvVS9iL3Avfi+LL5kvpy+0L8Iv0C/dL+sv+TAGMBQwIjAvMD0wSzBZMGcwdDCCMJAwnjCsMLkwxzDVMOMw8TD/MQ0xGjEoMTYxRDFSMWAxbjF8MYoxmDGmMbQxwjHQMd4x7DH6MggyFjIkMjIyQDJOMlwyajJ5MocylTKjMrEyvzLNMtwy6jL4MwYzFDMjMzEzPzNNM1wzajN4M4YzlTOjM7EzwDPOM9wz6zP5NAc0FjQkNDM0QTRPNF40bDR7NIk0mDSmNLU0wzTSNOA07zT9NQw1GjUpNTc1RjVUNWM1cjWANY81nTWsNbs1yTXYNec19TYENhM2ITYwNj82TjZcNms2ejaJNpc2pja1NsQ20zbhNvA2/zcONx03LDc7N0k3WDdnN3Y3hTeUN6M3sjfBN9A33zfuN/04DDgbOCo4OThIOFc4Zjh1OIQ4kziiOLE4wTjQON847jj9OQw5GzkrOTo5STlYOWc5dzmGOZU5pDm0OcM50jnhOfE6ADoPOh86Ljo9Ok06XDprOns6ijqaOqk6uDrIOtc65zr2OwY7FTslOzQ7RDtTO2M7cjuCO5E7oTuwO8A70DvfO+87/jwOPB48LTw9PE08XDxsPHw8izybPKs8ujzKPNo86jz5PQk9GT0pPTk9SD1YPWg9eD2IPZg9pz23Pcc91z3nPfc+Bz4XPic+Nz5HPlc+Zz53Poc+lz6nPrc+xz7XPuc+9z8HPxc/Jz83P0c/Vz9nP3g/iD+YP6g/uD/IP9k/6T/5QAlAGUAqQDpASkBaQGtAe0CLQJxArEC8QM1A3UDtQP5BDkEeQS9BP0FPQWBBcEGBQZFBokGyQcNB00HkQfRCBUIVQiZCNkJHQldCaEJ4QolCmkKqQrtCy0LcQu1C/UMOQx9DL0NAQ1FDYUNyQ4NDlEOkQ7VDxkPXQ+dD+EQJRBpEK0Q7RExEXURuRH9EkEShRLJEwkTTRORE9UUGRRdFKEU5RUpFW0VsRX1FjkWfRbBFwUXSReNF9EYFRhdGKEY5RkpGW0ZsRn1Gj0agRrFGwkbTRuRG9kcHRxhHKUc7R0xHXUduR4BHkUeiR7RHxUfWR+hH+UgKSBxILUg/SFBIYUhzSIRIlkinSLlIykjcSO1I/0kQSSJJM0lFSVZJaEl6SYtJnUmuScBJ0knjSfVKBkoYSipKO0pNSl9KcUqCSpRKpkq3SslK20rtSv9LEEsiSzRLRktYS2lLe0uNS59LsUvDS9VL50v5TApMHEwuTEBMUkxkTHZMiEyaTKxMvkzQTOJM9E0GTRlNK009TU9NYU1zTYVNl02pTbxNzk3gTfJOBE4XTilOO05NTl9Ock6ETpZOqU67Ts1O307yTwRPFk8pTztPTk9gT3JPhU+XT6pPvE/OT+FP81AGUBhQK1A9UFBQYlB1UIdQmlCtUL9Q0lDkUPdRCVEcUS9RQVFUUWdReVGMUZ9RsVHEUddR6VH8Ug9SIlI0UkdSWlJtUoBSklKlUrhSy1LeUvFTBFMWUylTPFNPU2JTdVOIU5tTrlPBU9RT51P6VA1UIFQzVEZUWVRsVH9UklSlVLhUy1TeVPJVBVUYVStVPlVRVWVVeFWLVZ5VsVXFVdhV61X+VhJWJVY4VktWX1ZyVoVWmVasVr9W01bmVvpXDVcgVzRXR1dbV25XgleVV6lXvFfQV+NX91gKWB5YMVhFWFhYbFiAWJNYp1i6WM5Y4lj1WQlZHVkwWURZWFlrWX9Zk1mnWbpZzlniWfZaCVodWjFaRVpZWmxagFqUWqhavFrQWuRa+FsLWx9bM1tHW1tbb1uDW5dbq1u/W9Nb51v7XA9cI1w3XEtcYFx0XIhcnFywXMRc2FzsXQFdFV0pXT1dUV1lXXpdjl2iXbZdy13fXfNeCF4cXjBeRF5ZXm1egl6WXqpev17TXude/F8QXyVfOV9OX2Jfd1+LX6BftF/JX91f8mAGYBtgL2BEYFhgbWCCYJZgq2C/YNRg6WD9YRJhJ2E7YVBhZWF6YY5ho2G4Yc1h4WH2YgtiIGI1YkliXmJzYohinWKyYsdi22LwYwVjGmMvY0RjWWNuY4NjmGOtY8Jj12PsZAFkFmQrZEBkVWRqZH9klWSqZL9k1GTpZP5lE2UpZT5lU2VoZX1lk2WoZb1l0mXoZf1mEmYnZj1mUmZnZn1mkmanZr1m0mboZv1nEmcoZz1nU2doZ35nk2epZ75n1GfpZ/9oFGgqaD9oVWhqaIBolmiraMFo1mjsaQJpF2ktaUNpWGluaYRpmWmvacVp22nwagZqHGoyakhqXWpzaolqn2q1aspq4Gr2awxrIms4a05rZGt6a5Brpmu8a9Jr6Gv+bBRsKmxAbFZsbGyCbJhsrmzEbNps8G0GbRxtM21JbV9tdW2LbaFtuG3ObeRt+m4RbiduPW5TbmpugG6Wbq1uw27ZbvBvBm8cbzNvSW9gb3ZvjG+jb7lv0G/mb/1wE3AqcEBwV3BtcIRwmnCxcMdw3nD0cQtxInE4cU9xZnF8cZNxqnHAcddx7nIEchtyMnJIcl9ydnKNcqRyunLRcuhy/3MWcyxzQ3Nac3FziHOfc7ZzzXPkc/p0EXQodD90VnRtdIR0m3SydMl04HT3dQ51JnU9dVR1a3WCdZl1sHXHdd519nYNdiR2O3ZSdmp2gXaYdq92x3bedvV3DHckdzt3Undqd4F3mHewd8d33nf2eA14JXg8eFR4a3iCeJp4sXjJeOB4+HkPeSd5PnlWeW55hXmdebR5zHnjeft6E3oqekJ6Wnpxeol6oXq4etB66HsAexd7L3tHe197dnuOe6Z7vnvWe+58BXwdfDV8TXxlfH18lXytfMV83Hz0fQx9JH08fVR9bH2EfZx9tH3NfeV9/X4Vfi1+RX5dfnV+jX6lfr5+1n7ufwZ/Hn83f09/Z39/f5d/sH/If+B/+YARgCmAQYBagHKAioCjgLuA1IDsgQSBHYE1gU6BZoF/gZeBsIHIgeGB+YISgiqCQ4JbgnSCjIKlgr6C1oLvgweDIIM5g1GDaoODg5uDtIPNg+WD/oQXhDCESIRhhHqEk4SshMSE3YT2hQ+FKIVBhVqFcoWLhaSFvYXWhe+GCIYhhjqGU4ZshoWGnoa3htCG6YcChxuHNIdNh2eHgIeZh7KHy4fkh/2IF4gwiEmIYoh7iJWIrojHiOCI+okTiSyJRolfiXiJkYmricSJ3on3ihCKKopDil2KdoqPiqmKworcivWLD4soi0KLW4t1i46LqIvCi9uL9YwOjCiMQoxbjHWMj4yojMKM3Iz1jQ+NKY1CjVyNdo2QjamNw43djfeOEY4rjkSOXo54jpKOrI7GjuCO+o8Tjy2PR49hj3uPlY+vj8mP44/9kBeQMZBLkGWQf5CakLSQzpDokQKRHJE2kVCRa5GFkZ+RuZHTke6SCJIikjySV5JxkouSppLAktqS9JMPkymTRJNek3iTk5Otk8iT4pP8lBeUMZRMlGaUgZSblLaU0JTrlQWVIJU7lVWVcJWKlaWVwJXalfWWD5YqlkWWX5Z6lpWWsJbKluWXAJcblzWXUJdrl4aXoZe7l9aX8ZgMmCeYQphdmHeYkpitmMiY45j+mRmZNJlPmWqZhZmgmbuZ1pnxmgyaJ5pCml6aeZqUmq+ayprlmwCb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', 1, 1);


--
-- Data for Name: document_type_translation; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.document_type_translation VALUES (3, 'en', 'Family status certificate', 'The Family Status Certificate is a document containing the data of persons residing at the same residence address and in the same housing unit. In case of family members, next to each name is written the specific role in the family composition.
', '2020-04-14 18:17:39.35');
INSERT INTO micadoapp.document_type_translation VALUES (5, 'en', 'Stamp duty', 'Stamp duty is a tax that is levied on single property purchases or documents (historically, this included the majority of legal documents such as cheques, receipts, military commissions, marriage licences and land transactions.) A physical stamp (a revenue stamp) had to be attached to or impressed upon the document to denote that stamp duty had been paid before the document was legally effective. More modern versions of the tax no longer require an actual stamp.', '2020-04-14 18:17:39.35');
INSERT INTO micadoapp.document_type_translation VALUES (4, 'en', 'Employment contract', 'Employment contracts regulate the main aspects of the working relationship between employer and employee including job title, salary, responsibilities and duties, entitlement to sick pay and holidays, and applicable probationary and notice periods.', '2020-04-14 18:17:39.35');
INSERT INTO micadoapp.document_type_translation VALUES (2, 'en', 'Identity document', 'An identity document (also called a piece of identification or ID, or colloquially as papers) is any document that may be used to prove a person''s identity. If issued in a small, standard credit card size form, it is usually called an identity card (IC, ID card, citizen card),or passport card.', '2020-04-14 18:17:39.35');
INSERT INTO micadoapp.document_type_translation VALUES (1, 'it', 'permesso di soggiorno', 'bla bla', '2020-04-14 18:17:39.35');
INSERT INTO micadoapp.document_type_translation VALUES (1, 'en', 'Residence permit', 'A residence permit (less commonly residency permit) is a document or card required in some regions, allowing a foreign national to reside in a country for a fixed or indefinite length of time. These may be permits for temporary residency, or permanent residency. The exact rules vary between regions. In some cases (e.g. the UK) a temporary residence permit is required to extend a stay past some threshold, and can be an intermediate step to applying for permanent residency.', '2020-04-14 18:17:39.35');


--
-- Data for Name: document_type_validator; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: event; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.event VALUES (6, NULL, false, '2020-07-10 13:05:28.049');


--
-- Data for Name: event_category; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: event_category_translation; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: event_event_category; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: event_topic; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: event_translation; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.event_translation VALUES (6, 'en', 'test', '{"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"test"}]}]}', '2020-07-10 13:05:28.212');
INSERT INTO micadoapp.event_translation VALUES (6, 'es', 'test2', '{"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"test2"}]}]}', '2020-07-10 13:05:34.988');


--
-- Data for Name: features_flags; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.features_flags VALUES (1, 'FEAT_DOCUMENTS', false);
INSERT INTO micadoapp.features_flags VALUES (2, 'FEAT_GLOSSARY', true);
INSERT INTO micadoapp.features_flags VALUES (3, 'FEAT_ASSISTANT', true);


--
-- Data for Name: features_flags_translation; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.features_flags_translation VALUES (1, 'it', 'Portafoglio documenti', '2020-04-14 17:54:28.436');
INSERT INTO micadoapp.features_flags_translation VALUES (1, 'en', 'Document wallet', '2020-04-14 17:54:28.436');


--
-- Data for Name: glossary; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.glossary VALUES (1, true, '2020-07-09');
INSERT INTO micadoapp.glossary VALUES (2, true, '2020-07-09');


--
-- Data for Name: glossary_translation; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.glossary_translation VALUES (2, 'en', 'Identity Card', '{"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"test2"}]}]}', '2020-07-09 12:21:09.926');
INSERT INTO micadoapp.glossary_translation VALUES (1, 'it', 'Permesso di soggiorno', '{"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"italian test 2"}]}]}', '2020-07-09 13:31:56.182');
INSERT INTO micadoapp.glossary_translation VALUES (1, 'en', 'Residence permit', '{"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"test 3"}]}]}', '2020-07-09 13:45:38.936');


--
-- Data for Name: individual_intervention_plan; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: individual_intervention_plan_interventions; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: intervention_category; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.intervention_category VALUES (1, false, NULL);
INSERT INTO micadoapp.intervention_category VALUES (7, false, NULL);


--
-- Data for Name: intervention_category_translation; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.intervention_category_translation VALUES (1, 'en', 'cat1', NULL);
INSERT INTO micadoapp.intervention_category_translation VALUES (1, 'it', NULL, NULL);
INSERT INTO micadoapp.intervention_category_translation VALUES (1, 'es', NULL, NULL);
INSERT INTO micadoapp.intervention_category_translation VALUES (1, 'nl', NULL, NULL);
INSERT INTO micadoapp.intervention_category_translation VALUES (1, 'de', NULL, NULL);
INSERT INTO micadoapp.intervention_category_translation VALUES (7, 'de', '', NULL);
INSERT INTO micadoapp.intervention_category_translation VALUES (7, 'it', 'Categoria2', NULL);
INSERT INTO micadoapp.intervention_category_translation VALUES (7, 'es', 'nueva categoria', NULL);
INSERT INTO micadoapp.intervention_category_translation VALUES (7, 'en', 'Category2 Updated', NULL);
INSERT INTO micadoapp.intervention_category_translation VALUES (7, 'nl', '', NULL);


--
-- Data for Name: intervention_processes; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: intervention_type_validator; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: intervention_types; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: intervention_types_translation; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: languages; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.languages VALUES ('it', 'it-it', 'italiano', true, false);
INSERT INTO micadoapp.languages VALUES ('de', 'de-de', 'deutch', true, false);
INSERT INTO micadoapp.languages VALUES ('en', 'en-us', 'english', true, true);
INSERT INTO micadoapp.languages VALUES ('es', 'es', 'español', true, false);
INSERT INTO micadoapp.languages VALUES ('nl', 'nl', 'nederlands', true, false);


--
-- Data for Name: migrant_app_config; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.migrant_app_config VALUES (1, '["FEAT_DOCUMENTS","FEAT_GLOSSARY","FEAT_ASSISTANT","FEAT_SERVICES","FEAT_TASKS","FEAT_DEFAULT"]');


--
-- Data for Name: picture_hotspot; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: picture_hotspot_translation; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: process; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.process VALUES (1, NULL, false, NULL);
INSERT INTO micadoapp.process VALUES (46, '', false, NULL);
INSERT INTO micadoapp.process VALUES (47, '', false, NULL);


--
-- Data for Name: process_comments; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: process_topic; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.process_topic VALUES (1, 2);
INSERT INTO micadoapp.process_topic VALUES (46, 4);
INSERT INTO micadoapp.process_topic VALUES (47, 4);


--
-- Data for Name: process_translation; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.process_translation VALUES (1, 'de', NULL, NULL, NULL);
INSERT INTO micadoapp.process_translation VALUES (1, 'it', NULL, NULL, NULL);
INSERT INTO micadoapp.process_translation VALUES (1, 'en', 'Get driver licence recognized', 'Placeholder description 2', NULL);
INSERT INTO micadoapp.process_translation VALUES (1, 'es', NULL, NULL, NULL);
INSERT INTO micadoapp.process_translation VALUES (1, 'nl', NULL, NULL, NULL);
INSERT INTO micadoapp.process_translation VALUES (46, 'nl', '', '', NULL);
INSERT INTO micadoapp.process_translation VALUES (46, 'es', '', '', NULL);
INSERT INTO micadoapp.process_translation VALUES (46, 'en', 'Certify your education degree', '', NULL);
INSERT INTO micadoapp.process_translation VALUES (46, 'de', '', '', NULL);
INSERT INTO micadoapp.process_translation VALUES (46, 'it', '', '', NULL);
INSERT INTO micadoapp.process_translation VALUES (47, 'de', '', '', NULL);
INSERT INTO micadoapp.process_translation VALUES (47, 'es', '', '', NULL);
INSERT INTO micadoapp.process_translation VALUES (47, 'en', 'Enroll children to school', '', NULL);
INSERT INTO micadoapp.process_translation VALUES (47, 'it', '', '', NULL);
INSERT INTO micadoapp.process_translation VALUES (47, 'nl', '', '', NULL);


--
-- Data for Name: process_users; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.process_users VALUES (1, 9);
INSERT INTO micadoapp.process_users VALUES (1, 1);
INSERT INTO micadoapp.process_users VALUES (1, 7);
INSERT INTO micadoapp.process_users VALUES (46, 1);
INSERT INTO micadoapp.process_users VALUES (46, 7);
INSERT INTO micadoapp.process_users VALUES (46, 9);
INSERT INTO micadoapp.process_users VALUES (47, 1);
INSERT INTO micadoapp.process_users VALUES (47, 7);
INSERT INTO micadoapp.process_users VALUES (47, 9);


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: micadoapp; Owner: -
--



--
-- Data for Name: settings; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.settings VALUES ('api_token', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IlpqUm1ZVE13TlRKak9XVTVNbUl6TWpnek5ESTNZMkl5TW1JeVkyRXpNamRoWmpWaU1qYzBaZz09In0.eyJhdWQiOiJodHRwOlwvXC9vcmcud3NvMi5hcGltZ3RcL2dhdGV3YXkiLCJzdWIiOiJhZG1pbkBjYXJib24uc3VwZXIiLCJhcHBsaWNhdGlvbiI6eyJvd25lciI6ImFkbWluIiwidGllciI6IlVubGltaXRlZCIsIm5hbWUiOiJNaWdyYW50QXBwbGljYXRpb24iLCJpZCI6MSwidXVpZCI6bnVsbH0sInNjb3BlIjoiYW1fYXBwbGljYXRpb25fc2NvcGUgZGVmYXVsdCIsImlzcyI6Imh0dHBzOlwvXC9nYXRld2F5Lm1pY2Fkb3Byb2plY3QuZXU6NDQzXC9vYXV0aDJcL3Rva2VuIiwidGllckluZm8iOnsiQnJvbnplIjp7InN0b3BPblF1b3RhUmVhY2giOnRydWUsInNwaWtlQXJyZXN0TGltaXQiOjAsInNwaWtlQXJyZXN0VW5pdCI6bnVsbH19LCJrZXl0eXBlIjoiUFJPRFVDVElPTiIsInN1YnNjcmliZWRBUElzIjpbeyJzdWJzY3JpYmVyVGVuYW50RG9tYWluIjoiY2FyYm9uLnN1cGVyIiwibmFtZSI6IlBvc3RnUkVTVEFQSSIsImNvbnRleHQiOiJcL2RiXC92MDEiLCJwdWJsaXNoZXIiOiJhZG1pbiIsInZlcnNpb24iOiJ2MDEiLCJzdWJzY3JpcHRpb25UaWVyIjoiQnJvbnplIn1dLCJjb25zdW1lcktleSI6InZabFNMbTFnYzVOMzIxbnRIN2Ztd2tONTNvVWEiLCJleHAiOjM3MzAyOTc0MzgsImlhdCI6MTU4MjgxMzc5MSwianRpIjoiYmYyMjBiYjMtNjY3MC00OTA5LWI4OTctOTY2ZDVhZDdhN2M0In0.GORnM7Hfflrv8iNFbBOZoLg7475tnLaXwY2f88My_qVCAupJxqPihM901E5GNQUsL2I7PW9_ymbCPJki0FuaIhdXk4ovso11ghjWDkVH9fUoMm_FElNynOlWp7gPDwtXbS5sNI2nZHflvUmc9IYG70XJG6tWhg4hI8bW0sNr03gkQOjQzbUqSqHb__J_oLJye1IGi657oJUtXnVLSDfRHOKl7w8SATrSiR_K57SkT4xGmpLqYGmbXsoWFJT-FHe1-WVrGBvwk2kqZfjgjDUoUedrDR0F9T_YrVIuPtruGqR4gJGWBuXPciOSHYsGu12Oxg3zC1FwoptN0NA2AZ-oTg');
INSERT INTO micadoapp.settings VALUES ('default_language', 'en');


--
-- Data for Name: step; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.step VALUES ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 12, true, 'string', 0, 0, 1);
INSERT INTO micadoapp.step VALUES ('7c0a6296-d88d-4af7-97d6-ec1a2919c53f', 0, true, 'string', 0, 0, 1);
INSERT INTO micadoapp.step VALUES ('5e06e8e5-9538-46db-b2e1-485fc5fef9bd', 0, false, '', 0, 0, 1);


--
-- Data for Name: step_document; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.step_document VALUES (1, true, '$0.00', '7c0a6296-d88d-4af7-97d6-ec1a2919c53f');


--
-- Data for Name: step_link; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.step_link VALUES ('b18cb964-ef52-4492-8d53-8e559745a2b1', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', '7c0a6296-d88d-4af7-97d6-ec1a2919c53f', 1);


--
-- Data for Name: step_link_translation; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.step_link_translation VALUES ('en', 'il link', 'b18cb964-ef52-4492-8d53-8e559745a2b1');
INSERT INTO micadoapp.step_link_translation VALUES ('it', NULL, 'b18cb964-ef52-4492-8d53-8e559745a2b1');
INSERT INTO micadoapp.step_link_translation VALUES ('es', NULL, 'b18cb964-ef52-4492-8d53-8e559745a2b1');
INSERT INTO micadoapp.step_link_translation VALUES ('de', NULL, 'b18cb964-ef52-4492-8d53-8e559745a2b1');
INSERT INTO micadoapp.step_link_translation VALUES ('nl', NULL, 'b18cb964-ef52-4492-8d53-8e559745a2b1');


--
-- Data for Name: step_translation; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.step_translation VALUES ('en', 'mio step', 'string', '2020-06-30 10:16:52.798', '7c0a6296-d88d-4af7-97d6-ec1a2919c53f');
INSERT INTO micadoapp.step_translation VALUES ('en', 'pippo', 'string', '2020-06-30 11:53:49.781', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11');
INSERT INTO micadoapp.step_translation VALUES ('it', NULL, NULL, NULL, '7c0a6296-d88d-4af7-97d6-ec1a2919c53f');
INSERT INTO micadoapp.step_translation VALUES ('es', NULL, NULL, NULL, '7c0a6296-d88d-4af7-97d6-ec1a2919c53f');
INSERT INTO micadoapp.step_translation VALUES ('de', NULL, NULL, NULL, '7c0a6296-d88d-4af7-97d6-ec1a2919c53f');
INSERT INTO micadoapp.step_translation VALUES ('nl', NULL, NULL, NULL, '7c0a6296-d88d-4af7-97d6-ec1a2919c53f');
INSERT INTO micadoapp.step_translation VALUES ('it', NULL, NULL, NULL, 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11');
INSERT INTO micadoapp.step_translation VALUES ('es', NULL, NULL, NULL, 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11');
INSERT INTO micadoapp.step_translation VALUES ('de', NULL, NULL, NULL, 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11');
INSERT INTO micadoapp.step_translation VALUES ('nl', NULL, NULL, NULL, 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11');
INSERT INTO micadoapp.step_translation VALUES ('en', NULL, NULL, NULL, '5e06e8e5-9538-46db-b2e1-485fc5fef9bd');
INSERT INTO micadoapp.step_translation VALUES ('es', NULL, NULL, NULL, '5e06e8e5-9538-46db-b2e1-485fc5fef9bd');
INSERT INTO micadoapp.step_translation VALUES ('it', NULL, NULL, NULL, '5e06e8e5-9538-46db-b2e1-485fc5fef9bd');
INSERT INTO micadoapp.step_translation VALUES ('de', NULL, NULL, NULL, '5e06e8e5-9538-46db-b2e1-485fc5fef9bd');
INSERT INTO micadoapp.step_translation VALUES ('nl', NULL, NULL, NULL, '5e06e8e5-9538-46db-b2e1-485fc5fef9bd');


--
-- Data for Name: topic; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.topic VALUES (1, 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTkiIGhlaWdodD0iMTkiIHZpZXdCb3g9IjAgMCAxOSAxOSIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTE0LjgyOTMgOC40NDQzMlYtMC4wMDAxMjIwN0g0LjIyMjIyVjQuMjIyMUgwVjE4Ljk5OTlIOC40NDQ0NFYxNC43Nzc3SDEwLjU1NTZWMTguOTk5OUgxOVY4LjQ0NDMySDE0LjgyOTNaTTQuMjIyMjIgMTYuOTQwM0gyLjExMTExVjE0LjgyOTFINC4yMjIyMlYxNi45NDAzWk00LjIyMjIyIDEyLjcxOEgyLjExMTExVjEwLjYwNjlINC4yMjIyMlYxMi43MThaTTQuMjIyMjIgOC40NDQzMkgyLjExMTExVjYuMzMzMjFINC4yMjIyMlY4LjQ0NDMyWk04LjQ0NDQ0IDEyLjcxOEg2LjMzMzMzVjEwLjYwNjlIOC40NDQ0NFYxMi43MThaTTguNDQ0NDQgOC40NDQzMkg2LjMzMzMzVjYuMzMzMjFIOC40NDQ0NFY4LjQ0NDMyWk04LjQ0NDQ0IDQuMjIyMUg2LjMzMzMzVjIuMTEwOTlIOC40NDQ0NFY0LjIyMjFaTTEyLjcxODIgMTIuNzE4SDEwLjYwN1YxMC42MDY5SDEyLjcxODJWMTIuNzE4Wk0xMi43MTgyIDguNDQ0MzJIMTAuNjA3VjYuMzMzMjFIMTIuNzE4MlY4LjQ0NDMyWk0xMi43MTgyIDQuMjIyMUgxMC42MDdWMi4xMTA5OUgxMi43MTgyVjQuMjIyMVpNMTYuOTQwNCAxNi45NDAzSDE0LjgyOTNWMTQuODI5MUgxNi45NDA0VjE2Ljk0MDNaTTE2Ljk0MDQgMTIuNzE4SDE0LjgyOTNWMTAuNjA2OUgxNi45NDA0VjEyLjcxOFoiIGZpbGw9IiM2N0RGNkQiLz4KPC9zdmc+Cg==', false, NULL);
INSERT INTO micadoapp.topic VALUES (2, 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTEyLjU2NDIgMTQuOTI4NkgxMS4yNzQ2QzEwLjYyOTkgMTQuOTI4NiAxMC4xNDYzIDE0LjQ0NSAxMC4wOTI1IDEzLjg1MzlMMyAxMi43NzkzVjE4LjM2NzRDMyAxOS40OTU3IDMuOTEzNDMgMjAuMzU1NCA0Ljk4ODA2IDIwLjM1NTRIMTguOTU4MkMyMC4wODY2IDIwLjM1NTQgMjAuOTQ2MyAxOS40NDIgMjAuOTQ2MyAxOC4zNjc0VjEyLjc3OTNMMTMuNzQ2MyAxMy44NTM5QzEzLjY5MjUgMTQuNDk4NyAxMy4yMDkgMTQuOTI4NiAxMi41NjQyIDE0LjkyODZaIiBmaWxsPSIjMjY0MTVBIi8+CjxwYXRoIGQ9Ik0xOC45NTgyIDcuMDgzNThIMTUuOTQ5M1Y1Ljc5NDAzQzE1Ljk0OTMgNC4yMzU4MiAxNC43MTM0IDMgMTMuMTU1MiAzSDEwLjczNzNDOS4xNzkxMSAzIDcuOTQzMjggNC4yMzU4MiA3Ljk0MzI4IDUuNzk0MDNWNy4wODM1OEg0Ljk4ODA2QzMuODU5NyA3LjA4MzU4IDMgNy45OTcwMiAzIDkuMDcxNjRWMTEuOTczMUwxMC4zMDc1IDEzLjA0NzhDMTAuNTIyNCAxMi43MjU0IDEwLjg5ODUgMTIuNTEwNCAxMS4zMjg0IDEyLjUxMDRIMTIuNjE3OUMxMy4wNDc4IDEyLjUxMDQgMTMuNDIzOSAxMi43MjU0IDEzLjYzODggMTMuMTAxNUwyMSAxMS45NzMxVjkuMDcxNjRDMjAuOTQ2MyA3Ljk5NzAyIDIwLjAzMjggNy4wODM1OCAxOC45NTgyIDcuMDgzNThaTTkuNTAxNDkgNS43OTQwM0M5LjUwMTQ5IDUuMTQ5MjUgMTAuMDM4OCA0LjYxMTk0IDEwLjY4MzYgNC42MTE5NEgxMy4xMDE1QzEzLjc0NjMgNC42MTE5NCAxNC4yODM2IDUuMTQ5MjUgMTQuMjgzNiA1Ljc5NDAzVjcuMDgzNThIOS40NDc3NlY1Ljc5NDAzSDkuNTAxNDlaIiBmaWxsPSIjMjY0MTVBIi8+Cjwvc3ZnPgo=', true, NULL);
INSERT INTO micadoapp.topic VALUES (3, 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xNC42OTk3IDQuNUMxNC42OTk3IDQuMjIzODYgMTQuNDc1OCA0IDE0LjE5OTcgNEgxMC4xNDcxQzkuODcwOTIgNCA5LjY0NzA2IDQuMjIzODYgOS42NDcwNiA0LjVWOC45NzM1OEM5LjY0NzA2IDkuMjQ5NzIgOS40MjMyIDkuNDczNTggOS4xNDcwNiA5LjQ3MzU4SDQuNUM0LjIyMzg2IDkuNDczNTggNCA5LjY5NzQzIDQgOS45NzM1OFYxNC4wMjYyQzQgMTQuMzAyMyA0LjIyMzg2IDE0LjUyNjIgNC41IDE0LjUyNjJIOS4xNDcwNkM5LjQyMzIgMTQuNTI2MiA5LjY0NzA2IDE0Ljc1MDEgOS42NDcwNiAxNS4wMjYyVjE5LjVDOS42NDcwNiAxOS43NzYxIDkuODcwOTIgMjAgMTAuMTQ3MSAyMEgxNC4xOTk3QzE0LjQ3NTggMjAgMTQuNjk5NyAxOS43NzYxIDE0LjY5OTcgMTkuNVYxNS4wMjYyQzE0LjY5OTcgMTQuNzUwMSAxNC45MjM1IDE0LjUyNjIgMTUuMTk5NyAxNC41MjYySDE5LjVDMTkuNzc2MSAxNC41MjYyIDIwIDE0LjMwMjMgMjAgMTQuMDI2MlY5Ljk3MzU4QzIwIDkuNjk3NDMgMTkuNzc2MSA5LjQ3MzU4IDE5LjUgOS40NzM1OEgxNS4xOTk3QzE0LjkyMzUgOS40NzM1OCAxNC42OTk3IDkuMjQ5NzIgMTQuNjk5NyA4Ljk3MzU4VjQuNVoiIGZpbGw9IiMyRUMwRUUiLz4KPC9zdmc+Cg==', false, NULL);
INSERT INTO micadoapp.topic VALUES (4, 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPGcgaWQ9Ikljb24gLSBFZHVjYXRpb24iPgo8cGF0aCBpZD0iaWNvbi9zb2NpYWwvc2Nob29sXzI0cHgiIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNMS42NDQxOSA5LjM1MTExQzEuMzY2MTQgOS4xOTk1NyAxLjM2NjA3IDguODAwMzYgMS42NDQwNyA4LjY0ODczTDExLjgwODUgMy4xMDQ1MUMxMS45Mjc5IDMuMDM5MzggMTIuMDcyMiAzLjAzOTM4IDEyLjE5MTUgMy4xMDQ1MUwyMi43OTE2IDguODg2MzJDMjIuOTIwMSA4Ljk1NjQyIDIzIDkuMDkxMSAyMyA5LjIzNzQ4VjE2LjZDMjMgMTYuODIwOSAyMi44MjA5IDE3IDIyLjYgMTdIMjEuNEMyMS4xNzkxIDE3IDIxIDE2LjgyMDkgMjEgMTYuNlYxMC43NjM2QzIxIDEwLjQ2IDIwLjY3NTEgMTAuMjY3MSAyMC40MDg2IDEwLjQxMjRMMTkuMjA4NiAxMS4wNjY0QzE5LjA4IDExLjEzNjQgMTkgMTEuMjcxMSAxOSAxMS40MTc2VjE2Ljk0MjZDMTkgMTcuMDg5IDE4LjkyMDEgMTcuMjIzNiAxOC43OTE2IDE3LjI5MzdMMTIuMTkxNiAyMC44OTU1QzEyLjA3MjIgMjAuOTYwNiAxMS45Mjc4IDIwLjk2MDYgMTEuODA4NCAyMC44OTU1TDUuMjA4NCAxNy4yOTM3QzUuMDc5OTMgMTcuMjIzNiA1LjAwMDAxIDE3LjA4OSA1LjAwMDAxIDE2Ljk0MjZWMTEuNDE3NkM1LjAwMDAxIDExLjI3MTEgNC45MiAxMS4xMzY0IDQuNzkxNDMgMTEuMDY2NEwxLjY0NDE5IDkuMzUxMTFaTTExLjgwODMgMTguNjE1NEMxMS45Mjc4IDE4LjY4MDYgMTIuMDcyMiAxOC42ODA2IDEyLjE5MTcgMTguNjE1NEwxNi43OTE3IDE2LjEwMzhDMTYuOTIwMSAxNi4wMzM2IDE3IDE1Ljg5OSAxNyAxNS43NTI3VjEyLjk0NDJDMTcgMTIuNjQwNSAxNi42NzQ5IDEyLjQ0NzYgMTYuNDA4MyAxMi41OTMxTDEyLjE5MTcgMTQuODk1NEMxMi4wNzIyIDE0Ljk2MDYgMTEuOTI3OCAxNC45NjA2IDExLjgwODMgMTQuODk1NEw3LjU5MTcgMTIuNTkzMUM3LjMyNTE0IDEyLjQ0NzYgNy4wMDAwMSAxMi42NDA1IDcuMDAwMDEgMTIuOTQ0MlYxNS43NTI3QzcuMDAwMDEgMTUuODk5IDcuMDc5OSAxNi4wMzM2IDcuMjA4MzIgMTYuMTAzOEwxMS44MDgzIDE4LjYxNTRaIiBmaWxsPSIjMEU1MThFIi8+CjwvZz4KPC9zdmc+Cg==', false, NULL);


--
-- Data for Name: topic_translation; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.topic_translation VALUES (1, 'it', 'Casa', '2020-06-18 16:31:27.89');
INSERT INTO micadoapp.topic_translation VALUES (1, 'de', 'aggiornato', '2020-06-24 17:59:35.993');
INSERT INTO micadoapp.topic_translation VALUES (1, 'en', 'House', NULL);
INSERT INTO micadoapp.topic_translation VALUES (2, 'en', 'Employment', NULL);
INSERT INTO micadoapp.topic_translation VALUES (2, 'de', 'Werk', NULL);
INSERT INTO micadoapp.topic_translation VALUES (2, 'it', 'Lavoro', '2020-06-18 19:42:09.469');
INSERT INTO micadoapp.topic_translation VALUES (3, 'de', '', NULL);
INSERT INTO micadoapp.topic_translation VALUES (3, 'es', '', NULL);
INSERT INTO micadoapp.topic_translation VALUES (3, 'nl', '', NULL);
INSERT INTO micadoapp.topic_translation VALUES (3, 'it', '', NULL);
INSERT INTO micadoapp.topic_translation VALUES (3, 'en', 'Health', NULL);
INSERT INTO micadoapp.topic_translation VALUES (4, 'de', '', NULL);
INSERT INTO micadoapp.topic_translation VALUES (4, 'es', '', NULL);
INSERT INTO micadoapp.topic_translation VALUES (4, 'it', '', NULL);
INSERT INTO micadoapp.topic_translation VALUES (4, 'en', 'Education', NULL);
INSERT INTO micadoapp.topic_translation VALUES (4, 'nl', '', NULL);
INSERT INTO micadoapp.topic_translation VALUES (1, 'es', NULL, NULL);
INSERT INTO micadoapp.topic_translation VALUES (1, 'nl', NULL, NULL);
INSERT INTO micadoapp.topic_translation VALUES (2, 'es', NULL, NULL);
INSERT INTO micadoapp.topic_translation VALUES (2, 'nl', NULL, NULL);


--
-- Data for Name: user_types; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.user_types VALUES (1, 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTE3LjMxOTMgNy42MDkxNUMxOC41OTIxIDcuNjA5MTUgMTkuNjIzOSA2LjU3NzM1IDE5LjYyMzkgNS4zMDQ1N0MxOS42MjM5IDQuMDMxNzkgMTguNTkyMSAzIDE3LjMxOTMgM0MxNi4wNDY2IDMgMTUuMDE0OCA0LjAzMTc5IDE1LjAxNDggNS4zMDQ1N0MxNS4wMTQ4IDYuNTc3MzUgMTYuMDQ2NiA3LjYwOTE1IDE3LjMxOTMgNy42MDkxNVoiIGZpbGw9IiNGRjdDNDQiLz4KPHBhdGggZD0iTTIyLjc0NzggMTEuMzk5MUwyMC41OTY5IDExLjA0MDZMMTguODA0NSA4LjQ3OTkzQzE4Ljc1MzIgOC4zNzc1MSAxOC41OTk2IDguMzI2MjkgMTguNDk3MiA4LjMyNjI5SDE0LjcwNzRDMTQuNjA1IDguMzI2MjkgMTQuNTAyNiA4LjM3NzUxIDE0LjQ1MTQgOC40Mjg3MkwxMi4xNDY4IDEwLjczMzNMMTAuMzAzMSAxMi45MzU0TDkuMDIyODMgMTMuMjQyN0w3LjIzMDM4IDEyLjUyNTdDNy4xNzkxNyAxMi41MjU3IDcuMTI3OTUgMTIuNDc0NSA3LjA3Njc0IDEyLjQ3NDVINC40MTM2OEM0LjMxMTI1IDEyLjQ3NDUgNC4yMDg4MyAxMi41MjU3IDQuMTA2NCAxMi42MjgyTDIuNTcwMDIgMTQuNTc0MkwxLjQ0MzM0IDE1LjcwMDlDMS4yODk3IDE1Ljg1NDYgMS4yODk3IDE2LjExMDYgMS40NDMzNCAxNi4yNjQzTDIuMjExNTMgMTcuMDMyNUMyLjM2NTE3IDE3LjE4NjEgMi42MjEyMyAxNy4xODYxIDIuNzc0ODcgMTcuMDMyNUw0LjA1NTE5IDE1Ljc1MjFWMTYuNjIyOEwyLjYyMTIzIDE4Ljc3MzdMMS4wODQ4NSAyMC42Njg2QzAuOTgyNDI3IDIwLjc3MSAwLjk4MjQyNyAyMC45MjQ2IDEuMDMzNjQgMjEuMDI3MUMwLjk4MjQyNyAyMS4xMjk1IDEuMDg0ODUgMjEuMjMxOSAxLjIzODQ5IDIxLjI4MzFMMi43NzQ4NyAyMS42NDE2QzIuODI2MDggMjEuNjQxNiAyLjgyNjA4IDIxLjY0MTYgMi44NzczIDIxLjY0MTZDMi45Nzk3MiAyMS42NDE2IDMuMTMzMzYgMjEuNTkwNCAzLjE4NDU3IDIxLjQ4OEw0LjcyMDk2IDE5LjE4MzRWMTkuMTMyMkw1LjQ4OTE1IDE3LjU5NThMNS44OTg4NSAxOC42MjAxTDUuMTgxODcgMjEuNTM5MkM1LjEzMDY2IDIxLjY0MTYgNS4xODE4NyAyMS43OTUyIDUuMjMzMDggMjEuODQ2NUM1LjI4NDMgMjEuOTQ4OSA1LjQzNzkzIDIyLjAwMDEgNS41NDAzNiAyMi4wMDAxSDcuMDc2NzRDNy4yMzAzOCAyMi4wMDAxIDcuMzg0MDIgMjEuODk3NyA3LjQzNTIzIDIxLjY5MjhMOC4yMDM0MiAxOC42MjAxQzguMjAzNDIgMTguNTE3NiA4LjIwMzQyIDE4LjQ2NjQgOC4yMDM0MiAxOC4zNjRMNy40MzUyMyAxNi42MjI4VjE1LjAzNTJMOC40MDgyNyAxNS40OTYxQzguNTEwNyAxNS41NDczIDguNjEzMTIgMTUuNTQ3MyA4LjcxNTU1IDE1LjQ5NjFMMTIuMTQ2OCAxNC4zNjk0SDEyLjE5OEgxMi4yNDkyQzEyLjMwMDQgMTQuMzY5NCAxMi4zMDA0IDE0LjMxODIgMTIuMzAwNCAxNC4zMTgyTDEzLjc4NTYgMTIuNDc0NUwxNC4yOTc3IDEyLjExNlYxNC44MzAzTDEzLjkzOTIgMTcuMzkwOUwxMi4wOTU2IDIwLjAwMjhDMTEuOTkzMiAyMC4wMDI4IDExLjk5MzIgMjAuMTU2NCAxMS45OTMyIDIwLjI1ODlDMTIuMDQ0NCAyMC4zNjEzIDEyLjE0NjggMjAuNDYzNyAxMi4yNDkyIDIwLjUxNDlMMTMuNzg1NiAyMC44NzM0QzEzLjgzNjggMjAuODczNCAxMy44MzY4IDIwLjg3MzQgMTMuODg4IDIwLjg3MzRDMTQuMDQxNyAyMC44NzM0IDE0LjE0NDEgMjAuODIyMiAxNC4xOTUzIDIwLjY2ODZMMTYuMDkwMiAxNy41OTU4QzE2LjA5MDIgMTcuNTQ0NiAxNi4xNDE0IDE3LjU0NDYgMTYuMTQxNCAxNy40OTM0TDE2LjcwNDcgMTUuNTk4NUwxOC4wMzYzIDE3LjQ0MjJMMTYuNjAyMyAyMS4xMjk1QzE2LjU1MTEgMjEuMjMxOSAxNi41NTExIDIxLjM4NTUgMTYuNjUzNSAyMS40ODhDMTYuNzA0NyAyMS41OTA0IDE2Ljg1ODQgMjEuNjQxNiAxNi45NjA4IDIxLjY0MTZIMTguNDk3MkMxOC42NTA4IDIxLjY0MTYgMTguNzUzMiAyMS41MzkyIDE4Ljg1NTcgMjEuNDM2OEwyMC42OTkzIDE3LjY0N0MyMC43NTA1IDE3LjU0NDYgMjAuNzUwNSAxNy4zOTA5IDIwLjY0ODEgMTcuMjM3M0wxOC44MDQ1IDE0LjY3NjdWMTIuMTY3MkwxOS4yNjU0IDEyLjczMDZDMTkuMzE2NiAxMi43ODE4IDE5LjM2NzggMTIuODMzIDE5LjQ3MDIgMTIuODg0MkwyMi41NDMgMTMuNjUyNEMyMi42NDU0IDEzLjcwMzYgMjIuNzk5MSAxMy42NTI0IDIyLjg1MDMgMTMuNjAxMkMyMi45NTI3IDEzLjU1IDIzLjAwMzkgMTMuMzk2NCAyMy4wMDM5IDEzLjI5MzlWMTEuNzU3NUMyMy4wNTUxIDExLjU1MjcgMjIuOTAxNSAxMS4zOTkxIDIyLjc0NzggMTEuMzk5MVoiIGZpbGw9IiNGRjdDNDQiLz4KPHBhdGggZD0iTTYuMjU3MzMgMTEuNzU3NUM3LjEwNTg1IDExLjc1NzUgNy43OTM3MSAxMS4wNjk2IDcuNzkzNzEgMTAuMjIxMUM3Ljc5MzcxIDkuMzcyNTUgNy4xMDU4NSA4LjY4NDY5IDYuMjU3MzMgOC42ODQ2OUM1LjQwODgxIDguNjg0NjkgNC43MjA5NSA5LjM3MjU1IDQuNzIwOTUgMTAuMjIxMUM0LjcyMDk1IDExLjA2OTYgNS40MDg4MSAxMS43NTc1IDYuMjU3MzMgMTEuNzU3NVoiIGZpbGw9IiNGRjdDNDQiLz4KPC9zdmc+Cg==', false, NULL);
INSERT INTO micadoapp.user_types VALUES (7, 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTEyIDZDMTMuMTA0NiA2IDE0IDUuMTA0NTcgMTQgNEMxNCAyLjg5NTQzIDEzLjEwNDYgMiAxMiAyQzEwLjg5NTQgMiAxMCAyLjg5NTQzIDEwIDRDMTAgNS4xMDQ1NyAxMC44OTU0IDYgMTIgNloiIGZpbGw9IiM5MjVGRkYiLz4KPHBhdGggZD0iTTE1Ljg5IDguMTFDMTUuNSA3LjcyIDE0LjgzIDcgMTMuNTMgN0MxMy4zMiA3IDEyLjExIDcgMTAuOTkgN0M4LjQwODQ3IDYuOTkwNjEgNi4yNzYzNyA1LjAxNjA5IDYuMDI0ODIgMi40OTkyOEM1Ljk5NzM2IDIuMjI0NSA1Ljc3NjE0IDIgNS41IDJINC41QzQuMjIzODYgMiAzLjk5ODEzIDIuMjI0NDIgNC4wMTc3IDIuNDk5ODdDNC4yMTc1NCA1LjMxMjA1IDYuMDg5OTQgNy42NzI1MiA4LjY0NzAxIDguNTkzNEM4Ljg1NDU5IDguNjY4MTUgOSA4Ljg2MTAyIDkgOS4wODE2NVYyMS41QzkgMjEuNzc2MSA5LjIyMzg2IDIyIDkuNSAyMkgxMC41QzEwLjc3NjEgMjIgMTEgMjEuNzc2MSAxMSAyMS41VjE2LjVDMTEgMTYuMjIzOSAxMS4yMjM5IDE2IDExLjUgMTZIMTIuNUMxMi43NzYxIDE2IDEzIDE2LjIyMzkgMTMgMTYuNVYyMS41QzEzIDIxLjc3NjEgMTMuMjIzOSAyMiAxMy41IDIySDE0LjVDMTQuNzc2MSAyMiAxNSAyMS43NzYxIDE1IDIxLjVWMTEuMjU3MUMxNSAxMC44MTE3IDE1LjUzODYgMTAuNTg4NiAxNS44NTM2IDEwLjkwMzZMMTguNTk2NCAxMy42NDY0QzE4Ljc5MTcgMTMuODQxNyAxOS4xMDgzIDEzLjg0MTcgMTkuMzAzNiAxMy42NDY0TDIwLjAwNjggMTIuOTQzMkMyMC4yMDIgMTIuNzQ4MSAyMC4yMDIxIDEyLjQzMTggMjAuMDA3MiAxMi4yMzY0TDE1Ljg5IDguMTFaIiBmaWxsPSIjOTI1RkZGIi8+Cjwvc3ZnPgo=', false, NULL);
INSERT INTO micadoapp.user_types VALUES (9, 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTE4Ljc0MjkgOS4xMzk4OUwxNy45Njc0IDguOTU3NDNDMTcuOTY3NCA4LjYzODExIDE3LjgzMDUgOC4zMTg3OSAxNy42MDI0IDguMDkwN0wxNy41NTY4IDguMDQ1MDhDMTcuMTkxOSA3LjY4MDE1IDE2LjY5MDEgNy43MjU3NiAxNi4yNzk1IDguMTgxOTNMMTYuMDA1OCA4LjQxMDAyTDIuODIyNSA1LjAzNDM1QzIuNjQwMDMgNC45ODg3NCAyLjQ1NzU3IDUuMTI1NTkgMi40MTE5NSA1LjMwODA2QzIuMzY2MzMgNS40OTA1MiAyLjQ1NzU3IDUuNjcyOTkgMi42NDAwMyA1LjcxODYxTDMuNTUyMzggNS45NDY3QzMuMDA0OTcgNi40OTQxIDIuNTQ4OCA3LjQ5NzY4IDIuMTgzODYgOC41MDEyNUMyLjAwMTM5IDguOTU3NDMgMS44NjQ1NCA5LjU5NjA3IDIuMjI5NDggMTAuMDk3OUMyLjU0ODggMTAuNTk5NiAzLjI3ODY3IDEwLjg3MzMgNC4zNzM0OCAxMC45NjQ2SDQuNDE5MUg0LjQ2NDcyQzUuNTU5NTMgMTAuODczMyA2LjI4OTQgMTAuNTk5NiA2LjYwODcyIDEwLjA5NzlDNi45MjgwNCA5LjU5NjA3IDYuNzkxMTkgOC45NTc0MyA2LjY1NDM0IDguNTAxMjVDNi4zODA2NCA3Ljc3MTM4IDYuMTA2OTMgNy4wNDE1MSA1Ljc0MiA2LjQ5NDFMMTAuMjU4MSA3LjYzNDUzQzkuODQ3NTQgNy44MTcgOS42MTk0NSA4LjEzNjMyIDkuNjE5NDUgOC43NzQ5NlYxMy43NDcyQzkuNjE5NDUgMTMuOTI5NyA5LjI1NDUyIDE0LjYxMzkgOC40NzkwMiAxNi44NDkyTDYuNDI2MjUgMTguODU2M0M1Ljk3MDA4IDE5LjMxMjUgNi4wMTU3IDE5Ljk1MTEgNi41MTc0OSAyMC40NTI5TDYuNjA4NzIgMjAuNTQ0MkM3LjExMDUxIDIxLjA0NiA3Ljg4NiAyMS4xMzcyIDguMjk2NTYgMjAuNzI2NkwxMC42MjMgMTguNDAwMkMxMC43NTk5IDE4LjMwODkgMTAuODUxMSAxOC4xNzIxIDEwLjg5NjcgMTcuOTg5NkwxMS41ODEgMTYuMTY0OUwxMi4zMTA5IDE3LjY3MDNWMjAuNTQ0MkMxMi4zMTA5IDIxLjE4MjggMTIuNzY3IDIxLjc3NTggMTMuNDUxMyAyMS43NzU4SDEzLjU4ODFDMTQuMjcyNCAyMS43NzU4IDE1LjAwMjMgMjEuMTgyOCAxNS4wMDIzIDIwLjU0NDJWMTcuMTY4NUMxNS4wMDIzIDE3LjE2ODUgMTQuOTU2NyAxNi44OTQ4IDE0Ljg2NTQgMTYuNzU4TDEzLjU0MjUgMTMuOTI5N0MxMy41NDI1IDEzLjcwMTYgMTMuNTQyNSAxMy4wNjMgMTMuNTQyNSAxMC45NjQ2TDE0LjA4OTkgMTEuNTU3NkMxNC4yNzI0IDExLjc0MDEgMTQuNjM3MyAxMS43ODU3IDE0LjkxMSAxMS43ODU3QzE1LjQ1ODQgMTEuNzg1NyAxNS41OTUzIDExLjY0ODggMTUuNjQwOSAxMS42MDMyTDE3LjY5MzcgOS41NTA0NUwxOC41NjA0IDkuNzc4NTNDMTguNjA2IDkuNzc4NTMgMTguNjA2IDkuNzc4NTMgMTguNjUxNiA5Ljc3ODUzQzE4Ljc4ODUgOS43Nzg1MyAxOC45MjUzIDkuNjg3MyAxOC45NzEgOS41MDQ4M0MxOS4wNjIyIDkuMzY3OTggMTguOTI1MyA5LjE4NTUxIDE4Ljc0MjkgOS4xMzk4OVpNMTQuOTU2NyA5LjQ1OTIxTDE0LjEzNTUgOC42MzgxMUwxNS40NTg0IDguOTU3NDNMMTQuOTU2NyA5LjQ1OTIxWiIgZmlsbD0iI0RGNUZGRiIvPgo8cGF0aCBkPSJNMTMuMjY4OCA3LjA4NzIzQzE0LjQwMjUgNy4wODcyMyAxNS4zMjE2IDYuMTY4MTcgMTUuMzIxNiA1LjAzNDQ2QzE1LjMyMTYgMy45MDA3NSAxNC40MDI1IDIuOTgxNjkgMTMuMjY4OCAyLjk4MTY5QzEyLjEzNTEgMi45ODE2OSAxMS4yMTYxIDMuOTAwNzUgMTEuMjE2MSA1LjAzNDQ2QzExLjIxNjEgNi4xNjgxNyAxMi4xMzUxIDcuMDg3MjMgMTMuMjY4OCA3LjA4NzIzWiIgZmlsbD0iI0RGNUZGRiIvPgo8L3N2Zz4K', false, NULL);


--
-- Data for Name: user_types_translation; Type: TABLE DATA; Schema: micadoapp; Owner: -
--

INSERT INTO micadoapp.user_types_translation VALUES (1, 'it', 'Rifugiato', NULL, NULL);
INSERT INTO micadoapp.user_types_translation VALUES (1, 'en', 'Refugee', NULL, NULL);
INSERT INTO micadoapp.user_types_translation VALUES (1, 'de', NULL, NULL, NULL);
INSERT INTO micadoapp.user_types_translation VALUES (1, 'es', NULL, NULL, NULL);
INSERT INTO micadoapp.user_types_translation VALUES (1, 'nl', NULL, NULL, NULL);
INSERT INTO micadoapp.user_types_translation VALUES (7, 'de', '', '', NULL);
INSERT INTO micadoapp.user_types_translation VALUES (7, 'es', '', '', NULL);
INSERT INTO micadoapp.user_types_translation VALUES (7, 'en', 'Migrant ', '', NULL);
INSERT INTO micadoapp.user_types_translation VALUES (7, 'nl', '', '', NULL);
INSERT INTO micadoapp.user_types_translation VALUES (7, 'it', 'Migrante ', '', NULL);
INSERT INTO micadoapp.user_types_translation VALUES (9, 'de', '', '', NULL);
INSERT INTO micadoapp.user_types_translation VALUES (9, 'it', '', '', NULL);
INSERT INTO micadoapp.user_types_translation VALUES (9, 'en', 'Asylum Seeker', '', NULL);
INSERT INTO micadoapp.user_types_translation VALUES (9, 'es', '', '', NULL);
INSERT INTO micadoapp.user_types_translation VALUES (9, 'nl', '', '', NULL);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.comments_id_seq', 1, false);


--
-- Name: document_document_type_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.document_document_type_seq', 1, false);


--
-- Name: document_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.document_id_seq', 1, false);


--
-- Name: document_type_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.document_type_id_seq', 13, true);


--
-- Name: document_type_picture_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.document_type_picture_id_seq', 6, true);


--
-- Name: event_category_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.event_category_id_seq', 1, false);


--
-- Name: event_category_translation_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.event_category_translation_id_seq', 1, false);


--
-- Name: event_event_category_id_event_category_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.event_event_category_id_event_category_seq', 1, false);


--
-- Name: event_event_category_id_event_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.event_event_category_id_event_seq', 1, false);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.event_id_seq', 6, true);


--
-- Name: event_topic_id_event_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.event_topic_id_event_seq', 1, false);


--
-- Name: event_topic_id_topic_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.event_topic_id_topic_seq', 1, false);


--
-- Name: event_translation_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.event_translation_id_seq', 1, false);


--
-- Name: features_flags_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.features_flags_id_seq', 1, false);


--
-- Name: glossary_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.glossary_id_seq', 14, true);


--
-- Name: individual_intervention_plan_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.individual_intervention_plan_id_seq', 1, false);


--
-- Name: individual_intervention_plan_intervention_intervention_type_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.individual_intervention_plan_intervention_intervention_type_seq', 1, false);


--
-- Name: individual_intervention_plan_interventions_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.individual_intervention_plan_interventions_id_seq', 1, false);


--
-- Name: individual_intervention_plan_interventions_list_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.individual_intervention_plan_interventions_list_id_seq', 1, false);


--
-- Name: intervention_category_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.intervention_category_id_seq', 7, true);


--
-- Name: intervention_processes_intervention_type_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.intervention_processes_intervention_type_seq', 1, false);


--
-- Name: intervention_processes_process_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.intervention_processes_process_id_seq', 1, false);


--
-- Name: intervention_types_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.intervention_types_id_seq', 5, true);


--
-- Name: picture_hotspot_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.picture_hotspot_id_seq', 1, false);


--
-- Name: process_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.process_id_seq', 47, true);


--
-- Name: process_topic_id_process_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.process_topic_id_process_seq', 1, false);


--
-- Name: process_topic_id_topic_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.process_topic_id_topic_seq', 1, false);


--
-- Name: process_translation_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.process_translation_id_seq', 1, false);


--
-- Name: process_users_id_process_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.process_users_id_process_seq', 1, false);


--
-- Name: process_users_id_user_types_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.process_users_id_user_types_seq', 1, false);


--
-- Name: ratings_content_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.ratings_content_id_seq', 1, false);


--
-- Name: topic_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.topic_id_seq', 4, true);


--
-- Name: topic_translation_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.topic_translation_id_seq', 1, false);


--
-- Name: user_types_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.user_types_id_seq', 9, true);


--
-- Name: user_types_translation_id_seq; Type: SEQUENCE SET; Schema: micadoapp; Owner: -
--

SELECT pg_catalog.setval('micadoapp.user_types_translation_id_seq', 1, false);


--
-- Name: charts charts_pkey; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.charts
    ADD CONSTRAINT charts_pkey PRIMARY KEY (id);


--
-- Name: document_pictures document_pictures_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document_pictures
    ADD CONSTRAINT document_pictures_pk PRIMARY KEY (id);


--
-- Name: document document_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document
    ADD CONSTRAINT document_pk PRIMARY KEY (id);


--
-- Name: document_type_picture document_type_picture_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document_type_picture
    ADD CONSTRAINT document_type_picture_pk PRIMARY KEY (id);


--
-- Name: document_type document_type_pkey; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document_type
    ADD CONSTRAINT document_type_pkey PRIMARY KEY (id);


--
-- Name: document_type_translation document_type_translation_pkey; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document_type_translation
    ADD CONSTRAINT document_type_translation_pkey PRIMARY KEY (id, lang);


--
-- Name: event_category event_category_pkey; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_category
    ADD CONSTRAINT event_category_pkey PRIMARY KEY (id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: features_flags features_flag_pkey; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.features_flags
    ADD CONSTRAINT features_flag_pkey PRIMARY KEY (id);


--
-- Name: features_flags_translation features_flags_translation_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.features_flags_translation
    ADD CONSTRAINT features_flags_translation_pk PRIMARY KEY (id, lang);


--
-- Name: glossary glossary_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.glossary
    ADD CONSTRAINT glossary_pk PRIMARY KEY (id);


--
-- Name: glossary_translation glossary_translation_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.glossary_translation
    ADD CONSTRAINT glossary_translation_pk PRIMARY KEY (id, lang);


--
-- Name: individual_intervention_plan_interventions individual_intervention_plan_interventions_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.individual_intervention_plan_interventions
    ADD CONSTRAINT individual_intervention_plan_interventions_pk PRIMARY KEY (id);


--
-- Name: individual_intervention_plan individual_intervention_plan_pkey; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.individual_intervention_plan
    ADD CONSTRAINT individual_intervention_plan_pkey PRIMARY KEY (id);


--
-- Name: intervention_category intervention_category_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_category
    ADD CONSTRAINT intervention_category_pk PRIMARY KEY (id);


--
-- Name: intervention_category_translation intervention_category_translation_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_category_translation
    ADD CONSTRAINT intervention_category_translation_pk PRIMARY KEY (id, lang);


--
-- Name: intervention_type_validator intervention_type_validator_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_type_validator
    ADD CONSTRAINT intervention_type_validator_pk PRIMARY KEY (tenant_id, intervention_type_id);


--
-- Name: intervention_types intervention_types_pkey; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_types
    ADD CONSTRAINT intervention_types_pkey PRIMARY KEY (id);


--
-- Name: intervention_types_translation intervention_types_translation_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_types_translation
    ADD CONSTRAINT intervention_types_translation_pk PRIMARY KEY (id, lang);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (lang);


--
-- Name: migrant_app_config migrant_app_config_pkey; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.migrant_app_config
    ADD CONSTRAINT migrant_app_config_pkey PRIMARY KEY (id);


--
-- Name: picture_hotspot picture_hotspot_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.picture_hotspot
    ADD CONSTRAINT picture_hotspot_pk PRIMARY KEY (id);


--
-- Name: picture_hotspot_translation picture_hotspot_translation_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.picture_hotspot_translation
    ADD CONSTRAINT picture_hotspot_translation_pk PRIMARY KEY (pht_id, lang);


--
-- Name: process process_pkey; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process
    ADD CONSTRAINT process_pkey PRIMARY KEY (id);


--
-- Name: process_topic process_topic_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process_topic
    ADD CONSTRAINT process_topic_pk PRIMARY KEY (id_process, id_topic);


--
-- Name: process_translation process_translation_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process_translation
    ADD CONSTRAINT process_translation_pk PRIMARY KEY (id, lang);


--
-- Name: process_users process_users_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process_users
    ADD CONSTRAINT process_users_pk PRIMARY KEY (id_process, id_user_types);


--
-- Name: settings settings_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.settings
    ADD CONSTRAINT settings_pk PRIMARY KEY (key);


--
-- Name: step_document step_document_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step_document
    ADD CONSTRAINT step_document_pk PRIMARY KEY (id_document, id_step);


--
-- Name: step_link step_link_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step_link
    ADD CONSTRAINT step_link_pk PRIMARY KEY (id);


--
-- Name: step_link_translation step_link_translation_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step_link_translation
    ADD CONSTRAINT step_link_translation_pk PRIMARY KEY (lang, id);


--
-- Name: step step_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step
    ADD CONSTRAINT step_pk PRIMARY KEY (id);


--
-- Name: step_translation step_translation_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step_translation
    ADD CONSTRAINT step_translation_pk PRIMARY KEY (id, lang);


--
-- Name: topic topic_pkey; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.topic
    ADD CONSTRAINT topic_pkey PRIMARY KEY (id);


--
-- Name: topic_translation topic_translation_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.topic_translation
    ADD CONSTRAINT topic_translation_pk PRIMARY KEY (id, lang);


--
-- Name: user_types user_types_pkey; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.user_types
    ADD CONSTRAINT user_types_pkey PRIMARY KEY (id);


--
-- Name: user_types_translation user_types_translation_pk; Type: CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.user_types_translation
    ADD CONSTRAINT user_types_translation_pk PRIMARY KEY (id, lang);


--
-- Name: document document_ask_validate_by_tenant_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document
    ADD CONSTRAINT document_ask_validate_by_tenant_fkey FOREIGN KEY (ask_validate_by_tenant) REFERENCES wso2_shared.um_tenant(um_id);


--
-- Name: document document_document_type_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document
    ADD CONSTRAINT document_document_type_fkey FOREIGN KEY (document_type) REFERENCES micadoapp.document_type(id);


--
-- Name: document_pictures document_pictures_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document_pictures
    ADD CONSTRAINT document_pictures_fk FOREIGN KEY (doc_id) REFERENCES micadoapp.document(id) ON DELETE CASCADE;


--
-- Name: document_type_picture document_type_picture_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document_type_picture
    ADD CONSTRAINT document_type_picture_fk FOREIGN KEY (document_type_id) REFERENCES micadoapp.document_type(id);


--
-- Name: document_type_translation document_type_translation_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document_type_translation
    ADD CONSTRAINT document_type_translation_id_fkey FOREIGN KEY (id) REFERENCES micadoapp.document_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: document_type_translation document_type_translation_lang_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document_type_translation
    ADD CONSTRAINT document_type_translation_lang_fkey FOREIGN KEY (lang) REFERENCES micadoapp.languages(lang) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: document_type_validator document_type_validator_document_type_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document_type_validator
    ADD CONSTRAINT document_type_validator_document_type_id_fkey FOREIGN KEY (document_type_id) REFERENCES micadoapp.document_type(id);


--
-- Name: document_type_validator document_type_validator_validable_by_tenant_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document_type_validator
    ADD CONSTRAINT document_type_validator_validable_by_tenant_fkey FOREIGN KEY (validable_by_tenant) REFERENCES wso2_shared.um_tenant(um_id);


--
-- Name: document document_um_user_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document
    ADD CONSTRAINT document_um_user_id_fkey FOREIGN KEY (user_id, user_tenant) REFERENCES wso2_shared.um_user(um_id, um_tenant_id);


--
-- Name: document document_validated_um_user_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.document
    ADD CONSTRAINT document_validated_um_user_id_fkey FOREIGN KEY (validated_by_user, validated_by_tenant) REFERENCES wso2_shared.um_user(um_id, um_tenant_id);


--
-- Name: event_category_translation event_category_translation_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_category_translation
    ADD CONSTRAINT event_category_translation_id_fkey FOREIGN KEY (id) REFERENCES micadoapp.event_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_category_translation event_category_translation_lang_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_category_translation
    ADD CONSTRAINT event_category_translation_lang_fkey FOREIGN KEY (lang) REFERENCES micadoapp.languages(lang) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_event_category event_event_category_id_event_category_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_event_category
    ADD CONSTRAINT event_event_category_id_event_category_fkey FOREIGN KEY (id_event_category) REFERENCES micadoapp.event_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_event_category event_event_category_id_process_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_event_category
    ADD CONSTRAINT event_event_category_id_process_fkey FOREIGN KEY (id_event) REFERENCES micadoapp.event(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_topic event_topic_id_process_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_topic
    ADD CONSTRAINT event_topic_id_process_fkey FOREIGN KEY (id_event) REFERENCES micadoapp.event(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_topic event_topic_id_topic_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_topic
    ADD CONSTRAINT event_topic_id_topic_fkey FOREIGN KEY (id_topic) REFERENCES micadoapp.topic(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_translation event_translation_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_translation
    ADD CONSTRAINT event_translation_id_fkey FOREIGN KEY (id) REFERENCES micadoapp.event(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_translation event_translation_lang_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.event_translation
    ADD CONSTRAINT event_translation_lang_fkey FOREIGN KEY (lang) REFERENCES micadoapp.languages(lang) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: features_flags_translation features_flags_translation_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.features_flags_translation
    ADD CONSTRAINT features_flags_translation_id_fkey FOREIGN KEY (id) REFERENCES micadoapp.features_flags(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: features_flags_translation features_flags_translation_lang_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.features_flags_translation
    ADD CONSTRAINT features_flags_translation_lang_fkey FOREIGN KEY (lang) REFERENCES micadoapp.languages(lang) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: glossary_translation glossary_translation_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.glossary_translation
    ADD CONSTRAINT glossary_translation_fk FOREIGN KEY (id) REFERENCES micadoapp.glossary(id);


--
-- Name: glossary_translation glossary_translation_fk_1; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.glossary_translation
    ADD CONSTRAINT glossary_translation_fk_1 FOREIGN KEY (lang) REFERENCES micadoapp.languages(lang);


--
-- Name: individual_intervention_plan_interventions individual_intervention_plan_interventions_intervention_type_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.individual_intervention_plan_interventions
    ADD CONSTRAINT individual_intervention_plan_interventions_intervention_type_fk FOREIGN KEY (intervention_type) REFERENCES micadoapp.intervention_types(id);


--
-- Name: individual_intervention_plan_interventions individual_intervention_plan_interventions_list_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.individual_intervention_plan_interventions
    ADD CONSTRAINT individual_intervention_plan_interventions_list_id_fkey FOREIGN KEY (list_id) REFERENCES micadoapp.individual_intervention_plan(id);


--
-- Name: individual_intervention_plan_interventions individual_intervention_plan_interventions_um_user_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.individual_intervention_plan_interventions
    ADD CONSTRAINT individual_intervention_plan_interventions_um_user_id_fkey FOREIGN KEY (validating_user_id, validating_user_tenant) REFERENCES wso2_shared.um_user(um_id, um_tenant_id);


--
-- Name: individual_intervention_plan individual_intervention_plan_um_user_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.individual_intervention_plan
    ADD CONSTRAINT individual_intervention_plan_um_user_id_fkey FOREIGN KEY (user_id, user_tenant) REFERENCES wso2_shared.um_user(um_id, um_tenant_id);


--
-- Name: intervention_category_translation intervention_category_id_translation_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_category_translation
    ADD CONSTRAINT intervention_category_id_translation_fk FOREIGN KEY (id) REFERENCES micadoapp.intervention_category(id);


--
-- Name: intervention_category_translation intervention_category_translation_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_category_translation
    ADD CONSTRAINT intervention_category_translation_fk FOREIGN KEY (lang) REFERENCES micadoapp.languages(lang);


--
-- Name: intervention_processes intervention_processes_intervention_type_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_processes
    ADD CONSTRAINT intervention_processes_intervention_type_fkey FOREIGN KEY (intervention_type) REFERENCES micadoapp.intervention_types(id);


--
-- Name: intervention_processes intervention_processes_process_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_processes
    ADD CONSTRAINT intervention_processes_process_id_fkey FOREIGN KEY (process_id) REFERENCES micadoapp.process(id);


--
-- Name: intervention_type_validator intervention_type_validator_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_type_validator
    ADD CONSTRAINT intervention_type_validator_fk FOREIGN KEY (intervention_type_id) REFERENCES micadoapp.intervention_types(id);


--
-- Name: intervention_types intervention_types_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_types
    ADD CONSTRAINT intervention_types_fk FOREIGN KEY (category_type) REFERENCES micadoapp.intervention_category(id);


--
-- Name: intervention_types_translation intervention_types_translation_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_types_translation
    ADD CONSTRAINT intervention_types_translation_id_fkey FOREIGN KEY (id) REFERENCES micadoapp.intervention_types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: intervention_types_translation intervention_types_translation_lang_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.intervention_types_translation
    ADD CONSTRAINT intervention_types_translation_lang_fkey FOREIGN KEY (lang) REFERENCES micadoapp.languages(lang) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: picture_hotspot picture_hotspot_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.picture_hotspot
    ADD CONSTRAINT picture_hotspot_fk FOREIGN KEY (picture_id) REFERENCES micadoapp.document_type_picture(id);


--
-- Name: picture_hotspot_translation picture_hotspot_translation_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.picture_hotspot_translation
    ADD CONSTRAINT picture_hotspot_translation_fk FOREIGN KEY (pht_id) REFERENCES micadoapp.picture_hotspot(id);


--
-- Name: picture_hotspot_translation picture_hotspot_translation_fk_1; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.picture_hotspot_translation
    ADD CONSTRAINT picture_hotspot_translation_fk_1 FOREIGN KEY (lang) REFERENCES micadoapp.languages(lang) ON DELETE CASCADE;


--
-- Name: process_topic process_topic_id_process_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process_topic
    ADD CONSTRAINT process_topic_id_process_fkey FOREIGN KEY (id_process) REFERENCES micadoapp.process(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: process_topic process_topic_id_topic_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process_topic
    ADD CONSTRAINT process_topic_id_topic_fkey FOREIGN KEY (id_topic) REFERENCES micadoapp.topic(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: process_translation process_translation_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process_translation
    ADD CONSTRAINT process_translation_id_fkey FOREIGN KEY (id) REFERENCES micadoapp.process(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: process_translation process_translation_lang_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process_translation
    ADD CONSTRAINT process_translation_lang_fkey FOREIGN KEY (lang) REFERENCES micadoapp.languages(lang) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: process_users process_users_id_process_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process_users
    ADD CONSTRAINT process_users_id_process_fkey FOREIGN KEY (id_process) REFERENCES micadoapp.process(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: process_users process_users_id_user_types_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.process_users
    ADD CONSTRAINT process_users_id_user_types_fkey FOREIGN KEY (id_user_types) REFERENCES micadoapp.user_types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ratings ratings_um_user_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.ratings
    ADD CONSTRAINT ratings_um_user_id_fkey FOREIGN KEY (user_id, user_tenant) REFERENCES wso2_shared.um_user(um_id, um_tenant_id);


--
-- Name: step_document step_document_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step_document
    ADD CONSTRAINT step_document_fk FOREIGN KEY (id_step) REFERENCES micadoapp.step(id);


--
-- Name: step_document step_document_id_document_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step_document
    ADD CONSTRAINT step_document_id_document_fkey FOREIGN KEY (id_document) REFERENCES micadoapp.document_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: step step_id_process_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step
    ADD CONSTRAINT step_id_process_fkey FOREIGN KEY (id_process) REFERENCES micadoapp.process(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: step_link step_link_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step_link
    ADD CONSTRAINT step_link_fk FOREIGN KEY (id_process) REFERENCES micadoapp.process(id);


--
-- Name: step_link step_link_from_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step_link
    ADD CONSTRAINT step_link_from_fk FOREIGN KEY (from_step) REFERENCES micadoapp.step(id);


--
-- Name: step_link step_link_to_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step_link
    ADD CONSTRAINT step_link_to_fk FOREIGN KEY (to_step) REFERENCES micadoapp.step(id);


--
-- Name: step_link_translation step_link_translation_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step_link_translation
    ADD CONSTRAINT step_link_translation_fk FOREIGN KEY (lang) REFERENCES micadoapp.languages(lang);


--
-- Name: step_link_translation step_link_translation_step_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step_link_translation
    ADD CONSTRAINT step_link_translation_step_fk FOREIGN KEY (id) REFERENCES micadoapp.step_link(id);


--
-- Name: step_translation step_translation_fk; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step_translation
    ADD CONSTRAINT step_translation_fk FOREIGN KEY (id) REFERENCES micadoapp.step(id);


--
-- Name: step_translation step_translation_lang_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.step_translation
    ADD CONSTRAINT step_translation_lang_fkey FOREIGN KEY (lang) REFERENCES micadoapp.languages(lang) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: topic_translation topic_translation_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.topic_translation
    ADD CONSTRAINT topic_translation_id_fkey FOREIGN KEY (id) REFERENCES micadoapp.topic(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: topic_translation topic_translation_lang_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.topic_translation
    ADD CONSTRAINT topic_translation_lang_fkey FOREIGN KEY (lang) REFERENCES micadoapp.languages(lang) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_types_translation user_types_translation_id_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.user_types_translation
    ADD CONSTRAINT user_types_translation_id_fkey FOREIGN KEY (id) REFERENCES micadoapp.user_types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_types_translation user_types_translation_lang_fkey; Type: FK CONSTRAINT; Schema: micadoapp; Owner: -
--

ALTER TABLE ONLY micadoapp.user_types_translation
    ADD CONSTRAINT user_types_translation_lang_fkey FOREIGN KEY (lang) REFERENCES micadoapp.languages(lang) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
