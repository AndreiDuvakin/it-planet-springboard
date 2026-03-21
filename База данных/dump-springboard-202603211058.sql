--
-- PostgreSQL database dump
--

\restrict YkyjCPrWprz8CdW0vO6qGDKcFouiF0aYHa17r9tHVQ4L6ZueLYmBoXlhGP44a2f

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-03-21 10:58:14 +05

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
-- TOC entry 219 (class 1259 OID 20230)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 20526)
-- Name: applicant_contact_recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_contact_recommendations (
    message text NOT NULL,
    recommender_id integer NOT NULL,
    recipient_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.applicant_contact_recommendations OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 20525)
-- Name: applicant_contact_recommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_contact_recommendations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicant_contact_recommendations_id_seq OWNER TO postgres;

--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 254
-- Name: applicant_contact_recommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_contact_recommendations_id_seq OWNED BY public.applicant_contact_recommendations.id;


--
-- TOC entry 221 (class 1259 OID 20237)
-- Name: applicant_contact_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_contact_statuses (
    title character varying(100) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.applicant_contact_statuses OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 20236)
-- Name: applicant_contact_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_contact_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicant_contact_statuses_id_seq OWNER TO postgres;

--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 220
-- Name: applicant_contact_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_contact_statuses_id_seq OWNED BY public.applicant_contact_statuses.id;


--
-- TOC entry 257 (class 1259 OID 20553)
-- Name: applicant_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_contacts (
    sender_id integer NOT NULL,
    receiver_id integer NOT NULL,
    status_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.applicant_contacts OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 20552)
-- Name: applicant_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicant_contacts_id_seq OWNER TO postgres;

--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 256
-- Name: applicant_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_contacts_id_seq OWNED BY public.applicant_contacts.id;


--
-- TOC entry 259 (class 1259 OID 20583)
-- Name: applicant_educations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_educations (
    start_education_year integer NOT NULL,
    end_education_year integer,
    specialization character varying(300) NOT NULL,
    is_in_the_learning boolean NOT NULL,
    applicant_id integer NOT NULL,
    university_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.applicant_educations OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 20582)
-- Name: applicant_educations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_educations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicant_educations_id_seq OWNER TO postgres;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 258
-- Name: applicant_educations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_educations_id_seq OWNED BY public.applicant_educations.id;


--
-- TOC entry 261 (class 1259 OID 20610)
-- Name: applicant_experiences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_experiences (
    company_name character varying(250) NOT NULL,
    description text,
    start_date date NOT NULL,
    end_date date,
    applicant_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.applicant_experiences OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 20609)
-- Name: applicant_experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_experiences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicant_experiences_id_seq OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 260
-- Name: applicant_experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_experiences_id_seq OWNED BY public.applicant_experiences.id;


--
-- TOC entry 263 (class 1259 OID 20632)
-- Name: applicant_favorite_companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_favorite_companies (
    applicant_id integer NOT NULL,
    company_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.applicant_favorite_companies OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 20631)
-- Name: applicant_favorite_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_favorite_companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicant_favorite_companies_id_seq OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 262
-- Name: applicant_favorite_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_favorite_companies_id_seq OWNED BY public.applicant_favorite_companies.id;


--
-- TOC entry 251 (class 1259 OID 20463)
-- Name: applicant_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_profiles (
    resume_html text,
    resume_url character varying(500),
    university_id integer,
    user_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.applicant_profiles OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 20462)
-- Name: applicant_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicant_profiles_id_seq OWNER TO postgres;

--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 250
-- Name: applicant_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_profiles_id_seq OWNED BY public.applicant_profiles.id;


--
-- TOC entry 265 (class 1259 OID 20656)
-- Name: applicant_resume_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_resume_files (
    title character varying(250) NOT NULL,
    applicant_id integer NOT NULL,
    filename character varying NOT NULL,
    file_path character varying NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.applicant_resume_files OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 20655)
-- Name: applicant_resume_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_resume_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicant_resume_files_id_seq OWNER TO postgres;

--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 264
-- Name: applicant_resume_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_resume_files_id_seq OWNED BY public.applicant_resume_files.id;


--
-- TOC entry 267 (class 1259 OID 20679)
-- Name: applicant_resume_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_resume_links (
    title character varying(250) NOT NULL,
    link character varying(500) NOT NULL,
    applicant_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.applicant_resume_links OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 20678)
-- Name: applicant_resume_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_resume_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicant_resume_links_id_seq OWNER TO postgres;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 266
-- Name: applicant_resume_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_resume_links_id_seq OWNED BY public.applicant_resume_links.id;


--
-- TOC entry 269 (class 1259 OID 20701)
-- Name: applicant_resume_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_resume_projects (
    title character varying(250) NOT NULL,
    description text,
    link character varying(500),
    repository_url character varying(500),
    applicant_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.applicant_resume_projects OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 20700)
-- Name: applicant_resume_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_resume_projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicant_resume_projects_id_seq OWNER TO postgres;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 268
-- Name: applicant_resume_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_resume_projects_id_seq OWNED BY public.applicant_resume_projects.id;


--
-- TOC entry 223 (class 1259 OID 20250)
-- Name: applicant_skill_tag_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_skill_tag_categories (
    title character varying(150) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.applicant_skill_tag_categories OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 20249)
-- Name: applicant_skill_tag_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_skill_tag_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicant_skill_tag_categories_id_seq OWNER TO postgres;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 222
-- Name: applicant_skill_tag_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_skill_tag_categories_id_seq OWNED BY public.applicant_skill_tag_categories.id;


--
-- TOC entry 247 (class 1259 OID 20415)
-- Name: applicant_skill_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_skill_tags (
    title character varying(150) NOT NULL,
    category_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.applicant_skill_tags OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 20414)
-- Name: applicant_skill_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_skill_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicant_skill_tags_id_seq OWNER TO postgres;

--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 246
-- Name: applicant_skill_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_skill_tags_id_seq OWNED BY public.applicant_skill_tags.id;


--
-- TOC entry 271 (class 1259 OID 20722)
-- Name: applicant_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_skills (
    level character varying(50) NOT NULL,
    tag_id integer NOT NULL,
    applicant_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.applicant_skills OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 20721)
-- Name: applicant_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicant_skills_id_seq OWNER TO postgres;

--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 270
-- Name: applicant_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_skills_id_seq OWNED BY public.applicant_skills.id;


--
-- TOC entry 273 (class 1259 OID 20747)
-- Name: career_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.career_events (
    title character varying(250) NOT NULL,
    description text,
    media_url character varying(500),
    address character varying(500),
    published_at timestamp without time zone NOT NULL,
    is_active boolean NOT NULL,
    moderation_comment text,
    event_date timestamp without time zone NOT NULL,
    registration_link character varying(500),
    is_online boolean NOT NULL,
    event_type_id integer NOT NULL,
    company_id integer NOT NULL,
    moderation_status_id integer NOT NULL,
    location_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.career_events OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 20746)
-- Name: career_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.career_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.career_events_id_seq OWNER TO postgres;

--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 272
-- Name: career_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.career_events_id_seq OWNED BY public.career_events.id;


--
-- TOC entry 225 (class 1259 OID 20263)
-- Name: company_profile_logos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_profile_logos (
    filename character varying(250) NOT NULL,
    path character varying(500) NOT NULL,
    url character varying(500),
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.company_profile_logos OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 20262)
-- Name: company_profile_logos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_profile_logos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.company_profile_logos_id_seq OWNER TO postgres;

--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 224
-- Name: company_profile_logos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_profile_logos_id_seq OWNED BY public.company_profile_logos.id;


--
-- TOC entry 227 (class 1259 OID 20279)
-- Name: company_profile_photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_profile_photos (
    filename character varying(250) NOT NULL,
    path character varying(500) NOT NULL,
    url character varying(500),
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.company_profile_photos OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 20278)
-- Name: company_profile_photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_profile_photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.company_profile_photos_id_seq OWNER TO postgres;

--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 226
-- Name: company_profile_photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_profile_photos_id_seq OWNED BY public.company_profile_photos.id;


--
-- TOC entry 275 (class 1259 OID 20790)
-- Name: company_profile_socials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_profile_socials (
    title character varying(100) NOT NULL,
    link character varying(500) NOT NULL,
    company_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.company_profile_socials OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 20789)
-- Name: company_profile_socials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_profile_socials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.company_profile_socials_id_seq OWNER TO postgres;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 274
-- Name: company_profile_socials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_profile_socials_id_seq OWNED BY public.company_profile_socials.id;


--
-- TOC entry 253 (class 1259 OID 20488)
-- Name: company_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_profiles (
    title character varying(250) NOT NULL,
    description text,
    website_url character varying(500),
    inn character varying(50),
    corporate_email character varying(250),
    video_url character varying(500),
    is_verified boolean NOT NULL,
    logo_id integer,
    official_photo_id integer,
    creator_user_id integer NOT NULL,
    industry_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.company_profiles OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 20487)
-- Name: company_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.company_profiles_id_seq OWNER TO postgres;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 252
-- Name: company_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_profiles_id_seq OWNED BY public.company_profiles.id;


--
-- TOC entry 229 (class 1259 OID 20295)
-- Name: employment_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employment_types (
    title character varying(100) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.employment_types OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 20294)
-- Name: employment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employment_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employment_types_id_seq OWNER TO postgres;

--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 228
-- Name: employment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employment_types_id_seq OWNED BY public.employment_types.id;


--
-- TOC entry 231 (class 1259 OID 20308)
-- Name: event_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_types (
    title character varying(100) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.event_types OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 20307)
-- Name: event_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_types_id_seq OWNER TO postgres;

--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 230
-- Name: event_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_types_id_seq OWNED BY public.event_types.id;


--
-- TOC entry 233 (class 1259 OID 20321)
-- Name: experience_levels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experience_levels (
    title character varying(100) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.experience_levels OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 20320)
-- Name: experience_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.experience_levels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.experience_levels_id_seq OWNER TO postgres;

--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 232
-- Name: experience_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.experience_levels_id_seq OWNED BY public.experience_levels.id;


--
-- TOC entry 235 (class 1259 OID 20334)
-- Name: industries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.industries (
    title character varying(150) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.industries OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 20333)
-- Name: industries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.industries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.industries_id_seq OWNER TO postgres;

--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 234
-- Name: industries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.industries_id_seq OWNED BY public.industries.id;


--
-- TOC entry 277 (class 1259 OID 20812)
-- Name: internships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.internships (
    title character varying(250) NOT NULL,
    description text,
    media_url character varying(500),
    address character varying(500),
    published_at timestamp without time zone NOT NULL,
    is_active boolean NOT NULL,
    moderation_comment text,
    duration_months integer NOT NULL,
    is_paid boolean NOT NULL,
    mentorship_available boolean NOT NULL,
    expires_at timestamp without time zone,
    company_id integer NOT NULL,
    moderation_status_id integer NOT NULL,
    experience_level_id integer NOT NULL,
    work_format_id integer NOT NULL,
    location_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.internships OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 20811)
-- Name: internships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.internships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.internships_id_seq OWNER TO postgres;

--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 276
-- Name: internships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.internships_id_seq OWNED BY public.internships.id;


--
-- TOC entry 237 (class 1259 OID 20347)
-- Name: location_coordinates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location_coordinates (
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.location_coordinates OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 20346)
-- Name: location_coordinates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_coordinates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.location_coordinates_id_seq OWNER TO postgres;

--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 236
-- Name: location_coordinates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_coordinates_id_seq OWNED BY public.location_coordinates.id;


--
-- TOC entry 279 (class 1259 OID 20862)
-- Name: mentorship_programs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mentorship_programs (
    title character varying(250) NOT NULL,
    description text,
    media_url character varying(500),
    address character varying(500),
    published_at timestamp without time zone NOT NULL,
    is_active boolean NOT NULL,
    moderation_comment text,
    mentor_name character varying(250),
    focus_area character varying(250),
    selection_criteria text,
    company_id integer NOT NULL,
    moderation_status_id integer NOT NULL,
    location_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.mentorship_programs OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 20861)
-- Name: mentorship_programs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mentorship_programs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mentorship_programs_id_seq OWNER TO postgres;

--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 278
-- Name: mentorship_programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mentorship_programs_id_seq OWNED BY public.mentorship_programs.id;


--
-- TOC entry 239 (class 1259 OID 20361)
-- Name: moderation_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moderation_statuses (
    title character varying(100) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.moderation_statuses OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 20360)
-- Name: moderation_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moderation_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moderation_statuses_id_seq OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 238
-- Name: moderation_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moderation_statuses_id_seq OWNED BY public.moderation_statuses.id;


--
-- TOC entry 241 (class 1259 OID 20374)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    title character varying(150) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 20373)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 240
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 243 (class 1259 OID 20389)
-- Name: universities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.universities (
    title character varying(300) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.universities OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 20388)
-- Name: universities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.universities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.universities_id_seq OWNER TO postgres;

--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 242
-- Name: universities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.universities_id_seq OWNED BY public.universities.id;


--
-- TOC entry 249 (class 1259 OID 20434)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    first_name character varying(250) NOT NULL,
    last_name character varying(250) NOT NULL,
    patronymic character varying(250),
    birthdate date NOT NULL,
    login character varying(250) NOT NULL,
    email character varying(250),
    password_hash character varying NOT NULL,
    role_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    is_activated boolean NOT NULL,
    is_admin boolean NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 20433)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 248
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 281 (class 1259 OID 20897)
-- Name: vacancies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacancies (
    title character varying(250) NOT NULL,
    description text,
    media_url character varying(500),
    address character varying(500),
    published_at timestamp without time zone NOT NULL,
    is_active boolean NOT NULL,
    moderation_comment text,
    expires_at timestamp without time zone,
    salary_min integer,
    salary_max integer,
    company_id integer NOT NULL,
    work_format_id integer NOT NULL,
    employment_type_id integer NOT NULL,
    experience_level_id integer NOT NULL,
    moderation_status_id integer NOT NULL,
    location_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.vacancies OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 20896)
-- Name: vacancies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vacancies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vacancies_id_seq OWNER TO postgres;

--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 280
-- Name: vacancies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vacancies_id_seq OWNED BY public.vacancies.id;


--
-- TOC entry 285 (class 1259 OID 20969)
-- Name: vacancy_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacancy_applications (
    cover_letter text,
    employer_note text,
    vacancy_id integer NOT NULL,
    applicant_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.vacancy_applications OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 20968)
-- Name: vacancy_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vacancy_applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vacancy_applications_id_seq OWNER TO postgres;

--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 284
-- Name: vacancy_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vacancy_applications_id_seq OWNED BY public.vacancy_applications.id;


--
-- TOC entry 283 (class 1259 OID 20950)
-- Name: verification_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verification_requests (
    is_accepted boolean NOT NULL,
    company_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.verification_requests OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 20949)
-- Name: verification_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.verification_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.verification_requests_id_seq OWNER TO postgres;

--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 282
-- Name: verification_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.verification_requests_id_seq OWNED BY public.verification_requests.id;


--
-- TOC entry 245 (class 1259 OID 20402)
-- Name: work_formats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_formats (
    title character varying(100) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.work_formats OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 20401)
-- Name: work_formats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.work_formats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.work_formats_id_seq OWNER TO postgres;

--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 244
-- Name: work_formats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.work_formats_id_seq OWNED BY public.work_formats.id;


--
-- TOC entry 4529 (class 2604 OID 20529)
-- Name: applicant_contact_recommendations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_contact_recommendations ALTER COLUMN id SET DEFAULT nextval('public.applicant_contact_recommendations_id_seq'::regclass);


--
-- TOC entry 4478 (class 2604 OID 20240)
-- Name: applicant_contact_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_contact_statuses ALTER COLUMN id SET DEFAULT nextval('public.applicant_contact_statuses_id_seq'::regclass);


--
-- TOC entry 4532 (class 2604 OID 20556)
-- Name: applicant_contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_contacts ALTER COLUMN id SET DEFAULT nextval('public.applicant_contacts_id_seq'::regclass);


--
-- TOC entry 4535 (class 2604 OID 20586)
-- Name: applicant_educations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_educations ALTER COLUMN id SET DEFAULT nextval('public.applicant_educations_id_seq'::regclass);


--
-- TOC entry 4538 (class 2604 OID 20613)
-- Name: applicant_experiences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_experiences ALTER COLUMN id SET DEFAULT nextval('public.applicant_experiences_id_seq'::regclass);


--
-- TOC entry 4541 (class 2604 OID 20635)
-- Name: applicant_favorite_companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_favorite_companies ALTER COLUMN id SET DEFAULT nextval('public.applicant_favorite_companies_id_seq'::regclass);


--
-- TOC entry 4523 (class 2604 OID 20466)
-- Name: applicant_profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_profiles ALTER COLUMN id SET DEFAULT nextval('public.applicant_profiles_id_seq'::regclass);


--
-- TOC entry 4544 (class 2604 OID 20659)
-- Name: applicant_resume_files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_resume_files ALTER COLUMN id SET DEFAULT nextval('public.applicant_resume_files_id_seq'::regclass);


--
-- TOC entry 4547 (class 2604 OID 20682)
-- Name: applicant_resume_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_resume_links ALTER COLUMN id SET DEFAULT nextval('public.applicant_resume_links_id_seq'::regclass);


--
-- TOC entry 4550 (class 2604 OID 20704)
-- Name: applicant_resume_projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_resume_projects ALTER COLUMN id SET DEFAULT nextval('public.applicant_resume_projects_id_seq'::regclass);


--
-- TOC entry 4481 (class 2604 OID 20253)
-- Name: applicant_skill_tag_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_skill_tag_categories ALTER COLUMN id SET DEFAULT nextval('public.applicant_skill_tag_categories_id_seq'::regclass);


--
-- TOC entry 4517 (class 2604 OID 20418)
-- Name: applicant_skill_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_skill_tags ALTER COLUMN id SET DEFAULT nextval('public.applicant_skill_tags_id_seq'::regclass);


--
-- TOC entry 4553 (class 2604 OID 20725)
-- Name: applicant_skills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_skills ALTER COLUMN id SET DEFAULT nextval('public.applicant_skills_id_seq'::regclass);


--
-- TOC entry 4556 (class 2604 OID 20750)
-- Name: career_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_events ALTER COLUMN id SET DEFAULT nextval('public.career_events_id_seq'::regclass);


--
-- TOC entry 4484 (class 2604 OID 20266)
-- Name: company_profile_logos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profile_logos ALTER COLUMN id SET DEFAULT nextval('public.company_profile_logos_id_seq'::regclass);


--
-- TOC entry 4487 (class 2604 OID 20282)
-- Name: company_profile_photos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profile_photos ALTER COLUMN id SET DEFAULT nextval('public.company_profile_photos_id_seq'::regclass);


--
-- TOC entry 4559 (class 2604 OID 20793)
-- Name: company_profile_socials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profile_socials ALTER COLUMN id SET DEFAULT nextval('public.company_profile_socials_id_seq'::regclass);


--
-- TOC entry 4526 (class 2604 OID 20491)
-- Name: company_profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profiles ALTER COLUMN id SET DEFAULT nextval('public.company_profiles_id_seq'::regclass);


--
-- TOC entry 4490 (class 2604 OID 20298)
-- Name: employment_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employment_types ALTER COLUMN id SET DEFAULT nextval('public.employment_types_id_seq'::regclass);


--
-- TOC entry 4493 (class 2604 OID 20311)
-- Name: event_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_types ALTER COLUMN id SET DEFAULT nextval('public.event_types_id_seq'::regclass);


--
-- TOC entry 4496 (class 2604 OID 20324)
-- Name: experience_levels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experience_levels ALTER COLUMN id SET DEFAULT nextval('public.experience_levels_id_seq'::regclass);


--
-- TOC entry 4499 (class 2604 OID 20337)
-- Name: industries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries ALTER COLUMN id SET DEFAULT nextval('public.industries_id_seq'::regclass);


--
-- TOC entry 4562 (class 2604 OID 20815)
-- Name: internships id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internships ALTER COLUMN id SET DEFAULT nextval('public.internships_id_seq'::regclass);


--
-- TOC entry 4502 (class 2604 OID 20350)
-- Name: location_coordinates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_coordinates ALTER COLUMN id SET DEFAULT nextval('public.location_coordinates_id_seq'::regclass);


--
-- TOC entry 4565 (class 2604 OID 20865)
-- Name: mentorship_programs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentorship_programs ALTER COLUMN id SET DEFAULT nextval('public.mentorship_programs_id_seq'::regclass);


--
-- TOC entry 4505 (class 2604 OID 20364)
-- Name: moderation_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderation_statuses ALTER COLUMN id SET DEFAULT nextval('public.moderation_statuses_id_seq'::regclass);


--
-- TOC entry 4508 (class 2604 OID 20377)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4511 (class 2604 OID 20392)
-- Name: universities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities ALTER COLUMN id SET DEFAULT nextval('public.universities_id_seq'::regclass);


--
-- TOC entry 4520 (class 2604 OID 20437)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4568 (class 2604 OID 20900)
-- Name: vacancies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies ALTER COLUMN id SET DEFAULT nextval('public.vacancies_id_seq'::regclass);


--
-- TOC entry 4574 (class 2604 OID 20972)
-- Name: vacancy_applications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancy_applications ALTER COLUMN id SET DEFAULT nextval('public.vacancy_applications_id_seq'::regclass);


--
-- TOC entry 4571 (class 2604 OID 20953)
-- Name: verification_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_requests ALTER COLUMN id SET DEFAULT nextval('public.verification_requests_id_seq'::regclass);


--
-- TOC entry 4514 (class 2604 OID 20405)
-- Name: work_formats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_formats ALTER COLUMN id SET DEFAULT nextval('public.work_formats_id_seq'::regclass);


--
-- TOC entry 4843 (class 0 OID 20230)
-- Dependencies: 219
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
720b875eee30
\.


--
-- TOC entry 4879 (class 0 OID 20526)
-- Dependencies: 255
-- Data for Name: applicant_contact_recommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_contact_recommendations (message, recommender_id, recipient_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4845 (class 0 OID 20237)
-- Dependencies: 221
-- Data for Name: applicant_contact_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_contact_statuses (title, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4881 (class 0 OID 20553)
-- Dependencies: 257
-- Data for Name: applicant_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_contacts (sender_id, receiver_id, status_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4883 (class 0 OID 20583)
-- Dependencies: 259
-- Data for Name: applicant_educations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_educations (start_education_year, end_education_year, specialization, is_in_the_learning, applicant_id, university_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4885 (class 0 OID 20610)
-- Dependencies: 261
-- Data for Name: applicant_experiences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_experiences (company_name, description, start_date, end_date, applicant_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4887 (class 0 OID 20632)
-- Dependencies: 263
-- Data for Name: applicant_favorite_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_favorite_companies (applicant_id, company_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4875 (class 0 OID 20463)
-- Dependencies: 251
-- Data for Name: applicant_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_profiles (resume_html, resume_url, university_id, user_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4889 (class 0 OID 20656)
-- Dependencies: 265
-- Data for Name: applicant_resume_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_resume_files (title, applicant_id, filename, file_path, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4891 (class 0 OID 20679)
-- Dependencies: 267
-- Data for Name: applicant_resume_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_resume_links (title, link, applicant_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4893 (class 0 OID 20701)
-- Dependencies: 269
-- Data for Name: applicant_resume_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_resume_projects (title, description, link, repository_url, applicant_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4847 (class 0 OID 20250)
-- Dependencies: 223
-- Data for Name: applicant_skill_tag_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_skill_tag_categories (title, id, created_at, updated_at) FROM stdin;
Programming Languages	1	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Backend Development	2	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Frontend Development	3	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Mobile Development	4	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Desktop Development	5	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Game Development	6	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Databases & Storage	7	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Data Engineering	8	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Data Analysis & BI	9	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Data Science & ML	10	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
DevOps & SRE	11	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Cloud Platforms	12	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Containerization & Orchestration	13	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Testing & QA	14	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Information Security	15	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Networks & Infrastructure	16	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Operating Systems & Admin	17	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Architecture & Design	18	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Project & Product Management	19	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Business Analysis	20	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
UI/UX & Product Design	21	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Embedded & IoT	22	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
ERP/CRM & Enterprise Systems	23	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
RPA & No-Code Platforms	24	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Analytics & Marketing Tech	25	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Documentation & Technical Writing	26	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Soft Skills & Communication	27	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Methodologies & Processes	28	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
Data Governance & Compliance	29	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
AI Infrastructure & MLOps	30	2026-03-21 09:14:52.652889	2026-03-21 09:14:52.652889
\.


--
-- TOC entry 4871 (class 0 OID 20415)
-- Dependencies: 247
-- Data for Name: applicant_skill_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_skill_tags (title, category_id, id, created_at, updated_at) FROM stdin;
C	1	1	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
C++	1	2	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
C#	1	3	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Java	1	4	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Kotlin	1	5	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Scala	1	6	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Groovy	1	7	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
JavaScript	1	8	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
TypeScript	1	9	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Python	1	10	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Ruby	1	11	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
PHP	1	12	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Go	1	13	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Rust	1	14	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Swift	1	15	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Objective-C	1	16	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Dart	1	17	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
R	1	18	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
MATLAB	1	19	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Julia	1	20	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
SQL	1	21	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
PL/SQL	1	22	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
T-SQL	1	23	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Shell scripting (Bash)	1	24	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
PowerShell	1	25	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Lua	1	26	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Haskell	1	27	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Elixir	1	28	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Erlang	1	29	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
F#	1	30	2026-03-21 09:14:52.66279	2026-03-21 09:14:52.66279
Разработка REST API	2	31	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
GraphQL API	2	32	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
gRPC	2	33	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Микросервисная архитектура	2	34	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Монолитная архитектура	2	35	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Domain-Driven Design (DDD)	2	36	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Clean Architecture	2	37	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Event-driven архитектура	2	38	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Работа с брокерами сообщений	2	39	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Apache Kafka	2	40	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
RabbitMQ	2	41	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
NATS	2	42	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Redis как кэш	2	43	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
In-memory кэширование	2	44	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Проектирование версионирования API	2	45	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Аутентификация и авторизация	2	46	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
OAuth 2.0	2	47	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
OpenID Connect	2	48	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
JWT	2	49	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Управление сессиями	2	50	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Rate limiting	2	51	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Throttling	2	52	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Обработка загрузки файлов	2	53	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Фоновые задачи и workers	2	54	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
WebSockets	2	55	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
Server-side rendering (SSR) концепции	2	56	2026-03-21 09:14:52.672273	2026-03-21 09:14:52.672273
HTML5	3	57	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
CSS3	3	58	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Адаптивная верстка	3	59	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
CSS Flexbox	3	60	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
CSS Grid	3	61	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
SASS / SCSS	3	62	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Less	3	63	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
JavaScript (ES6+)	3	64	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
TypeScript во frontend	3	65	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
React	3	66	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
React Hooks	3	67	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Next.js	3	68	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Redux	3	69	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
MobX	3	70	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Vue.js	3	71	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Nuxt.js	3	72	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Angular	3	73	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
RxJS	3	74	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Svelte	3	75	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Web Components	3	76	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
LitElement	3	77	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Webpack	3	78	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Vite	3	79	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Babel	3	80	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
npm / yarn / pnpm	3	81	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
SPA разработка	3	82	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
PWA разработка	3	83	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Использование DevTools браузера	3	84	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Кросс-браузерная совместимость	3	85	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Web Accessibility (a11y)	3	86	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
UI-библиотеки компонентов	3	87	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Внедрение дизайн-систем	3	88	2026-03-21 09:14:52.681972	2026-03-21 09:14:52.681972
Android SDK	4	89	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
Kotlin для Android	4	90	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
Java для Android	4	91	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
Jetpack Compose	4	92	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
iOS SDK	4	93	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
Swift для iOS	4	94	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
Objective-C для iOS	4	95	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
React Native	4	96	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
Flutter	4	97	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
Xamarin	4	98	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
.NET MAUI (Mobile)	4	99	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
Мобильный UI/UX гайдлайны	4	100	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
Push-уведомления	4	101	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
In-App Purchases	4	102	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
Публикация в App Store	4	103	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
Публикация в Google Play	4	104	2026-03-21 09:14:52.68865	2026-03-21 09:14:52.68865
WPF	5	105	2026-03-21 09:14:52.694947	2026-03-21 09:14:52.694947
WinForms	5	106	2026-03-21 09:14:52.694947	2026-03-21 09:14:52.694947
UWP	5	107	2026-03-21 09:14:52.694947	2026-03-21 09:14:52.694947
.NET MAUI (Desktop)	5	108	2026-03-21 09:14:52.694947	2026-03-21 09:14:52.694947
Electron	5	109	2026-03-21 09:14:52.694947	2026-03-21 09:14:52.694947
Qt	5	110	2026-03-21 09:14:52.694947	2026-03-21 09:14:52.694947
GTK	5	111	2026-03-21 09:14:52.694947	2026-03-21 09:14:52.694947
JavaFX	5	112	2026-03-21 09:14:52.694947	2026-03-21 09:14:52.694947
Swing	5	113	2026-03-21 09:14:52.694947	2026-03-21 09:14:52.694947
Кросс-платформенная разработка desktop-приложений	5	114	2026-03-21 09:14:52.694947	2026-03-21 09:14:52.694947
Unity	6	115	2026-03-21 09:14:52.701028	2026-03-21 09:14:52.701028
Unreal Engine	6	116	2026-03-21 09:14:52.701028	2026-03-21 09:14:52.701028
C# для Unity	6	117	2026-03-21 09:14:52.701028	2026-03-21 09:14:52.701028
C++ для Unreal	6	118	2026-03-21 09:14:52.701028	2026-03-21 09:14:52.701028
Игровая физика (базовый уровень)	6	119	2026-03-21 09:14:52.701028	2026-03-21 09:14:52.701028
3D математика для игр	6	120	2026-03-21 09:14:52.701028	2026-03-21 09:14:52.701028
Разработка шейдеров (HLSL/GLSL)	6	121	2026-03-21 09:14:52.701028	2026-03-21 09:14:52.701028
Сетевой геймплей (базовый уровень)	6	122	2026-03-21 09:14:52.701028	2026-03-21 09:14:52.701028
Разработка мобильных игр	6	123	2026-03-21 09:14:52.701028	2026-03-21 09:14:52.701028
Реляционные БД (общие знания)	7	124	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
PostgreSQL	7	125	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
MySQL	7	126	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
MariaDB	7	127	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
Microsoft SQL Server	7	128	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
Oracle Database	7	129	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
SQLite	7	130	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
NoSQL БД (общие знания)	7	131	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
MongoDB	7	132	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
Cassandra	7	133	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
CouchDB	7	134	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
Redis как key-value хранилище	7	135	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
DynamoDB	7	136	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
Time-series БД (общие знания)	7	137	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
InfluxDB	7	138	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
Elasticsearch	7	139	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
OLTP концепции	7	140	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
OLAP концепции	7	141	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
Индексирование и оптимизация запросов	7	142	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
Нормализация данных	7	143	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
Транзакции и уровни изоляции	7	144	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
Репликация БД	7	145	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
Шардинг	7	146	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
Бэкапы и восстановление БД	7	147	2026-03-21 09:14:52.708266	2026-03-21 09:14:52.708266
Проектирование ETL/ELT	8	148	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Data Warehousing	8	149	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Data Lake концепции	8	150	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Пакетная обработка данных	8	151	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Потоковая обработка данных	8	152	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Apache Spark	8	153	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Apache Flink	8	154	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Apache Beam	8	155	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Apache Airflow	8	156	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
dbt (Data Build Tool)	8	157	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Kafka Streams	8	158	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Моделирование данных (Dimensional modeling)	8	159	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Star schema	8	160	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Snowflake schema	8	161	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Контроль качества данных (Data Quality)	8	162	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Отслеживание происхождения данных (Data Lineage)	8	163	2026-03-21 09:14:52.71473	2026-03-21 09:14:52.71473
Exploratory Data Analysis (EDA)	9	164	2026-03-21 09:14:52.72071	2026-03-21 09:14:52.72071
Описательная статистика	9	165	2026-03-21 09:14:52.72071	2026-03-21 09:14:52.72071
A/B-тестирование (базовый уровень)	9	166	2026-03-21 09:14:52.72071	2026-03-21 09:14:52.72071
Проверка гипотез	9	167	2026-03-21 09:14:52.72071	2026-03-21 09:14:52.72071
SQL для аналитики	9	168	2026-03-21 09:14:52.72071	2026-03-21 09:14:52.72071
Продвинутый Excel	9	169	2026-03-21 09:14:52.72071	2026-03-21 09:14:52.72071
Продвинутый Google Sheets	9	170	2026-03-21 09:14:52.72071	2026-03-21 09:14:52.72071
Power BI	9	171	2026-03-21 09:14:52.72071	2026-03-21 09:14:52.72071
Tableau	9	172	2026-03-21 09:14:52.72071	2026-03-21 09:14:52.72071
Looker Studio	9	173	2026-03-21 09:14:52.72071	2026-03-21 09:14:52.72071
Metabase	9	174	2026-03-21 09:14:52.72071	2026-03-21 09:14:52.72071
Принципы визуализации данных	9	175	2026-03-21 09:14:52.72071	2026-03-21 09:14:52.72071
Проектирование дашбордов	9	176	2026-03-21 09:14:52.72071	2026-03-21 09:14:52.72071
Supervised learning	10	177	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
Unsupervised learning	10	178	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
Feature engineering	10	179	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
Оценка моделей и метрики	10	180	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
Переобучение и регуляризация	10	181	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
scikit-learn	10	182	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
pandas	10	183	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
NumPy	10	184	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
Matplotlib	10	185	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
Seaborn	10	186	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
TensorFlow	10	187	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
Keras	10	188	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
PyTorch	10	189	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
NLP (базовый уровень)	10	190	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
Компьютерное зрение (базовый уровень)	10	191	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
Рекомендательные системы (базовый уровень)	10	192	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
Прогнозирование временных рядов (базовый уровень)	10	193	2026-03-21 09:14:52.727313	2026-03-21 09:14:52.727313
Концепции CI/CD	11	194	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Jenkins	11	195	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
GitLab CI/CD	11	196	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
GitHub Actions	11	197	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
CircleCI	11	198	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Azure DevOps Pipelines	11	199	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Infrastructure as Code (общие знания)	11	200	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Terraform	11	201	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Ansible	11	202	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Chef	11	203	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Puppet	11	204	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Configuration management (общие знания)	11	205	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Мониторинг и наблюдаемость	11	206	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Prometheus	11	207	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Grafana	11	208	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
ELK / EFK стек	11	209	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Практики логирования	11	210	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Incident management	11	211	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
On-call практики	11	212	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
SLI/SLO/SLA	11	213	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Оптимизация производительности систем	11	214	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Резервное копирование и DR	11	215	2026-03-21 09:14:52.735609	2026-03-21 09:14:52.735609
Основы cloud computing	12	216	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
AWS (общие знания)	12	217	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
AWS EC2	12	218	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
AWS S3	12	219	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
AWS RDS	12	220	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
AWS Lambda	12	221	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
AWS IAM	12	222	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
AWS VPC	12	223	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
Azure (общие знания)	12	224	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
Azure App Service	12	225	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
Azure Functions	12	226	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
Azure SQL	12	227	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
Azure Active Directory	12	228	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
GCP (общие знания)	12	229	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
Google Compute Engine (GCE)	12	230	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
Google Cloud Storage (GCS)	12	231	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
Cloud Run	12	232	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
BigQuery	12	233	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
Cloud IAM	12	234	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
Оптимизация расходов в облаке (базовый уровень)	12	235	2026-03-21 09:14:52.743599	2026-03-21 09:14:52.743599
Docker	13	236	2026-03-21 09:14:52.75016	2026-03-21 09:14:52.75016
Docker Compose	13	237	2026-03-21 09:14:52.75016	2026-03-21 09:14:52.75016
Работа с container registry	13	238	2026-03-21 09:14:52.75016	2026-03-21 09:14:52.75016
Kubernetes (базовый уровень)	13	239	2026-03-21 09:14:52.75016	2026-03-21 09:14:52.75016
Helm	13	240	2026-03-21 09:14:52.75016	2026-03-21 09:14:52.75016
Kustomize	13	241	2026-03-21 09:14:52.75016	2026-03-21 09:14:52.75016
Kubernetes networking (базовый уровень)	13	242	2026-03-21 09:14:52.75016	2026-03-21 09:14:52.75016
Kubernetes storage (базовый уровень)	13	243	2026-03-21 09:14:52.75016	2026-03-21 09:14:52.75016
Service mesh (Istio/Linkerd) (базовый уровень)	13	244	2026-03-21 09:14:52.75016	2026-03-21 09:14:52.75016
Основы тестирования ПО	14	245	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Модульное тестирование	14	246	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Интеграционное тестирование	14	247	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Функциональное тестирование	14	248	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Регрессионное тестирование	14	249	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Нагрузочное тестирование	14	250	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Performance-тестирование	14	251	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
API-тестирование	14	252	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
UI-тестирование	14	253	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Фреймворки автоматизации тестирования (общие знания)	14	254	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Selenium	14	255	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Cypress	14	256	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Playwright	14	257	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Postman	14	258	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
JMeter	14	259	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Тестовая документация	14	260	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Проектирование тест-кейсов	14	261	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Системы отслеживания багов (Jira и др.)	14	262	2026-03-21 09:14:52.756634	2026-03-21 09:14:52.756634
Основы информационной безопасности	15	263	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
Secure coding практики	15	264	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
OWASP Top Ten	15	265	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
Безопасность веб-приложений	15	266	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
Основы сетевой безопасности	15	267	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
Identity & Access Management	15	268	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
Security monitoring	15	269	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
SIEM (базовый уровень)	15	270	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
Vulnerability assessment	15	271	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
Penetration testing (базовый уровень)	15	272	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
Threat modeling	15	273	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
Incident response (базовый уровень)	15	274	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
Security compliance (GDPR, HIPAA) (базовый уровень)	15	275	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
Шифрование данных (базовый уровень)	15	276	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
Управление ключами (базовый уровень)	15	277	2026-03-21 09:14:52.762657	2026-03-21 09:14:52.762657
TCP/IP основы	16	278	2026-03-21 09:14:52.768703	2026-03-21 09:14:52.768703
Модель OSI	16	279	2026-03-21 09:14:52.768703	2026-03-21 09:14:52.768703
DNS	16	280	2026-03-21 09:14:52.768703	2026-03-21 09:14:52.768703
HTTP/HTTPS	16	281	2026-03-21 09:14:52.768703	2026-03-21 09:14:52.768703
VPN концепции	16	282	2026-03-21 09:14:52.768703	2026-03-21 09:14:52.768703
Основы работы firewall	16	283	2026-03-21 09:14:52.768703	2026-03-21 09:14:52.768703
Load balancing	16	284	2026-03-21 09:14:52.768703	2026-03-21 09:14:52.768703
Proxy / Reverse proxy	16	285	2026-03-21 09:14:52.768703	2026-03-21 09:14:52.768703
CDN (базовый уровень)	16	286	2026-03-21 09:14:52.768703	2026-03-21 09:14:52.768703
Диагностика сетевых проблем	16	287	2026-03-21 09:14:52.768703	2026-03-21 09:14:52.768703
Linux basics	17	288	2026-03-21 09:14:52.774408	2026-03-21 09:14:52.774408
Администрирование Linux	17	289	2026-03-21 09:14:52.774408	2026-03-21 09:14:52.774408
Bash-скриптинг	17	290	2026-03-21 09:14:52.774408	2026-03-21 09:14:52.774408
systemd и сервисы	17	291	2026-03-21 09:14:52.774408	2026-03-21 09:14:52.774408
Пакетные менеджеры (apt/yum/dnf)	17	292	2026-03-21 09:14:52.774408	2026-03-21 09:14:52.774408
Управление файловой системой	17	293	2026-03-21 09:14:52.774408	2026-03-21 09:14:52.774408
Управление пользователями и группами	17	294	2026-03-21 09:14:52.774408	2026-03-21 09:14:52.774408
Права доступа и ACL	17	295	2026-03-21 09:14:52.774408	2026-03-21 09:14:52.774408
Настройка SSH	17	296	2026-03-21 09:14:52.774408	2026-03-21 09:14:52.774408
Администрирование Windows (базовый уровень)	17	297	2026-03-21 09:14:52.774408	2026-03-21 09:14:52.774408
PowerShell-скриптинг	17	298	2026-03-21 09:14:52.774408	2026-03-21 09:14:52.774408
Основы Active Directory	17	299	2026-03-21 09:14:52.774408	2026-03-21 09:14:52.774408
Основы архитектуры ПО	18	300	2026-03-21 09:14:52.780419	2026-03-21 09:14:52.780419
Паттерны проектирования	18	301	2026-03-21 09:14:52.780419	2026-03-21 09:14:52.780419
Принципы SOLID	18	302	2026-03-21 09:14:52.780419	2026-03-21 09:14:52.780419
High-level system design	18	303	2026-03-21 09:14:52.780419	2026-03-21 09:14:52.780419
Масштабируемость систем	18	304	2026-03-21 09:14:52.780419	2026-03-21 09:14:52.780419
Высокая доступность (High Availability)	18	305	2026-03-21 09:14:52.780419	2026-03-21 09:14:52.780419
Отказоустойчивость (Fault tolerance)	18	306	2026-03-21 09:14:52.780419	2026-03-21 09:14:52.780419
Принципы проектирования API	18	307	2026-03-21 09:14:52.780419	2026-03-21 09:14:52.780419
Event Sourcing (базовый уровень)	18	308	2026-03-21 09:14:52.780419	2026-03-21 09:14:52.780419
CQRS (базовый уровень)	18	309	2026-03-21 09:14:52.780419	2026-03-21 09:14:52.780419
Основы управления проектами	19	310	2026-03-21 09:14:52.786137	2026-03-21 09:14:52.786137
Основы продуктового менеджмента	19	311	2026-03-21 09:14:52.786137	2026-03-21 09:14:52.786137
Roadmapping	19	312	2026-03-21 09:14:52.786137	2026-03-21 09:14:52.786137
Управление стейкхолдерами	19	313	2026-03-21 09:14:52.786137	2026-03-21 09:14:52.786137
Приоритизация требований	19	314	2026-03-21 09:14:52.786137	2026-03-21 09:14:52.786137
Управление рисками (базовый уровень)	19	315	2026-03-21 09:14:52.786137	2026-03-21 09:14:52.786137
Оценка трудозатрат	19	316	2026-03-21 09:14:52.786137	2026-03-21 09:14:52.786137
KPI и метрики продукта	19	317	2026-03-21 09:14:52.786137	2026-03-21 09:14:52.786137
Сбор и формализация требований	20	318	2026-03-21 09:14:52.791806	2026-03-21 09:14:52.791806
Моделирование use-case	20	319	2026-03-21 09:14:52.791806	2026-03-21 09:14:52.791806
BPMN (базовый уровень)	20	320	2026-03-21 09:14:52.791806	2026-03-21 09:14:52.791806
User stories и acceptance criteria	20	321	2026-03-21 09:14:52.791806	2026-03-21 09:14:52.791806
Моделирование бизнес-процессов	20	322	2026-03-21 09:14:52.791806	2026-03-21 09:14:52.791806
Gap-анализ	20	323	2026-03-21 09:14:52.791806	2026-03-21 09:14:52.791806
UX research (базовый уровень)	21	324	2026-03-21 09:14:52.797232	2026-03-21 09:14:52.797232
Проведение пользовательских интервью	21	325	2026-03-21 09:14:52.797232	2026-03-21 09:14:52.797232
Wireframing	21	326	2026-03-21 09:14:52.797232	2026-03-21 09:14:52.797232
Прототипирование интерфейсов	21	327	2026-03-21 09:14:52.797232	2026-03-21 09:14:52.797232
Информационная архитектура (базовый уровень)	21	328	2026-03-21 09:14:52.797232	2026-03-21 09:14:52.797232
Interaction design (базовый уровень)	21	329	2026-03-21 09:14:52.797232	2026-03-21 09:14:52.797232
Figma	21	330	2026-03-21 09:14:52.797232	2026-03-21 09:14:52.797232
Sketch	21	331	2026-03-21 09:14:52.797232	2026-03-21 09:14:52.797232
Adobe XD	21	332	2026-03-21 09:14:52.797232	2026-03-21 09:14:52.797232
Usability-тестирование (базовый уровень)	21	333	2026-03-21 09:14:52.797232	2026-03-21 09:14:52.797232
Основы встроенных систем (Embedded)	22	334	2026-03-21 09:14:52.814896	2026-03-21 09:14:52.814896
Микроконтроллеры (общие знания)	22	335	2026-03-21 09:14:52.814896	2026-03-21 09:14:52.814896
C для Embedded	22	336	2026-03-21 09:14:52.814896	2026-03-21 09:14:52.814896
Основы RTOS	22	337	2026-03-21 09:14:52.814896	2026-03-21 09:14:52.814896
Протоколы IoT (MQTT, CoAP)	22	338	2026-03-21 09:14:52.814896	2026-03-21 09:14:52.814896
Edge computing (базовый уровень)	22	339	2026-03-21 09:14:52.814896	2026-03-21 09:14:52.814896
SAP (базовый уровень)	23	340	2026-03-21 09:14:52.819889	2026-03-21 09:14:52.819889
1С:Предприятие (базовый уровень)	23	341	2026-03-21 09:14:52.819889	2026-03-21 09:14:52.819889
Salesforce (базовый уровень)	23	342	2026-03-21 09:14:52.819889	2026-03-21 09:14:52.819889
Microsoft Dynamics 365 (базовый уровень)	23	343	2026-03-21 09:14:52.819889	2026-03-21 09:14:52.819889
CRM концепции	23	344	2026-03-21 09:14:52.819889	2026-03-21 09:14:52.819889
ERP концепции	23	345	2026-03-21 09:14:52.819889	2026-03-21 09:14:52.819889
RPA (базовые знания)	24	346	2026-03-21 09:14:52.824933	2026-03-21 09:14:52.824933
UiPath (базовый уровень)	24	347	2026-03-21 09:14:52.824933	2026-03-21 09:14:52.824933
Automation Anywhere (базовый уровень)	24	348	2026-03-21 09:14:52.824933	2026-03-21 09:14:52.824933
No-code платформы (общие знания)	24	349	2026-03-21 09:14:52.824933	2026-03-21 09:14:52.824933
Zapier / Make.com (базовый уровень)	24	350	2026-03-21 09:14:52.824933	2026-03-21 09:14:52.824933
Веб-аналитика (базовый уровень)	25	351	2026-03-21 09:14:52.830017	2026-03-21 09:14:52.830017
Google Analytics (базовый уровень)	25	352	2026-03-21 09:14:52.830017	2026-03-21 09:14:52.830017
Tag management (базовый уровень)	25	353	2026-03-21 09:14:52.830017	2026-03-21 09:14:52.830017
Инструменты A/B-тестирования (базовый уровень)	25	354	2026-03-21 09:14:52.830017	2026-03-21 09:14:52.830017
Маркетинговая автоматизация (базовый уровень)	25	355	2026-03-21 09:14:52.830017	2026-03-21 09:14:52.830017
Техническая документация	26	356	2026-03-21 09:14:52.834924	2026-03-21 09:14:52.834924
Документирование API	26	357	2026-03-21 09:14:52.834924	2026-03-21 09:14:52.834924
Пользовательские инструкции	26	358	2026-03-21 09:14:52.834924	2026-03-21 09:14:52.834924
Release notes	26	359	2026-03-21 09:14:52.834924	2026-03-21 09:14:52.834924
Markdown	26	360	2026-03-21 09:14:52.834924	2026-03-21 09:14:52.834924
Письменная коммуникация	27	361	2026-03-21 09:14:52.840053	2026-03-21 09:14:52.840053
Устная коммуникация	27	362	2026-03-21 09:14:52.840053	2026-03-21 09:14:52.840053
Навыки презентации	27	363	2026-03-21 09:14:52.840053	2026-03-21 09:14:52.840053
Командная работа	27	364	2026-03-21 09:14:52.840053	2026-03-21 09:14:52.840053
Разрешение конфликтов	27	365	2026-03-21 09:14:52.840053	2026-03-21 09:14:52.840053
Тайм-менеджмент	27	366	2026-03-21 09:14:52.840053	2026-03-21 09:14:52.840053
Менторство и коучинг	27	367	2026-03-21 09:14:52.840053	2026-03-21 09:14:52.840053
Базовые лидерские навыки	27	368	2026-03-21 09:14:52.840053	2026-03-21 09:14:52.840053
Коммуникация со стейкхолдерами	27	369	2026-03-21 09:14:52.840053	2026-03-21 09:14:52.840053
Agile (базовые знания)	28	370	2026-03-21 09:14:52.844458	2026-03-21 09:14:52.844458
Scrum	28	371	2026-03-21 09:14:52.844458	2026-03-21 09:14:52.844458
Kanban	28	372	2026-03-21 09:14:52.844458	2026-03-21 09:14:52.844458
Lean принципы	28	373	2026-03-21 09:14:52.844458	2026-03-21 09:14:52.844458
DevOps culture	28	374	2026-03-21 09:14:52.844458	2026-03-21 09:14:52.844458
ITIL (базовый уровень)	28	375	2026-03-21 09:14:52.844458	2026-03-21 09:14:52.844458
Модели SDLC	28	376	2026-03-21 09:14:52.844458	2026-03-21 09:14:52.844458
Практики code review	28	377	2026-03-21 09:14:52.844458	2026-03-21 09:14:52.844458
Data governance (базовые знания)	29	378	2026-03-21 09:14:52.848984	2026-03-21 09:14:52.848984
Data privacy (базовые знания)	29	379	2026-03-21 09:14:52.848984	2026-03-21 09:14:52.848984
GDPR (базовый уровень)	29	380	2026-03-21 09:14:52.848984	2026-03-21 09:14:52.848984
Политики управления доступом	29	381	2026-03-21 09:14:52.848984	2026-03-21 09:14:52.848984
Аудит и логирование (базовый уровень)	29	382	2026-03-21 09:14:52.848984	2026-03-21 09:14:52.848984
MLOps (базовый уровень)	30	383	2026-03-21 09:14:52.853681	2026-03-21 09:14:52.853681
Деплой моделей (model serving) (базовый уровень)	30	384	2026-03-21 09:14:52.853681	2026-03-21 09:14:52.853681
Мониторинг моделей (базовый уровень)	30	385	2026-03-21 09:14:52.853681	2026-03-21 09:14:52.853681
Feature store (базовый уровень)	30	386	2026-03-21 09:14:52.853681	2026-03-21 09:14:52.853681
Data pipeline для ML (базовый уровень)	30	387	2026-03-21 09:14:52.853681	2026-03-21 09:14:52.853681
\.


--
-- TOC entry 4895 (class 0 OID 20722)
-- Dependencies: 271
-- Data for Name: applicant_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_skills (level, tag_id, applicant_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4897 (class 0 OID 20747)
-- Dependencies: 273
-- Data for Name: career_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.career_events (title, description, media_url, address, published_at, is_active, moderation_comment, event_date, registration_link, is_online, event_type_id, company_id, moderation_status_id, location_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4849 (class 0 OID 20263)
-- Dependencies: 225
-- Data for Name: company_profile_logos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_profile_logos (filename, path, url, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4851 (class 0 OID 20279)
-- Dependencies: 227
-- Data for Name: company_profile_photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_profile_photos (filename, path, url, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4899 (class 0 OID 20790)
-- Dependencies: 275
-- Data for Name: company_profile_socials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_profile_socials (title, link, company_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4877 (class 0 OID 20488)
-- Dependencies: 253
-- Data for Name: company_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_profiles (title, description, website_url, inn, corporate_email, video_url, is_verified, logo_id, official_photo_id, creator_user_id, industry_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4853 (class 0 OID 20295)
-- Dependencies: 229
-- Data for Name: employment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employment_types (title, id, created_at, updated_at) FROM stdin;
Полная занятость	1	2026-03-21 09:26:29.797597	2026-03-21 09:26:29.797597
Частичная занятость	2	2026-03-21 09:26:29.807328	2026-03-21 09:26:29.807328
Проектная работа	3	2026-03-21 09:26:29.811742	2026-03-21 09:26:29.811742
\.


--
-- TOC entry 4855 (class 0 OID 20308)
-- Dependencies: 231
-- Data for Name: event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_types (title, id, created_at, updated_at) FROM stdin;
День открытых дверей	1	2026-03-21 09:23:47.393187	2026-03-21 09:23:47.393187
Хакатон	2	2026-03-21 09:23:47.408859	2026-03-21 09:23:47.408859
Лекция от компании	3	2026-03-21 09:23:47.413684	2026-03-21 09:23:47.413684
\.


--
-- TOC entry 4857 (class 0 OID 20321)
-- Dependencies: 233
-- Data for Name: experience_levels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experience_levels (title, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4859 (class 0 OID 20334)
-- Dependencies: 235
-- Data for Name: industries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.industries (title, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4901 (class 0 OID 20812)
-- Dependencies: 277
-- Data for Name: internships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.internships (title, description, media_url, address, published_at, is_active, moderation_comment, duration_months, is_paid, mentorship_available, expires_at, company_id, moderation_status_id, experience_level_id, work_format_id, location_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4861 (class 0 OID 20347)
-- Dependencies: 237
-- Data for Name: location_coordinates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location_coordinates (latitude, longitude, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4903 (class 0 OID 20862)
-- Dependencies: 279
-- Data for Name: mentorship_programs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mentorship_programs (title, description, media_url, address, published_at, is_active, moderation_comment, mentor_name, focus_area, selection_criteria, company_id, moderation_status_id, location_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4863 (class 0 OID 20361)
-- Dependencies: 239
-- Data for Name: moderation_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moderation_statuses (title, id, created_at, updated_at) FROM stdin;
in progress	1	2026-03-21 10:27:42.221095	2026-03-21 10:27:42.221095
approved	2	2026-03-21 10:27:42.245088	2026-03-21 10:27:42.245088
rejected	3	2026-03-21 10:27:42.250882	2026-03-21 10:27:42.250882
\.


--
-- TOC entry 4865 (class 0 OID 20374)
-- Dependencies: 241
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (title, id, created_at, updated_at) FROM stdin;
employer	1	2026-03-21 09:02:14.776602	2026-03-21 09:02:14.776602
applicant	2	2026-03-21 09:02:14.785173	2026-03-21 09:02:14.785173
moderator	3	2026-03-21 09:02:14.78981	2026-03-21 09:02:14.78981
\.


--
-- TOC entry 4867 (class 0 OID 20389)
-- Dependencies: 243
-- Data for Name: universities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.universities (title, id, created_at, updated_at) FROM stdin;
Абаканский филиал заочного обучения Сибирского юридического института Министерства внутренних дел Российской Федерации	1	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Абаканский филиал Современной гуманитарной академии	2	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Агинский филиал Бурятского государственного университета	3	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Агинский филиал Бурятской государственной сельскохозяйственной академии	4	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Агинский филиал Восточно-Сибирского государственного технологического университета	5	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Агинский филиал Забайкальского государственного гуманитарно-педагогического университета им. Н.Г. Чернышевского	6	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Агинский филиал Современной гуманитарной академии	7	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Адыгейский государственный университет	8	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Адыгейский филиал Кубанского государственного медицинского университета Федерального агентства по здравоохранению и социальному развитию в г. Майкопе	9	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Адыгейский филиал Московского открытого социального университета (института)	10	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Адыгейский филиал Северо-Кавказской академии государственной службы в г. Майкопе	11	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Адыгейский филиал Южно-Российского государственного технического университета (Новочеркасского политехнического института)	12	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Азово-Черноморская государственная агроинженерная академия	13	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Азовский институт экономики	14	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Азовский технологический институт (филиал) Донского государственного технического университета	15	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Азовский филиал Евразийского открытого института	16	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академический институт прикладной энергетики	17	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академический правовой университет (институт)	18	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академический физико-технологический университет Российской академии наук	19	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия адвокатуры	20	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия акмеологии менеджмента и бизнес-образования	21	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия безопасности и права	22	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия бизнеса и предпринимательства	23	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия бюджета и казначейства Министерства финансов Российской Федерации	24	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия Государственной противопожарной службы Министерства Российской Федерации по делам гражданской обороны	25	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия гражданской защиты Министерства Российской Федерации по делам гражданской обороны	26	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия Гуманитарного Образования (институт)	27	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия Континент (институт)	28	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия маркетинга и социально-информационных технологий - ИМСИТ (г. Краснодар)	29	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия медико-социального управления	30	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия международного учета	31	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия менеджмента инноваций (АМИ) (институт)	32	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия народного хозяйства при Правительстве Российской Федерации	33	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия национального образования	34	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия национальной безопасности	35	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия права и управления (институт)	36	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия права и управления Федеральной службы исполнения наказаний	37	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия профессионального мастерства искусств	38	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия Русского балета имени А.Я. Вагановой	39	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия социального образования (КСЮИ)	40	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия социального управления	41	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия стран Тихоокеанского региона	42	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия труда и социальных отношений	43	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия управления Министерства внутренних дел Российской Федерации	44	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия управления ТИСБИ	45	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия управления	46	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия Федеральной службы безопасности Российской Федерации	47	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия Федеральной службы охраны Российской Федерации	48	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия хорового искусства	49	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия эвритмического искусства (институт)	50	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Академия экономической безопасности Министерства внутренних дел Российской Федерации	51	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Акбулакский филиал Оренбургского государственного университета	52	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алатырский филиал Чувашского государственного университета им. И.Н.Ульянова	53	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Александровский филиал Российского нового университета	54	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Александровский филиал Современной гуманитарной академии	55	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Александровск-Сахалинский колледж (филиал) Сахалинского государственного университета	56	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алексеевский филиал Белгородского государственного университета	57	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алматинский филиал Академии труда и социальных отношений	58	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алматинский филиал Санкт-Петербургского Гуманитарного университета профсоюзов	59	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайская академия экономики и права (институт)	60	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайская государственная академия культуры и искусств	61	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайский государственный аграрный университет	62	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайский государственный медицинский университет Федерального агентства по здравоохранению и социальному развитию	63	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайский государственный технический университет им. И.И. Ползунова	64	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайский государственный университет	65	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайский институт труда и права (филиал) Академии труда и социальных отношений	66	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайский институт финансового управления	67	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайский институт экономики - филиал Санкт-Петербургской академии управления и экономики	68	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайский филиал (г. Барнаул) Московского психолого-социального института	69	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайский филиал Академии национальной безопасности	70	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайский филиал Московского государственного университета культуры и искусств	71	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайский филиал Российской международной академии туризма	72	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайский филиал Сибирской академии государственной службы в г. Барнауле	73	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Алтайский экономико-юридический институт	74	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Альметьевский государственный институт муниципальной службы	75	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Альметьевский государственный нефтяной институт	76	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Альметьевский филиал Академии управления ТИСБИ	77	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Альметьевский филиал Восточного института экономики	78	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Альметьевский филиал Института экономики	79	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Альметьевский филиал Казанского государственного технического университета им. А.Н. Туполева	80	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Амурская государственная медицинская академия Министерства здравоохранения Российской Федерации	81	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Амурский государственный университет	82	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Амурский гумнитарно-педагогический государственный университет	83	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Амурский институт железнодорожного транспорта - филиал Дальневосточного государственного университета путей сообщения в г. Свободном	84	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Амурский филиал Морского государственного университета имени адмирала Г.И. Невельского	85	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Анапский филиал Кубанского государственного аграрного университета	86	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Анапский филиал Южного института менеджмента	87	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ангарская государственная техническая академия	88	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ангарский филиал Сибирского института права	89	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ангарский филиал Современной гуманитарной академии	90	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Апатитский филиал Мурманского государственного технического университета	91	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Арзамасский государственный педагогический институт им. А.П. Гайдара	92	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Арзамасский политехнический институт (филиал) Нижегородского государственного технического университета	93	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Арзамасский филиал Волго-Вятской академии государственной службы	94	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Арзамасский филиал Нижегородского государственного университета им. Н.И. Лобачевского	95	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт рынка недвижимости	796	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Арзамасский филиал Российского государственного аграрного заочного университета (не лицензирован)	96	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Арзамасский филиал Российского университета кооперации	97	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Арзамасский филиал Современной гуманитарной академии	98	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Арктический государственный институт культуры и искусств Республики Саха (Якутия)	99	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Армавирский государственный педагогический университет	100	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Армавирский институт социального образования (филиал) Российского государственного социального университета в г. Армавире Краснодарского края	101	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Армавирский лингвистический университет (институт)	102	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Армавирский механико-технологический институт (филиал) Кубанского государственного технологического университета	103	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Армавирский православно-социальный институт	104	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Армавирский социально-психологический институт	105	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Армавирский филиал Академии права и управления (институт)	106	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Армавирский филиал Краснодарского университета Министерства внутренних дел Российской Федерации	107	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Армавирский филиал Современной гуманитарной академии	108	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Армянский институт туризма - филиал Российской международной академии туризма	109	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Арсеньевский технологический институт (филиал) Дальневосточного государственного технического университета (ДВПИ имени В.В. Куйбышева)	110	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Архангельский государственный технический университет	111	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Архангельский колледж телекоммуникаций (филиал) Санкт-Петербургского государственного университета телекоммуникаций им. проф. М.А. Бонч-Бруевича	112	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Архангельский филиал Государственной морской академии имени адмирала С.О. Макарова	113	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Архангельский филиал Современной гуманитарной академии	114	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Арчединский филиал Воронежской государственной лесотехнической академии (находится в стадии ликвидации	115	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Асинский филиал Томского государственного архитектурно-строительного университета	116	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханская государственная консерватория (институт)	117	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	118	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский (г. Астрахань) филиал Международного юридического института при Министерстве юстиции Российской Федерации	119	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский государственный технический университет	120	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский государственный университет	121	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский инженерно-строительный институт	122	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский институт бизнеса и управления	123	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский филиал Волгоградской академии государственной службы	124	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский филиал Волжской государственной академии водного транспорта	125	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский филиал Московского государственного университета экономики	126	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский филиал Московского открытого социального университета (института)	127	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский филиал Российской международной академии туризма	128	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский филиал Саратовского государственного аграрного университета имени Н.И. Вавилова	129	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский филиал Саратовского государственного социально-экономического университета	130	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский филиал Современной гуманитарной академии	131	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский филиал Университета Российской академии образования	132	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Астраханский филиал Южно-Российского гуманитарного института	133	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ахтубинский филиал Волгоградского государственного университета	134	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ачинский филиал Красноярского государственного аграрного университета	135	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ачинский филиал Современной гуманитарной академии	136	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бурятский филиал Академии труда и социальных отношений	266	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Багаевский филиал Южно-Российского государственного технического университета (Новочеркасского политехнического института) (НЕ ЛИЦЕНЗИРОВАН - письмо из ВУЗа ? 28-01784 от 8.09.05)	137	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Байкало-Амурский институт железнодорожного транспорта - филиал Дальневосточного государственного университета путей сообщения в г. Тынде	138	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Байкальский государственный университет экономики и права	139	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Байкальский гуманитарный институт	140	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Байкальский филиал Гуманитарного института (г. Москва)	141	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Байкальский экономико-правовой институт	142	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бакинский филиал Академии труда и социальных отношений	143	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бакинский филиал Московского государственного открытого университета	144	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бакинский филиал Южно-Российского гуманитарного института	145	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балаковский институт Бизнеса и Управления	146	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балаковский институт техники	147	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балаковский институт экономики и бизнеса (филиал) Саратовского государственного социально-экономического университета	148	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балаковский филиал Саратовской государственной академии права	149	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балаковский филиал Современной гуманитарной академии	150	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балашовский филиал Саратовского государственного аграрного университета имени Н.И. Вавилова	151	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балашовский филиал Саратовского государственного социально-экономического университета	152	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балашовский филиал Саратовского государственного университета имени Н.Г. Чернышевского	153	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балашовский филиал Современной гуманитарной академии	154	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балтийская академия технологии	155	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балтийская академия туризма и предпринимательства	156	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балтийская государственная академия рыбопромыслового флота	157	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балтийский военно-морской институт имени адмирала Ф.Ф. Ушакова	158	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балтийский государственный технический университет ВОЕНМЕХ им. Д.Ф. Устинова	159	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балтийский Гуманитарный Институт	160	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балтийский институт иностранных языков и межкультурного сотрудничества	161	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балтийский институт экологии	162	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балтийский институт экономики и финансов	163	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Балтийский филиал Санкт-Петербургского государственного университета водных коммуникаций	164	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Барнаульский государственный педагогический университет	165	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Барнаульский филиал Московской академии предпринимательства при Правительстве г. Москвы	166	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Барнаульский филиал Современной гуманитарной академии	167	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Барнаульский юридический институт Министерства внутренних дел Российской Федерации	168	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Барышский колледж - филиал Ульяновского государственного технического университета	169	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Батыревский филиал Чувашского государственного университета им. И.Н. Ульянова	170	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Башантинский аграрный колледж им. Ф.Г. Попова (филиал) Калмыцкого государственного университета	171	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Башкирская академия государственной службы и управления при Президенте Республики Башкортостан	172	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Башкирский государственный аграрный университет	173	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Башкирский государственный медицинский университет Федерального агентства по здравоохранению и социальному развитию	174	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Башкирский государственный педагогический университет им. М. Акмуллы	175	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Башкирский государственный университет	176	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Башкирский институт социальных технологий (филиал) Академии труда и социальных отношений	177	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Башкирский институт физической культуры (филиал) Уральского государственного университета физической культуры	178	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Башкирский кооперативный институт (филиал) Российского университета кооперации	179	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Государственный институт русского языка имени А.С. Пушкина	492	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Башкирский филиал Сибирской государственной автомобильно-дорожной академии (СибАДИ)	180	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородская государственная сельскохозяйственная академия	181	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородский государственный институт культуры и искусств	182	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородский государственный технологический университет им. В.Г. Шухова	183	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородский государственный университет	184	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородский инженерно-экономический институт	185	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородский институт государственного и муниципального управления (филиал) Орловской региональной академии государственной службы	186	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородский институт предпринимательства и культуры	187	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородский институт экономики и права	188	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородский университет потребительской кооперации	189	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородский филиал Международного славянского института	190	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородский филиал Московского государственного университета экономики	191	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородский филиал Московской финансово-юридической академии	192	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородский филиал Российского государственного открытого технического университета путей сообщения	193	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородский филиал Современной гуманитарной академии	194	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белгородский юридический институт Министерства внутренних дел Российской Федерации	195	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Беловский институт (филиал) Кемеровского государственного университета	196	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Беловский филиал Томского политехнического университета	197	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Беломорский филиал Петрозаводского государственного университета	198	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белорусская государственная сельскохозяйственная академия	199	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Белорусско-Российский университет	200	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бендерский политехнический филиал Приднестровского государственного университета им. Т.Г. Шевченко	201	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бердский филиал Новосибирского государственного технического университета	202	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Березниковский филиал Пермского государственного технического университета	203	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Березниковский филиал Пермского государственного университета	204	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Библейско-богословский институт святого апостола Андрея	205	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бийский педагогический государственный университет имени В.М. Шукшина	206	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бийский технологический институт (филиал) Алтайского государственного технического университета им. И.И. Ползунова	207	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бийский филиал Алтайского государственного университета	208	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бийский филиал Московского открытого социального университета (института)	209	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бийский филиал Современной гуманитарной академии	210	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Биробиджанский филиал Амурского государственного университета	211	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Биробиджанский филиал Дальневосточного государственного аграрного университета	212	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Биробиджанский филиал Современной гуманитарной академии	213	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Биробиджанский филиал Хабаровской государственной академии экономики и права	214	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бирская государственная социально-педагогическая академия	215	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бирский филиал Уфимской государственной академии экономики и сервиса	216	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бишкекский филиал Международного славянского института	217	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бишкекский филиал Московского института предпринимательства и права	218	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бишкекский филиал Российского государственного торгово-экономического университета	219	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Благовещенский государственный педагогический университет	220	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Благовещенский филиал заочного обучения Дальневосточного юридического института МВД России	221	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Благовещенский филиал Московской академии предпринимательства при Правительстве г. Москвы	222	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Благовещенский филиал Современной гуманитарной академии	223	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт рыночной инфраструктуры	797	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Благовещенский филиал Хабаровской государственной академии экономики и права	224	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Благовещенский финансово-экономический колледж - филиал Финансовой академии при Правительстве Российской Федерации	225	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Богословский аграрный колледж - филиал Российского университета дружбы народов	226	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бокситогорский институт (филиал) Ленинградского государственного университета имени А.С. Пушкина	227	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Большекаменский институт экономики и технологий (филиал) Дальневосточного государственного технического университета (ДВПИ имени В.В. Куйбышева)	228	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Борисоглебский государственный педагогический институт	229	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Борисоглебский филиал Института менеджмента	230	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Боровичский филиал Новгородского государственного университета имени Ярослава Мудрого	231	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Борский филиал Нижегородского государственного университета им. Н.И. Лобачевского	232	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Боханский филиал Бурятского государственного университета	233	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Братский государственный университет	234	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Братский филиал Московской академии экономики и права (находится в стадии ликвидации)	235	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Братский филиал Новосибирского гуманитарного института	236	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бронницкий филиал Московского автомобильно-дорожного института (государственного технического университета)	237	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брюховецкий филиал Кубанского государственного аграрного университета	238	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянская государственная инженерно-технологическая академия	239	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянская государственная сельскохозяйственная академия	240	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянский государственный технический университет	241	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянский государственный университет имени академика И.Г. Петровского	242	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянский филиал Академии права и управления (института)	243	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянский филиал Международного славянского института	244	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянский филиал Международной академии бизнеса и управления	245	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянский филиал Московского института рекламы	246	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянский филиал Московского психолого-социального института	247	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянский филиал Московского университета Министерства внутренних дел Российской Федерации	248	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянский филиал Российского государственного открытого технического университета путей сообщения	249	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянский филиал Российского государственного торгово-экономического университета	250	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянский филиал Российского университета кооперации	251	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянский филиал Санкт-Петербургского государственного университета физической культуры имени П.Ф. Лесгафта	252	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Брянский филиал Современной гуманитарной академии	253	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бугульминский филиал Института экономики	254	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бугульминский филиал Казанского государственного технического университета им. А.Н. Туполева	255	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бугульминский филиал Казанского государственного технологического университета	256	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бугурусланский филиал Оренбургского государственного университета	257	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бугурусланский филиал Санкт-Петербургского государственного университета гражданской авиации	258	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Буденновский филиал Института Дружбы народов Кавказа	259	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Буденновский филиал Северо-Западного государственного заочного технического университета (не лицензирован)	260	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бузулукский гуманитарно-технологический институт (филиал) Оренбургского государственного университета	261	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бузулукский финансово-экономический колледж - филиал Финансовой академии при Правительстве Российской Федерации	262	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Буинский филиал Академии социального образования (КСЮИ)	263	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бурятская государственная сельскохозяйственная академия имени В.Р. Филиппова	264	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бурятский государственный университет	265	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бурятский филиал Института государственного администрирования в г. Улан-Удэ	267	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бурятский филиал Новосибирского государственного технического университета	268	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бурятский филиал Сибирского государственного университета телекоммуникаций и информатики в городе Улан-Удэ	269	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бурятский филиал Сибирского университета потребительской кооперации	270	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бурятский филиал Томского государственного университета	271	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Бутурлиновский филиал Воронежского государственного университета (окончен срок действия лицензии)	272	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Быковский филиал Современной гуманитарной академии	273	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Варненский филиал Южно-Уральского профессионального института	274	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Великолукская государственная академия физической культуры и спорта	275	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Великолукская государственная сельскохозяйственная академия	276	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Великолукский филиал Петербургского государственного университета путей сообщения	277	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Великолукский филиал Санкт-Петербургского государственного университета сервиса и экономики	278	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Великолукский филиал Северо-Западного государственного заочного технического университета	279	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Великолукский филиал Современной гуманитарной академии	280	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вельский филиал Архангельского государственного технического университета (не лицензирован)	281	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вельский филиал Современной гуманитарной академии	282	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Венгерский филиал Московского государственного университета культуры и искусств в г. Будапеште (Венгерская Республика) (НЕ ЛИЦЕНЗИРОВАН - письмо ?01-68-1141 из ВУЗа от 07.03.06)	283	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Верхневолжский институт бизнеса и права	284	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Верхнемамоновский филиал Воронежского государственного университета	285	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вешенский филиал Таганрогского государственного педагогического института	286	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вичугский текстильный техникум (филиал) Ивановской государственной текстильной академии	287	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владивостокский государственный медицинский университет Федерального агентства по здравоохранению и социальному развитию	288	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владивостокский государственный университет экономики и сервиса	289	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владивостокский филиал Дальневосточного юридического института Министерства внутренних дел Российской Федерации	290	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владивостокский филиал Российской таможенной академии	291	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владивостокский филиал Санкт-Петербургского Гуманитарного университета профсоюзов	292	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владивостокский филиал Современной гуманитарной академии	293	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владикавказский институт моды	294	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владикавказский институт управления	295	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владикавказский институт экономики	296	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владикавказский филиал Современной гуманитарной академии	297	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владимирский государственный педагогический университет	298	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владимирский государственный университет	299	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владимирский институт бизнеса	300	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владимирский институт финансов и менеджмента (ликвидирован	301	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владимирский институт экономики	302	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владимирский филиал Московской финансово-юридической академии	303	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владимирский филиал Нижегородского государственного лингвистического университета им. Н.А. Добролюбова	304	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владимирский филиал Российского университета кооперации	305	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владимирский филиал Российской академии государственной службы при Президенте Российской Федерации	306	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владимирский филиал Российской международной академии туризма	307	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владимирский филиал Современной гуманитарной академии	308	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Владимирский юридический институт Федеральной службы исполнения наказаний	309	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный государственный гуманитарный университет	538	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военная академия воздушно-космической обороны имени Маршала Советского Союза Г.К. Жукова (г. Тверь)	310	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военная академия войсковой противовоздушной обороны Вооруженных Сил Российской Федерации	311	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военная академия Генерального штаба Вооруженных сил Российской Федерации	312	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военная академия радиационной	313	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военная академия Ракетных войск стратегического назначения имени Петра Великого	314	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военная академия связи имени С.М. Буденного	315	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военная академия тыла и транспорта имени генерала армии А.В. Хрулева	316	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военно-ветеринарный институт	317	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военно-воздушная академия имени Ю.А. Гагарина	318	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военно-воздушная инженерная академия имени профессора Н.Е. Жуковского	319	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военно-дипломатическая академия	320	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военно-космическая академия имени А.Ф. Можайского	321	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военно-медицинская академия им. С.М. Кирова	322	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военно-медицинский институт Федеральной службы безопасности Российской Федерации (г. Нижний Новгород)	323	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военно-морская академия имени Адмирала Флота Советского Союза Н.Г. Кузнецова	324	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военно-морской инженерный институт	325	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военно-морской институт радиоэлектроники	326	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военно-технический университет при Федеральном агентстве специального строительства	327	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военно-транспортный университет железнодорожных войск Российской Федерации	328	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военный инженерно-технический университет	329	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военный институт физической культуры	330	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Военный университет	331	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вознесенский филиал Кубанского государственного аграрного университета	332	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волго-Вятская академия государственной службы	333	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волго-Вятский филиал Московского технического университета связи и информатики	334	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградская академия государственной службы	335	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградская академия Министерства внутренних дел Российской Федерации	336	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградская государственная академия физической культуры	337	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградская государственная сельскохозяйственная академия	338	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский государственный архитектурно-строительный университет	339	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский государственный институт искусств и культуры	340	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский государственный медицинский университет Федерального агентства по здравоохранению и социальному развитию	341	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский государственный педагогический университет	342	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский государственный технический университет	343	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский государственный университет	344	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский естественно-гуманитарный институт	345	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский институт бизнеса	346	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский институт экономики	347	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский муниципальный институт искусств имени П.А. Серебрякова	348	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский филиал Академии труда и социальных отношений	349	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский филиал Волжской государственной академии водного транспорта	350	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский филиал Института управления	351	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский филиал Международного славянского института	352	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский филиал Московского государственного университета сервиса	353	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский филиал Московского гуманитарно-экономического института	354	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский филиал Московского международного университета бизнеса и информационных технологий	355	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский филиал Московской финансово-юридической академии	356	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский филиал Российского государственного открытого технического университета путей сообщения	357	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт русского театра	795	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский филиал Российского государственного торгово-экономического университета	358	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский филиал Российского университета кооперации	359	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский филиал Современной гуманитарной академии	360	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгоградский юридический институт	361	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгодонский институт (филиал) Южно-Российского государственного технического университета (Новочеркасского политехнического института)	362	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгодонский институт сервиса (филиал) Южно-Российского государственного университета экономики и сервиса	363	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгодонский институт экономики	364	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгодонский филиал Московского открытого социального университета (института)	365	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волгодонский филиал Таганрогского государственного педагогического института	366	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжская государственная академия водного транспорта	367	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжский (г. Волжский Волгоградской области) филиал Международного юридического института при Министерстве юстиции Российской Федерации	368	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжский государственный инженерно-педагогический университет	369	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжский гуманитарный институт (филиал) Волгоградского государственного университета	370	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжский институт строительства и технологий (филиал) Волгоградского государственного архитектурно-строительного университета	371	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжский институт экономики	372	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжский научно-технический комплекс (филиал) Волгоградского государственного технического университета (не лицензирован)	373	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжский политехнический институт (филиал) Волгоградского государственного технического университета	374	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжский университет имени В.Н. Татищева (институт)	375	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжский филиал Казанского государственного технического университета им. А.Н. Туполева	376	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжский филиал Казанского государственного технологического университета	377	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжский филиал Московского автомобильно-дорожного института (государственного технического университета)	378	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжский филиал Московского института рекламы	379	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжский филиал Российской академии предпринимательства	380	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжский филиал Современной гуманитарной академии	381	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волжско-Камский филиал Российской международной академии туризма	382	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вологодская государственная молочнохозяйственная академия имени Н.В. Верещагина	383	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вологодский государственный педагогический университет	384	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вологодский государственный технический университет	385	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вологодский институт бизнеса	386	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вологодский институт права и экономики Федеральной службы исполнения наказаний	387	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вологодский филиал Международного университета бизнеса и новых технологий (института)	388	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вологодский филиал Современной гуманитарной академии	389	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волоколамский институт гостеприимства - филиал Российской международной академии туризма	390	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Волоколамский филиал Российского нового университета	391	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вольское высшее военное училище тыла (военный институт)	392	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воркутинский институт пищевой промышленности	393	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воркутинский институт управления	394	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воркутинский колледж бизнеса и права Воркутинского института управления	395	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воркутинский филиал Российской международной академии туризма (не лицензирован)	396	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воркутинский филиал Северо-Западного государственного заочного технического университета (не лицензирован)	397	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воркутинский филиал Современной гуманитарной академии	398	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воркутинский филиал Сыктывкарского государственного университета	399	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воркутинский филиал Университета Российской академии образования	400	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воркутинский филиал Ухтинского государственного технического университета	401	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежская государственная академия искусств	402	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежская государственная лесотехническая академия	403	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежская государственная медицинская академия им. Н.Н. Бурденко Федерального агентства по здравоохранению и социальному развитию	404	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежская государственная технологическая академия	405	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский государственный аграрный университет имени К.Д. Глинки	406	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский государственный архитектурно-строительный университет	407	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский государственный институт физической культуры (филиал) Московской государственной академии физической культуры (по Распоряжению Правительста РФ ?237-р от 22.02.2006 реорганизовывается в самостоятельный вуз)	408	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский государственный педагогический университет	409	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский государственный технический университет	410	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский государственный университет	411	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский гуманитарный институт - филиал Московского открытого социального университета (института)	412	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский институт высоких технологий	413	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский институт инновационных систем	414	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский институт Министерства внутренних дел Российской Федерации	415	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский институт экономики и социального управления	416	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский кооперативный институт (филиал) Белгородского университета потребительской кооперации	417	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский филиал Всероссийского заочного финансово-экономического института	418	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский филиал Московского гуманитарно-экономического института	419	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский филиал Московской академии экономики и права	420	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский филиал Российского государственного открытого технического университета путей сообщения	421	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский филиал Российского государственного торгово-экономического университета	422	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский филиал Российского нового университета	423	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский филиал Российской академии государственной службы при Президенте Российской Федерации	424	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский филиал Санкт-Петербургского государственного университета водных коммуникаций	425	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежский филиал Современной гуманитарной академии	426	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воронежское высшее военное авиационное инженерное училище (военный институт)	427	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воскресенский институт туризма - филиал Российской международной академии туризма	428	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воскресенский филиал Российского нового университета	429	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Восточно-Европейский институт	430	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Восточно-Европейский Институт психоанализа	431	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Восточно-Сибирская государственная академия культуры и искусств	432	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Восточно-Сибирский государственный технологический университет	433	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Восточно-Сибирский институт Министерства внутренних дел Российской Федерации	434	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Восточно-Сибирский институт туризма - филиал Российской международной академии туризма	435	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Восточно-Сибирский институт экономики и права	436	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Восточно-Сибирский филиал Российской академии правосудия (г. Иркутск)	437	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Восточный институт	438	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Восточный институт экономики	439	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Восточный университет	440	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Воткинский филиал Ижевского государственного технического университета	441	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Всемирный технологический университет	442	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Всероссийская академия внешней торговли Министерства экономического развития и торговли Российской Федерации	443	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Всероссийская государственная налоговая академия Министерства финансов Российской Федерации	444	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Всероссийский государственный институт кинематографии имени С.А. Герасимова	445	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Всероссийский заочный финансово-экономический институт	446	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Выборгский филиал Российского государственного педагогического университета им. А.И. Герцена	447	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Выборгский филиал Санкт-Петербургского государственного университета аэрокосмического приборостроения	448	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Выборгский филиал Санкт-Петербургского государственного университета водных коммуникаций	449	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Выборгский филиал Санкт-Петербургского государственного университета сервиса и экономики	450	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Выборгский филиал Северо-Западного государственного заочного технического университета	451	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Выксунский филиал Московского государственного института стали и сплавов (технологического университета)	452	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Выксунский филиал Нижегородского государственного технического университета	453	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Высшая административная школа при Администрации Санкт-Петербурга	454	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Высшая гуманитарная школа им. С. Дубнова	455	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Высшая религиозно-философская школа (Институт)	456	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Высшая школа изящных искусств	457	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Высшая школа искусств	458	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Высшая школа музыки Республики Саха (Якутия)	459	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Высшая школа народных искусств (институт)	460	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Высшая школа приватизации и предпринимательства - институт	461	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Высшая школа психологии (Институт)	462	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Высшее театральное училище (институт) им. М.С. Щепкина при Государственном академическом Малом театре России	463	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Высший институт управления (ВИУ)	464	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Высший коммерческий колледж Русский бизнес	465	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вяземский филиал Российской международной академии туризма	466	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вяземский филиал Современной гуманитарной академии	467	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вятская государственная сельскохозяйственная академия	468	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вятский государственный гуманитарный университет	469	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вятский государственный университет	470	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вятский социально-экономический институт	471	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Вятскополянский филиал Казанского государственного технического университета им. А.Н. Туполева	472	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гаврилов-Ямский филиал Рыбинской государственной авиационной технологической академии имени П.А. Соловьева	473	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гатчинский филиал Санкт-Петербургского государственного университета технологии и дизайна	474	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Геленджикский институт искусств	475	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Геленджикский институт управления	476	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Геленджикский филиал Южного института менеджмента	477	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Георгиевский технологический институт (филиал) Северо-Кавказского государственного технического университета	478	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Георгиевский филиал Невинномысского государственного гуманитарно-технического института	479	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гжельский государственный художественно-промышленный институт	480	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Глазовский государственный педагогический институт имени В.Г. Короленко	481	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Глазовский инженерно-экономический институт (филиал) Ижевского государственного технического университета	482	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Глазовский филиал Университета Российской академии образования	483	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Голицынский пограничный институт Федеральной службы безопасности Российской Федерации	484	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Горно-Алтайский государственный университет	485	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Горно-Алтайский филиал Современной гуманитарной академии	486	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Горский государственный аграрный университет	487	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Государственная академия славянской культуры	488	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Государственная классическая академия имени Маймонида	489	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Государственная морская академия имени адмирала С.О. Макарова	490	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Государственная полярная академия	491	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Государственный музыкально-педагогический институт имени М.М. Ипполитова-Иванова	493	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Государственный специализированный институт искусств	494	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Государственный университет - Высшая школа экономики	495	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Государственный университет гуманитарных наук	496	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Государственный университет по землеустройству	497	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Государственный университет управления (ГУУ)	498	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Государственный университет цветных металлов и золота	499	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Грозненский государственный нефтяной институт имени академика М.Д. Миллионщикова	500	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Грозненский филиал Краснодарского университета Министерства внутренних дел Российской Федерации	501	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Губкинский институт (филиал) Московского государственного открытого университета	502	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Губкинский филиал Белгородского государственного технологического университета им. В.Г. Шухова	503	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Губкинский филиал Современной гуманитарной академии	504	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гудермесский филиал Института финансов и права	505	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гуковский институт экономики и права (филиал) Ростовского государственного экономического университета РИНХ	506	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гулькевичский филиал Северо-Кавказского института бизнеса	507	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гуманитарно-Прогностическая Академия	508	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гуманитарно-социальный институт	509	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гуманитарно-технический институт	510	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гуманитарно-Экологический Институт	511	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гуманитарно-экономический и информационно-технологический институт	512	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гуманитарный институт (г. Москва)	513	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гуманитарный институт им. Сергия Радонежского	514	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гуманитарный институт ИНСАН	515	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гуманитарный институт телевидения и радиовещания им. М.А. Литовчина	516	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Гуманитарный университет	517	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дагестанская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	518	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дагестанская государственная сельскохозяйственная академия	519	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дагестанский государственный институт народного хозяйства Правительства Республики Дагестан	520	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дагестанский государственный педагогический университет	521	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дагестанский государственный технический университет	522	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дагестанский государственный университет	523	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дагестанский институт прикладного искусства и дизайна	524	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дагестанский кооперативный институт (филиал) Белгородского университета потребительской кооперации	525	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дагестанский филиал Московского государственного института радиотехники	526	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дагестанский филиал Российского государственного педагогического университета им. А. И. Герцена	527	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дагестанский филиал Университета Российской академии образования	528	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дагестанский филиал Южно-Российского государственного технического университета (Новочеркасского политехнического института)	529	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточная академия государственной службы	530	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточная государственная академия искусств	531	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточная государственная академия физической культуры	532	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточная государственная социально-гуманитарная академия	533	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточное высшее военное автомобильное командно-инженерное училище (военный институт) (г. Уссурийск)	534	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточное высшее военное командное училище (военный институт) имени Маршала Советского Союза К.К. Рокоссовского (г. Благовещенск) Министерства обороны Российской Федерации	535	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный (г. Хабаровск) филиал Российской правовой академии Министерства юстиции Российской Федерации	536	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный государственный аграрный университет	537	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный государственный медицинский университет Федерального агентства по здравоохранению и социальному развитию	539	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный государственный технический рыбохозяйственный университет	540	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный государственный технический университет (ДВПИ имени В.В. Куйбышева)	541	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный государственный университет	542	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный государственный университет путей сообщения	543	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный институт законодательства и правоведения	544	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный институт иностранных языков	545	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный институт коммуникации	546	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный институт международного бизнеса	547	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный институт международных отношений	548	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный институт менеджмента	549	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный институт психологии и психоанализа	550	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный институт управления	551	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный открытый институт	552	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный филиал Всероссийской академии внешней торговли Министерства экономического развития и торговли Российской Федерации	553	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный филиал Российского университета кооперации	554	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный филиал Российской академии правосудия (г. Хабаровск)	555	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный филиал Санкт-Петербургской академии управления и экономики	556	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальневосточный юридический институт Министерства внутренних дел Российской Федерации	557	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальнегорский индустриально-экономический институт (филиал) Дальневосточного государственного технического университета (ДВПИ имени В.В. Куйбышева)	558	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дальнереченский социально-экономический институт (филиал) Дальневосточного государственного технического университета (ДВПИ имени В.В. Куйбышева)	559	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Данковский филиал Елецкого государственного университета имени И.А. Бунина (НЕ ЛИЦЕНЗИРОВАН - письмо из ВУЗа ?528458 от 29.04.05)	560	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дербентский гуманитарный институт	561	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дербентский институт дистанционного образования	562	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дербентский институт искусств и культуры	563	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дербентский филиал Института мировой экономики	564	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дербентский филиал Московского государственного университета экономики	565	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дербентский филиал Современной гуманитарной академии	566	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дзержинский политехнический институт (филиал) Нижегородского государственного технического университета	567	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дзержинский филиал Волго-Вятской академии государственной службы	568	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дзержинский филиал Нижегородского государственного университета им. Н.И. Лобачевского	569	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дзержинский филиал Современной гуманитарной академии	570	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Димитровградский институт технологии	571	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Димитровградский филиал Современной гуманитарной академии	572	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дипломатическая академия Министерства иностранных дел Российской Федерации	573	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дмитровский филиал Астраханского государственного технического университета	574	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дмитровский филиал Московского государственного агроинженерного университета имени В.П. Горячкина	575	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дмитровский филиал Московского государственного технического университета имени Н.Э. Баумана	576	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дмитровский филиал Российского государственного торгово-экономического университета	577	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дмитровский филиал Российской международной академии туризма	578	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дмитровский филиал Современной гуманитарной академии	579	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Домодедовский филиал Российского нового университета	580	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Донской государственный аграрный университет	581	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Донской государственный технический университет	582	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Донской институт дистанционного образования	583	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Донской филиал Евразийского открытого института	584	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Донской юридический институт	585	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Духовно-гуманитарный институт имени Саидбега Даитова	586	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Дятьковский филиал Белгородского государственного технологического университета им. В.Г. Шухова	587	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Евразийский институт экономики	588	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Евразийский открытый институт	589	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Европейский Университет Права JUSTO	590	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Европейско-Азиатский институт управления и предпринимательства	591	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Егорьевский технологический институт (филиал) Московского государственного технологического университета Станкин	592	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Егорьевский филиал Московского государственного открытого педагогического университета им. М.А. Шолохова	593	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ейский филиал Современной гуманитарной академии	594	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ейское высшее военное авиационное училище (военный институт) имени дважды Героя Советского Союза летчика-космонавта СССР В.М. Комарова	595	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Екатеринбургский государственный театральный институт	596	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Екатеринбургский филиал Академии труда и социальных отношений	597	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Екатеринбургский филиал Московского института предпринимательства и права	598	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Екатеринбургский филиал Современной гуманитарной академии	599	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Екатеринбургский филиал Университета Российской академии образования	600	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Екатеринбургский филиал Уральского государственного университета физической культуры	601	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Екатеринбургское высшее артиллерийское командное училище (военный институт)	602	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Елабужский государственный педагогический университет	603	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Елабужский филиал Академии социального образования (КСЮИ)	604	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Елабужский филиал Института социальных и гуманитарных знаний	605	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Елецкий государственный университет им. И.А. Бунина	606	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Елецкий филиал Российского государственного открытого технического университета путей сообщения	607	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Елецкий филиал Российского нового университета	608	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Елецкий филиал Современной гуманитарной академии	609	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ереванский филиал Института бизнеса и права	610	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ереванский филиал Международной академии предпринимательства	611	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ереванский филиал Московского государственного университета сервиса	612	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ереванский филиал Московского государственного университета экономики	613	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ессентукский институт управления	614	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Жалал-абадский филиал Международного университета Кыргызстана	615	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Железногорский филиал Курского института менеджмента	616	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Железногорский филиал Современной гуманитарной академии	617	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Жигулевский инженерно-экономический институт	618	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Забайкальский аграрный институт - филиал Иркутской государственной сельскохозяйственной академии	619	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Забайкальский государственный гуманитарно-педагогический университет им. Н.Г. Чернышевского	620	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Забайкальский институт железнодорожного транспорта - филиал Иркутского государственного университета путей сообщения в г. Чите	621	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Забайкальский институт предпринимательства - филиал Сибирского университета потребительской кооперации	622	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Заводоуковский филиал Уральского института коммерции и права	623	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Заволжский филиал Нижегородского государственного технического университета	624	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Заволжский филиал Нижегородского государственного университета им. Н.И. Лобачевского	625	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Заинский филиал Казанского государственного технического университета им. А.Н. Туполева	626	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Закаменский филиал Бурятской государственной сельскохозяйственной академии им. В.Р. Филиппова	627	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Заокский христианский гуманитарно-экономический институт	628	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Западно-Подмосковный институт туризма - филиал Российской международной академии туризма	629	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Западно-Сибирский (г. Барнаул) филиал Российской правовой академии Министерства юстиции Российской Федерации	630	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Западно-Сибирский гуманитарный институт	631	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Западно-Сибирский гуманитарный институт (г. Тобольск)	632	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Западно-Сибирский Институт Финансов и Права	633	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Западно-Сибирский филиал Российского государственного университета инновационных технологий и предпринимательства	634	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Западно-Сибирский филиал Российской академии правосудия (г. Томск)	635	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Западно-Уральский институт экономики и права	636	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Западно-Уральский филиал Московской международной высшей школы бизнеса МИРБИС (Институт)	637	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Заполярный филиал Ленинградского государственного университета имени А.С. Пушкина	638	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Зареченский технологический институт - филиал Пензенской государственной технологической академии	639	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Зауральский гуманитарно-технологический институт	640	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Зауральский филиал Башкирского государственного аграрного университета	641	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Звенигородский финансово-экономический колледж - филиал Финансовой академии при Правительстве Российской Федерации	642	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Зеленодольский филиал Академии социального образования (КСЮИ)	643	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Зеленодольский филиал Института экономики	644	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Зеленодольский филиал Казанского государственного технического университета им. А.Н. Туполева	645	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Зеленчукский филиал Армавирского финансово-экономического института (Находится в стадии ЛИКВИДАЦИИ - письмо ?16 ОТ 26.01.06)	646	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Зерноградский филиал Таганрогского государственного педагогического института	647	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Златоустовский филиал Современной гуманитарной академии	648	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивангородский гуманитарно-технический институт (филиал) Санкт-Петербургского государственного университета аэрокосмического приборостроения	649	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	650	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановская государственная сельскохозяйственная академия имени академика Д.К. Беляева	651	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановская государственная текстильная академия	652	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановский (г. Иваново) филиал Международного юридического института при Министерстве юстиции Российской Федерации	653	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановский государственный архитектурно-строительный университет	654	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановский государственный университет	655	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановский государственный химико-технологический университет	656	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановский государственный энергетический университет имени В.И. Ленина	657	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановский институт Государственной противопожарной службы Министерства Российской Федерации по делам гражданской обороны	658	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановский институт управления	659	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановский православный богословский институт Св. Апостола Иоанна Богослова	660	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановский филиал Владимирского юридического института Федеральной службы исполнения наказаний	661	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановский филиал Института управления	662	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановский филиал Российского государственного торгово-экономического университета	663	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановский филиал Российского университета кооперации	664	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ивановский филиал Современной гуманитарной академии	665	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ижевская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	666	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ижевская государственная сельскохозяйственная академия	667	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ижевский государственный технический университет	668	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ижевский институт управления	669	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ижевский филиал Академии права и управления (института)	670	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ижевский филиал Нижегородской академии Министерства внутренних дел Российской Федерации	671	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ижевский филиал Российского нового университета	672	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ижевский филиал Российского университета кооперации	673	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ижевский филиал Современной гуманитарной академии	674	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ижевский юридический институт (филиал) Российской правовой академии Министерства юстиции Российской Федерации	675	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ингушский государственный университет	676	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Индустриальный институт	677	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Инзенский филиал Ульяновского государственного университета	678	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Инновационный университет предпринимательства	679	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт (филиал) Московской государственной юридической академии в г. Махачкале Республики Дагестан	680	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт автомобильных технологий и управления	681	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт агроэкологии - филиал Челябинского государственного агроинженерного университета	682	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Актуального образования ЮрИнфоР-МГУ	683	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Аналитической Психологии и Психоанализа	684	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт английского языка	685	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт банковского дела (г. Екатеринбург)	686	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт безопасности предпринимательства	687	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт бизнеса и компьютеров	688	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт бизнеса и политики	689	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт бизнеса и права	690	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт бизнеса и права (г. Санкт-Петербург)	691	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Бизнеса и Экономики	692	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт бизнеса	693	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт бизнеса	694	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт биологии и психологии человека	695	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт богословия и философии	696	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Верхневолжье	697	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт высоких технологий и проектов	698	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Высшая школа лингвистики	699	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Высшая школа футбольного менеджмента	700	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Высшие столыпинские курсы государственного права и управления	701	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт государственного администрирования	702	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт государственного управления	703	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт государственной службы при Президенте Республики Татарстан	704	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт гуманитарного образования	705	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт декоративно-прикладного искусства	706	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт деловой карьеры	707	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт дизайна и новых технологий	708	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Дружбы народов Кавказа	709	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Европейская бизнес-школа - Калининград	710	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт европейских культур	711	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт европейских языков	712	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт естественного и гуманитарного образования	713	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт естественных наук и экологии	714	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт журналистики и литературного творчества	715	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт инвестиционного развития	716	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Индустрии Моды	717	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт индустрии сервиса	718	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт инженерных технологий	719	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт иностранных языков	720	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт иностранных языков (г. Санкт-Петербург)	721	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт иностранных языков и международных связей	722	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт ИНФО	723	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт информационного менеджмента	724	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт информационных технологий	725	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт инфраструктуры предпринимательства	726	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт искусства реставрации	727	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт истории культур	728	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Калининградская высшая школа управления	729	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт коммерции и права	730	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт коммуникативных технологий	731	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Ландера	732	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт лингвистики	733	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Магнитогорская высшая школа бизнеса	734	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт маркетинга	735	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт международного бизнес образования	736	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Международного бизнеса (г. Ростов-на-Дону)	737	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт международного права и экономики имени А.С. Грибоедова	738	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт международного права	739	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт международного туризма	740	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт международной торговли и права	741	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт международной торговли и права (г. Йошкар-Ола)	742	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт международных связей	743	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт международных социально-гуманитарных связей	744	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт международных экономических отношений	745	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт международных экономических связей	746	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт менеджеров пищевых и перерабатывающих производств	747	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт менеджмента и бизнеса	748	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт менеджмента и информационных технологий (филиал) Санкт-Петербургского государственного политехнического университета в г. Череповце	749	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт менеджмента и культурных инноваций (г. Москва)	750	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт менеджмента и права	751	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт менеджмента и рынка	752	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт менеджмента	753	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт менеджмента	754	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт мировой экономики	755	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт мировой экономики	756	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт мировой экономики и антикризисного управления	757	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт мировой экономики и информатизации	758	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт мировой экономики и права	759	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт мировой экономики и управления	760	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт мировой экономики и финансов	761	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт мировых цивилизаций	762	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт моды	763	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт морского права	764	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Московская высшая школа социальных и экономических наук	765	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Московская международная школа переводчиков	766	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт недвижимости и строительного бизнеса	767	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт непрерывного профессионального образования	768	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт открытого бизнес-образования	769	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт открытого образования	770	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт переподготовки и повышения квалификации сотрудников Федеральной службы безопасности Российской Федерации (г. Новосибирск)	771	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт подготовки телевизионных ведущих	772	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт позитивной психотерапии	773	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт права и экономики	774	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт права и экономики (г. Омск)	775	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт правоведения и предпринимательства	776	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт правовой и экономической безопасности	777	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт правовой экономики	778	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт практического востоковедения	779	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт практической психологии	780	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Практической Психологии и Психоанализа	781	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт практической психологии и социологии	782	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт прикладной информатики и управления	783	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт проблем риска	784	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт программных систем - Университет города Переславля имени А.К. Айламазяна	785	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт профессионального образования (филиал Югорского государственного университета в г. Белоярском)	786	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт профессиональной оценки	787	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт профессиональных инноваций	788	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт психоанализа	789	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт психологии и педагогики	790	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт психологии и социологии	791	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт радиоэлектроники	792	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт реабилитологии	793	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт русского предпринимательства	794	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт рыночной экономики	798	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Сам Юк	799	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт свободных искусств и наук	800	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт систем управления экономикой и международного права	801	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт современного искусства	802	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт современного права и экономики	803	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт современного права и экономики (пос. Приокск	804	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт современной экономики (г. Москва)	805	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Современных Бизнес-Технологий и Систем Управления	806	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт современных технологий и экономики	807	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт социального и образовательного менеджмента	808	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт социального образования (филиал) Российского государственного социального университета в г. Саратове	809	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт социального страхования	810	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт социально-экономического прогнозирования и моделирования	811	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт социальных и гуманитарных знаний	812	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт социальных наук	813	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт специальной педагогики и психологии	814	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт сферы социальных отношений	815	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт танцевального и театрального искусства	816	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт театрального искусства им. П.М. Ершова	817	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт телевидения	818	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт ТЕЛЕИНФО	819	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт теологии и религиоведения имени Мамма-Дибира аль-Рочи	820	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт технологии и бизнеса	821	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт технологии туризма	822	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт туризма и гостеприимства (г. Москва) (филиал) Московского государственного университета сервиса	823	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт универсального знания Тетрада	824	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт управления (г. Архангельск)	825	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт управления (г. Набережные Челны)	826	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт управления и безопасности	827	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт управления и бизнеса	828	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт управления и информатики	829	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт управления и международных связей	830	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт управления и образовательных технологий (г. Москва)	831	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт управления и права	832	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт управления и права (г. Москва)	833	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт управления индустрией гостиничного хозяйства и туризма (г. Москва)	834	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт управления	835	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
ИНСТИТУТ УПРАВЛЕНИЯ	836	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт управления	837	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт управления	838	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт философии	839	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт финансов и кредита	840	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт финансов и права	841	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт финансов	842	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт художественного творчества	843	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт цивилизации (г. Владикавказ)	844	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экологии	845	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики	846	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Экономики Бизнеса	847	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и антикризисного управления	848	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и культуры (г. Москва)	849	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и права	850	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и права (г. Воронеж)	851	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и права (филиал) Академии труда и социальных отношений в г. Севастополе	852	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и правоведения (г. Назрань)	853	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и предпринимательства	854	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и предпринимательства (г. Москва)	855	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и связей с общественностью	856	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и сервиса	857	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и современных технологий (не ведет образовательную деятельность с 15.05.2006)	858	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и социальных отношений	859	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и управления	860	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и управления (г. Пятигорск)	861	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и управления (г. Салават)	862	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и управления в медицине и социальной сфере	863	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и управления в строительстве и промышленности	864	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и финансов	865	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики и финансов Синергия	866	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики	867	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики	868	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики	869	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономики	870	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт Экономическая школа (г. Санкт-Петербург)	871	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт экономических преобразований и управления рынком	872	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт ЮЖДАГ	873	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт ядерной энергетики (филиал) Санкт-Петербургского государственного политехнического университета в г. Сосновый Бор	874	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Институт языков и культур имени Льва Толстого	875	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутская государственная сельскохозяйственная академия	876	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский государственный лингвистический университет	877	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский государственный медицинский университет Федерального агентства по здравоохранению и социальному развитию	878	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский государственный педагогический университет	879	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский государственный технический университет	880	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский государственный университет	881	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский государственный университет путей сообщения	882	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский институт международного туризма	883	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский институт международного туризма - филиал Российской международной академии туризма	884	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский филиал Академии труда и социальных отношений	885	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский филиал Международной академии предпринимательства (Решается вопрос о ликвидации - приказ ВУЗа ?65Ф от 12.12.2004 )	886	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский филиал Московского государственного технического университета гражданской авиации	887	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский филиал Негосударственного образовательного учреждения Международного института Менеджмента ЛИНК	888	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский филиал Российского государственного торгово-экономического университета	889	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский филиал Сибирского университета потребительской кооперации	890	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский филиал Современной гуманитарной академии	891	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутский юридический институт (филиал) Российской правовой академии Министерства юстиции Российской Федерации	892	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иркутское высшее военное авиационное инженерное училище (военный институт)	893	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Иссык-Кульский филиал Международного университета Кыргызстана	894	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ишимский государственный педагогический институт им. П.П. Ершова	895	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Йошкар-Олинский филиал Академии права и управления (института)	896	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Йошкар-Олинский филиал Современной гуманитарной академии	897	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кабардино-Балкарская государственная сельскохозяйственная академия	898	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кабардино-Балкарский государственный университет им. Х.М. Бербекова	899	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кабардино-Балкарский институт бизнеса	900	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кавказский светский институт	901	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кавминводский институт (филиал) Южно-Российского государственного технического университета (Новочеркасского политехнического института)	902	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кавминводский институт сервиса (филиал) Южно-Российского государственного университета экономики и сервиса	903	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанская государственная академия ветеринарной медицины имени Н.Э. Баумана	904	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанская государственная консерватория имени Н.Г. Жиганова	905	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский государственный аграрный университет	906	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский государственный архитектурно-строительный университет	907	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский филиал Международного славянского института	949	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский государственный медицинский университет Министерства здравоохранения Российской Федерации	908	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский государственный технический университет им. А.Н. Туполева	909	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский государственный технологический университет	910	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский государственный университет имени В.И. Ульянова-Ленина	911	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский государственный университет культуры и искусств	912	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский государственный финансово-экономический институт	913	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский государственный энергетический университет	914	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский гуманитарный институт	915	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский институт (филиал) Российского государственного торгово-экономического университета	916	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский институт бизнеса и управления	917	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский институт предпринимательства и права	918	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский кооперативный институт (филиал) Российского университета кооперации	919	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Академии труда и социальных отношений	920	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Владимирского юридического института Федеральной службы исполнения наказаний	921	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Волжской государственной академии водного транспорта	922	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Восточного института экономики	923	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Московского государственного университета сервиса (проходит процедуру лицензирования)	924	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Московского государственного университета экономики	925	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Московской академии предпринимательства при Правительстве г. Москвы	926	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Негосударственного образовательного учреждения Международный институт менеджмента ЛИНК	927	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Поволжской государственной академии телекоммуникаций и информатики	928	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Российского государственного открытого технического университета путей сообщения	929	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Российского государственного университета инновационных технологий и предпринимательства (не лицензирован)	930	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Российской академии правосудия (г. Казань)	931	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Российской международной академии туризма	932	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Санкт-Петербургской академии управления и экономики	933	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский филиал Современной гуманитарной академии	934	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский юридический институт (филиал) Российской правовой академии Министерства юстиции Российской Федерации	935	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанский юридический институт Министерства внутренних дел Российской Федерации	936	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанское высшее артиллерийское командное училище (военный институт) имени маршала артиллерии М.Н. Чистякова	937	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казанское высшее военное командное училище (военный институт) Министерства обороны Российской Федерации	938	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Казахстанский филиал Московского государственного университета имени М.В. Ломоносова	939	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калачевский филиал Волгоградского государственного университета	940	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калачеевский филиал Воронежского государственного университета (окончен срок действия лицензии)	941	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский государственный технический университет	942	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский институт международного бизнеса	943	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский институт туризма - филиал Российской международной академии туризма	944	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский институт экономики - филиал Санкт-Петербургской академии управления и экономики	945	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский пограничный институт Федеральной службы безопасности Российской Федерации	946	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский филиал (г.Советск) Санкт-Петербургского государственного университета культуры и искусств	947	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский филиал Евразийского открытого института	948	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский филиал Международного университета в Москве (гуманитарного)	950	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский филиал Московского государственного университета сервиса	951	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский филиал Московского государственного университета экономики	952	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский филиал Московского открытого социального университета (института) (находится в стадии ликвидации с 14.03.2006)	953	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский филиал Московской финансово-юридической академии	954	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский филиал Российского государственного открытого технического университета путей сообщения	955	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский филиал Российского университета кооперации	956	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский филиал Санкт-Петербургского государственного аграрного университета	957	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский филиал Санкт-Петербургского государственного университета сервиса и экономики	958	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский филиал Современной гуманитарной академии	959	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калининградский юридический институт Министерства внутренних дел Российской Федерации	960	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калмыцкий государственный университет	961	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калмыцкий технологический институт (филиал) Пятигорского государственного технологического университета	962	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калмыцкий филиал Московского государственного открытого педагогического университета имени М.А. Шолохова	963	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калмыцкий филиал Московского открытого социального университета (института)	964	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калмыцкий филиал Московской академии экономики и права	965	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калмыцкий филиал Московской финансово-юридической академии	966	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калмыцкий филиал Санкт-Петербургской академии управления и экономики	967	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калужский государственный педагогический университет им. К.Э. Циолковского	968	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калужский институт туристского бизнеса - филиал Российской международной академии туризма	969	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калужский филиал Академии бюджета и казначейства Министерства финансов Российской Федерации	970	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калужский филиал Всероссийского заочного финансово-экономического института	971	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калужский филиал Международного славянского института	972	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калужский филиал Московского государственного технического университета имени Н.Э. Баумана	973	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калужский филиал Московского гуманитарно-экономического института	974	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калужский филиал Московской финансово-юридической академии	975	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калужский филиал Российского государственного аграрного университета - МСХА имени К.А. Тимирязева	976	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калужский филиал Российского государственного открытого технического университета путей сообщения	977	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калужский филиал Российской правовой академии Министерства юстиции Российской Федерации	978	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калужский филиал Санкт-Петербургского государственного университета сервиса и экономики	979	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Калужский филиал Современной гуманитарной академии	980	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камбарский машиностроительный колледж (филиал) Ижевского государственного технического университета	981	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Каменский институт (филиал) Южно-Российского государственного технического университета (Новочеркасского политехнического института)	982	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Каменский технологический институт - филиал Пензенской государственной технологической академии	983	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Каменск-Уральский филиал Института международных связей	984	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Каменск-Уральский филиал Уральского института экономики	985	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камская государственная инженерно-экономическая академия	986	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камский государственный институт физической культуры	987	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камский институт	988	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камский институт гуманитарных и инженерных технологий	989	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камский институт искусств и дизайна	990	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камский институт экономики	991	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камчатский государственный технический университет	992	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камчатский государственный университет имени Витуса Беринга	993	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камчатский филиал Международного института менеджмента ЛИНК	994	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камчатский филиал Московского государственного университета сервиса	995	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камчатский филиал Российского университета кооперации	996	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камчатский филиал Сибирского университета потребительской кооперации	997	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камышинский технологический институт (филиал) Волгоградского государственного технического университета	998	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Камышинский филиал Современной гуманитарной академии	999	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Канашский филиал Института социальных и гуманитарных знаний	1000	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Канашский филиал Чувашского государственного университета им. И.Н. Ульянова	1001	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Канский филиал Сибирского института бизнеса	1002	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Каракольский филиал Московского института предпринимательства и права	1003	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Карачаево-Черкесская государственная технологическая академия	1004	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Карачаево-Черкесский государственный университет	1005	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Карачаево-Черкесский филиал Московского открытого социального университета (института)	1006	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Карачаево-Черкесский филиал Российского государственного социального университета в г. Черкесске Карачаево-Черкесской Республики	1007	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Карачевский филиал Орловского государственного технического университета	1008	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Карельский государственный педагогический университет	1009	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Карельский институт туризма - филиал Российской международной академии туризма	1010	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Карельский филиал Северо-Западной академии государственной службы	1011	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Каспийский филиал Морской государственной академии имени адмирала Ф.Ф. Ушакова в г. Астрахани	1012	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Католическая Высшая духовная семинария Мария - Царица Апостолов	1013	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кемеровская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	1014	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кемеровский государственный сельскохозяйственный институт	1015	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кемеровский государственный университет	1016	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кемеровский государственный университет культуры и искусств	1017	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кемеровский институт (филиал) Российского государственного торгово-экономического университета	1018	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кемеровский технологический институт пищевой промышленности	1019	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кемеровский филиал Современной гуманитарной академии	1020	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кемеровское высшее военное командное училище связи (военный институт) имени маршала войск связи И.Т. Пересыпкина	1021	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кемеровское отделение заочного обучения Омской академии МВД России	1022	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кингисеппский филиал Ленинградского государственного университета имени А.С. Пушкина	1023	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кинешемский текстильный техникум (филиал) Ивановской государственной текстильной академии	1024	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кинешемский филиал Современной гуманитарной академии	1025	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Киришский филиал Санкт-Петербургского государственного горного института им. Г.В. Плеханова (технического университета)	1026	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Киришский филиал Санкт-Петербургского государственного университета аэрокосмического приборостроения	1027	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Киришский филиал Санкт-Петербургской академии управления и экономики	1028	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Киришский филиал Северо-Западного государственного заочного технического университета	1029	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кирово-Чепецкий филиал Вятского социально-экономического института	1030	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировская государственная медицинская академия Министерства здравоохранения Российской Федерации	1031	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский институт иностранных языков	1032	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский филиал Академии права и управления Федеральной службы исполнения наказаний	1033	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский филиал заочного обучения государственного образовательного учреждения высшего профессионального образования Нижегородская академия МВД России	1034	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский филиал Института бизнеса и политики	1035	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский филиал Института управления и бизнеса в г. Кирове	1036	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский филиал Московского государственного индустриального университета	1037	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский филиал Московского гуманитарно-экономического института	1038	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский филиал Московской финансово-юридической академии	1039	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский филиал Пермского государственного института искусства и культуры	1040	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский филиал Российского университета инноваций (института)	1041	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский филиал Санкт-Петербургского государственного университета сервиса и экономики	1042	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский филиал Санкт-Петербургского Гуманитарного университета профсоюзов	1043	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский филиал Современной гуманитарной академии	1044	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский филиал Университета Российской академии образования	1045	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кировский финансово-экономический колледж - филиал Финансовой академии при Правительстве Российской Федерации	1046	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кисловодский гуманитарно-технический институт	1047	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кисловодский институт экономики и права	1048	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кисловодский филиал Московской академии туристского и гостинично-ресторанного бизнеса (института) при Правительстве Москвы	1049	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Клинский институт экономики и права	1050	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Клинский филиал Института государственного администрирования	1051	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ковровская государственная технологическая академия имени В.А. Дегтярева	1052	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ковровский филиал Современной гуманитарной академии	1053	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ковылкинский филиал Мордовского государственного университета имени Н.П. Огарева	1054	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Колледж Банкир	1055	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Колледж Интербиз	1056	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Колледж менеджмента и права	1057	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Коломенский государственный педагогический институт	1058	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Коломенский институт (филиал) Московского государственного открытого университета	1059	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Коломенский филиал Евразийского открытого института	1060	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Коломенский филиал Московской академии экономики и права	1061	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Коломенский филиал Современной гуманитарной академии	1062	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Коломенское высшее артиллерийское командное училище (военный институт)	1063	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кольский филиал Петрозаводского государственного университета	1064	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Коми государственный педагогический институт	1065	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Коми республиканская академия государственной службы и управления	1066	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Коми филиал Вятской государственной сельскохозяйственной академии	1067	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Коми филиал Кировской государственной медицинской академии Федерального агентства по здравоохранению и социальному развитию в г. Сыктывкаре	1068	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Комсомольский-на-Амуре государственный технический университет	1069	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Конаковский филиал Евразийского открытого института	1070	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Конаковский филиал Российской международной академии туризма	1071	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Королевский (г. Королев Московской области) филиал Международного юридического института при Министерстве юстиции Российской Федерации	1072	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Королевский институт управления	1073	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Коряжемский филиал Поморского государственного университета имени М.В. Ломоносова	1074	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Костанайский филиал Челябинского государственного университета	1075	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Костомукшский филиал Петрозаводского государственного университета	1076	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Костомукшский филиал Северо-Западного государственного заочного технического университета	1077	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Костромская государственная сельскохозяйственная академия	1078	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Костромской государственный технологический университет	1079	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Костромской государственный университет имени Н.А. Некрасова	1080	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Костромской открытый институт непрерывного образования	1081	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Костромской филиал Международного университета бизнеса и новых технологий (институт)	1082	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Костромской филиал Современной гуманитарной академии	1083	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Котельнический филиал Вятской государственной сельскохозяйственной академии	1084	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Котласский филиал Архангельского государственного технического университета	1085	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Котласский филиал Санкт-Петербургского государственного университета водных коммуникаций	1086	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Котласское речное училище - филиал Санкт-Петербургского государственного университета водных коммуникаций	1087	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кочубеевский гуманитарно-технический колледж - филиал Невинномысского государственного гуманитарно-технологического института	1088	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красногорский филиал Академии народного хозяйства при Правительстве Российской Федерации	1089	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красногорский филиал Московской финансово-промышленной академии	1090	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Краснодарский государственный университет культуры и искусств	1091	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Краснодарский кооперативный институт (филиал) Российского университета кооперации	1092	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Краснодарский муниципальный медицинский институт высшего сестринского образования	1093	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Краснодарский университет Министерства внутренних дел Российской Федерации	1094	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Краснодарский филиал Академии труда и социальных отношений	1095	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Краснодарский филиал Владимирского юридического института Федеральной службы исполнения наказаний	1096	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Краснодарский филиал Международного университета (в Москве)	1097	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Краснодарский филиал Российского государственного торгово-экономического университета	1098	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Краснодарский филиал Современной гуманитарной академии	1099	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Краснодарское высшее военное авиационное училище летчиков (военный институт) имени Героя Советского Союза А.К. Серова	1100	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Краснодарское высшее военное училище (военный институт) имени генерала армии С.М. Штеменко	1101	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Краснознаменский (г. Краснознаменск Московской области) филиал Международного юридического института при Министерстве юстиции Российской Федерации	1102	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Краснознаменский филиал Московской финансово-промышленной академии	1103	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красносулинский филиал Южно-Российского государственного технического университета (Новочеркасского политехнического института)	1104	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноуфимский филиал Уральской государственной сельскохозяйственной академии	1105	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярская государственная академия музыки и театра	1106	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярская государственная архитектурно-строительная академия	1107	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	1108	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский государственный аграрный университет	1109	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский государственный педагогический университет им. В.П. Астафьева	1110	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский государственный технический университет	1111	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский государственный торгово-экономический институт	1112	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский государственный художественный институт	1113	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский институт социально-экономических наук	1114	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский институт экономики - филиал Санкт-Петербургской академии управления и экономики	1115	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский институт экономики	1116	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский филиал Академии труда и социальных отношений	1117	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский филиал Московского государственного университета экономики	1118	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский филиал Новосибирской государственной академии водного транспорта	1119	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский филиал Российской академии предпринимательства	1120	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский филиал Санкт-Петербургского государственного университета гражданской авиации	1121	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский филиал Санкт-Петербургского Гуманитарного университета профсоюзов	1122	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский филиал Современной гуманитарной академии	1123	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский филиал Университета Российской академии образования	1124	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Красноярский финансово-экономический колледж - филиал Финансовой академии при Правительстве Российской Федерации	1125	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Крестьянский государственный университет имени Кирилла и Мефодия	1126	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Крымский филиал Новороссийской государственной морской академии	1127	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кубанский государственный аграрный университет	1128	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кубанский государственный медицинский университет Федерального агентства по здравоохранению и социальному развитию	1129	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кубанский государственный технологический университет	1130	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кубанский государственный университет	1131	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кубанский государственный университет физической культуры	1132	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кубанский институт информзащиты	1133	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кубанский институт международного предпринимательства и менеджмента	1134	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кубанский медицинский институт	1135	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кубанский социально-экономический институт	1136	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кубанский филиал Московского открытого социального университета (института)	1137	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кубанский филиал Московского экстерного гуманитарного университета	1138	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кудымкарский филиал Уральского государственного лесотехнического университета	1139	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кузбасская государственная педагогическая академия	1140	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кузбасский государственный технический университет	1141	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кузбасский институт экономики и права	1142	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кузбасский областной педагогический институт	1143	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кузбасский филиал Владимирского юридического института Федеральной службы исполнения наказаний	1144	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кузнецкий институт информационных и управленческих технологий (филиал) Пензенского государственного университета	1145	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кузнецкий технологический институт - филиал Пензенской государственной технологической академии	1146	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Куйбышевский филиал Новосибирского государственного педагогического университета	1147	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Куйбышевский филиал Новосибирского государственного технического университета	1148	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кумертауский институт экономики и права	1149	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кумертауский филиал Оренбургского государственного университета	1150	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кумертауский филиал Уфимского государственного авиационного технического университета	1151	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кунгурский филиал Пермского государственного педагогического университета	1152	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курганская государственная сельскохозяйственная академия имени Т.С. Мальцева	1153	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курганский государственный университет	1154	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курганский институт государственной и муниципальной службы (филиал) Уральской академии государственной службы	1155	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курганский институт управления и права	1156	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курганский пограничный институт Федеральной службы безопасности Российской Федерации	1157	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курганский социально-экономический институт	1158	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курганский филиал Академии труда и социальных отношений	1159	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курганский филиал Современной гуманитарной академии	1160	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курганский филиал Уральского института экономики	1161	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курганский филиал Шадринского государственного педагогического института	1162	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курская государственная сельскохозяйственная академия имени профессора И.И. Иванова	1163	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский автодорожный институт	1164	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лискинский филиал Воронежского государственного университета	1209	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский государственный медицинский университет Федерального агентства по здравоохранению и социальному развитию	1165	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский государственный технический университет	1166	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский государственный университет	1167	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский институт государственной и муниципальной службы	1168	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский институт менеджмента	1169	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский институт социального образования (филиал) Российского государственного социального университета	1170	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский институт экономики и права	1171	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский медицинский институт	1172	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский филиал Академии права и управления (институт)	1173	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский филиал Белгородского университета потребительской кооперации	1174	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский филиал Всероссийского заочного финансово-экономического института	1175	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский филиал Московского регионального института высшего социально-экономического образования	1176	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский филиал Орловского юридического института Министерства внутренних дел Российской Федерации	1177	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский филиал Российского государственного торгово-экономического университета	1178	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курский филиал Современной гуманитарной академии	1179	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курчатовский филиал Регионального открытого социального института (образовательная деятельность НЕ ВЕДЕТСЯ - письмо из ВУЗа ?337 от 7.09.05)	1180	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Курчатовский филиал Современной гуманитарной академии	1181	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кызылский филиал Современной гуманитарной академии	1182	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кыргызско-Российская Академия образования	1183	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кыргызско-Российский Славянский университет	1184	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Кяхтинский филиал Восточно-Сибирского государственного технологического университета	1185	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лабинский филиал Кубанского государственного аграрного университета	1186	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лабинский филиал Северо-Кавказского института бизнеса	1187	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лазаревский институт востоковедения	1188	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лебедянский филиал Елецкого государственного университета им. И.А. Бунина	1189	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ленинградский государственный университет имени А.С. Пушкина	1190	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ленинградский областной институт экономики и финансов	1191	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лениногорский филиал Казанского государственного технического университета им. А.Н. Туполева	1192	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лесной филиал Уральского института экономики	1193	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лесозаводский институт технологий управления (филиал) Дальневосточного государственного технического университета (ДВПИ имени В.В. Куйбышева)	1194	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лесосибирский филиал Сибирского государственного технологического университета	1195	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лесосибирский филиал Современной гуманитарной академии	1196	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ливенский филиал Орловского государственного технического университета	1197	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Линевский филиал Сибирской государственной геодезической академии	1198	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Липецкий государственный педагогический университет	1199	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Липецкий государственный технический университет	1200	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Липецкий кооперативный институт (филиал) Белгородского университета потребительской кооперации	1201	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Липецкий филиал Владимирского юридического института Федеральной службы исполнения наказаний	1202	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Липецкий филиал Воронежского института Министерства внутренних дел Российской Федерации	1203	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Липецкий филиал Института менеджмента	1204	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Липецкий филиал Международного института компьютерных технологий (г. Воронеж)	1205	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Липецкий филиал Нижегородского государственного лингвистического университета им. Н.А. Добролюбова	1206	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Липецкий эколого-гуманитарный институт	1207	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лисинский учебно-опытный лесхоз-филиал Санкт-Петербургской государственной лесотехнической академии имени С.М. Кирова (не лицензирован	1208	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Литературный институт имени А.М. Горького	1210	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лобненский филиал Московского государственного университета экономики	1211	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лужский филиал Северо-Западного государственного заочного технического университета	1212	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Луховицкий филиал Современной гуманитарной академии	1213	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лысьвенский филиал Пермского государственного педагогического университета	1214	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лысьвенский филиал Пермского государственного технического университета	1215	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Лыткаринский филиал Института финансов	1216	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Льговский филиал Современной гуманитарной академии	1217	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Люберецкий филиал Российского нового университета	1218	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Магаданский институт экономики - филиал Санкт-Петербургской академии управления и экономики	1219	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Магаданский филиал Ленинградского государственного университета имени А.С. Пушкина	1220	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Магаданский филиал Московской государственной юридической академии	1221	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Магаданский филиал Приморской государственной сельскохозяйственной академии	1222	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Магаданский филиал Российской академии предпринимательства	1223	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Магаданский филиал Современной гуманитарной академии	1224	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Магнитогорская государственная консерватория (институт) имени М.И. Глинки	1225	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Магнитогорский государственный технический университет им. Г.И. Носова	1226	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Магнитогорский государственный университет	1227	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Магнитогорский институт туризма - филиал Российской международной академии туризма	1228	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Магнитогорский филиал Восточного института экономики	1229	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Магнитогорский филиал Современной гуманитарной академии	1230	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Майкопский государственный технологический университет	1231	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Майкопский филиал Современной гуманитарной академии	1232	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Марийский государственный педагогический институт им. Н.К. Крупской	1233	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Марийский государственный технический университет	1234	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Марийский государственный университет	1235	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Марийский филиал Московского открытого социального университета (института)	1236	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Марийский филиал Московского психолого-социального института (г. Йошкар-Ола)	1237	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Марксовский филиал Саратовского государственного социально-экономического университета	1238	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
МАТИ - Российский государственный технологический университет имени К.Э. Циолковского	1239	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Махачкалинский филиал Московского автомобильно-дорожного института (государственного технического университета)	1240	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Махачкалинский филиал Современной гуманитарной академии	1241	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международная академия бизнеса и управления	1242	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международная академия маркетинга и менеджмента (институт) МАМАРМЕН	1243	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международная академия оценки и консалтинга	1244	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международная академия предпринимательства (институт)	1245	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международная высшая школа	1246	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международная гуманитарно-техническая академия (институт)	1247	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный банковский институт	1248	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный гуманитарно-лингвистический институт	1249	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный гуманитарный институт им. Е.П. Романовой	1250	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный институт XXI века	1251	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный институт бизнеса	1252	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный институт гостиничного менеджмента и туризма	1253	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный институт ИНФО-Рутения	1254	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный институт компьютерных технологий	1255	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный институт менеджмента ЛИНК	1256	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный институт отраслевого образования	1257	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный институт рекламы	1258	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный институт рынка	1259	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный институт экономики и права (г. Москва)	1260	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный независимый эколого-политологический университет	1261	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный славянский институт	1262	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный университет бизнеса и новых технологий (институт) (г. Ярославль)	1263	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный университет в Москве (гуманитарный)	1264	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный университет Кыргызстана	1265	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный университет природы	1266	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Международный юридический институт при Министерстве юстиции Российской Федерации	1267	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Междуреченский филиал Сибирского государственного индустриального университета	1268	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Межнациональный гуманитарно-технический институт Поволжья	1269	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Межотраслевой институт подготовки кадров и информации	1270	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Межотраслевой технологический институт	1271	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Межрегиональный институт экономики бизнеса и консалтинга (г. Москва)	1272	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Межрегиональный институт экономики и права	1273	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Межрегиональный открытый социальный институт	1274	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Миасский филиал Челябинского государственного университета	1275	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Минераловодский филиал Академии права и управления (института)	1276	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Минераловодский филиал Московского открытого социального университета (института)	1277	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Минский филиал Московского государственного университета экономики	1278	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мирнинский филиал Томского политехнического университета	1279	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Михайловская военная артиллерийская академия	1280	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Михайловский филиал Алтайского государственного университета (не лицензирован)	1281	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Михайловский филиал Волгоградского государственного педагогического университета	1282	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Михайловский филиал Волгоградского государственного университета	1283	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мичуринский государственный аграрный университет	1284	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мичуринский государственный педагогический институт	1285	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мичуринский филиал Брянской государственной сельскохозяйственной академии	1286	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мичуринский филиал Российского университета кооперации	1287	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Многоуровневый образовательный комплекс Воронежский экономико-правовой институт	1288	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Моздокский филиал Московской академии экономики и права	1289	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мончегорский филиал Мурманского государственного технического университета	1290	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мончегорский филиал Санкт-Петербургского государственного университета физической культуры им. П.Ф. Лесгафта	1291	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мордовский государственный педагогический институт имени М.Е. Евсевьева	1292	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мордовский государственный университет им. Н.П. Огарева	1293	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мордовский гуманитарный институт	1294	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Морская государственная академия имени адмирала Ф.Ф. Ушакова	1295	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Морской государственный университет имени адмирала Г.И. Невельского	1296	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Морской корпус Петра Великого - Санкт-Петербургский военно-морской институт	1297	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская академия государственного и муниципального управления	1298	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская академия комплексной безопасности (институт)	1299	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская академия образования Натальи Нестеровой	1300	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская академия предпринимательства при Правительстве г. Москвы	1301	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская академия рынка труда и информационных технологий	1302	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская академия туристского и гостинично-ресторанного бизнеса (институт) при Правительстве Москвы	1303	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская академия экономики и права	1304	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская богословская семинария евангельских христиан-баптистов	1305	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская высшая школа бизнеса (институт)	1306	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская государственная академия ветеринарной медицины и биотехнологии имени К.И. Скрябина	1307	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская государственная академия водного транспорта	1308	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская государственная академия тонкой химической технологии имени М.В. Ломоносова	1309	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская государственная академия физической культуры	1310	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская государственная академия хореографии	1311	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская государственная консерватория им. П.И. Чайковского	1312	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская государственная юридическая академия	1313	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская медицинская академия имени И.М. Сеченова Федерального агентства по здравоохранению и социальному развитию	1314	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская международная высшая школа бизнеса МИРБИС (Институт)	1315	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская пресвитерианская духовная академия	1316	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская финансово-промышленная академия	1317	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московская финансово-юридическая академия	1318	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский авиационный институт (государственный технический университет)	1319	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский автомобильно-дорожный институт (государственный технический университет)	1320	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский архитектурный институт (государственная академия)	1321	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский банковский институт	1322	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский бухгалтерский институт	1323	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский военный институт радиоэлектроники Космических войск	1324	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский городской институт бухгалтерского учета	1325	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский городской институт документоведения	1326	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский городской институт международного туризма	1327	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский городской институт права	1328	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский городской педагогический университет	1329	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский городской психолого-педагогический университет	1330	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский городской университет управления Правительства Москвы	1331	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский городской филиал Московского государственного университета сервиса	1332	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский городской финансовый институт	1333	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный агроинженерный университет имени В.П. Горячкина	1334	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный академический художественный институт им. В.И. Сурикова	1335	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный вечерний металлургический институт	1336	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный горный университет	1337	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный индустриальный университет	1338	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный институт делового администрирования	1339	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный институт международных отношений (Университет) Министерства иностранных дел Российской Федерации	1340	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный институт музыки имени А.Г. Шнитке	1341	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный институт радиотехники	1342	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный институт стали и сплавов (технологический университет)	1343	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный институт электроники и математики (технический университет)	1344	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный институт электронной техники (технический университет)	1345	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный лингвистический университет	1346	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный медико-стоматологический университет Федерального агентства по здравоохранению и социальному развитию	1347	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный областной педагогический институт	1348	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный областной университет	1349	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный открытый педагогический университет имени М.А. Шолохова	1350	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный открытый университет	1351	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный социально-гуманитарный институт	1352	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный строительный университет	1353	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный текстильный университет имени А.Н. Косыгина	1354	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный технический университет гражданской авиации	1355	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный технический университет имени Н.Э. Баумана	1356	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный технический университет МАМИ	1357	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный технологический университет Станкин	1358	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет геодезии и картографии	1359	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет дизайна и технологии	1360	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет имени М.В. Ломоносова	1361	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет инженерной экологии	1362	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет культуры и искусств	1363	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет леса	1364	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет печати	1365	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет пищевых производств	1366	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет приборостроения и информатики	1367	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет прикладной биотехнологии	1368	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет природообустройства	1369	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет путей сообщения	1370	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет сервиса	1371	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет технологий и управления	1372	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный университет экономики	1373	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский государственный художественно-промышленный университет им. С.Г. Строганова	1374	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский гуманитарно-экономический институт	1375	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский гуманитарный институт	1376	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский гуманитарный институт имени Е.Р. Дашковой	1377	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский гуманитарный педагогический институт	1378	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский гуманитарный университет	1379	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский инженерно-физический институт (государственный университет)	1380	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт банковского дела	1381	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт бухгалтерского учета и аудита	1382	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский Институт Государственного и Корпоративного Управления	1383	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский Институт Кинотелевизионных Искусств	1384	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт коммунального хозяйства и строительства	1385	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт лингвистики	1386	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт медико-социальной реабилитологии	1387	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт межгосударственных отношений	1388	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт международных экономических отношений	1389	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт национальной экономики	1390	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт национальных и региональных отношений	1391	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт открытого образования	1392	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт открытого образования имени Н.Н. Халаджана МЭГУ	1393	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт права	1394	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт предпринимательства и права	1395	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт рекламы	1396	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт телевидения и радиовещания Останкино	1397	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский Институт ТУРО	1398	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт управления	1399	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт управления и сервиса (МИУС)	1400	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт физической культуры и спорта	1401	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт экономики	1402	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт экономики	1403	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт энергобезопасности и энергосбережения	1404	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский институт юриспруденции	1405	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский Исламский Университет (Учреждение)	1406	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский киновидеоинститут (филиал) Санкт-Петербургского государственного университета кино и телевидения	1407	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижнекамский филиал Академии управления ТИСБИ	1544	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский международный университет бизнеса и информационных технологий	1408	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский налоговый институт	1409	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский новый юридический институт	1410	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский областной институт управления	1411	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский областной институт управления и права	1412	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский областной филиал Академии права и управления (института)	1413	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский областной филиал Восточного института экономики	1414	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский областной филиал Московского университета Министерства внутренних дел Российской Федерации	1415	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский областной филиал Московской финансово-юридической академии	1416	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский областной филиал Санкт-Петербургского Гуманитарного университета профсоюзов Институт искусств и информационных технологий	1417	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский открытый социальный университет (институт)	1418	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский открытый юридический институт	1419	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский педагогический государственный университет	1420	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский пограничный институт Федеральной службы безопасности Российской Федерации	1421	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский психолого-социальный институт	1422	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский региональный институт высшего социально-экономического образования	1423	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский социально-гуманитарный институт	1424	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский социально-педагогический институт	1425	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский социально-экономический институт	1426	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский теологический институт Российской Церкви христиан веры евангельской	1427	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский технический университет связи и информатики	1428	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский транспортный институт	1429	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский университет Министерства внутренних дел Российской Федерации	1430	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский физико-технический институт (государственный университет)	1431	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский филиал Высшей школы народных искусств (института) - МШХР	1432	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский филиал Дагестанского государственного университета (НЕ ЛИЦЕНЗИРОВАН - письмо ?0118326 от 01.03.06)	1433	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский филиал информационных технологий в туризме - филиал Российской международной академии туризма	1434	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский филиал Ленинградского государственного университета имени А.С. Пушкина	1435	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский филиал Негосударственного образовательного учреждения Международного института менеджемнта ЛИНК	1436	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский филиал Санкт-Петербургского Гуманитарного университета профсоюзов	1437	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский финансово-экономический институт	1438	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский художественно-промышленный институт	1439	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский экономико-лингвистический институт	1440	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский экономико-правовой институт	1441	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский экономико-финансовый институт	1442	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский экономический институт	1443	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский экономический институт (г. Москва)	1444	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский экономический институт Высшая школа Современное образование	1445	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московский энергетический институт (технический университет)	1446	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Московское высшее военное командное училище (военный институт)	1447	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Муниципальный институт г. Жуковского	1448	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманская академия экономики и управления	1449	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманский государственный педагогический университет	1450	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманский государственный технический университет	1451	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманский гуманитарный институт	1452	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманский институт экономики - филиал Санкт-Петербургской академии управления и экономики	1453	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманский филиал Государственной морской академии имени адмирала С.О. Макарова	1454	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманский филиал заочного обучения Санкт-Петербургского университета МВД России	1455	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманский филиал Московской академии предпринимательства при Правительстве г. Москвы	1456	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманский филиал Петербурского государственного университета путей сообщения	1457	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманский филиал Российского университета кооперации	1458	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманский филиал Санкт-Петербургского государственного университета водных коммуникаций	1459	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманский филиал Санкт-Петербургского Гуманитарного университета профсоюзов	1460	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманский филиал Северо-Западного государственного заочного технического университета	1461	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманский филиал Современной гуманитарной академии	1462	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мурманский филиал Юридического института (г. Санкт-Петербург)	1463	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Муромский институт (филиал) Владимирского государственного университета	1464	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Муромский филиал Российского государственного открытого технического университета путей сообщения	1465	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мценский филиал Орловского государственного технического университета	1466	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Мытищинский филиал Московского государственного строительного университета	1467	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Набережночелнинский государственный педагогический институт	1468	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Набережночелнинский государственный торгово-технологический институт	1469	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Набережночелнинский гуманитарный институт (находится в стадии ликвидации см. бумаги в деле)	1470	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Набережночелнинский филиал Академии управления ТИСБИ	1471	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Набережночелнинский филиал Института экономики	1472	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Набережночелнинский филиал Казанского государственного технического университета им. А.Н. Туполева	1473	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Набережночелнинский филиал Нижегородского государственного лингвистического университета	1474	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Набережночелнинский филиал Современной гуманитарной академии	1475	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Набережночелнинский филиал Татарского государственного гуманитарно-педагогического университета	1476	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Надымский филиал (г. Надым) Московского психолого-социального института	1477	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Назраньский филиал Современной гуманитарной академии	1478	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нальчикский филиал Белгородского университета потребительской кооперации	1479	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нальчикский филиал Краснодарского университета Министерства внутренних дел Российской Федерации	1480	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нальчикский филиал Современной гуманитарной академии	1481	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нарьян-Марский филиал Архангельского государственного технического университета	1482	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нарьян-Марский филиал Поморского государственного университета имени М.В. Ломоносова	1483	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Находкинский инженерно-экономический институт (филиал) Дальневосточного государственного технического университета (ДВПИ имени В.В. Куйбышева)	1484	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Находкинский филиал Дальневосточного государственного технического рыбохозяйственного университета	1485	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Находкинский филиал Современной гуманитарной академии	1486	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Национальный институт бизнеса	1487	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Национальный институт Высшая школа управления	1488	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Национальный Институт Дизайна	1489	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Национальный институт имени Екатерины Великой	1490	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Национальный институт моды	1491	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Национальный институт современного дизайна	1492	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Национальный открытый институт России г. Санкт-Петербург	1493	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Невинномысский государственный гуманитарно-технический институт	1494	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Невинномысский институт экономики	1495	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Невинномысский технологический институт (филиал) Северо-Кавказского государственного технического университета	1496	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Невский институт экспертологии	1497	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Невский институт языка и культуры	1498	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Независимый институт прикладного правоведения	1499	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Независимый Московский университет	1500	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нерюнгринский филиал Восточно-Сибирского государственного технологического университета (не лицензирован)	1501	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нерюнгринский филиал Санкт-Петербургского государственного университета водных коммуникаций	1502	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нефтекамский филиал Башкирского государственного университета	1503	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нефтекамский филиал Восточного института экономики	1504	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нефтеюганский филиал Омского государственного технического университета	1505	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нефтеюганский филиал Томского государственного университета систем управления и радиоэлектроники	1506	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородская академия Министерства внутренних дел Российской Федерации	1507	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородская государственная консерватория (академия) им. М.И. Глинки	1508	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	1509	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородская государственная сельскохозяйственная академия	1510	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородская правовая академия (институт)	1511	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский (г. Нижний Новгород) филиал Международного юридического института при Министерстве юстиции Российской Федерации	1512	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский государственный архитектурно-строительный университет	1513	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский государственный инженерно-экономический институт	1514	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский государственный лингвистический университет им. Н.А. Добролюбова	1515	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский государственный педагогический университет	1516	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский государственный технический университет	1517	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский государственный университет им. Н.И. Лобачевского	1518	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский институт менеджмента и бизнеса	1519	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский коммерческий институт	1520	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский филиал Академии труда и социальных отношений	1521	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский филиал Государственного университета - Высшей школы экономики	1522	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский филиал Гуманитарного института	1523	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский филиал Института бизнеса и политики	1524	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский филиал Международного независимого эколого-политологического университета	1525	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский филиал Международного славянского института	1526	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский филиал Московского гуманитарно-экономического института	1527	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский филиал Московского экономико-финансового института	1528	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский филиал Российского государственного открытого технического университета путей сообщения	1529	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский филиал Российского нового университета	1530	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский филиал Санкт-Петербургской государственной академии физической культуры им. П.Ф. Лесгафта (НЕТ ЛИЦЕНЗИИ	1531	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский филиал Современной гуманитарной академии	1532	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородский филиал Университета Российской академии образования	1533	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижегородское высшее военно-инженерное командное училище (военный институт)	1534	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижневартовский государственный гуманитарный университет	1535	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижневартовский филиал Института бизнеса и права	1536	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижневартовский филиал Омского государственного технического университета	1537	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижневартовский филиал Российской экономической академии им. Г.В. Плеханова	1538	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижневартовский филиал Сибирской государственной автомобильно-дорожной академии (СибАДИ)	1539	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижневартовский филиал Томского государственного университета систем управления и радиоэлектроники	1540	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижневартовский экономико-правовой институт (филиал) Тюменского государственного университета	1541	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижнекамский институт открытого образования	1542	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижнекамский муниципальный институт	1543	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижнекамский филиал Института экономики	1545	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижнекамский филиал Казанского государственного технического университета им. А.Н.Туполева	1546	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижнекамский филиал Московского гуманитарно-экономического института	1547	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижнекамский химико-технологический институт (филиал) Казанского государственного технологического университета	1548	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижнеломовский филиал Пензенского государственного университета	1549	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижнетагильская государственная социально-педагогическая академия	1550	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижнетагильский (г. Нижний Тагил Свердловской области) филиал Международного юридического института при Министерстве юстиции Российской Федерации	1551	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижнетагильский архитектурный институт (филиал) Уральской государственной архитектурно-художественной академии	1552	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижнетагильский технологический институт (филиал) Уральского государственного технического университета - УПИ	1553	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нижнетагильский филиал Уральского института экономики	1554	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новгородский государственный университет имени Ярослава Мудрого	1555	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новгородский институт государственного управления - филиал Санкт-Петербургского института управления и права	1556	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новгородский филиал заочного обучения Санкт-Петербургского университета МВД России	1557	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новгородский филиал Санкт-Петербургского государственного университета сервиса и экономики	1558	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новгородский филиал Санкт-Петербургского государственного университета экономики и финансов	1559	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новгородский филиал Современной гуманитарной академии	1560	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новоалтайский филиал Алтайского государственного технического университета им. И.И. Ползунова	1561	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нововаршавский филиал Омского государственного педагогического университета	1562	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новодвинский филиал Архангельского государственного технического университета	1563	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новокубанский филиал Кубанского государственного аграрного университета	1564	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новокузнецкий филиал - институт Кемеровского государственного университета	1565	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новокузнецкий филиал Российской международной академии туризма	1566	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новокузнецкий филиал Современной гуманитарной академии	1567	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новокузнецкий филиал Томского политехнического университета	1568	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новомосковский институт (филиал) Российского химико-технологического университета им. Д.И. Менделеева	1569	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новомосковский филиал Университета Российской академии образования	1570	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новороссийский политехнический институт (филиал) Кубанского государственного технологического университета	1571	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новороссийский филиал Адыгейского государственного университета	1572	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новороссийский филиал Краснодарского университета Министерства внутренних дел Российской Федерации	1573	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новороссийский филиал Московского гуманитарно-экономического института	1574	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новороссийский филиал Пятигорского государственного лингвистического университета	1575	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новороссийский филиал Современной гуманитарной академии	1576	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирская государственная академия водного транспорта	1577	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирская государственная архитектурно-художественная академия	1578	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирская государственная консерватория (академия) имени М.И. Глинки	1579	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский военный институт внутренних войск Министерства внутренних дел Российской Федерации	1580	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский государственный аграрный университет	1581	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский государственный архитектурно-строительный университет (Сибстрин)	1582	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский государственный медицинский университет Федерального агентства по здравоохранению и социальному развитию	1583	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института управления	2642	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский государственный педагогический университет	1584	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский государственный театральный институт	1585	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский государственный технический университет	1586	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский государственный университет	1587	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский государственный университет экономики и управления - НИНХ	1588	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский гуманитарный институт	1589	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский институт экономики и менеджмента	1590	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский институт экономики	1591	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский технологический институт Московского государственного университета дизайна и технологий (филиал)	1592	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский филиал Академии национальной безопасности	1593	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский филиал Московской финансово-юридической академии	1594	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский филиал образовательного учреждения Академия Гуманитарного Образования (находится в стадии ЛИЦЕНЗИРОВАНИЯ - письмо из ВУЗа ?645 от 13.09.05)	1595	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский филиал Российского государственного торгово-экономического университета	1596	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский филиал Российской академии предпринимательства	1597	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский филиал Санкт-Петербургской академии управления и экономики	1598	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский филиал Современной гуманитарной академии	1599	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский филиал Томского экономико-юридического института	1600	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирский юридический институт (филиал) Томского государственного университета	1601	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новосибирское высшее военное командное училище (военный институт)	1602	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новотроицкий филиал Московского государственного института стали и сплавов (технологического университета)	1603	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новоуральский государственный технологический институт	1604	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новоуральский филиал Современной гуманитарной академии	1605	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новоуренгойский филиал Московского открытого социального университета (института)	1606	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новоуренгойский филиал Российского нового университета	1607	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новочебоксарский филиал Московского государственного университета прикладной биотехнологии	1608	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новочеркасская государственная мелиоративная академия	1609	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новочеркасский филиал Современной гуманитарной академии	1610	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новочеркасское высшее военное командное училище связи (военный институт) имени Маршала Советского Союза В.Д. Соколовского	1611	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новошахтинский филиал Южно-Российского государственного технического университета (Новочеркасского политехнического института)	1612	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новый гуманитарный институт	1613	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новый институт социальных коммуникаций	1614	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Новый сибирский институт	1615	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ногинский филиал Московской академии государственного и муниципального управления	1616	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нолинский филиал Вятской государственной сельскохозяйственной академии	1617	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Норильский индустриальный институт	1618	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Норильский филиал Кисловодского института экономики и права	1619	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Норильский филиал Современной гуманитарной академии	1620	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ноябрьский филиал Московского открытого социального университета (института)	1621	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ноябрьский филиал Новосибирского государственного технического университета	1622	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Нурлатский филиал Казанской государственной сельскохозяйственной академии (не ведется образовательная деятельность)	1623	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Обнинский государственный технический университет атомной энергетики	1624	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Обнинский институт искусств	1625	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Обнинский филиал Российского нового университета	1626	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Обнинский филиал Современной гуманитарной академии	1627	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Образовательный научный центр Институт эргономики и социально-экономических технологий	1628	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Общевойсковая академия Вооруженных Сил Российской Федерации	1629	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Одинцовский (г. Одинцово Московской области) филиал Международного юридического института при Министерстве юстиции Российской Федерации	1630	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Одинцовский гуманитарный университет	1631	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Одинцовский филиал Российской международной академии туризма	1632	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Одинцовский филиал Центр профессиональной переподготовки и повышения квалификации Московской академии государственного и муниципального управления	1633	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Озерский технологический институт (филиал) Московского инженерно-физического института (государственного университета)	1634	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Озерский филиал Уральского государственного лесотехнического университета	1635	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Октемский филиал Якутской государственной сельскохозяйственной академии	1636	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Октябрьский филиал Современной гуманитарной академии	1637	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Октябрьский филиал Уфимской государственной академии экономики и сервиса	1638	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Олекминский филиал Якутской государственной сельскохозяйственной академии	1639	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Олимпийский институт	1640	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
ОМНИ-колледж	1641	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омская академия Министерства внутренних дел Российской Федерации	1642	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	1643	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский государственный аграрный университет	1644	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский государственный институт сервиса	1645	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский государственный педагогический университет	1646	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский государственный технический университет	1647	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский государственный университет им. Ф.М. Достоевского	1648	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский государственный университет путей сообщения	1649	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский гуманитарный институт	1650	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский институт (филиал) Российского государственного торгово-экономического университета	1651	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский институт иностранных языков Ин.яз.-Омск	1652	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский региональный институт	1653	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский танковый инженерный институт	1654	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский терминологический центр - Институт терминологии и перевода	1655	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский филиал Академии бюджета и казначейства Министерства финансов Российской Федерации	1656	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский филиал Института иностранных языков (г. Москва)	1657	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский филиал Московской финансово-промышленной академии	1658	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский филиал Новосибирской государственной академии водного транспорта	1659	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский филиал Сибирского университета потребительской кооперации	1660	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский филиал Современной гуманитарной академии	1661	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский экономический институт	1662	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Омский юридический институт	1663	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	1664	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский государственный аграрный университет	1665	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский государственный институт искусств имени Леопольда и Мстислава Ростроповичей	1666	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский государственный институт менеджмента	1667	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский государственный педагогический университет	1668	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский государственный университет	1669	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский гуманитарно-технологический институт	1670	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский институт (филиал) Московской государственной юридической академии	1671	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский институт бизнеса и управления	1672	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский институт экономики и культуры	1673	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский медицинский колледж - филиал Самарской государственной академии путей сообщения	1674	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский муниципальный высший естественно-гуманитарный колледж (институт)	1675	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский филиал Академии национальной безопасности	1676	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский филиал Академии труда и социальных отношений	1677	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский филиал Института бизнеса и политики	1678	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский филиал Поволжской государственной академии телекоммуникаций и информатики	1679	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский филиал Российского государственного торгово-экономического университета	1680	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургский филиал Современной гуманитарной академии	1681	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Оренбургское высшее зенитное ракетное училище (военный институт)	1682	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орехово-Зуевский филиал Института экономики и предпринимательства	1683	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орехово-Зуевский филиал Московской международной высшей школы бизнеса МИРБИС (Институт)	1684	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орехово-Зуевский филиал Российского нового университета	1685	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орловская региональная академия государственной службы	1686	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орловский государственный аграрный университет	1687	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орловский государственный институт искусств и культуры	1688	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орловский государственный институт экономики и торговли	1689	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орловский государственный технический университет	1690	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орловский государственный университет	1691	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орловский институт Знание	1692	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орловский филиал Современной гуманитарной академии	1693	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орловский юридический институт Министерства внутренних дел Российской Федерации	1694	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орский гуманитарно-технологический институт (филиал) Оренбургского государственного университета	1695	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орский политехнический колледж (филиал) Оренбургского государственного университета	1696	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орский филиал Московской финансово-юридической академии	1697	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орский филиал Оренбургского государственного института менеджмента	1698	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Орский филиал Российского университета инноваций (института)	1699	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Осинниковский филиал Сибирского государственного индустриального университета	1700	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Осинский филиал Пермского государственного педагогического университета	1701	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Останкинский институт телевидения и радиовещания	1702	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Осташковский финансово-экономический колледж - филиал Финансовой академии при Правительстве Российской Федерации	1703	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Открытый гуманитарный институт	1704	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Открытый институт (филиал) Самарского государственного архитектурно-строительного университета в г. Похвистнево	1705	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Открытый Институт Муниципальных Проблем	1706	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Открытый Социальный Университет им. С. Стальского	1707	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Открытый университет профессиональных инноваций	1708	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Открытый юридический институт	1709	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Отрадненский гуманитарный институт	1710	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ошский филиал Международного университета Кыргызстана	1711	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ошский филиал Московского института предпринимательства и права	1712	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Павлово-Посадский филиал Российской международной академии туризма	1713	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Павлово-Посадский филиал Современной гуманитарной академии	1714	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Павловский филиал Воронежского государственного педагогического университета (находится в стадии ЛИКВИДАЦИИ - письмо из ВУЗа ? 05722 от 13.09.05)	1715	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Павловский филиал Нижегородского государственного технического университета	1716	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Павловский филиал Нижегородского государственного университета им. Н.И. Лобачевского	1717	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пензенская государственная сельскохозяйственная академия	1718	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пензенская государственная технологическая академия	1719	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пензенский артиллерийский инженерный институт	1720	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пензенский государственный педагогический университет имени В.Г. Белинского	1721	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пензенский государственный университет	1722	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пензенский государственный университет архитектуры и строительства	1723	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пензенский региональный центр высшей школы (филиал) Российского государственного университета инновационных технологий и предпринимательства	1724	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пензенский филиал заочного обучения Саратовского юридического института Министерства внутренних дел Российской Федерации	1725	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пензенский филиал Международного независимого эколого-политологического университета	1726	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пензенский филиал Московского открытого социального университета (института)	1727	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пензенский филиал Нижегородского коммерческого института	1728	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пензенский филиал Современной гуманитарной академии	1729	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Первый Московский юридический институт	1730	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермская государственная медицинская академия имени академика Е.А. Вагнера Федерального агентства по здравоохранению и социальному развитию	1731	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермская государственная сельскохозяйственная академия имени академика Д.Н. Прянишникова	1732	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермская государственная фармацевтическая академия Министерства здравоохранения Российской Федерации	1733	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский военный институт внутренних войск Министерства внутренних дел Российской Федерации	1734	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский государственный институт искусства и культуры	1735	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский государственный педагогический университет	1736	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский государственный технический университет	1737	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский государственный университет	1738	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский гуманитарно-технологический институт	1739	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский институт (филиал) Российского государственного торгово-экономического университета	1740	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский институт экономики и финансов	1741	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский региональный институт педагогических информационных технологий	1742	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский филиал Академии права и управления (института)	1743	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский филиал Волжской государственной академии водного транспорта	1744	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский филиал Высшей школы приватизации и предпринимательства - института	1745	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский филиал Государственного университета - Высшей школы экономики	1746	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский филиал Евразийского открытого института	1747	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский филиал Московской академии предпринимательства при Правительстве г. Москвы	1748	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский филиал Негосударственного образовательного учреждения Международного института менеджмента ЛИНК	1749	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский филиал Нижегородской академии Министерства внутренних дел Российской Федерации	1750	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский филиал Современной гуманитарной академии	1751	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пермский финансово-экономический колледж - филиал Финансовой академии при Правительстве Российской Федерации	1752	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петербургский государственный университет путей сообщения	1753	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петербургский институт иудаики	1754	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петровский филиал Саратовского государственного социально-экономического университета	1755	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петрозаводская государственная консерватория (институт) имени А.К. Глазунова	1756	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петрозаводский государственный университет	1757	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петрозаводский филиал заочного обучения Санкт-Петербургского университета МВД России	1758	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петрозаводский филиал Международного Славянского Института	1759	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петрозаводский филиал Петербургского государственного университета путей сообщения	1760	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петрозаводский филиал Санкт-Петербургского государственного университета водных коммуникаций	1761	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петрозаводский филиал Санкт-Петербургской академии управления и экономики	1762	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петрозаводский филиал Северо-Западного государственного заочного технического университета	1763	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петрозаводский филиал Современной гуманитарной академии	1764	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарская государственная академия культуры и искусств	1942	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петрозаводский филиал Юридического института (г. Санкт-Петербург) (преобразован в представительство Приказ ? 25 от 9.08.2005 по вузу)	1765	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петропавловск-Камчатский филиал заочного обучения Дальневосточного юридического института Министерства внутренних дел Российской Федерации	1766	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Петропавловск-Камчатский филиал Современной гуманитарной академии	1767	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Печорский филиал Московской государственной академии водного транспорта	1768	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пикалевский филиал Санкт-Петербургской академии управления и экономики	1769	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Поволжская академия государственной службы имени П.А. Столыпина	1770	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Поволжская государственная академия телекоммуникаций и информатики	1771	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Поволжский (г. Саратов) юридический институт (филиал) Российской правовой академии Министерства юстиции Российской Федерации	1772	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Поволжский институт бизнеса	1773	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Поволжский кооперативный институт (филиал) Российского университета кооперации	1774	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Поволжский филиал Международного университета в Москве (гуманитарного)	1775	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Поволжский филиал Российского государственного открытого технического университета путей сообщения в г. Саратове	1776	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пограничная академия Федеральной службы безопасности Российской Федерации	1777	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Подмосковный филиал Московского государственного университета им. М.В. Ломоносова (г. Черноголовка Московской области)	1778	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Подольский институт (филиал) Московского государственного открытого университета	1779	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Подольский колледж сервиса (филиал) Московского государственного университета сервиса	1780	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Подольский корпоративный социально-спортивный университет	1781	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Подольский филиал Современной гуманитарной академии	1782	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Покровский филиал Московского государственного открытого педагогического университета имени М.А. Шолохова	1783	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Полевской филиал Уральского института экономики	1784	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Политехнический институт (филиал) Уральского государственного технического университета - УПИ в г. Каменске-Уральском	1785	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Политехнический институт (филиал) Якутского государственного университета имени М.К. Аммосова в г. Мирном	1786	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Поморский государственный университет имени М.В. Ломоносова	1787	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Православный Свято-Тихоновский Гуманитарный Университет	1788	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пражский филиал Московского института предпринимательства и права	1789	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Приамурский институт агроэкономики и бизнеса	1790	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Приволжский филиал Российской академии правосудия (г. Нижний Новгород)	1791	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Приднестровский государственный университет им. Т.Г. Шевченко	1792	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Прикамский социальный институт	1793	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Прикамский филиал Московского открытого социального университета (института)	1794	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Приладожский филиал Петрозаводского государственного университета	1795	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Приморская государственная сельскохозяйственная академия	1796	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Приморский институт железнодорожного транспорта - филиал Дальневосточного государственного университета путей сообщения в г. Уссурийске	1797	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Приморский филиал Сибирского университета потребительской кооперации	1798	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Прокопьевский филиал Сибирского государственного индустриального университета	1799	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Протвинский филиал Международной академии бизнеса и управления	1800	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Профессиональный институт управления	1801	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Профессиональный институт юриспруденции	1802	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Прохладненский филиал Международной гуманитарно-технической академии	1803	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Псковский вольный институт	1804	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Псковский государственный педагогический университет имени С.М. Кирова	1805	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Псковский государственный политехнический институт	1806	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Псковский институт государственного управления - филиал Санкт-Петербургского института управления и права	1807	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Псковский филиал Академии права и управления (института)	1808	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Псковский филиал заочного обучения Санкт-Петербургского университета МВД России	1809	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Псковский филиал Московского открытого социального университета (института)	1810	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Псковский филиал Российской международной академии туризма	1811	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Псковский филиал Санкт-Петербургского государственного университета сервиса и экономики	1812	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Псковский филиал Санкт-Петербургской академии управления и экономики	1813	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Псковский филиал Современной гуманитарной академии	1814	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Псковский юридический институт Федеральной службы исполнения наказаний	1815	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пушкинский филиал Современной гуманитарной академии	1816	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пущинский государственный университет	1817	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пятигорская государственная фармацевтическая академия Министерства здравоохранения Российской Федерации	1818	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пятигорский государственный лингвистический университет	1819	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пятигорский государственный технологический университет	1820	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пятигорский институт курортной рекреации и гостеприимства филиал Российской международной академии туризма	1821	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пятигорский филиал Российского государственного торгово-экономического университета	1822	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пятигорский филиал Российского нового университета	1823	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пятигорский филиал Санкт-Петербургского государственного университета аэрокосмического приборостроения	1824	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пятигорский филиал Северо-Кавказской академии государственной службы	1825	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Пятигорский филиал Современной гуманитарной академии	1826	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Раменский филиал Современной гуманитарной академии	1827	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Региональный институт психологии и гуманитарных наук	1828	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Региональный институт развития открытого образования	1829	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Региональный открытый социальный институт	1830	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Региональный финансово-экономический институт	1831	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Реутовский (г. Реутов Московской области) филиал Международного юридического института при Министерстве юстиции Российской Федерации	1832	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Реутовский филиал Международной академии маркетинга и менеджмента (института) МАМАРМЕН	1833	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ровеньский филиал Белгородского университета потребительской кооперации	1834	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российская Академия адвокатуры. (Институт)	1835	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российская академия государственной службы при Президенте Российской Федерации	1836	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российская академия живописи	1837	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российская академия музыки имени Гнесиных	1838	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российская академия правосудия	1839	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российская академия предпринимательства	1840	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российская академия театрального искусства - ГИТИС	1841	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российская международная академия туризма	1842	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российская правовая академия Министерства юстиции Российской Федерации	1843	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российская таможенная академия	1844	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российская школа частного права (институт)	1845	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российская экономическая академия им. Г.В. Плеханова	1846	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российская экономическая школа (институт)	1847	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный аграрный заочный университет	1848	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный аграрный университет - МСХА имени К.А. Тимирязева	1849	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный геологоразведочный университет имени Серго Орджоникидзе	1850	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный гидрометеорологический университет	1851	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный гуманитарный университет	1852	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный институт интеллектуальной собственности	1853	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный медицинский университет Федерального агентства по здравоохранению и социальному развитию	1854	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный открытый технический университет путей сообщения	1855	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный педагогический университет им. А.И. Герцена	1856	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный профессионально-педагогический университет	1857	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный социальный университет	1858	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный торгово-экономический университет	1859	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный университет имени Иммануила Канта	1860	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный университет инновационных технологий и предпринимательства	1861	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный университет нефти и газа имени И.М. Губкина	1862	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский государственный университет физической культуры	1863	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский заочный институт текстильной и легкой промышленности	1864	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский исламский университет (г. Казань)	1865	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский новый университет	1866	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский православный институт святого Иоанна Богослова	1867	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский университет дружбы народов	1868	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский университет инноваций (институт)	1869	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский университет кооперации	1870	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российский химико-технологический университет имени Д.И. Менделеева	1871	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российско-Армянский (Славянский) университет	1872	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российско-германский институт экономики и международных отношений	1873	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Российско-Таджикский (славянский) университет	1874	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Россошанский филиал Современной гуманитарной академии	1875	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовская государственная академия архитектуры и искусства	1876	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовская государственная консерватория (академия) имени С.В. Рахманинова	1877	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовская-на-Дону государственная академия сельскохозяйственного машиностроения	1878	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский военный институт ракетных войск имени Главного маршала артиллерии М.И. Неделина	1879	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский государственный медицинский университет Федерального агентства по здравоохранению и социальному развитию	1880	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский государственный педагогический университет	1881	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский государственный строительный университет	1882	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский государственный университет путей сообщения	1883	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский государственный экономический университет РИНХ	1884	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский институт (филиал) Российского государственного торгово-экономического университета	1885	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский институт защиты предпринимателя	1886	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский институт иностранных языков	1887	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский институт прикладной информатики	1888	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский институт сервиса (филиал) Южно-Российского государственного университета экономики и сервиса	1889	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский международный институт экономики и управления	1890	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский социально-экономический институт	1891	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский филиал Белгородского университета потребительской кооперации	1892	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский филиал Волжской государственной академии водного транспорта	1893	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский филиал Московского государственного технического университета гражданской авиации	1894	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский филиал Российской академии правосудия (г. Ростов-на-Дону)	1895	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский филиал Российской таможенной академии	1896	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский филиал Санкт-Петербургского государственного университета культуры и искусств	1897	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский филиал Современной гуманитарной академии	1898	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский филиал Южно-Российского государственного технического университета (Новочеркасского политехнического института)	1899	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский финансово-экономический колледж - филиал Финансовой академии при Правительстве Российской Федерации	1900	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский юридический институт (филиал Российской правовой академии Министерства юстиции Российской Федерации) г. Ростов-на-Дону	1901	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский юридический институт Министерства внутренних дел Российской Федерации	1902	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский-на-Дону институт физической культуры и спорта (филиал) Кубанского государственного университета физической культуры	1903	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ростовский-на-Дону филиал Московской академии предпринимательства при Правительстве г. Москвы	1904	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рубцовский индустриальный институт (филиал) Алтайского государственного технического университета им. И.И. Ползунова	1905	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рубцовский филиал Университета Российской академии образования	1906	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рузаевский институт машиностроения (филиал) Мордовского государственного университета им. Н.П. Огарева	1907	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Русская Христианская Гуманитарная Академия	1908	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Русский институт управления	1909	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Русско-американский христианский институт	1910	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Русско-немецкий университет	1911	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рыбинская государственная авиационная технологическая академия имени П.А. Соловьева	1912	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рыбинский филиал Современной гуманитарной академии	1913	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рыбницкий филиал Приднестровского государственного университета им. Т.Г. Шевченко	1914	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рыльский филиал Курского института менеджмента	1915	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рыльский филиал Современной гуманитарной академии	1916	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанская государственная сельскохозяйственная академия имени профессора П.А. Костычева	1917	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский военный автомобильный институт имени генерала армии В.П. Дубынина	1918	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский государственный медицинский университет имени академика И.П. Павлова Федерального агентства по здравоохранению и социальному развитию	1919	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский государственный радиотехнический университет	1920	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский государственный университет имени С.А. Есенина	1921	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский заочный институт (филиал) Московского государственного университета культуры и искусств	1922	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский институт (филиал) Московского государственного открытого университета	1923	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский институт бизнеса и управления	1924	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский институт открытого образования	1925	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский институт управления и права	1926	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский филиал Академии права и управления (института)	1927	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский филиал Академического правового университета (института)	1928	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский филиал Московского государственного университета экономики	1929	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский филиал Московского психолого-социального института	1930	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский филиал Московского университета Министерства внутренних дел Российской Федерации	1931	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский филиал Московской академии экономики и права	1932	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский филиал Российского государственного открытого технического университета путей сообщения	1933	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский филиал Санкт-Петербургской академии управления и экономики	1934	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанский филиал Современной гуманитарной академии	1935	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанское высшее военное командное училище связи (военный институт) имени Маршала Советского Союза М.В. Захарова	1936	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Рязанское высшее воздушно-десантное командное училище (военный институт) имени генерала армии В.Ф. Маргелова Министерства обороны Российской Федерации	1937	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Салаватский гуманитарный институт	1938	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Салаватский филиал Уфимской государственной академии экономики и сервиса	1939	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Салехардский филиал Тюменской государственной сельскохозяйственной академии	1940	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Салехардский филиал Уральского института коммерции и права	1941	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарская государственная академия путей сообщения	1943	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарская государственная сельскохозяйственная академия	1944	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарская гуманитарная академия	1945	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский военно-медицинский институт	1946	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский государственный архитектурно-строительный университет	1947	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский государственный аэрокосмический университет имени академика С.П. Королева	1948	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский государственный медицинский университет Федерального агентства по здравоохранению и социальному развитию	1949	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Поволжская государственная социально-гуманитарная академия	1950	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский государственный технический университет	1951	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский государственный университет	1952	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский государственный экономический университет	1953	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский институт (филиал) Российского государственного торгово-экономического университета	1954	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский институт бизнеса и управления	1955	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский институт журналистики	1956	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский институт медико-социальной реабилитологии	1957	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский институт открытого образования	1958	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский институт права	1959	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский институт управления	1960	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский медицинский институт РЕАВИЗ	1961	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский муниципальный институт управления	1962	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский муниципальный университет Наяновой	1963	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский филиал Волжской государственной академии водного транспорта	1964	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский филиал Восточного института экономики	1965	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский филиал Высшей школы приватизации и предпринимательства - института	1966	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский филиал Московского городского педагогического университета	1967	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский филиал Новгородского государственного университета имени Ярослава Мудрого	1968	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский филиал Санкт-Петербургского Гуманитарного университета профсоюзов	1969	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский филиал Саратовского юридического института Министерства внутренних дел Российской Федерации	1970	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский филиал Современной гуманитарной академии	1971	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский филиал Университета Российской академии образования	1972	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский финансово-экономический колледж - филиал Финансовой академии при Правительстве Российской Федерации	1973	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Самарский юридический институт Федеральной службы исполнения наказаний	1974	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургская академия управления и экономики	1975	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургская акмеологическая академия (институт)	1976	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургская археологическая академия	1977	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургская государственная академия ветеринарной медицины	1978	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургская государственная академия театрального искусства	1979	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургская государственная консерватория (академия) им. Н.А. Римского-Корсакова	1980	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургская государственная лесотехническая академия имени С.М. Кирова	1981	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургская государственная медицинская академия им. И.И. Мечникова Федерального агентства по здравоохранению и социальному развитию	1982	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургская государственная педиатрическая медицинская академия Федерального агентства по здравоохранению и социальному развитию	1983	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургская государственная химико-фармацевтическая академия Федерального агентства по здравоохранению и социальному развитию	1984	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургская государственная художественно-промышленная академия	1985	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургская юридическая академия	1986	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский военный институт внутренних войск Министерства внутренних дел Российской Федерации	1987	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сергиево-Посадский гуманитарный институт	2116	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный аграрный университет	1988	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный академический институт живописи	1989	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный архитектурно-строительный университет	1990	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный горный институт имени Г.В. Плеханова (технический университет)	1991	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный инженерно-экономический университет	1992	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный институт психологии и социальной работы	1993	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный медицинский университет имени академика И.П. Павлова Федерального агентства по здравоохранению и социальному развитию	1994	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный морской технический университет	1995	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный политехнический университет	1996	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный технологический институт (технический университет)	1997	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный технологический университет растительных полимеров	1998	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный университет	1999	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный университет аэрокосмического приборостроения	2000	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный университет водных коммуникаций	2001	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный университет гражданской авиации	2002	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный университет информационных технологий	2003	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный университет кино и телевидения	2004	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный университет культуры и искусств	2005	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный университет низкотемпературных и пищевых технологий	2006	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный университет сервиса и экономики	2007	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный университет телекоммуникаций им. проф. М.А. Бонч-Бруевича	2008	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный университет технологии и дизайна	2009	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный университет физической культуры имени П.Ф. Лесгафта	2010	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный университет экономики и финансов	2011	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский государственный электротехнический университет ЛЭТИ имени В.И. Ульянова (Ленина)	2012	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский гуманитарный институт	2013	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский Гуманитарный университет профсоюзов	2014	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский имени В.Б. Бобкова филиал Российской таможенной академии	2015	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский институт внешнеэкономических связей	2016	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский институт гостеприимства	2017	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский институт гуманитарного образования	2018	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский институт машиностроения (ЛМЗ-ВТУЗ)	2019	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский институт права имени Принца П.Г. Ольденбургского	2020	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский институт управления и права	2021	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский институт управления персоналом	2022	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский институт экономики и управления	2023	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский институт экономики	2024	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский институт экспертов	2025	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский медико-технический институт	2026	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский международный институт менеджмента	2027	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский социально-экономический институт	2028	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский терапевтический институт	2029	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский торгово-экономический институт	2030	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский университет Государственной противопожарной службы Министерства Российской Федерации по делам гражданской обороны	2031	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский университет Министерства внутренних дел Российской Федерации	2032	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский филиал Государственного университета - Высшей школы экономики	2033	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский филиал Института бизнеса и политики (ИБП)	2034	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский филиал Негосударственного образовательного учреждения Международный институт менеджмента ЛИНК - Открытая школа бизнеса	2035	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский филиал Современной гуманитарной академии	2036	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургский юридический институт Генеральной прокуратуры Российской Федерации	2037	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Санкт-Петербургское высшее военное училище радиоэлектроники (военный институт)	2038	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саранский кооперативный институт (филиал) Российского университета кооперации	2039	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саранский филиал Нижегородской академии Министерства внутренних дел Российской Федерации	2040	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саранский филиал Современной гуманитарной академии	2041	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сарапульский политехнический институт (филиал) Ижевского государственного технического университета	2042	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовская государственная академия права	2043	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовская государственная консерватория (институт) имени Л.В. Собинова	2044	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовский военно-медицинский институт	2045	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовский военный институт внутренних войск Министерства внутренних дел Российской Федерации	2046	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовский военный институт радиационной	2047	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовский государственный аграрный университет имени Н.И. Вавилова	2048	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовский государственный медицинский университет Федерального агентства по здравоохранению и социальному развитию	2049	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовский государственный социально-экономический университет	2050	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовский государственный технический университет	2051	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовский государственный университет имени Н.Г. Чернышевского	2052	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовский институт (филиал) Российского государственного торгово-экономического университета	2053	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовский институт бизнеса и информационных технологий	2054	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовский филиал Международной академии бизнеса и управления	2055	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовский филиал Современной гуманитарной академии	2056	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовский юридический институт адвокатуры	2057	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саратовский юридический институт Министерства внутренних дел Российской Федерации	2058	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саровский государственный физико-технический институт	2059	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саровский филиал Международного института менеджмента ЛИНК	2060	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саровский филиал Современной гуманитарной академии	2061	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саха государственная педагогическая академия	2062	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сахалинский государственный университет	2063	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сахалинский институт железнодорожного транспорта - филиал Дальневосточного государственного университета путей сообщения в г. Южно-Сахалинске	2064	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сахалинский филиал Морского государственного университета имени адмирала Г.И. Невельского	2065	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Саяно-Шушенский филиал Сибирского федерального университета	2066	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Свердловский филиал Московской международной высшей школы бизнеса МИРБИС (Институт)	2067	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Светский институт народов Кавказа	2068	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Свято-Филаретовский православно-христианский институт	2069	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Себряковский филиал Волгоградского государственного архитектурно-строительного университета	2070	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Севастопольский филиал Санкт-Петербургского Гуманитарного университета профсоюзов	2071	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Севастопольский филиал Саратовского государственного социально-экономического университета	2072	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северный (г. Петрозаводск) филиал Российской правовой академии Министерства юстиции Российской Федерации	2073	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сердобский филиал Пензенского государственного университета	2117	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северный государственный медицинский университет (г. Архангельск) Федерального агентства по здравоохранению и социальному развитию	2074	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северный институт предпринимательства	2075	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северный институт экономики и управления (находится в стадии ликвидации с15.12.2005)	2076	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северный международный университет	2077	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северный филиал в г. Великий Новгород Российского государственного университета инновационных технологий и предпринимательства	2078	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северный филиал Московского гуманитарно-экономического института	2079	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северный филиал Новосибирского государственного аграрного университета	2080	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Восточный гуманитарный институт	2081	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северодвинский филиал Поморского государственного университета имени М.В. Ломоносова	2082	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северодвинский филиал Современной гуманитарной академии	2083	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Западная академия государственной службы	2084	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Западный (г. Санкт-Петербург) филиал Российской правовой академии Министерства юстиции Российской Федерации	2085	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Западный государственный заочный технический университет	2086	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Западный институт инжиниринга	2087	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Западный филиал Международного университета в Москве (гуманитарного)	2088	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Западный филиал Московского гуманитарно-экономического института	2089	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Западный филиал Российской академии правосудия (г. Санкт-Петербург)	2090	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказская академия государственной службы	2091	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский (г. Махачкала) филиал Российской правовой академии Министерства юстиции Российской Федерации	2092	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский военный институт внутренних войск Министерства внутренних дел Российской Федерации	2093	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский горно-металлургический институт (государственный технологический университет)	2094	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский государственный институт искусств	2095	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский государственный налоговый институт - филиал Всероссийской государственной налоговой академии Министерства финансов Российской Федерации в г. Махачкале	2096	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский государственный технический университет	2097	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский гуманитарно-технический институт	2098	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский гуманитарный институт	2099	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский гуманитарный институт (г. Георгиевск)	2100	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский Гуманитарный Университет	2101	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский институт антропологии и прикладной психологии	2102	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский институт бизнеса	2103	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский социальный институт	2104	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский филиал Белгородского государственного технологического университета им. В.Г. Шухова (г. Минеральные Воды)	2105	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский филиал Московского автомобильно-дорожного института (государственного технического университета)	2106	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский филиал Московского гуманитарно-экономического института	2107	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский филиал Московского технического университета связи и информатики	2108	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кавказский филиал Российской академии правосудия (г. Краснодар)	2109	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Кубанский гуманитарно-технологический институт	2110	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Осетинская государственная медицинская академия Министерства здравоохранения Российской Федерации	2111	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Осетинский государственный педагогический институт Министерства общего и профессионального образования РСО-Алания	2112	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Осетинский государственный университет имени Коста Левановича Хетагурова	2113	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северо-Осетинский институт экологии и безопасности жизнедеятельности	2114	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Северская государственная технологическая академия	2115	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Серпуховской военный институт ракетных войск	2118	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Серпуховской филиал Московской Академии государственного и муниципального управления	2119	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Серпуховской филиал Современной гуманитарной академии	2120	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибайский институт (филиал) Башкирского государственного университета	2121	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирская академия государственной службы	2122	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирская академия управления и массовых коммуникаций (институт)	2123	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирская государственная автомобильно-дорожная академия (СибАДИ)	2124	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирская государственная геодезическая академия	2125	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский государственный аэрокосмический университет имени академика М.Ф. Решетнева	2126	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский государственный индустриальный университет	2127	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский государственный медицинский университет Федерального агентства по здравоохранению и социальному развитию	2128	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский государственный технологический университет	2129	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский государственный университет путей сообщения	2130	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский государственный университет телекоммуникаций и информатики	2131	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский государственный университет физической культуры и спорта	2132	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский институт бизнеса и информационных технологий	2133	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский институт бизнеса и новых технологий Надежда	2134	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский институт бизнеса	2135	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский институт международных отношений и регионоведения	2136	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский институт права	2137	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский институт финансов и банковского дела	2138	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский институт фондового рынка	2139	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский независимый институт	2140	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский университет потребительской кооперации	2141	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский федеральный университет	2142	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский филиал Международного института экономики и права	2143	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сибирский юридический институт Министерства внутренних дел Российской Федерации (г. Красноярск)	2144	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Славянский деловой институт имени К.В. Нечаева (Митрополита Питирима)	2145	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Славянский филиал Кубанского государственного аграрного университета	2146	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Славянский-на-Кубани государственный педагогический институт	2147	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сланцевский филиал Северо-Западного государственного заочного технического университета	2148	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Слободской филиал Вятского социально-экономического института	2149	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленская государственная академия физической культуры	2150	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленская государственная медицинская академия Министерства здравоохранения Российской Федерации	2151	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленская государственная сельскохозяйственная академия	2152	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленская православная духовная семинария	2153	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский (г. Смоленск) филиал Международного юридического института при Министерстве юстиции Российской Федерации	2154	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский государственный институт искусств	2155	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский государственный университет	2156	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский гуманитарный университет	2157	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский институт бизнеса и предпринимательства	2158	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский институт экономики - филиал Санкт-Петербургской академии управления и экономики	2159	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский колледж телекоммуникаций (филиал) Санкт - Петербургского государственного университета телекоммуникаций им. проф. М.А. Бонч-Бруевича	2160	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский филиал Академии права и управления (института)	2161	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский филиал Всероссийского заочного финансово-экономического института	2162	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский филиал Московского автомобильно-дорожного института (государственного технического университета)	2163	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сызранский филиал Самарского государственного экономического университета	2254	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский филиал Московского университета Министерства внутренних дел Российской Федерации	2164	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский филиал Московской академии экономики и права	2165	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский филиал Российского государственного открытого технического университета путей сообщения	2166	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский филиал Российского университета кооперации	2167	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский филиал Саратовской государственной академии права	2168	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смоленский филиал Современной гуманитарной академии	2169	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Смольный университет	2170	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Снежинская государственная физико-техническая академия	2171	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Советский филиал Уральского государственного лесотехнического университета	2172	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Советско-Гаваньский филиал Современной гуманитарной академии	2173	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Современная гуманитарная академия	2174	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Современный институт управления	2175	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Современный технический институт	2176	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Соликамский государственный педагогический институт	2177	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Соликамский филиал Современной гуманитарной академии	2178	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сосновоборский филиал Санкт-Петербургского государственного университета аэрокосмического приборостроения	2179	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сосновоборский филиал Санкт-Петербургского государственного университета сервиса и экономики	2180	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сосновоборский филиал Санкт-Петербургского института машиностроения (ЛМЗ-ВТУЗ)	2181	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сосновоборский филиал Северо-Западного государственного заочного технического университета	2182	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Социально-педагогический центр Орленок (филиал) Сочинского государственного университета туризма и курортного дела	2183	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Социально-правовой институт экономической безопасности	2184	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Социально-экономический институт	2185	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Социально-экономический институт	2186	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Социальный университет	2187	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сочинский государственный университет туризма и курортного дела	2188	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сочинский институт курортной рекреации и гостеприимства - филиал Российской международной академии туризма	2189	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сочинский институт моды	2190	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сочинский институт экономики и информационных технологий	2191	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сочинский морской институт	2192	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сочинский филиал Восточного института экономики	2193	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сочинский филиал Краснодарского университета Министерства внутренних дел Российской Федерации	2194	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сочинский филиал Московского института предпринимательства и права	2195	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сочинский филиал Российского университета дружбы народов	2196	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сочинский филиал Современной гуманитарной академии	2197	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сочинский филиал Южного института менеджмента	2198	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Специализированный институт юриспруденции	2199	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Средне-Волжский (г. Саранск) филиал Российской правовой академии Министерства юстиции Российской Федерации	2200	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Среднерусский университет (Брянский открытый институт управления и бизнеса)	2201	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Среднерусский университет (гуманитарный институт)	2202	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Среднерусский университет (Институт управления и бизнеса)	2203	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Среднерусский университет (Тульский институт управления и бизнеса)	2204	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	2205	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский военный институт связи ракетных войск	2206	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский государственный аграрный университет	2207	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский государственный педагогический институт	2208	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский государственный университет	2209	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский институт бизнеса и технологий Бизнестранс	2210	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский институт имени В.Д. Чурсина	2211	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский институт управления	2212	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский институт экономики и управления имени О.В. Казначеева (филиал) Пятигорского государственного технологического университета	2213	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский кооперативный институт (филиал) Белгородского университета потребительской кооперации	2214	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский технологический институт сервиса (филиал) Южно-Российского государственного университета экономики и сервиса	2215	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский филиал Краснодарского университета Министерства внутренних дел Российской Федерации	2216	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский филиал Московского гуманитарно-экономического института	2217	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский филиал Московского института предпринимательства и права	2218	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский филиал Поволжской государственной академии телекоммуникаций и информатики	2219	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский филиал Пятигорского государственного лингвистического университета	2220	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский филиал Современной гуманитарной академии	2221	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский филиал Южно-Российского гуманитарного института	2222	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольский финансово-экономический институт	2223	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ставропольское высшее военное авиационное инженерное училище (военный институт) имени маршала авиации В.А. Судца	2224	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Старооскольский технологический институт (филиал) Московского государственного института стали и сплавов (технологического университета)	2225	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Старооскольский филиал Белгородского государственного университета	2226	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Старооскольский филиал Воронежского государственного университета	2227	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Старооскольский филиал Современной гуманитарной академии	2228	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Старорусский политехнический колледж (филиал) Новгородского государственного университета имени Ярослава Мудрого	2229	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Старорусский филиал Санкт-Петербургского государственного университета сервиса и экономики	2230	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Стерлитамакская государственная педагогическая академия	2231	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Стерлитамакский институт физической культуры (филиал) Уральского государственного университета физической культуры	2232	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Стерлитамакский филиал Башкирского государственного университета	2233	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Стерлитамакский филиал Восточного института экономики	2234	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Стерлитамакский филиал Московского государственного открытого педагогического университета имени М.А. Шолохова	2235	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Стерлитамакский филиал Современной гуманитарной академии	2236	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Столичная финансово-гуманитарная академия	2237	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Столичный Гуманитарно-Технический Университет	2238	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Столичный гуманитарно-экономический институт	2239	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Столичный институт иностранных языков	2240	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Столичный институт переводчиков	2241	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Столичный институт управления и сервиса	2242	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ступинский филиал МАТИ - Российского государственного технологического университета имени К. Э. Циолковского	2243	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ступинский филиал Российского нового университета	2244	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Суджанский филиал Современной гуманитарной академии	2245	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сургутский государственный педагогический университет	2246	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сургутский государственный университет Ханты-Мансийского автономного округа	2247	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сургутский институт мировой экономики и бизнеса Планета	2248	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сургутский институт нефти и газа (филиал) Тюменского государственного нефтегазового университета	2249	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сургутский филиал заочного обучения Тюменского юридического института МВД России	2250	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сургутский филиал Московской академии предпринимательства при Правительстве г. Москвы	2251	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сургутский филиал Омского государственного технического университета	2252	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сургутский филиал Сибирской государственной автомобильно-дорожной академии (СибАДИ)	2253	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сызранское высшее военное авиационное училище летчиков (военный институт)	2255	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сыктывкарский государственный университет	2256	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сыктывкарский лесной институт (филиал) Санкт-Петербургской государственной лесотехнической академии им. С.М. Кирова	2257	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сыктывкарский филиал Нижегородского коммерческого института	2258	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сыктывкарский филиал Российского университета кооперации	2259	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сыктывкарский филиал Санкт-Петербургского государственного университета культуры и искусств	2260	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сыктывкарский филиал Санкт-Петербургского государственного университета сервиса и экономики	2261	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сыктывкарский филиал Современной гуманитарной академии	2262	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Сыктывкарский филиал Ухтинского государственного технического университета	2263	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Таганрогский государственный педагогический институт	2264	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Таганрогский институт управления и экономики	2265	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Таганрогский филиал Донского государственного технического университета	2266	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Таганрогский филиал Российского нового университета	2267	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Таймырский филиал Ленинградского государственного университета имени А.С. Пушкина	2268	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тамбовский государственный музыкально-педагогический институт им. С.В. Рахманинова	2269	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тамбовский государственный технический университет	2270	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тамбовский государственный университет имени Г.Р. Державина	2271	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тамбовский филиал Московского государственного университета культуры и искусств	2272	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тамбовский филиал Московского открытого социального университета (института)	2273	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тамбовский филиал Московского университета Министерства внутренних дел Российской Федерации	2274	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тамбовский филиал Российского нового университета	2275	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тамбовский филиал Современной гуманитарной академии	2276	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тамбовское высшее военное авиационное инженерное училище радиоэлектроники (военный институт)	2277	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тарский филиал Омского государственного аграрного университета	2278	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Татарский государственный гуманитарно-педагогический университет	2279	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Таштагольский филиал Сибирского государственного индустриального университета	2280	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тверская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	2281	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тверская государственная сельскохозяйственная академия	2282	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тверской государственный технический университет	2283	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тверской государственный университет	2284	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тверской институт экологии и права	2285	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тверской институт экономики и менеджмента	2286	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тверской филиал Балтийского государственного технического университета ВОЕНМЕХ им. Д. Ф. Устинова	2287	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тверской филиал Московского государственного университета экономики	2288	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тверской филиал Московского гуманитарно-экономического института	2289	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тверской филиал Московского университета Министерства внутренних дел Российской Федерации	2290	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тверской филиал Московской международной высшей школы бизнеса МИРБИС (Институт)	2291	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тверской филиал Московской финансово-юридической академии	2292	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тверской филиал Санкт-Петербургского государственного университета технологии и дизайна	2293	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тверской филиал Современной гуманитарной академии	2294	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Театральный институт имени Бориса Щукина при Государственном академическом театре имени Евг. Вахтангова	2295	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Театральный институт Школа русской драмы имени И.О. Горбачева	2296	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тейковский текстильный техникум (филиал) Ивановской государственной текстильной академии	2297	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Теологическая Семинария Евангелическо-Лютеранской Церкви	2298	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Терский сельскохозяйственный техникум - филиал Кабардино-Балкарской государственной сельскохозяйственной академии	2299	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тетюшский филиал Академия социального образования (КСЮИ)	2300	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Технический институт (филиал) Якутского государственного университета имени М.К. Аммосова в г. Нерюнгри	2301	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Технический институт культуры (г. Москва)	2302	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Технологический институт	2303	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Технологический институт - филиал Ульяновской государственной сельскохозяйственной академии	2304	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Технологический институт (филиал) Московского инженерно-физического института (государственного университета) (г. Лесной)	2305	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Технологический институт Южного федерального университета	2306	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тираспольский филиал Московского института предпринимательства и права	2307	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тираспольский филиал Московской академии экономики и права	2308	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тихвинский филиал Санкт-Петербургского государственного университета сервиса и экономики	2309	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тихоокеанский военно-морской институт	2310	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тихоокеанский государственный университет	2311	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тихоокеанский государственный экономический университет	2312	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тобольский государственный педагогический институт имени Д.И. Менделеева	2313	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тобольский филиал заочного обучения Тюменского юридического института Министерства внутренних дел Российской Федерации	2314	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тобольский филиал Новосибирской государственной академии водного транспорта	2315	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тобольский филиал Современной гуманитарной академии	2316	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тобольский филиал Тюменского государственного архитектурно-строительного университета	2317	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тогучинский филиал Сибирской государственной геодезической академии	2318	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тольяттинская академия управления	2319	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тольяттинский военный технический институт	2320	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тольяттинский государственный университет	2321	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тольяттинский государственный университет сервиса	2322	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тольяттинский институт искусств	2323	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тольяттинский филиал Восточного института экономики	2324	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тольяттинский филиал Института коммерции и права	2325	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тольяттинский филиал Международного института рынка	2326	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тольяттинский филиал Московского государственного университета пищевых производств	2327	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тольяттинский филиал Негосударственного образовательного учреждения Международного института менеджмента ЛИНК	2328	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тольяттинский филиал Российского государственного университета инновационных технологий и предпринимательства (не лицензирован)	2329	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тольяттинский филиал Самарского государственного аэрокосмического университета имени академика С.П. Королева	2330	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тольяттинский филиал Современной гуманитарной академии	2331	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тольяттинский филиал Университета Российской академии образования	2332	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Томский военно-медицинский институт	2333	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Томский государственный архитектурно-строительный университет	2334	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Томский государственный педагогический университет	2335	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Томский государственный университет	2336	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Томский государственный университет систем управления и радиоэлектроники	2337	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Томский институт бизнеса	2338	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Томский политехнический университет	2339	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Томский сельскохозяйственный институт - филиал Новосибирского государственного аграрного университета	2340	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Томский филиал Академии права и управления Федеральной службы исполнения наказаний	2341	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Томский филиал Новосибирской государственной академии водного транспорта	2342	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Томский филиал Современной гуманитарной академии	2343	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Томский экономико-юридический институт	2344	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Трехгорный технологический институт (филиал) Московского инженерно-физического института (государственного университета)	2345	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Троицкий филиал Современной гуманитарной академии	2346	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Троицкий филиал Челябинского государственного университета	2347	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тувинский филиал Восточно-Сибирской государственной академии культуры и искусств	2348	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский (г. Тула) филиал Международного юридического института при Министерстве юстиции Российской Федерации	2349	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский артиллерийский инженерный институт	2350	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский государственный педагогический университет им. Л.Н. Толстого	2351	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский государственный университет	2352	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский институт непрерывного образования	2353	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский институт экономики и информатики	2354	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский региональный филиал Российской правовой академии Министерства юстиции Российской Федерации	2355	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский филиал Евразийского открытого института	2356	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский филиал Института управления и бизнеса в г. Туле	2357	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский филиал Международной академии бизнеса и управления	2358	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский филиал Московского государственного университета культуры и искусств	2359	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский филиал Московского университета Министерства внутренних дел Российской Федерации	2360	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский филиал Московской академии комплексной безопасности предпринимательства	2361	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский филиал Московской академии предпринимательства при Правительстве г. Москвы	2362	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский филиал Российского государственного торгово-экономического университета	2363	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский филиал Российской международной академии туризма	2364	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тульский филиал Современной гуманитарной академии	2365	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тутаевский филиал Рыбинской государственной авиационной технологической академии имени П.А. Соловьева	2366	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тывинский государственный университет	2367	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тывинский филиал (г. Кызыл) Московской финансово-юридической академии (деятельность филиала ПРИОСТАНОВЛЕНА с 1.09.2005 - приказ ВУЗа ?173 от 12.09.05)	2368	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тывинский филиал Сибирского университета потребительской кооперации	2369	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тюменская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	2370	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тюменская государственная сельскохозяйственная академия	2371	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тюменский государственный архитектурно-строительный университет	2372	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тюменский государственный институт искусств и культуры	2373	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тюменский государственный институт мировой экономики	2374	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тюменский государственный нефтегазовый университет	2375	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тюменский государственный университет	2376	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тюменский филиал Академии права и управления (института)	2377	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тюменский филиал Сибирского университета потребительской кооперации	2378	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тюменский филиал Современной гуманитарной академии	2379	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тюменский филиал Уральской государственной архитектурно-художественной академии Институт дизайна	2380	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тюменский юридический институт Министерства внутренних дел Российской Федерации	2381	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Тюменское высшее военно-инженерное командное училище (военный институт)	2382	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Удмуртский государственный университет	2383	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Удмуртский республиканский институт дизайна	2384	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Удмуртский филиал Евразийского открытого института	2385	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Удмуртский филиал Московской финансово-промышленной академии	2386	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Украинско-Российский институт (филиал) Московского государственного открытого университета (не лицензирован)	2387	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Улан-Баторский филиал Восточно-Сибирского государственного технологического университета	2388	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Улан-Удэнский филиал заочного обучения Восточно-Сибирского института Министерства внутренних дел Российской Федерации	2389	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Улан-Удэнский филиал Современной гуманитарной академии	2390	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ульяновская государственная сельскохозяйственная академия	2391	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ульяновский государственный педагогический университет имени И.Н. Ульянова	2392	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ульяновский государственный технический университет	2393	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ульяновский государственный университет	2394	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ульяновский филиал Современной гуманитарной академии	2395	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ульяновский финансово-экономический колледж - филиал Финансовой академии при Правительстве Российской Федерации	2396	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ульяновское высшее авиационное училище гражданской авиации (институт)	2397	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ульяновское высшее военное инженерное училище связи (военный институт) имени Г.К. Орджоникидзе	2398	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ульяновское высшее военно-техническое училище (военный институт)	2399	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Универсальный институт инновационных технологий	2400	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Университет Бизнеса и Искусства	2401	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Университет имени Н.К.Рериха (г. Воронеж)	2402	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Университет информатизации и управления	2403	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Университет Российской академии образования	2404	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Университет содружества независимых государств	2405	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральская академия государственной службы	2406	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральская государственная академия ветеринарной медицины	2407	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральская государственная архитектурно-художественная академия	2408	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральская государственная консерватория (институт) имени М.П. Мусоргского	2409	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	2410	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральская государственная сельскохозяйственная академия	2411	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральская государственная юридическая академия	2412	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский (г. Екатеринбург) филиал Российской правовой академии Министерства юстиции Российской Федерации	2413	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский государственный горный университет	2414	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский государственный лесотехнический университет	2415	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский государственный педагогический университет	2416	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский государственный технический университет - УПИ	2417	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский государственный университет им. А.М. Горького	2418	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский государственный университет путей сообщения	2419	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский государственный университет физической культуры	2420	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский государственный экономический университет	2421	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский гуманитарный институт	2422	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский гуманитарный институт (г. Екатеринбург)	2423	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский институт бизнеса	2424	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский институт бизнеса (г. Екатеринбург)	2425	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский институт Государственной противопожарной службы Министерства Российской Федерации по делам гражданской обороны	2426	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский институт коммерции и права	2427	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский институт непрерывного образования общества Знание России	2428	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский институт социального образования (филиал) Российского государственного социального университета в г. Екатеринбурге	2429	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский институт туризма - филиал Российской международной академии туризма	2430	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский институт фондового рынка	2431	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский институт экономики - филиал Санкт-Петербургской академии управления и экономики	2432	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский институт экономики	2433	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский международный институт туризма	2434	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский социально-экономический институт (филиал) Академии труда и социальных отношений	2435	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Адыгейского государственного университета в г. Апшеронске	2481	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский технический институт связи и информатики (филиал) Сибирского государственного университета телекоммуникаций и информатики (УрТИСИ СибГУТИ) в городе Екатеринбурге	2436	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский филиал (г. Ижевск) Московской финансово-юридической академии	2437	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский филиал Академии национальной безопасности	2438	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский филиал Московского автомобильно-дорожного института (государственного технического университета)	2439	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский филиал Московского государственного университета сервиса	2440	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский филиал Российской академии живописи	2441	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский филиал Российской академии правосудия (г. Челябинск)	2442	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский филиал Российской экономической академии им. Г.В. Плеханова	2443	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский филиал Санкт-Петербургского государственного университета водных коммуникаций	2444	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский филиал Сибирской государственной геодезической академии	2445	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский Финансово-Юридический институт	2446	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский экономический институт	2447	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральский юридический институт Министерства внутренних дел Российской Федерации	2448	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уральское отделение (филиал) Российской школы частного права (института)	2449	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Урюпинский филиал Волгоградского государственного университета	2450	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уссурийский государственный педагогический институт	2451	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уссурийский филиал Дальневосточного юридического института Министерства внутренних дел Российской Федерации	2452	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уссурийский филиал Современной гуманитарной академии	2453	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Усть-Илимский филиал Московского открытого социального университета (института)	2454	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Усть-Каменогорский филиал Московского государственного университета экономики	2455	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уфимская государственная академия искусств имени Загира Исмагилова	2456	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уфимская государственная академия экономики и сервиса	2457	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уфимский государственный авиационный технический университет	2458	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уфимский государственный нефтяной технический университет	2459	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уфимский институт (филиал) Российского государственного торгово-экономического университета	2460	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уфимский институт коммерции и права	2461	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уфимский филиал Института экономических преобразований и управления рынком	2462	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уфимский филиал Оренбургского государственного университета	2463	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уфимский филиал Современной гуманитарной академии	2464	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уфимский филиал Уральской государственной юридической академии	2465	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уфимский филиал Челябинской государственной академии культуры и искусств	2466	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уфимский финансово-экономический колледж - филиал Финансовой академии при Правительстве Российской Федерации	2467	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Уфимский юридический институт Министерства внутренних дел Российской Федерации	2468	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ухтинский государственный технический университет	2469	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ухтинский филиал Современной гуманитарной академии	2470	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал (г. Анапа) Академического правового университета (института)	2471	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал (г. Донецк	2472	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал (г. Кропоткин) Ставропольского института имени В.Д. Чурсина	2473	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал (г. Орехово-Зуево) Института инфраструктуры предпринимательства (НАХОДИТСЯ В СТАДИИ ЛИКВИДАЦИИ)	2474	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал (г. Пятигорск) Ставропольского института имени В.Д. Чурсина	2475	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал (г. Рославль	2476	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал (пос. Прасковея) Ставропольского института имени В.Д. Чурсина	2477	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал ?1 Южного федерального университета в г.Туапсе Краснодарского края	2478	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал ?2 Южного федерального университета в г. Туапсе	2479	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Адыгейского государственного университета в ауле Кошехабль Республики Адыгея	2480	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Адыгейского государственного университета в г. Белореченске	2482	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Адыгейского государственного университета в г. Ейске	2483	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Адыгейского государственного университета в г. Новокубанске	2484	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Адыгейского государственного университета в г. Сочи	2485	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Академии маркетинга и социально-информационных технологий - ИМСИТ (г. Краснодар) в г. Апшеронске	2486	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Академии маркетинга и социально-информационных технологий - ИМСИТ (г. Краснодар) в г. Армавире	2487	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Академии маркетинга и социально-информационных технологий - ИМСИТ (г. Краснодар) в г. Курганинске	2488	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Академии маркетинга и социально-информационных технологий - ИМСИТ (г. Краснодар) в г. Новороссийске	2489	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Академии маркетинга и социально-информационных технологий - ИМСИТ (г. Краснодар) в г. Урус-Мартане	2490	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Академии маркетинга и социально-информационных технологий - ИМСИТ (г. Краснодар) в ст. Выселки	2491	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Академии маркетинга и социально-информационных технологий - ИМСИТ (г. Краснодар) в ст. Каневской	2492	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Академии права и управления (института) в Чеченской Республике	2493	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Академии экономической безопасности МВД России в г. Уфе	2494	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Академии экономической безопасности Министерства внутренних дел Российской Федерации в г. Ессентуки	2495	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Алтайского государственного университета в г. Белокурихе	2496	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Алтайского государственного университета в г. Камне-на-Оби	2497	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Алтайского государственного университета в г. Рубцовске	2498	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Алтайского государственного университета в г. Славгороде	2499	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Армавирского государственного педагогического университета в г. Ессентуки	2500	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Армавирского государственного педагогического университета в г. Краснодаре	2501	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Армавирского государственного педагогического университета в г. Новороссийске	2502	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Армавирского государственного педагогического университета в г. Усть-Лабинске	2503	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Армавирского государственного педагогического университета в станице Ленинградской Краснодарского края	2504	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Армавирского лингвистического университета (института) в г. Анапе	2505	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Армавирского лингвистического университета (института) в г. Карачаевске	2506	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Армавирского лингвистического университета (института) в г. Курганинске	2507	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Армавирского лингвистического университета (института) в г. Нальчике	2508	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Армавирского лингвистического университета (института) в г. Новороссийске	2509	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Армавирского лингвистического университета (института) в г. Тихорецке	2510	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Армавирского лингвистического университета (института) в г. Усть-Лабинске	2511	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Архангельского государственного технического университета в г. Мирном	2512	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Астраханского государственного университета в г. Знаменске	2513	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Байкальского государственного университета экономики и права в г. Братске	2514	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Байкальского государственного университета экономики и права в г. Усть-Илимске	2515	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Байкальского государственного университета экономики и права г. Якутске	2516	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Балтийского государственного технического университета ВОЕНМЕХ им. Д.Ф. Устинова в г. Бишкеке	2517	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Балтийского института экологии	2518	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Балтийского института экологии	2519	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Балтийского института экологии	2520	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Белгородского государственного технологического университета им. В.Г. Шухова в г. Новороссийске	2521	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Бийского педагогического государственного университета имени В.М. Шукшина в г. Белокурихе	2522	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Братского государственного университета в г. Усть-Илимске	2523	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Брянского государственного университета имени академика И.Г.Петровского в г. Новозыбкове	2524	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Бурятского государственного университета в г. Улан-Баторе (Монголия)	2525	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Взлет Московского авиационного института (государственного технического университета) в г. Ахтубинске	2526	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Владивостокского государственного университета экономики и сервиса в г. Артеме	2527	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Владивостокского государственного университета экономики и сервиса в г. Находке	2528	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Владимирского государственного университета в г. Гусь-Хрустальный	2529	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Владимирского государственного университета в г. Кольчугино	2530	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Волго-Вятской академии государственной службы в г. Кирове	2531	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Волго-Вятской академии государственной службы в г. Рыбинске Ярославской области	2532	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Волго-Вятской академии государственной службы в г. Саранске Республики Мордовия	2533	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Волго-Вятской академии государственной службы в г. Чебоксары Чувашской Республики	2534	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Воронежского государственного архитектурно-строительного университета в городе Борисоглебске	2535	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Воронежского института высоких технологий в г. Боброве	2536	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Воронежского института высоких технологий в г. Борисоглебске	2537	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Воронежского института высоких технологий в г. Калаче	2538	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Воронежского института высоких технологий в г. Лиски	2539	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Воронежского института высоких технологий в г. Россоши	2540	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Воронежского института высоких технологий в г. Эртиль	2541	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Воронежского института высоких технологий в п.г.т. Анна	2542	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Воронежского экономико-правового института в г. Борисоглебске Воронежской области	2543	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Воронежского экономико-правового института в г. Калаче Воронежской области	2544	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Воронежского экономико-правового института в г. Лиски Воронежской области	2545	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Воронежской государственной академии искусств в городе Белгороде	2546	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Восток Казанского государственного технического университета им. А. Н. Туполева в г. Чистополе	2547	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Восточного института экономики	2548	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Восточного института экономики	2549	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Восточного института экономики	2550	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Восточно-Сибирского государственного технологического университета в г. Сухэ-Баторе (Монголия) (находится в стадии ликвидации)	2551	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Восточно-Сибирского государственного технологического университета в г. Усть-Илимске	2552	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Восход Московского авиационного института (государственного технического университета) в г. Байконуре	2553	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всемирного технологического университета (ВТУ) в г. Оренбурге	2554	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в г. Архангельске	2555	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в г. Барнауле	2556	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в г. Брянске	2557	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в г. Волгограде	2558	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в г. Кирове	2559	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в г. Краснодаре	2560	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в г. Новороссийске	2561	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института современного искусства в г. Якутске	2640	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в г. Омске	2562	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в г. Пензе	2563	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в г. Сургуте	2564	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в г. Туле	2565	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в г. Уфе	2566	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в городе Владимире	2567	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в городе Липецке	2568	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в городе Орле	2569	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Всероссийского заочного финансово-экономического института в городе Челябинске	2570	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Вятского государственного гуманитарного университета в г. Вятские Поляны	2571	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Вятского государственного гуманитарного университета в г. Ижевске	2572	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Вятского государственного гуманитарного университета в г. Кирово-Чепецке	2573	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Вятского государственного гуманитарного университета в г. Сыктывкаре	2574	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Вятского государственного университета в г. Кирово-Чепецке	2575	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Глазовского государственного педагогического института имени В.Г. Короленко в г. Ижевске	2576	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Государственного университета управления в г. Калининграде	2577	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Государственного университета управления в г. Обнинске	2578	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Государственной академии славянской культуры в г. Твери	2579	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Государственной классической академии имени Маймонида в г. Воронеже (на 17.02.06 НЕ ЛИЦЕНЗИРОВАН - письмо из ВУЗа)	2580	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Государственной классической академии имени Маймонида в г. Санкт-Петербурге (на 17.02.06 НЕ ЛИЦЕНЗИРОВАН - письмо из ВУЗа)	2581	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Грозненского государственного нефтяного института имени академика М.Д. Миллионщикова в г. Дербенте	2582	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного педагогического университета в г. Буйнакске	2583	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного педагогического университета в г. Дербенте	2584	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного педагогического университета в г. Избербаше	2585	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного педагогического университета в г. Хасавюрте	2586	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного педагогического университета в городе Кизилюрте	2587	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного технического университета в г. Буйнакске (не лицензирован)	2588	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного технического университета в г. Дербенте	2589	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного технического университета в г. Каспийске Республики Дагестан	2590	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного технического университета в г. Кизляре	2591	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного университета в Азербайджанской Республике в г. Баку	2592	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного университета в г. Буйнакске	2593	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного университета в г. Дербенте	2594	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного университета в г. Избербаше	2595	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного университета в г. Каспийске	2596	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного университета в г. Кизилюрте	2597	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного университета в г. Кизляре	2598	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дагестанского государственного университета в г. Хасавюрте	2599	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного технического университета ( ДВПИ имени В.В. Куйбышева) в г. Артеме	2600	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института управления	2641	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного технического университета (ДВПИ имени В.В. Куйбышева) в г. Петропавловске-Камчатском	2601	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного технического университета (ДВПИ имени В.В. Куйбышева) в г. Спасске-Дальнем	2602	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного технического университета (ДВПИ имени В.В. Куйбышева) в г. Уссурийске	2603	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного технического университета (ДВПИ имени В.В. Куйбышева) в г. Южно-Сахалинске	2604	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного технического университета (ДВПИ имени В.В. Куйбышева) в пос. Кировском Приморского края	2605	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного университета в г. Арсеньеве	2606	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного университета в г. Артеме	2607	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного университета в г. Находке	2608	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного университета в г. Партизанске	2609	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного университета в г. Петропавловске-Камчатском	2610	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного университета в г. Спасске-Дальнем	2611	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного университета в г. Уссурийске	2612	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного университета в г. Хакодате (Япония)	2613	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного университета в пос. Михайловка	2614	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточного государственного университета путей сообщения в г. Нерюнгри	2615	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточной академии государственной службы в г. Петропавловске-Камчатском	2616	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дальневосточной академии государственной службы в г. Якутске	2617	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Дмитров Международного университета природы	2618	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Донского государственного аграрного университета в г. Волгодонске	2619	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Донского государственного технического университета в г. Волгодонске	2620	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Донского государственного технического университета в г. Ессентуки	2621	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал заочного обучения в г. Оренбурге Уфимского юридического института МВД России	2622	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ивановского государственного университета в г. Дербенте	2623	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ивановского государственного энергетического университета в г. Радужном	2624	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ивановской государственной текстильной академии в г. Краснодаре	2625	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ивановской государственной текстильной академии в г. Нижний Новгород	2626	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ивановской государственной текстильной академии в г. Рязани	2627	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института инфраструктуры предпринимательства в г. Горки-2 (НАХОДИТСЯ В СТАДИИ ЛИКВИДАЦИИ)	2628	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института международного права и экономики имени А.С. Грибоедова в г. Вологде	2629	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института международного права и экономики имени А.С. Грибоедова в г. Калуге	2630	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института международного права и экономики имени А.С. Грибоедова в г. Липецке	2631	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института международного права и экономики имени А.С. Грибоедова в г. Мурманске	2632	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института международного права и экономики имени А.С. Грибоедова в г. Нижневартовске	2633	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института международного права и экономики имени А.С. Грибоедова в г. Петрозаводске	2634	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института международного права и экономики имени А.С. Грибоедова в г. Ульяновске	2635	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института мировой экономики в г. Вологде	2636	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института профессиональных инноваций (некоммерческой организации) в г. Мирном	2637	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института профессиональных инноваций (некоммерческой организации) в г. Нерюнгри	2638	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института профессиональных инноваций (некоммерческой организации) в г. Нефтеюганске	2639	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Института экономики и управления Кубанской государственной медицинской академии (г. Белореченск)	2643	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Иркутского государственного педагогического университета в г. Усть-Илимске	2644	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Иркутского государственного технического университета в г. Усолье-Сибирском	2645	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Иркутского государственного университета в г. Ангарске	2646	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Иркутского государственного университета в г. Братске	2647	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Иркутского государственного университета путей сообщения в г. Абакане	2648	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Иркутского государственного университета путей сообщения в г. Братске	2649	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Иркутского государственного университета путей сообщения в г. Красноярске	2650	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Иркутского государственного университета путей сообщения в г. Северобайкальске	2651	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Иркутского государственного университета путей сообщения в г. Улан-Удэ	2652	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кабардино-Балкарского государственного университета им. Х.М. Бербекова в г. Майском	2653	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Казанского государственного технического университета им. А.Н. Туполева (г. Елабуга)	2654	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Казанского государственного университета им. В.И. Ульянова-Ленина в г. Зеленодольске	2655	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Казанского государственного университета им. В.И. Ульянова-Ленина в г. Набережные Челны	2656	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Камской государственной инженерно-экономической академии в г. Чистополе	2657	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Карачаево-Черкесского государственного университета в г. Кропоткине	2658	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Карачаево-Черкесского государственного университета в г. Черкесске (не ведут образовательную деятельность)	2659	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кемеровского государственного университета в г. Анжеро-Судженске	2660	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кемеровского государственного университета в г. Прокопьевске	2661	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кемеровского государственного университета в г. Улан-Баторе (НЕ ИМЕЕТ ЛИЦЕНЗИИ Минобразования России - письмо от 15.10.2004)	2662	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кемеровского государственного университета в г. Юрге	2663	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Комсомольского-на-Амуре государственного технического университета в пос. Ванино	2664	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Костромского государственного университета имени Н.А. Некрасова в г. Кировске Мурманской области	2665	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Котельники Международного университета природы	2666	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Красноярского государственного педагогического университета им. В.П. Астафьева в г. Ачинске	2667	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Красноярского государственного педагогического университета им. В.П. Астафьева в г. Железногорске	2668	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Красноярского государственного педагогического университета им. В.П. Астафьева в г. Канске	2669	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Красноярского государственного педагогического университета им. В.П. Астафьева в г. Минусинске	2670	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Красноярского государственного педагогического университета им. В.П. Астафьева в г. Норильске	2671	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Красноярского государственного торгово-экономического института в г. Ачинске Красноярского края	2672	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Красноярского государственного торгово-экономического института в г. Барнауле Алтайского края	2673	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Красноярского государственного торгово-экономического института в г. Минусинске Красноярского края	2674	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Красноярского государственного торгово-экономического института в г. Шарыпово Красноярского края	2675	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Красноярского государственного художественного института в г. Якутске (находится в стадии ликвидации)	2676	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Крестьянского государственного института имени Кирилла и Мефодия в городе Сланцы	2677	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Крестьянского государственного университета им. Кирилла и Мефодия (г. Луга) в г. Тосно	2678	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного технологического университета в г. Сочи	2679	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного технологического университета в г. Туапсе	2680	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в г. Армавире	2681	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в г. Белореченске	2682	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в г. Геленджике	2683	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в г. Горячий Ключ	2684	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в г. Ейске	2685	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в г. Кореновске	2686	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в г. Кропоткине	2687	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в г. Новороссийске	2688	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в г. Ставрополе	2689	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в г. Тихорецке	2690	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в г. Усть-Лабинске	2691	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в станице Ленинградской	2692	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в станице Отрадной	2693	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в станице Павловской	2694	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета в станице Северской	2695	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского государственного университета физической культуры	2696	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кубанского института международного предпринимательства и менеджмента в г. Кропоткине	2697	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кузбасского государственного технического университета в г. Анжеро-Судженске	2698	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кузбасского государственного технического университета в г. Белово	2699	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кузбасского государственного технического университета в г. Междуреченске	2700	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кузбасского государственного технического университета в г. Новокузнецке	2701	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кузбасского государственного технического университета в г. Прокопьевске	2702	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кузбасского государственного технического университета в г. Таштаголе	2703	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Кузбасской государственной педагогической академии в г. Кемерове	2704	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Магнитогорского государственного технического университета им. Г.И. Носова в г. Белорецке	2705	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Майкопского государственного технологического университета в поселке Яблоновском Республики Адыгея	2706	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Международного института экономики и права  в городе Владивостоке	2707	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Международного института экономики и права в городе Астрахани	2708	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Международного института экономики и права в городе Белорецке	2709	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Международного института экономики и права в городе Братиславе	2710	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Международного института экономики и права в городе Волгограде	2711	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Международного института экономики и права в городе Екатеринбурге	2712	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Международного института экономики и права в городе Калининграде	2713	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Международного института экономики и права в городе Киселевске	2714	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Международного института экономики и права в городе Магнитогорске	2715	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Международного института экономики и права в городе Мурманске	2716	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Международного института экономики и права в городе Омске	2717	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Международного института экономики и права в городе Челябинске	2718	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Международного института экономики и права в городе Ярославле	2719	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Международной гуманитарно-технической академии в г. Нефтекумске	2720	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Межотраслевого технологического института - учебный центр Кораллово	2721	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Махачкале	2754	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Многоуровневого образовательного комплекса Воронежский экономико-правовой институт в г. Алексеевке Белгородской области	2722	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Многоуровневого образовательного комплекса Воронежский экономико-правовой институт в г. Грязи Липецкой области	2723	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Многоуровневого образовательного комплекса Воронежский экономико-правовой институт в г. Липецке	2724	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Многоуровневого образовательного комплекса Воронежский экономико-правовой институт в г. Орле Орловской области	2725	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Многоуровневого образовательного комплекса Воронежский экономико-правовой институт в г. Острогожске Воронежской области	2726	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Многоуровневого образовательного комплекса Воронежский экономико-правовой институт в г. Россоши Воронежской области	2727	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Многоуровневого образовательного комплекса Воронежский экономико-правовой институт в г. Старый Оскол Белгородской области	2728	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Морской государственной академии имени адмирала Ф.Ф. Ушакова в г. Ростове-на-Дону	2729	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского автомобильно-дорожного института (государственного технического университета) в г. Весьегонске Тверской области	2730	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного индустриального университета в г. Вязьме	2731	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного индустриального университета в г. Кинешме	2732	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного индустриального университета в г. Рославле Смоленской обл.	2733	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного индустриального университета в г. Сергиев Посад Московской области	2734	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного института радиотехники	2735	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного института радиотехники	2736	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного лингвистического университета в г. Михайловске Ставропольского края	2737	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого педагогического университета имени М.А. Шолохова в г. Анапе Краснодарского края	2738	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого педагогического университета имени М.А. Шолохова в г. Балабаново Калужской области	2739	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого педагогического университета имени М.А. Шолохова в г. Дербенте	2740	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого педагогического университета имени М.А. Шолохова в г. Екатеринбурге	2741	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого педагогического университета имени М.А. Шолохова в г. Железноводске Ставропольского края	2742	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого педагогического университета имени М.А. Шолохова в г. Ростове-на-Дону	2743	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого педагогического университета имени М.А. Шолохова в г. Ставрополе	2744	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого педагогического университета имени М.А. Шолохова в г. Томске	2745	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого педагогического университета имени М.А. Шолохова в г. Уфе	2746	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Александрове Владимирской области	2747	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Волоколамске	2748	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Воскресенске Московской области	2749	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Ейске Краснодарского края	2750	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Кольчугино Владимирской области (ЛИКВИДИРОВАН - приказ Рособразования ?203 от 27.03.2006)	2751	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Кропоткине Краснодарского края	2752	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Кулебаки Нижегородской области	2753	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Нижневартовске	2755	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Новотроицке Оренбургской области  (ЛИКВИДИРОВАН - приказ Рособразования ?203 от 27.03.2006)	2756	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Новый Уренгой Ямало-Ненецкого автономного округа	2757	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Ногинске Московской области	2758	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Ноябрьске Ямало-Ненецкого автономного округа	2759	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Перевозе Нижегородской области	2760	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Прокопьевске Кемеровской области	2761	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Сафоново Смоленской области	2762	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Смоленске	2763	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в г. Шатуре Московской области	2764	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного открытого университета в п. Белый Яр Ханты-Мансийского автономного округа	2765	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного социального университета в г. Алматы (Осуществляет функции ПРЕДСТАВИТЕЛЬСТВА- письмо из ВУЗа от 21.03.2003)	2766	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного социального университета в г. Кемерово (к реализации образовательной деятельности не приступил - письмо И-3844 от 9.9.2005)	2767	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного социального университета в г. Чимкент (Осуществляет функции ПРЕДСТАВИТЕЛЬСТВА- письмо из ВУЗа от 21.03.2003)	2768	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного технического университета МАМИ в г. Дмитрове Московской области	2769	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного технического университета МАМИ в г. Ликине-Дулеве Московской области	2770	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета геодезии и картографии в г. Кирове (не лицензирован)	2771	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета им. М.В. Ломоносова в г. Севастополе (Украина)	2772	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета имени М.В. Ломоносова в г. Пущино	2773	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета культуры и искусств в городе Жуковском	2774	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета культуры и искусств в городе Набережные Челны	2775	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета культуры и искусств в городе Норильске	2776	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета печати в г. Абовяне (Республика Армения)	2777	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета приборостроения и информатики в г. Дмитрове	2778	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета приборостроения и информатики в г. Кашире	2779	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета приборостроения и информатики в г. Кимры	2780	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета приборостроения и информатики в г. Лыткарино	2781	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета приборостроения и информатики в г. Можайске	2782	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета приборостроения и информатики в г. Сергиевом Посаде	2783	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета приборостроения и информатики в г. Серпухове	2784	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета приборостроения и информатики в г. Ставрополе	2785	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета приборостроения и информатики в г. Угличе	2786	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета приборостроения и информатики в г. Чехове	2787	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института права в г. Санкт-Петербурге	2825	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета сервиса в г. Махачкале	2788	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета сервиса в г. Отрадном Самарской области	2789	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета сервиса в г. Перми	2790	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета сервиса в г. Пятигорске	2791	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета сервиса в г. Самаре	2792	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета сервиса в г. Смоленске	2793	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета сервиса в г. Сочи	2794	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Абдулино Оренбургской области	2795	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Архангельске	2796	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Владикавказе (Республика Северная Осетия-Алания)	2797	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Волоколамске Московской области	2798	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Вязьме Смоленской области	2799	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Калининграде	2800	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Калуге	2801	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Липецке	2802	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Мелеузе (Республика Башкортостан)	2803	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Мичуринске Тамбовской области	2804	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Можайске Московской области	2805	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Нижний Новгород	2806	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Пензе	2807	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Перми	2808	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Ростове-на-Дону	2809	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Самаре	2810	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Смоленске	2811	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Тобольске Тюменской области	2812	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Унече Брянской области	2813	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского государственного университета технологий и управления в г. Чебоксары (Чувашская Республика)	2814	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института коммунального хозяйства и строительства в г. Дмитрове Московской области	2815	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института коммунального хозяйства и строительства в г. Егорьевске Московской области	2816	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института коммунального хозяйства и строительства в г. Люберцы Московской области	2817	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института коммунального хозяйства и строительства в г. Можайске Московской области	2818	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института коммунального хозяйства и строительства в г. Серпухове Московской области	2819	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института права в г. Казани	2820	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института права в г. Курске	2821	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института права в г. Нижний Новгород	2822	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института права в г. Орске	2823	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института права в г. Рязани	2824	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института предпринимательства и права в г. Буйнакске	2826	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института предпринимательства и права в г. Дербенте	2827	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института предпринимательства и права в г. Махачкале	2828	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института предпринимательства и права в г. Минеральные Воды	2829	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института предпринимательства и права в г. Новосибирске	2830	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института предпринимательства и права в г. Норильске	2831	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института предпринимательства и права в г. Оренбурге	2832	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института предпринимательства и права в г. Пензе	2833	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института предпринимательства и права в г. Ростове	2834	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института экономики	2835	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института экономики	2836	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института экономики	2837	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института экономики	2838	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института экономики	2839	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института экономики	2840	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского института экономики	2841	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского нового юридического института в г. Брянске	2842	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского нового юридического института в г. Липецке	2843	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского нового юридического института в г. Новошахтинске	2844	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского нового юридического института в г. Пскове	2845	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского нового юридического института в г. Смоленске	2846	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского нового юридического института в г. Советске	2847	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского нового юридического института в г. Сочи	2848	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского нового юридического института в г. Тамбове	2849	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского нового юридического института в городе Ереване (Республика Армения)	2850	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского нового юридического института в городе Юбилейный	2851	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского нового юридического института в п. Тучково Рузского района Московской области	2852	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского педагогического государственного университета в городе Брянске	2853	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского педагогического государственного университета в городе Краснодаре	2854	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского педагогического государственного университета в городе Новосибирске	2855	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского педагогического государственного университета в городе Снежинске	2856	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского педагогического государственного университета в городе Ульяновске	2857	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского педагогического государственного университета в городе Челябинске	2858	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института (г. Ижевск)	2859	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института (г. Конаково	2860	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института (г. Люберцы	2861	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института (г. Магнитогорск)	2862	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института (г. Стерлитамак)	2863	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института (г. Электросталь)	2864	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института (г. Ярославль)	2865	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института в г. Гремячинске Пермской области	2866	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института в г. Железногорске Курской области	2867	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института в г. Красноярске	2868	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института в г. Куровское Московской области	2869	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института в г. Муроме	2870	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института в г. Одинцово	2871	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института в г. Уварово (Тамбовская область)	2872	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института в г. Удомле Тверской области	2873	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института в г. Хабаровске	2874	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института в г. Черняховске Калининградской области	2875	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского психолого-социального института в станице Полтавская Краснодарского края	2876	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского социально-гуманитарного института в г. Апрелевке Московской области	2877	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского социально-гуманитарного института в г. Егорьевске	2878	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского социально-гуманитарного института в г. Ейске Краснодарского края	2879	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского социально-гуманитарного института в г. Казани	2880	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского социально-гуманитарного института в г. Каменске-Шахтинском Ростовской области	2881	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского социально-гуманитарного института в г. Набережные Челны	2882	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского социально-гуманитарного института в г. Нефтеюганске	2883	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского социально-гуманитарного института в г. Новомосковске	2884	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского социально-гуманитарного института в г. Новороссийске	2885	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского социально-гуманитарного института в г. Перми	2886	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского социально-гуманитарного института в г. Ржеве Тверской области	2887	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского социально-гуманитарного института в г. Сальске Ростовской области	2888	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского социально-гуманитарного института в г. Стрежевой Томской области	2889	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского социально-гуманитарного института в г. Ярославле	2890	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского теологического института пятидесятников	2891	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского экономико-финансового института в г. Самаре	2892	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского энергетического института (технического университета) в г. Волжском	2893	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского энергетического института (технического университета) в г. Смоленске	2894	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московского юридического института при Министерстве юстиции Российской Федерации г. Тверь (Филиал находится в стадии ликвидации см письмо из вуза ? 281М от 14.02.2005 )	2895	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московской государственной академии водного транспорта Велико-Устюгское речное училище им. З.А. Шашкова	2896	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московской государственной юридической академии в г. Вологде	2897	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Московской государственной юридической академии в г. Кирове	2898	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Нижегородского государственного лингвистического университета им. Н.А. Добролюбова в г. Казани	2899	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Новосибирского государственного архитектурно-строительного университета (Сибстрин) в г. Айхале	2900	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Новосибирского государственного архитектурно-строительного университета (Сибстрин) в г. Искитиме Новосибирской области	2901	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Новосибирского государственного архитектурно-строительного университета (Сибстрин) в г. Ленске	2902	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Новосибирского государственного архитектурно-строительного университета (Сибстрин) в г. Мирном	2903	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Новосибирского государственного архитектурно-строительного университета (Сибстрин) в г. Удачном	2904	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Новосибирского государственного технического университета в г. Нерюнгри	2905	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Новосибирского государственного университета экономики и управления - НИНХ в г. Улан-Удэ	2906	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Омского государственного педагогического университета в г. Таре	2907	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Омского государственного университета путей сообщения в г. Тайге	2908	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Орловской региональной академии государственной службы в г. Брянске	2909	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Орловской региональной академии государственной службы в г. Курске	2910	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Орловской региональной академии государственной службы в г. Липецке	2911	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Орловской региональной академии государственной службы в г. Смоленске	2912	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Орловской региональной академии государственной службы в г. Тамбове	2913	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Орловской региональной академия государственной службы в г. Туле	2914	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Поволжской академии государственной службы имени П.А. Столыпина в г. Балаково	2915	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Поволжской академии государственной службы имени П.А. Столыпина в г. Балашове	2916	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Поволжской академии государственной службы имени П.А. Столыпина в г. Самаре	2917	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Поволжской академии государственной службы имени П.А. Столыпина в г. Тамбове	2918	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Поволжской академии государственной службы имени П.А. Столыпина в г. Тольятти	2919	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Поволжской академии государственной службы имени П.А. Столыпина в г. Ульяновске	2920	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Пограничной академии Федеральной службы безопасности Российской Федерации в г. Анапе	2921	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Протвино  Международного университета природы	2922	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Пятигорского государственного лингвистического университета в г. Учкекене	2923	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Пятигорского государственного технологического университета в г. Грозном Чеченской Республики	2924	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Пятигорского государственного технологического университета в г. Карачаевске Карачаево-Черкесской Республики	2925	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гидрометеорологического университета в г. Алексине Тульской области	2926	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гидрометеорологического университета в г. Ростове-на-Дону	2927	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гидрометеорологического университета в г. Туапсе Краснодарского края	2928	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Астрахани	2929	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Балашихе	2930	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Великий Новгород	2931	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Воскресенске	2932	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Всеволожске	2933	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Георгиевске	2934	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Дмитрове	2935	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Домодедово	2936	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Железнодорожном	2937	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Иваново	2938	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Казани	2939	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Калининграде	2940	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Калуге	2941	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Кашире	2942	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Кирове	2943	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Костроме	2944	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Красноярске	2945	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Кызыле	2946	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Лыткарино (НЕ ЛИЦЕНЗИРОВАН)	2947	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Магадане	2948	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Мытищах (НЕ ЛИЦЕНЗИРОВАН)	2949	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Наро-Фоминске	2950	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Нижнем Новгороде	2951	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Одинцово	2952	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Павловский Посад	2953	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Самаре	2954	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Санкт-Петербурге	2955	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Саратове	2956	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Твери	2957	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Тольятти	2958	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Улан-Удэ	2959	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Фрязине	2960	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Чехове	2961	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Электростали	2962	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Элисте	2963	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного гуманитарного университета в г. Ярославле	2964	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного педагогического университета им. А.И. Герцена в г. Волхове	2965	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного профессионально-педагогического университета в г. Березовском	2966	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного профессионально-педагогического университета в г. Ереване	2967	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного профессионально-педагогического университета в г. Кемерове	2968	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного профессионально-педагогического университета в г. Омске	2969	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного профессионально-педагогического университета в г. Оренбурге	2970	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного профессионально-педагогического университета в г. Советском	2971	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Азове Ростовской области	2972	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Анапе Краснодарского края	2973	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Батайске Ростовской области	2974	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Брянске	2975	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Воронеже	2976	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Дедовске Московской области	2977	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Дербент Республики Дагестан	2978	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Ивантеевке Московской области	2979	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Ижевске Удмуртской Республики	2980	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Калуге	2981	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Каменске-Шахтинском Ростовской области	2982	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Кисловодске Ставропольского края	2983	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Клину Московской области	2984	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского университета дружбы народов в г. Перми	3021	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Красноярске	2985	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Люберцы Московской области	2986	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Майкопе Республики Адыгея	2987	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Минске Республики Беларуссия	2988	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Мурманске	2989	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Наро-Фоминск Московской области	2990	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Нефтеюганске Ханты-Мансийского автономного округа - Югра Тюменской области	2991	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Обнинске Калужской области	2992	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Ош Кыргызской Республики	2993	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Павловский Посад Московской области	2994	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Пензе	2995	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Пятигорске Ставропольского края	2996	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Рузе Московской области	2997	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Серпухове Московской области	2998	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Советском Ханты-Мансийского автономного округа - Югра Тюменской области	2999	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Сочи Краснодарского края	3000	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Ставрополе	3001	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Сургуте Ханты-Мансийского автономного округа - Югра Тюменской области	3002	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Таганроге Ростовской области	3003	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Твери	3004	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Тольятти Самарской области	3005	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Томске	3006	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Уфе Республики Башкортостан	3007	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Хасавюрте Республики Дагестан	3008	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Чебоксары Чувашской Республики - Чувашия	3009	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного социального университета в г. Электростали Московской области	3010	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного университета нефти и газа имени И.М. Губкина в г. Оренбурге	3011	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного университета физической культуры	3012	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского государственного университета физической культуры	3013	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского заочного института текстильной и легкой промышленности в г. Кемерово	3014	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского заочного института текстильной и легкой промышленности в г. Омске	3015	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского заочного института текстильной и легкой промышленности в г. Орехово-Зуево	3016	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского заочного института текстильной и легкой промышленности в г. Серпухове	3017	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского заочного института текстильной и легкой промышленности в г. Твери	3018	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского университета дружбы народов в г. Белгороде	3019	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского университета дружбы народов в г. Ессентуки	3020	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российского университета дружбы народов в г. Якутске	3022	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российской экономической академии им. Г. В. Плеханова в г. Краснодаре	3023	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российской экономической академии им. Г.В. Плеханова в г. Ташкенте	3024	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Российской экономической академии им. Г.В. Плеханова в г. Улан-Батор (Монголия)	3025	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного строительного университета в г. Азове (находится в стадии ликвидации	3026	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного университета путей сообщения в г. Краснодаре	3027	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного университета путей сообщения в г. Кропоткине	3028	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного университета путей сообщения в г. Минеральные Воды	3029	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного университета путей сообщения в г. Туапсе	3030	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного экономического университета РИНХ в г. Аксае	3031	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного экономического университета РИНХ в г. Батайске	3032	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного экономического университета РИНХ в г. Волгодонске	3033	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного экономического университета РИНХ в г. Георгиевске	3034	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного экономического университета РИНХ в г. Дербенте	3035	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного экономического университета РИНХ в г. Ейске	3036	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного экономического университета РИНХ в г. Кисловодске	3037	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного экономического университета РИНХ в г. Махачкале	3038	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного экономического университета РИНХ в г. Миллерово	3039	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного экономического университета РИНХ в г. Назрани	3040	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного экономического университета РИНХ в г. Сальске	3041	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного экономического университета РИНХ в г. Ставрополе	3042	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного экономического университета РИНХ в г. Черкесске	3043	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ростовского государственного экономического университета РИНХ в п. Матвеев Курган	3044	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Рязанской государственной радиотехнической академии в г. Сасово Рязанской области	3045	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Самарского государственного архитектурно-строительного университета в г. Белебее Республики Башкортостан	3046	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Самарского государственного технического университета в г. Сызрани	3047	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Самарского государственного университета в г. Тольятти	3048	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Самарского государственного экономического университета в г. Тольятти	3049	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Самарской государственной академии путей сообщения в г. Оренбурге	3050	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Самарской государственной академии путей сообщения в г. Орске	3051	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Самарской государственной академии путей сообщения в г. Рузаевке	3052	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Самарской государственной академии путей сообщения в г. Уфе	3053	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Самарской гуманитарной академии в г. Димитровграде	3054	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Самарской гуманитарной академии в г. Жигулевске	3055	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Самарской гуманитарной академии в г. Тольятти	3056	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного горного института им. Г.В. Плеханова (технического университета) Воркутинский горный институт	3057	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в г. Альметьевске	3058	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в г. Анадыре	3059	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в г. Апатиты	3060	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в г. Белгороде	3061	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в г. Выборге	3062	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в г. Кизляре	3063	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в г. Мурманске	3064	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в г. Нижневартовске (находится в стадии ликвидации с 15.12.2005)	3065	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в г. Певеке	3066	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в г. Пскове	3067	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в г. Твери	3068	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в г. Тихвине	3069	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в г. Чебоксары	3070	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в г. Череповце	3071	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного инженерно-экономического университета в городе Вологде	3072	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного политехнического университета в г. Анадыре	3073	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного технологического университета растительных полимеров в г. Кувшиново	3074	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного технологического университета растительных полимеров в г. Сегеже	3075	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного университета кино и телевидения в г. Якутске	3076	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного университета культуры и искусств в г. Архангельске	3077	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного университета культуры и искусств в г. Великий Новгород	3078	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного университета культуры и искусств в г. Пскове	3079	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного университета экономики и финансов в г. Мурманске	3080	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного университета экономики и финансов в г. Пскове	3081	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского государственного электротехнического университета ЛЭТИ им. В.И. Ульянова (Ленина) в г. Югорске	3082	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3083	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3084	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3085	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3086	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3087	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3088	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3089	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3090	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3091	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3092	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3093	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3094	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3095	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3096	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3097	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3098	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3099	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3100	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3101	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3102	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3103	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3104	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3105	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3106	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Санкт-Петербургского института внешнеэкономических связей	3107	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Саратовского государственного технического университета в г. Балашове	3108	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Саратовского государственного технического университета в г. Петровске	3109	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Саратовской государственной академии права в г. Астрахани	3110	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Западной академии государственной службы в г. Вологде	3111	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Западной академии государственной службы в г. Выборге	3112	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Западной академии государственной службы в г. Иваново	3113	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Западной академии государственной службы в г. Калининграде	3114	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Западной академии государственной службы в г. Калуге	3115	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Западной академии государственной службы в г. Мурманске	3116	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Западной академии государственной службы в г. Пскове	3117	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Западной академии государственной службы в г. Сосновый Бор (Ленинградская область)	3118	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Западной академии государственной службы в г. Твери	3119	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Западной академии государственной службы в городе Великий Новгород	3120	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Западной академии государственной службы в городе Нижневартовске	3121	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Западной академии государственной службы в городе Северодвинске	3122	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Кавказского государственного технического университета в г. Кисловодске	3123	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Кавказского государственного технического университета в г. Назрани	3124	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Кавказского государственного технического университета в г. Пятигорске	3125	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Кавказского государственного технического университета в городе Черкесске (не лицензирован)	3126	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Кавказской академии государственной службы в г. Краснодаре	3127	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Кавказской академии государственной службы в г. Махачкале	3128	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Северо-Кавказской академии государственной службы в г. Ставрополе	3129	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал СЕВМАШВТУЗ Санкт-Петербургского государственного морского технического университета в г. Северодвинске	3130	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сергиево-Посадского гуманитарного института в г. Дмитрове	3131	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сергиево-Посадского гуманитарного института в г. Талдоме	3132	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского государственного аэрокосмического университета имени академика М.Ф. Решетнева в г. Железногорске Красноярского края	3133	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского государственного аэрокосмического университета имени академика М.Ф. Решетнева в г. Зеленогорске Красноярского края	3134	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского государственного технологического университета в г. Мариинске Кемеровской области	3135	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского государственного университета физической культуры и спорта в г. Березовском	3136	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского государственного университета физической культуры и спорта в г. Надыме	3137	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского федерального университета - Лесосибирский педагогический институт	3138	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Пыть-Яхе	3254	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского федерального университета - Хакасский технический институт	3139	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского федерального университета ?1 в г. Ачинске	3140	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского федерального университета ?2 в г. Ачинске	3141	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского федерального университета в г. Дудинке	3142	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского федерального университета в г. Железногорске	3143	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского федерального университета в г. Зеленогорске	3144	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского федерального университета в г. Канске	3145	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского федерального университета в г. Норильске	3146	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского федерального университета в г. Усть-Илимске	3147	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирского федерального университета в г. Шарыпово	3148	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирской академии государственной службы в г. Иркутске	3149	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирской академии государственной службы в г. Новокузнецке	3150	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирской академии государственной службы в г. Томске	3151	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирской академии государственной службы в г. Усть-Илимске	3152	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сибирской государственной академии физической культуры в г. Кемерово	3153	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Славянского-на-Кубани государственного педагогического института в г. Новороссийске	3154	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Современной гуманитарной академии в г. Комсомольске-на-Амуре	3155	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сочинского государственного университета туризма и курортного дела в г. Анапе	3156	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сочинского государственного университета туризма и курортного дела в г. Геленджике	3157	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сочинского государственного университета туризма и курортного дела в г. Ейске	3158	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сочинского государственного университета туризма и курортного дела в г. Нижний Новгород	3159	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сочинского государственного университета туризма и курортного дела в г. Омске	3160	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сочинского государственного университета туризма и курортного дела в г. Пятигорске	3161	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ставропольского государственного университета в г. Буденновске	3162	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ставропольского государственного университета в г. Георгиевске	3163	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ставропольского государственного университета в г. Изобильном	3164	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ставропольского государственного университета в г. Светлограде	3165	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ставропольского института им. В.Д. Чурсина в г. Георгиевске	3166	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ставропольского института им. В.Д. Чурсина в г. Изобильном	3167	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ставропольского института им. В.Д. Чурсина в г. Черкесске	3168	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ставропольского института имени В.Д. Чурсина в г. Буденновске	3169	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ставропольского института имени В.Д. Чурсина в г. Кисловодске	3170	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Столичного института переводчиков в г. Санкт-Петербурге	3171	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Столичной финансово-гуманитарной академии в г. Владимире	3172	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Столичной финансово-гуманитарной академии в г. Волгодонске	3173	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Столичной финансово-гуманитарной академии в г. Вологде	3174	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Столичной финансово-гуманитарной академии в г. Мурманске	3175	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Столичной финансово-гуманитарной академии в г. Омске	3176	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Столичной финансово-гуманитарной академии в г. Орске	3177	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Столичной финансово-гуманитарной академии в г. Салехарде	3178	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Столичной финансово-гуманитарной академии в г. Сургуте	3179	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Столичной финансово-гуманитарной академии в г. Ухте	3180	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Столичной финансово-гуманитарной академии в г. Череповце	3181	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Столичной финансово-гуманитарной академии в г.Уфе	3182	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сургутского государственного университета в г. Лангепасе	3183	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Сургутского государственного университета в г. Лянторе ХМАО	3184	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Таганрогского государственного радиотехнического университета в г. Ростове-на-Дону	3185	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тверского государственного технического университета в г. Бежецке Тверской области	3186	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тверского государственного технического университета в г. Вышний Волочек Тверской области	3187	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тверского государственного технического университета в г. Конакове Тверской области	3188	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тверского государственного технического университета в г. Кувшиново Тверской области	3189	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тверского государственного технического университета в г. Нелидове Тверской области (НЕ ЛИЦЕНЗИРОВАН - письмо из ВУЗа ?98-02-852 от 08.09.05)	3190	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тверского государственного технического университета в г. Ржеве Тверской области	3191	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тверского государственного технического университета в г. Торжке Тверской области	3192	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тверского государственного университета в г. Нелидово Тверской области	3193	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тверского государственного университета в г. Ржеве Тверской области	3194	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тверского государственного университета в г. Торопце Тверской области (проводится работа по ликвидации филиала - письмо из ВУЗа ?59-01-61 от 06.03.06)	3195	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тихоокеанского государственного экономического университета в г. Арсеньеве Приморского края	3196	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тихоокеанского государственного экономического университета в г. Находке Приморского края	3197	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тихоокеанского государственного экономического университета в г. Уссурийске Приморского края	3198	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тихоокеанского государственного экономического университета в г. Южно-Сахалинске Сахалинской области	3199	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тобольский индустриальный институт Тюменского государственного нефтегазового университета	3200	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тобольского государственного педагогического института им. Д.И. Менделеева в г. Салехарде	3201	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тобольского государственного педагогического института имени Д.И. Менделеева в г. Новый Уренгой	3202	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного архитектурно-строительного университета в г. Белово Кемеровской области	3203	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного архитектурно-строительного университета в г. Ленинске-Кузнецком	3204	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного архитектурно-строительного университета в г. Новокузнецке Кемеровской области	3205	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного архитектурно-строительного университета в г. Стрежевом	3206	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного педагогического университета в г. Братске Иркутской области (выполняет функцию представительства)	3207	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета в г. Междуреченске	3208	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета в г. Прокопьевске	3209	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета в г. Юрге	3210	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета систем управления и радиоэлектроники в г. Когалыме	3211	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета систем управления и радиоэлектроники в г. Ленинске-Кузнецком	3212	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета систем управления и радиоэлектроники в г. Надыме Ямало-Ненецкого автономного округа	3213	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета систем управления и радиоэлектроники в г. Новом Уренгое Ямало-Ненецкого автономного округа	3214	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета систем управления и радиоэлектроники в г. Ноябрьске Ямало-Ненецкого автономного округа	3215	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета систем управления и радиоэлектроники в г. Салехарде Ямало-Ненецкого автономного округа	3216	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Череповецкий филиал Института бизнеса и права	3422	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета систем управления и радиоэлектроники в г. Сургуте	3217	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета систем управления и радиоэлектроники в городе Гурьевске Кемеровской области	3218	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета систем управления и радиоэлектроники в городе Колпашево Томской области (не лицензирован)	3219	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета систем управления и радиоэлектроники в городе Лангепасе Ханты-Мансийского автономного округа	3220	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета систем управления и радиоэлектроники в городе Нягани Ханты-Мансийского автономного округа	3221	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета систем управления и радиоэлектроники в городе Радужном Ханты-Мансийского автономного округа	3222	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского государственного университета систем управления и радиоэлектроники в городе Саяногорске (не лицензирован)	3223	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского политехнического университета в г. Междуреченске	3224	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Томского политехнического университета в г. Праге (не лицензирован см. письмо из вуза от 25.04.2005 года)	3225	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного архитектурно-строительного университета в г. Лабытнанги	3226	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного архитектурно-строительного университета в г. Муравленко	3227	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного архитектурно-строительного университета в г. Надыме	3228	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного архитектурно-строительного университета в г. Туртасе	3229	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в г. Заводоуковске	3230	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в г. Надыме имени В.В. Ремизова	3231	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в г. Нижневартовске	3232	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в г. Павлодаре	3233	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в г. Салехарде	3234	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в городе Ишиме	3235	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в городе Когалыме	3236	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в городе Лангепасе	3237	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в городе Муравленко	3238	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в городе Нефтеюганске	3239	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в городе Ноябрьске	3240	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в городе Нягани	3241	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в городе Советском	3242	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в городе Урае	3243	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного нефтегазового университета в городе Ялуторовске	3244	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Заводоуковске	3245	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Ишиме	3246	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Когалыме	3247	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Муравленко	3248	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Надыме	3249	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Новый Уренгой	3250	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Ноябрьске	3251	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Нягани	3252	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Пойковском	3253	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский институт Знание	3516	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Салехарде	3255	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Сургуте	3256	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Тобольске	3257	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Урае	3258	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в г. Шадринске	3259	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Тюменского государственного университета в Туапсинском районе Краснодарского края	3260	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Угреша Международного университета природы	3261	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Удмуртского государственного университета в г. Воткинске	3262	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Удмуртского государственного университета в г. Кудымкаре	3263	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Удмуртского государственного университета в г. Можге	3264	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Удмуртского государственного университета в городе Губкинском	3265	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Удмуртского государственного университета в городе Нижняя Тура	3266	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ульяновского государственного университета в г. Димитровграде	3267	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного горного университета в г. Североуральске	3268	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного педагогического университета в г. Каменске-Уральском	3269	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного педагогического университета в г. Красноуфимске	3270	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного педагогического университета в г. Новоуральске	3271	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного педагогического университета в г. Серове	3272	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного педагогического университета в г. Челябинске (находится в стадии ликвидации)	3273	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного технического университета - УПИ в г. Алапаевске	3274	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного технического университета - УПИ в г. Верхняя Салда	3275	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного технического университета - УПИ в г. Ирбите	3276	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного технического университета - УПИ в г. Краснотурьинске	3277	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного технического университета - УПИ в г. Красноуральске	3278	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного технического университета - УПИ в г. Невьянске	3279	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного технического университета - УПИ в г. Первоуральске	3280	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного технического университета - УПИ в г. Серове	3281	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного технического университета - УПИ в г. Чусовом	3282	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного университета им. А.М. Горького в г. Новоуральске	3283	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного университета им. А.М. Горького в г. Ноябрьске	3284	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного университета путей сообщения в г. Златоусте	3285	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного университета путей сообщения в г. Кургане	3286	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного университета путей сообщения в г. Нижнем Тагиле	3287	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного университета путей сообщения в г. Перми	3288	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного университета путей сообщения в г. Тюмени	3289	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного экономического университета в г. Березники	3290	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного экономического университета в г. Нижний Тагил	3291	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного экономического университета в г. Челябинске	3292	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральского государственного экономического университета в городе Каменске-Уральский	3293	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральской академии государственной службы в г. Ижевске	3294	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральской академии государственной службы в г. Лангепасе	3295	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральской академии государственной службы в г. Магнитогорске	3296	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральской академии государственной службы в г. Нижний Тагил	3297	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральской академии государственной службы в г. Оренбурге	3298	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральской академии государственной службы в г. Перми	3299	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральской академии государственной службы в г. Тюмени	3300	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уральской государственной юридической академии в г. Ноябрьске	3301	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уфимского государственного авиационного технического университета в г. Белорецке	3302	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уфимского государственного авиационного технического университета в г. Ишимбае	3303	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уфимского государственного авиационного технического университета в г. Нефтекамске	3304	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уфимского государственного авиационного технического университета в г. Стерлитамаке	3305	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уфимского государственного авиационного технического университета в г. Туймазы	3306	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уфимского государственного нефтяного технического университета в г. Октябрьском	3307	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уфимского государственного нефтяного технического университета в г. Салавате	3308	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уфимского государственного нефтяного технического университета в г. Стерлитамаке	3309	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Уфимского юридического института МВД России в городе Мелеузе	3310	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ухтинского государственного технического университета в г. Усинске	3311	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Хабаровского государственного педагогического университета в г. Благовещенске (не лицензирован)	3312	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Хакасского государственного университета им. Н.Ф. Катанова в г. Саяногорске	3313	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Челябинского государственного педагогического университета в г. Миассе	3314	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Чеченского государственного университета в г. Гудермесе	3315	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Чеченского государственного университета в г. Урус-Мартане	3316	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Чеченского государственного университета в г. Шали	3317	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Чеченского государственного университета в селении Ачхой-Мартан (не лицензирован)	3318	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Чеченского государственного университета в станице Шелковской (не лицензирован)	3319	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Чувашского государственного университета им. И.Н. Ульянова в г. Новочебоксарске	3320	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Югорского государственного университета в г. Мегионе	3321	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Волгодонске Ростовской области	3322	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Геленджике Краснодарского края	3323	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Георгиевске Ставропольского края	3324	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Ейске Краснодарского края	3325	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Железноводске Ставропольского края	3326	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Зернограде Ростовской области	3327	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Каменск-Шахтинском Ростовской области	3328	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Кизляре Республики Дагестан	3329	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Константиновске Ростовской области	3330	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Махачкале Республики Дагестан	3331	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Новошахтинске Ростовской области	3332	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Пятигорске Ставропольского края	3333	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Черкесске Карачаево-Черкесской Республики	3334	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Шахты Ростовской области	3335	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в г. Элисте Республики Калмыкия	3336	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в поселке Зимовники Ростовской области	3337	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в с. Учкекен Карачаево-Черкесской Республики	3338	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южного федерального университета в станице Вешенской Ростовской области	3339	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Российского государственного технического университета (Новочеркасского политехнического института) в городе Белая Калитва	3340	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского государственного университета в г. Аше	3341	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского государственного университета в г. Верхний Уфалей	3342	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского государственного университета в г. Златоусте	3343	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского государственного университета в г. Кусе	3344	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского государственного университета в г. Кыштыме	3345	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского государственного университета в г. Миассе	3346	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского государственного университета в г. Нижневартовске	3347	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского государственного университета в г. Нязепетровске	3348	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского государственного университета в г. Озерске	3349	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского государственного университета в г. Снежинске	3350	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского государственного университета в г. Трехгорном	3351	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского государственного университета в г. Усть-Катаве	3352	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского государственного университета в городе Сатке	3353	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского профессионального института в г. Аше	3354	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Южно-Уральского профессионального института в г. Куса	3355	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ярославского государственного педагогического университета им. К.Д. Ушинского в г. Ростове Ярославской области	3356	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ярославского государственного педагогического университета им. К.Д. Ушинского в г. Рыбинске Ярославской области	3357	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Филиал Ярославского государственного педагогического университета им. К.Д. Ушинского в г. Угличе Ярославской области	3358	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Финансовая академия при Правительстве Российской Федерации	3359	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Финансово-промышленный институт	3360	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Финансовый институт Московская школа экономики	3361	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Франко-Российский институт делового администрирования	3362	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Фроловский филиал Волгоградского государственного университета	3363	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Фрязинский филиал Современной гуманитарной академии	3364	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Хабаровская государственная академия экономики и права	3365	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Хабаровский государственный институт искусств и культуры	3366	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Хабаровский институт инфокоммуникаций (филиал) Сибирского государственного университета телекоммуникаций и информатики	3367	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Хабаровский пограничный институт Федеральной службы безопасности Российской Федерации	3368	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Хабаровский филиал Новосибирской государственной академии водного транспорта	3369	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Хабаровский филиал Современной гуманитарной академии	3370	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Хакасский государственный университет им. Н.Ф. Катанова	3371	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Хакасский институт бизнеса	3372	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Хакасский филиал Красноярского государственного аграрного университета	3373	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ханты-Мансийский государственный медицинский институт	3374	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ханты-Мансийский институт дизайна и прикладных искусств (филиал) Уральской государственной архитектурно-художественной академии	3375	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ханты-Мансийский филиал Института управления	3376	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ханты-Мансийский филиал Московского государственного университета культуры и искусств	3377	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ханты-Мансийский филиал Российской академии музыки им. Гнесиных	3378	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ханты-Мансийский филиал Томского государственного университета систем управления и радиоэлектроники	3379	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ханты-Мансийский филиал Уральского института коммерции и права	3380	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Хасавюртовский филиал Современной гуманитарной академии	3381	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Химкинский филиал Российского университета кооперации	3382	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Хреновский филиал Воронежской государственной лесотехнической академии (находится в стадии ликвидации	3383	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Царицынский православный университет Преподобного Сергия Радонежского	3384	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Центрально-Азиатский филиал Российского нового университета в г. Худжанде	3385	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Центральный институт управления и экономики туристского бизнеса - филиал Российской международной академии туризма	3386	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Центральный филиал Российской академии правосудия (г. Воронеж)	3387	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чайковский государственный институт физической культуры	3388	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чайковский технологический институт (филиал) Ижевского государственного технического университета	3389	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чайковский филиал Пермского государственного педагогического университета	3390	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чайковский филиал Пермского государственного технического университета	3391	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чебоксарский институт (филиал) Московского государственного открытого университета	3392	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чебоксарский институт экономики и менеджмента (филиал) Санкт-Петербургского государственного политехнического университета	3393	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чебоксарский кооперативный институт (филиал) Российского университета кооперации	3394	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чебоксарский филиал Академии права и управления (института)	3395	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чебоксарский филиал Московского государственного открытого педагогического университета имени М.А. Шолохова	3396	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чебоксарский филиал Нижегородской академии Министерства внутренних дел Российской Федерации	3397	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чебоксарский филиал Современной гуманитарной академии	3398	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинская государственная академия культуры и искусств	3399	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	3400	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский государственный агроинженерный университет	3401	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский государственный педагогический университет	3402	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский государственный университет	3403	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский гуманитарный институт	3404	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский институт (филиал) Российского государственного торгово-экономического университета	3405	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский институт (филиал) Уральской академии государственной службы	3406	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский институт музыки им. П.И. Чайковского	3407	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский институт путей сообщения - филиал Уральского государственного университета путей сообщения	3408	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский институт экономики и права им. М.В. Ладошина	3409	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский филиал Академии права и управления (института)	3410	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский филиал Московской международной высшей школы бизнеса МИРБИС (Иститут)	3411	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский филиал Российской академии предпринимательства	3412	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский филиал Современной гуманитарной академии	3413	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский филиал Университета Российской академии образования	3414	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинский юридический институт Министерства внутренних дел Российской Федерации	3415	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинское высшее военное авиационное училище штурманов (военный институт)	3416	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинское высшее военное автомобильное командно-инженерное училище (военный институт) имени Главного маршала бронетанковых войск П.А. Ротмистрова	3417	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Челябинское высшее военное командное училище (военный институт)	3418	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Череповецкий военный инженерный институт радиоэлектроники	3419	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Череповецкий государственный университет	3420	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Череповецкий филиал Вологодского государственного технического университета	3421	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Череповецкий филиал Московской государственной академии водного транспорта	3423	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Череповецкий филиал Современной гуманитарной академии	3424	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Череповецкий филиал Университета Российской академии образования	3425	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Черкесский филиал Краснодарского университета Министерства внутренних дел Российской Федерации	3426	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Черкесский филиал Современной гуманитарной академии	3427	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Черноголовский филиал Современной гуманитарной академии	3428	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Черноморская гуманитарная академия	3429	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Черняховский филиал Российского государственного университета имени Иммануила Канта	3430	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чеховский филиал Современной гуманитарной академии	3431	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чеченский государственный педагогический институт	3432	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чеченский государственный университет	3433	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чеченский институт бизнеса и управления	3434	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чиркейский институт имени Саида Афанди	3435	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чистопольский филиал Института экономики	3436	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Читинская государственная медицинская академия Федерального агентства по здравоохранению и социальному развитию	3437	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Читинский государственный университет	3438	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Читинский институт (филиал) Байкальского государственного университета экономики и права	3439	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Читинский филиал Восточно-Сибирской государственной академии культуры и искусств	3440	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Читинский филиал Российской академии предпринимательства	3441	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Читинский филиал Современной гуманитарной академии	3442	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чувашская государственная сельскохозяйственная академия	3443	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чувашский государственный институт культуры и искусств	3444	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чувашский государственный педагогический университет им. И.Я. Яковлева	3445	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чувашский государственный университет имени И.Н. Ульянова	3446	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чувашский филиал Московского гуманитарно-экономического института	3447	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Чурапчинский государственный институт физической культуры и спорта	3448	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Шадринский государственный педагогический институт	3449	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Шадринский филиал Московского государственного открытого педагогического университета имени М.А. Шолохова	3450	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Шадринский филиал Современной гуманитарной академии	3451	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Шарьинский филиал Костромского государственного университета имени Н.А. Некрасова	3452	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Шахтинский институт (филиал) Южно-Российского государственного технического университета (Новочеркасского политехнического института)	3453	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Шахтинский филиал Гуманитарного института (г. Москва)	3454	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Шахтинский филиал Южно-Российского гуманитарного института	3455	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Шенталинский филиал Самарского государственного экономического университета	3456	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Школа культурной политики	3457	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Школа-студия (вуз) имени Вл.И. Немировича-Данченко при Московском Художественном академическом театре имени А.П. Чехова	3458	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Шуйский государственный педагогический университет	3459	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Экономико-гуманитарный институт (г. Москва)	3460	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Экономико-правовой институт	3461	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Экономико-энергетический институт	3462	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Экономико-юридический институт	3463	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Электростальский политехнический институт (филиал) Московского государственного института стали и сплавов (технологического университета)	3464	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Электростальский филиал Евразийского открытого института	3465	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Электростальский филиал Современной гуманитарной академии	3466	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Элистинский филиал Современной гуманитарной академии	3467	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Энгельсский технологический институт (филиал) Саратовского государственного технического университета	3468	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Югорский государственный университет	3469	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южно-Российский государственный технический университет (Новочеркасский политехнический институт)	3470	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южно-Российский государственный университет экономики и сервиса	3471	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южно-Российский гуманитарный институт (г. Ростов-на-Дону)	3472	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южно-Российский институт международных отношений	3473	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южно-Сахалинский институт (филиал) Российского государственного торгово-экономического университета	3474	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южно-Сахалинский институт коммерции и предпринимательства	3475	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южно-Сахалинский институт экономики	3476	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южно-Сахалинский филиал Дальневосточного юридического института Министерства внутренних дел Российской Федерации	3477	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южно-Сахалинский филиал Приморской государственной сельскохозяйственной академии	3478	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южно-Сахалинский филиал Современной гуманитарной академии	3479	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южно-Сахалинский филиал Хабаровской государственной академии экономики и права	3480	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южно-Уральский государственный университет	3481	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южно-Уральский институт управления и экономики	3482	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южно-Уральский профессиональный институт	3483	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южный институт менеджмента	3484	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Южный федеральный университет	3485	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Юргинский технологический институт (филиал) Томского политехнического университета	3486	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Юридический институт	3487	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутская государственная сельскохозяйственная академия	3488	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский государственный инженерно-технический институт	3489	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский государственный университет имени М.К. Аммосова	3490	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский Институт в Москве	3491	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский институт дистанционного образования	3492	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский университет высоких технологий в Санкт-Петербурге	3493	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский филиал Академии права и управления (института)	3494	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский филиал Дальневосточного юридического института Министерства внутренних дел Российской Федерации	3495	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский филиал Института государственного администрирования	3496	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский филиал Московского государственного открытого педагогического университета имени М.А. Шолохова	3497	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский филиал Московского государственного университета сервиса	3498	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский филиал Московской академии предпринимательства при Правительстве г. Москвы	3499	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский филиал Новосибирского государственного университета экономики и управления - НИНХ	3500	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский филиал Новосибирской государственной академии водного транспорта	3501	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский филиал Санкт-Петербургского Гуманитарного университета профсоюзов	3502	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский филиал Санкт-Петербургской академии управления и экономики	3503	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский филиал Сибирского университета потребительской кооперации	3504	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский филиал Современной гуманитарной академии	3505	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Якутский экономико-правовой институт (филиал) Академии труда и социальных отношений	3506	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ямальский нефтегазовый институт (филиал) Тюменского государственного нефтегазового университета	3507	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Яранский филиал Вятской государственной сельскохозяйственной академии	3508	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославская государственная медицинская академия Министерства здравоохранения Российской Федерации	3509	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославская государственная сельскохозяйственная академия	3510	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский военный финансово-экономический институт имени генерала армии А.В. Хрулева	3511	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский государственный педагогический университет им. К.Д. Ушинского	3512	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский государственный театральный институт	3513	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский государственный технический университет	3514	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский государственный университет имени П.Г. Демидова	3515	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский филиал Академии труда и социальных отношений	3517	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский филиал Всероссийского заочного финансово-экономического института	3518	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский филиал Института управления (г. Архангельск)	3519	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский филиал Института финансов	3520	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский филиал Ленинградского государственного университета имени А.С. Пушкина	3521	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский филиал Московского государственного университета экономики	3522	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский филиал Московской академии предпринимательства при Правительстве г. Москвы	3523	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский филиал Московской финансово-юридической академии	3524	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский филиал Нижегородского коммерческого института	3525	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский филиал Московского Государственного Университета Путей Сообщения	3526	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский филиал Российской международной академии туризма	3527	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославский филиал Современной гуманитарной академии	3528	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
Ярославское высшее зенитное ракетное училище противовоздушной обороны (военный институт)	3529	2026-03-21 09:01:13.019788	2026-03-21 09:01:13.019788
\.


--
-- TOC entry 4873 (class 0 OID 20434)
-- Dependencies: 249
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (first_name, last_name, patronymic, birthdate, login, email, password_hash, role_id, id, created_at, updated_at, is_activated, is_admin) FROM stdin;
admin	admin	admin	2005-07-11	admin	admin@admin.admin	scrypt:32768:8:1$kNB9fXmvgnc6uike$4a52b3091234e86b81e33dc9b5b500d45fe3d20efdbaa18fb5374d2d5b8d41870437b24460ff6039768d06cb11d9166542270175c4bcf13f993abc9c316e5861	3	1	2026-03-21 10:53:29.598245	2026-03-21 10:53:29.598245	t	t
\.


--
-- TOC entry 4905 (class 0 OID 20897)
-- Dependencies: 281
-- Data for Name: vacancies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacancies (title, description, media_url, address, published_at, is_active, moderation_comment, expires_at, salary_min, salary_max, company_id, work_format_id, employment_type_id, experience_level_id, moderation_status_id, location_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4909 (class 0 OID 20969)
-- Dependencies: 285
-- Data for Name: vacancy_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacancy_applications (cover_letter, employer_note, vacancy_id, applicant_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4907 (class 0 OID 20950)
-- Dependencies: 283
-- Data for Name: verification_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.verification_requests (is_accepted, company_id, id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4869 (class 0 OID 20402)
-- Dependencies: 245
-- Data for Name: work_formats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work_formats (title, id, created_at, updated_at) FROM stdin;
Офис	1	2026-03-21 09:04:05.249613	2026-03-21 09:04:05.249613
Гибрид	2	2026-03-21 09:04:05.262574	2026-03-21 09:04:05.262574
Удаленно	3	2026-03-21 09:04:05.269024	2026-03-21 09:04:05.269024
\.


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 254
-- Name: applicant_contact_recommendations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_contact_recommendations_id_seq', 1, false);


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 220
-- Name: applicant_contact_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_contact_statuses_id_seq', 1, false);


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 256
-- Name: applicant_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_contacts_id_seq', 1, false);


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 258
-- Name: applicant_educations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_educations_id_seq', 1, false);


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 260
-- Name: applicant_experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_experiences_id_seq', 1, false);


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 262
-- Name: applicant_favorite_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_favorite_companies_id_seq', 1, false);


--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 250
-- Name: applicant_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_profiles_id_seq', 1, false);


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 264
-- Name: applicant_resume_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_resume_files_id_seq', 1, false);


--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 266
-- Name: applicant_resume_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_resume_links_id_seq', 1, false);


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 268
-- Name: applicant_resume_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_resume_projects_id_seq', 1, false);


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 222
-- Name: applicant_skill_tag_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_skill_tag_categories_id_seq', 1, false);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 246
-- Name: applicant_skill_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_skill_tags_id_seq', 1, false);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 270
-- Name: applicant_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_skills_id_seq', 1, false);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 272
-- Name: career_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.career_events_id_seq', 1, false);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 224
-- Name: company_profile_logos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_profile_logos_id_seq', 1, false);


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 226
-- Name: company_profile_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_profile_photos_id_seq', 1, false);


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 274
-- Name: company_profile_socials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_profile_socials_id_seq', 1, false);


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 252
-- Name: company_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_profiles_id_seq', 1, false);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 228
-- Name: employment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employment_types_id_seq', 3, true);


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 230
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_types_id_seq', 3, true);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 232
-- Name: experience_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.experience_levels_id_seq', 1, false);


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 234
-- Name: industries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.industries_id_seq', 1, false);


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 276
-- Name: internships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.internships_id_seq', 1, false);


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 236
-- Name: location_coordinates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_coordinates_id_seq', 1, false);


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 278
-- Name: mentorship_programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mentorship_programs_id_seq', 1, false);


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 238
-- Name: moderation_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moderation_statuses_id_seq', 3, true);


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 240
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 242
-- Name: universities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.universities_id_seq', 3529, true);


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 248
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 280
-- Name: vacancies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vacancies_id_seq', 1, false);


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 284
-- Name: vacancy_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vacancy_applications_id_seq', 1, false);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 282
-- Name: verification_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.verification_requests_id_seq', 1, false);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 244
-- Name: work_formats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.work_formats_id_seq', 3, true);


--
-- TOC entry 4578 (class 2606 OID 20235)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 4620 (class 2606 OID 20541)
-- Name: applicant_contact_recommendations applicant_contact_recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_contact_recommendations
    ADD CONSTRAINT applicant_contact_recommendations_pkey PRIMARY KEY (id);


--
-- TOC entry 4580 (class 2606 OID 20248)
-- Name: applicant_contact_statuses applicant_contact_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_contact_statuses
    ADD CONSTRAINT applicant_contact_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 4622 (class 2606 OID 20566)
-- Name: applicant_contacts applicant_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_contacts
    ADD CONSTRAINT applicant_contacts_pkey PRIMARY KEY (id);


--
-- TOC entry 4624 (class 2606 OID 20598)
-- Name: applicant_educations applicant_educations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_educations
    ADD CONSTRAINT applicant_educations_pkey PRIMARY KEY (id);


--
-- TOC entry 4626 (class 2606 OID 20625)
-- Name: applicant_experiences applicant_experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_experiences
    ADD CONSTRAINT applicant_experiences_pkey PRIMARY KEY (id);


--
-- TOC entry 4628 (class 2606 OID 20644)
-- Name: applicant_favorite_companies applicant_favorite_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_favorite_companies
    ADD CONSTRAINT applicant_favorite_companies_pkey PRIMARY KEY (id);


--
-- TOC entry 4616 (class 2606 OID 20476)
-- Name: applicant_profiles applicant_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_profiles
    ADD CONSTRAINT applicant_profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 4630 (class 2606 OID 20672)
-- Name: applicant_resume_files applicant_resume_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_resume_files
    ADD CONSTRAINT applicant_resume_files_pkey PRIMARY KEY (id);


--
-- TOC entry 4632 (class 2606 OID 20694)
-- Name: applicant_resume_links applicant_resume_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_resume_links
    ADD CONSTRAINT applicant_resume_links_pkey PRIMARY KEY (id);


--
-- TOC entry 4634 (class 2606 OID 20715)
-- Name: applicant_resume_projects applicant_resume_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_resume_projects
    ADD CONSTRAINT applicant_resume_projects_pkey PRIMARY KEY (id);


--
-- TOC entry 4582 (class 2606 OID 20261)
-- Name: applicant_skill_tag_categories applicant_skill_tag_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_skill_tag_categories
    ADD CONSTRAINT applicant_skill_tag_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4608 (class 2606 OID 20427)
-- Name: applicant_skill_tags applicant_skill_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_skill_tags
    ADD CONSTRAINT applicant_skill_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4636 (class 2606 OID 20735)
-- Name: applicant_skills applicant_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_skills
    ADD CONSTRAINT applicant_skills_pkey PRIMARY KEY (id);


--
-- TOC entry 4638 (class 2606 OID 20768)
-- Name: career_events career_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_events
    ADD CONSTRAINT career_events_pkey PRIMARY KEY (id);


--
-- TOC entry 4584 (class 2606 OID 20277)
-- Name: company_profile_logos company_profile_logos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profile_logos
    ADD CONSTRAINT company_profile_logos_pkey PRIMARY KEY (id);


--
-- TOC entry 4586 (class 2606 OID 20293)
-- Name: company_profile_photos company_profile_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profile_photos
    ADD CONSTRAINT company_profile_photos_pkey PRIMARY KEY (id);


--
-- TOC entry 4640 (class 2606 OID 20805)
-- Name: company_profile_socials company_profile_socials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profile_socials
    ADD CONSTRAINT company_profile_socials_pkey PRIMARY KEY (id);


--
-- TOC entry 4618 (class 2606 OID 20504)
-- Name: company_profiles company_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profiles
    ADD CONSTRAINT company_profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 4588 (class 2606 OID 20306)
-- Name: employment_types employment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employment_types
    ADD CONSTRAINT employment_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4590 (class 2606 OID 20319)
-- Name: event_types event_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4592 (class 2606 OID 20332)
-- Name: experience_levels experience_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experience_levels
    ADD CONSTRAINT experience_levels_pkey PRIMARY KEY (id);


--
-- TOC entry 4594 (class 2606 OID 20345)
-- Name: industries industries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries
    ADD CONSTRAINT industries_pkey PRIMARY KEY (id);


--
-- TOC entry 4642 (class 2606 OID 20835)
-- Name: internships internships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internships
    ADD CONSTRAINT internships_pkey PRIMARY KEY (id);


--
-- TOC entry 4596 (class 2606 OID 20359)
-- Name: location_coordinates location_coordinates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_coordinates
    ADD CONSTRAINT location_coordinates_pkey PRIMARY KEY (id);


--
-- TOC entry 4644 (class 2606 OID 20880)
-- Name: mentorship_programs mentorship_programs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentorship_programs
    ADD CONSTRAINT mentorship_programs_pkey PRIMARY KEY (id);


--
-- TOC entry 4598 (class 2606 OID 20372)
-- Name: moderation_statuses moderation_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderation_statuses
    ADD CONSTRAINT moderation_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 4600 (class 2606 OID 20385)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4602 (class 2606 OID 20387)
-- Name: roles roles_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_title_key UNIQUE (title);


--
-- TOC entry 4604 (class 2606 OID 20400)
-- Name: universities universities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_pkey PRIMARY KEY (id);


--
-- TOC entry 4610 (class 2606 OID 20454)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4612 (class 2606 OID 20456)
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- TOC entry 4614 (class 2606 OID 20452)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4646 (class 2606 OID 20918)
-- Name: vacancies vacancies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_pkey PRIMARY KEY (id);


--
-- TOC entry 4650 (class 2606 OID 20983)
-- Name: vacancy_applications vacancy_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancy_applications
    ADD CONSTRAINT vacancy_applications_pkey PRIMARY KEY (id);


--
-- TOC entry 4648 (class 2606 OID 20962)
-- Name: verification_requests verification_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_requests
    ADD CONSTRAINT verification_requests_pkey PRIMARY KEY (id);


--
-- TOC entry 4606 (class 2606 OID 20413)
-- Name: work_formats work_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_formats
    ADD CONSTRAINT work_formats_pkey PRIMARY KEY (id);


--
-- TOC entry 4659 (class 2606 OID 21228)
-- Name: applicant_contact_recommendations applicant_contact_recommendations_recipient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_contact_recommendations
    ADD CONSTRAINT applicant_contact_recommendations_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.applicant_profiles(id);


--
-- TOC entry 4660 (class 2606 OID 21223)
-- Name: applicant_contact_recommendations applicant_contact_recommendations_recommender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_contact_recommendations
    ADD CONSTRAINT applicant_contact_recommendations_recommender_id_fkey FOREIGN KEY (recommender_id) REFERENCES public.applicant_profiles(id);


--
-- TOC entry 4661 (class 2606 OID 21233)
-- Name: applicant_contacts applicant_contacts_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_contacts
    ADD CONSTRAINT applicant_contacts_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.applicant_profiles(id);


--
-- TOC entry 4662 (class 2606 OID 21238)
-- Name: applicant_contacts applicant_contacts_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_contacts
    ADD CONSTRAINT applicant_contacts_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.applicant_profiles(id);


--
-- TOC entry 4663 (class 2606 OID 21243)
-- Name: applicant_contacts applicant_contacts_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_contacts
    ADD CONSTRAINT applicant_contacts_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.applicant_contact_statuses(id);


--
-- TOC entry 4664 (class 2606 OID 21253)
-- Name: applicant_educations applicant_educations_applicant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_educations
    ADD CONSTRAINT applicant_educations_applicant_id_fkey FOREIGN KEY (applicant_id) REFERENCES public.applicant_profiles(id);


--
-- TOC entry 4665 (class 2606 OID 21248)
-- Name: applicant_educations applicant_educations_university_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_educations
    ADD CONSTRAINT applicant_educations_university_id_fkey FOREIGN KEY (university_id) REFERENCES public.universities(id);


--
-- TOC entry 4666 (class 2606 OID 21258)
-- Name: applicant_experiences applicant_experiences_applicant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_experiences
    ADD CONSTRAINT applicant_experiences_applicant_id_fkey FOREIGN KEY (applicant_id) REFERENCES public.applicant_profiles(id);


--
-- TOC entry 4667 (class 2606 OID 21263)
-- Name: applicant_favorite_companies applicant_favorite_companies_applicant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_favorite_companies
    ADD CONSTRAINT applicant_favorite_companies_applicant_id_fkey FOREIGN KEY (applicant_id) REFERENCES public.applicant_profiles(id);


--
-- TOC entry 4668 (class 2606 OID 21268)
-- Name: applicant_favorite_companies applicant_favorite_companies_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_favorite_companies
    ADD CONSTRAINT applicant_favorite_companies_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company_profiles(id);


--
-- TOC entry 4653 (class 2606 OID 21278)
-- Name: applicant_profiles applicant_profiles_university_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_profiles
    ADD CONSTRAINT applicant_profiles_university_id_fkey FOREIGN KEY (university_id) REFERENCES public.universities(id);


--
-- TOC entry 4654 (class 2606 OID 21273)
-- Name: applicant_profiles applicant_profiles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_profiles
    ADD CONSTRAINT applicant_profiles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4669 (class 2606 OID 21283)
-- Name: applicant_resume_files applicant_resume_files_applicant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_resume_files
    ADD CONSTRAINT applicant_resume_files_applicant_id_fkey FOREIGN KEY (applicant_id) REFERENCES public.applicant_profiles(id);


--
-- TOC entry 4670 (class 2606 OID 21288)
-- Name: applicant_resume_links applicant_resume_links_applicant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_resume_links
    ADD CONSTRAINT applicant_resume_links_applicant_id_fkey FOREIGN KEY (applicant_id) REFERENCES public.applicant_profiles(id);


--
-- TOC entry 4671 (class 2606 OID 21293)
-- Name: applicant_resume_projects applicant_resume_projects_applicant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_resume_projects
    ADD CONSTRAINT applicant_resume_projects_applicant_id_fkey FOREIGN KEY (applicant_id) REFERENCES public.applicant_profiles(id);


--
-- TOC entry 4651 (class 2606 OID 21298)
-- Name: applicant_skill_tags applicant_skill_tags_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_skill_tags
    ADD CONSTRAINT applicant_skill_tags_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.applicant_skill_tag_categories(id);


--
-- TOC entry 4672 (class 2606 OID 21308)
-- Name: applicant_skills applicant_skills_applicant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_skills
    ADD CONSTRAINT applicant_skills_applicant_id_fkey FOREIGN KEY (applicant_id) REFERENCES public.applicant_profiles(id);


--
-- TOC entry 4673 (class 2606 OID 21303)
-- Name: applicant_skills applicant_skills_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_skills
    ADD CONSTRAINT applicant_skills_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.applicant_skill_tags(id);


--
-- TOC entry 4674 (class 2606 OID 21313)
-- Name: career_events career_events_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_events
    ADD CONSTRAINT career_events_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company_profiles(id);


--
-- TOC entry 4675 (class 2606 OID 21318)
-- Name: career_events career_events_event_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_events
    ADD CONSTRAINT career_events_event_type_id_fkey FOREIGN KEY (event_type_id) REFERENCES public.event_types(id);


--
-- TOC entry 4676 (class 2606 OID 21323)
-- Name: career_events career_events_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_events
    ADD CONSTRAINT career_events_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location_coordinates(id);


--
-- TOC entry 4677 (class 2606 OID 21328)
-- Name: career_events career_events_moderation_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_events
    ADD CONSTRAINT career_events_moderation_status_id_fkey FOREIGN KEY (moderation_status_id) REFERENCES public.moderation_statuses(id);


--
-- TOC entry 4678 (class 2606 OID 21333)
-- Name: company_profile_socials company_profile_socials_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profile_socials
    ADD CONSTRAINT company_profile_socials_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company_profiles(id);


--
-- TOC entry 4655 (class 2606 OID 21343)
-- Name: company_profiles company_profiles_creator_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profiles
    ADD CONSTRAINT company_profiles_creator_user_id_fkey FOREIGN KEY (creator_user_id) REFERENCES public.users(id);


--
-- TOC entry 4656 (class 2606 OID 21348)
-- Name: company_profiles company_profiles_industry_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profiles
    ADD CONSTRAINT company_profiles_industry_id_fkey FOREIGN KEY (industry_id) REFERENCES public.industries(id);


--
-- TOC entry 4657 (class 2606 OID 21338)
-- Name: company_profiles company_profiles_logo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profiles
    ADD CONSTRAINT company_profiles_logo_id_fkey FOREIGN KEY (logo_id) REFERENCES public.company_profile_logos(id);


--
-- TOC entry 4658 (class 2606 OID 21353)
-- Name: company_profiles company_profiles_official_photo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profiles
    ADD CONSTRAINT company_profiles_official_photo_id_fkey FOREIGN KEY (official_photo_id) REFERENCES public.company_profile_photos(id);


--
-- TOC entry 4679 (class 2606 OID 21368)
-- Name: internships internships_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internships
    ADD CONSTRAINT internships_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company_profiles(id);


--
-- TOC entry 4680 (class 2606 OID 21373)
-- Name: internships internships_experience_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internships
    ADD CONSTRAINT internships_experience_level_id_fkey FOREIGN KEY (experience_level_id) REFERENCES public.experience_levels(id);


--
-- TOC entry 4681 (class 2606 OID 21358)
-- Name: internships internships_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internships
    ADD CONSTRAINT internships_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location_coordinates(id);


--
-- TOC entry 4682 (class 2606 OID 21378)
-- Name: internships internships_moderation_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internships
    ADD CONSTRAINT internships_moderation_status_id_fkey FOREIGN KEY (moderation_status_id) REFERENCES public.moderation_statuses(id);


--
-- TOC entry 4683 (class 2606 OID 21363)
-- Name: internships internships_work_format_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internships
    ADD CONSTRAINT internships_work_format_id_fkey FOREIGN KEY (work_format_id) REFERENCES public.work_formats(id);


--
-- TOC entry 4684 (class 2606 OID 21393)
-- Name: mentorship_programs mentorship_programs_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentorship_programs
    ADD CONSTRAINT mentorship_programs_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company_profiles(id);


--
-- TOC entry 4685 (class 2606 OID 21388)
-- Name: mentorship_programs mentorship_programs_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentorship_programs
    ADD CONSTRAINT mentorship_programs_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location_coordinates(id);


--
-- TOC entry 4686 (class 2606 OID 21383)
-- Name: mentorship_programs mentorship_programs_moderation_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentorship_programs
    ADD CONSTRAINT mentorship_programs_moderation_status_id_fkey FOREIGN KEY (moderation_status_id) REFERENCES public.moderation_statuses(id);


--
-- TOC entry 4652 (class 2606 OID 21399)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 4687 (class 2606 OID 21424)
-- Name: vacancies vacancies_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company_profiles(id);


--
-- TOC entry 4688 (class 2606 OID 21414)
-- Name: vacancies vacancies_employment_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_employment_type_id_fkey FOREIGN KEY (employment_type_id) REFERENCES public.employment_types(id);


--
-- TOC entry 4689 (class 2606 OID 21429)
-- Name: vacancies vacancies_experience_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_experience_level_id_fkey FOREIGN KEY (experience_level_id) REFERENCES public.experience_levels(id);


--
-- TOC entry 4690 (class 2606 OID 21404)
-- Name: vacancies vacancies_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location_coordinates(id);


--
-- TOC entry 4691 (class 2606 OID 21409)
-- Name: vacancies vacancies_moderation_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_moderation_status_id_fkey FOREIGN KEY (moderation_status_id) REFERENCES public.moderation_statuses(id);


--
-- TOC entry 4692 (class 2606 OID 21419)
-- Name: vacancies vacancies_work_format_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_work_format_id_fkey FOREIGN KEY (work_format_id) REFERENCES public.work_formats(id);


--
-- TOC entry 4694 (class 2606 OID 21434)
-- Name: vacancy_applications vacancy_applications_applicant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancy_applications
    ADD CONSTRAINT vacancy_applications_applicant_id_fkey FOREIGN KEY (applicant_id) REFERENCES public.applicant_profiles(id);


--
-- TOC entry 4695 (class 2606 OID 21439)
-- Name: vacancy_applications vacancy_applications_vacancy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancy_applications
    ADD CONSTRAINT vacancy_applications_vacancy_id_fkey FOREIGN KEY (vacancy_id) REFERENCES public.vacancies(id);


--
-- TOC entry 4693 (class 2606 OID 21444)
-- Name: verification_requests verification_requests_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_requests
    ADD CONSTRAINT verification_requests_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company_profiles(id);


-- Completed on 2026-03-21 10:58:14 +05

--
-- PostgreSQL database dump complete
--

\unrestrict YkyjCPrWprz8CdW0vO6qGDKcFouiF0aYHa17r9tHVQ4L6ZueLYmBoXlhGP44a2f

