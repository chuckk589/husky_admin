--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 15.3

-- Started on 2023-10-28 22:19:23

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
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 18444)
-- Name: achievments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achievments (
    id integer NOT NULL,
    type character varying(64) NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(255) NOT NULL,
    award_key character varying(64) NOT NULL,
    award_name character varying(64) NOT NULL,
    icon character varying(64) NOT NULL,
    actions jsonb NOT NULL
);


ALTER TABLE public.achievments OWNER TO postgres;

--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN achievments.award_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.achievments.award_key IS 'Ключ получаемой награды';


--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN achievments.award_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.achievments.award_name IS 'Название получаемой награды';


--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN achievments.actions; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.achievments.actions IS 'Массив из объектов действий необходимых для получения ачивки';


--
-- TOC entry 202 (class 1259 OID 18442)
-- Name: achievments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.achievments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.achievments_id_seq OWNER TO postgres;

--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 202
-- Name: achievments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.achievments_id_seq OWNED BY public.achievments.id;


--
-- TOC entry 205 (class 1259 OID 18455)
-- Name: actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actions (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    "group" integer NOT NULL,
    animation_id integer NOT NULL,
    rules jsonb NOT NULL,
    min_time integer NOT NULL,
    max_time integer NOT NULL,
    "unique" boolean NOT NULL,
    condition_ids jsonb NOT NULL
);


ALTER TABLE public.actions OWNER TO postgres;

--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN actions.rules; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.actions.rules IS 'Правила для выполнения действий, тут указываются ключи, вся логика в коде прописывается';


--
-- TOC entry 204 (class 1259 OID 18453)
-- Name: actions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actions_id_seq OWNER TO postgres;

--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 204
-- Name: actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actions_id_seq OWNED BY public.actions.id;


--
-- TOC entry 207 (class 1259 OID 18467)
-- Name: buffs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buffs (
    id integer NOT NULL,
    "group" integer NOT NULL,
    type character varying(64) NOT NULL,
    positive boolean NOT NULL,
    multiply integer NOT NULL,
    name character varying(64) NOT NULL,
    icon character varying(64) NOT NULL,
    description character varying(256) NOT NULL,
    metadata character varying(128) NOT NULL
);


ALTER TABLE public.buffs OWNER TO postgres;

--
-- TOC entry 3650 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN buffs."group"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buffs."group" IS 'У одной группы не может быть бафф и дебафф одновременно!!';


--
-- TOC entry 3651 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN buffs.positive; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buffs.positive IS 'Является ли бонус положительным';


--
-- TOC entry 3652 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN buffs.multiply; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buffs.multiply IS 'множитель бонуса в процентах';


--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN buffs.metadata; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buffs.metadata IS 'конкретизация на что бонус, используется не везде, и для каждого случая свое значение';


--
-- TOC entry 206 (class 1259 OID 18465)
-- Name: buffs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buffs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.buffs_id_seq OWNER TO postgres;

--
-- TOC entry 3654 (class 0 OID 0)
-- Dependencies: 206
-- Name: buffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.buffs_id_seq OWNED BY public.buffs.id;


--
-- TOC entry 273 (class 1259 OID 19332)
-- Name: character_duplicate_fines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.character_duplicate_fines (
    id integer NOT NULL,
    count_duplicates integer NOT NULL,
    fine_percent real NOT NULL
);


ALTER TABLE public.character_duplicate_fines OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 19330)
-- Name: character_duplicate_fines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_duplicate_fines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_duplicate_fines_id_seq OWNER TO postgres;

--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 272
-- Name: character_duplicate_fines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_duplicate_fines_id_seq OWNED BY public.character_duplicate_fines.id;


--
-- TOC entry 211 (class 1259 OID 18489)
-- Name: character_levels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.character_levels (
    id integer NOT NULL,
    level integer NOT NULL,
    from_exp integer NOT NULL,
    price integer DEFAULT 100 NOT NULL,
    efficiency_for_level real DEFAULT '0.1'::real NOT NULL
);


ALTER TABLE public.character_levels OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 18487)
-- Name: character_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_levels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_levels_id_seq OWNER TO postgres;

--
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 210
-- Name: character_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_levels_id_seq OWNED BY public.character_levels.id;


--
-- TOC entry 213 (class 1259 OID 18497)
-- Name: character_perks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.character_perks (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    icon character varying(64) NOT NULL,
    type character varying(64),
    value real DEFAULT '0'::real NOT NULL
);


ALTER TABLE public.character_perks OWNER TO postgres;

--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN character_perks.value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.character_perks.value IS 'Указывается в зависимости от перка, нужен не везде';


--
-- TOC entry 212 (class 1259 OID 18495)
-- Name: character_perks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_perks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_perks_id_seq OWNER TO postgres;

--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 212
-- Name: character_perks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_perks_id_seq OWNED BY public.character_perks.id;


--
-- TOC entry 309 (class 1259 OID 20150)
-- Name: character_puzzle_chances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.character_puzzle_chances (
    id integer NOT NULL,
    chance real NOT NULL,
    character_id integer
);


ALTER TABLE public.character_puzzle_chances OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 20148)
-- Name: character_puzzle_chances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_puzzle_chances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_puzzle_chances_id_seq OWNER TO postgres;

--
-- TOC entry 3659 (class 0 OID 0)
-- Dependencies: 308
-- Name: character_puzzle_chances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_puzzle_chances_id_seq OWNED BY public.character_puzzle_chances.id;


--
-- TOC entry 209 (class 1259 OID 18478)
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    id integer NOT NULL,
    template_name character varying(64) NOT NULL,
    "group" integer NOT NULL,
    promo_image character varying(64) NOT NULL,
    avatar character varying(64) NOT NULL,
    model character varying(64) NOT NULL,
    actions jsonb NOT NULL,
    friends jsonb NOT NULL,
    things jsonb NOT NULL,
    perks jsonb NOT NULL,
    can_be_starter boolean DEFAULT false NOT NULL
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN characters.actions; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.characters.actions IS 'Доступные персонажу действия';


--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN characters.things; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.characters.things IS 'Список ид вещей, который у этого персонажа, указывается по очередности уровней';


--
-- TOC entry 208 (class 1259 OID 18476)
-- Name: characters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_id_seq OWNER TO postgres;

--
-- TOC entry 3662 (class 0 OID 0)
-- Dependencies: 208
-- Name: characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_id_seq OWNED BY public.characters.id;


--
-- TOC entry 271 (class 1259 OID 19319)
-- Name: characters_requirements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters_requirements (
    id integer NOT NULL,
    book_row integer NOT NULL,
    furniture_id integer NOT NULL,
    furniture_group integer NOT NULL,
    character_id integer
);


ALTER TABLE public.characters_requirements OWNER TO postgres;

--
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN characters_requirements.furniture_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.characters_requirements.furniture_id IS 'Если group = -1';


--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN characters_requirements.furniture_group; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.characters_requirements.furniture_group IS 'Если id = -1';


--
-- TOC entry 270 (class 1259 OID 19317)
-- Name: characters_requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_requirements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_requirements_id_seq OWNER TO postgres;

--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 270
-- Name: characters_requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_requirements_id_seq OWNED BY public.characters_requirements.id;


--
-- TOC entry 215 (class 1259 OID 18506)
-- Name: constants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constants (
    id integer NOT NULL,
    key character varying(64) NOT NULL,
    type character varying(64) NOT NULL,
    num_value integer,
    str_value character varying(128),
    flt_value double precision,
    arr_value jsonb
);


ALTER TABLE public.constants OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 18504)
-- Name: constants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.constants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constants_id_seq OWNER TO postgres;

--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 214
-- Name: constants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.constants_id_seq OWNED BY public.constants.id;


--
-- TOC entry 217 (class 1259 OID 18517)
-- Name: consumables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumables (
    id integer NOT NULL,
    "group" integer NOT NULL,
    name character varying(128) NOT NULL,
    icon character varying(64) NOT NULL,
    description character varying(255) NOT NULL,
    use_type character varying(32) NOT NULL,
    max_count integer NOT NULL,
    use_count integer DEFAULT 1 NOT NULL,
    buff_id integer,
    value double precision DEFAULT '0'::double precision NOT NULL,
    only_characters boolean DEFAULT false NOT NULL
);


ALTER TABLE public.consumables OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18515)
-- Name: consumables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consumables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consumables_id_seq OWNER TO postgres;

--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 216
-- Name: consumables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consumables_id_seq OWNED BY public.consumables.id;


--
-- TOC entry 249 (class 1259 OID 18738)
-- Name: dialogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dialogs (
    id integer NOT NULL,
    messages jsonb DEFAULT '[]'::jsonb NOT NULL
);


ALTER TABLE public.dialogs OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 18736)
-- Name: dialogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dialogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dialogs_id_seq OWNER TO postgres;

--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 248
-- Name: dialogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dialogs_id_seq OWNED BY public.dialogs.id;


--
-- TOC entry 241 (class 1259 OID 18703)
-- Name: en_lang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.en_lang (
    id integer NOT NULL,
    key character varying(64) NOT NULL,
    type character varying(64) NOT NULL,
    text character varying(255) NOT NULL
);


ALTER TABLE public.en_lang OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 18701)
-- Name: en_lang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.en_lang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.en_lang_id_seq OWNER TO postgres;

--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 240
-- Name: en_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.en_lang_id_seq OWNED BY public.en_lang.id;


--
-- TOC entry 245 (class 1259 OID 18719)
-- Name: es_lang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.es_lang (
    id integer NOT NULL,
    key character varying(64) NOT NULL,
    type character varying(64) NOT NULL,
    text character varying(255) NOT NULL
);


ALTER TABLE public.es_lang OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 18717)
-- Name: es_lang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.es_lang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.es_lang_id_seq OWNER TO postgres;

--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 244
-- Name: es_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.es_lang_id_seq OWNED BY public.es_lang.id;


--
-- TOC entry 219 (class 1259 OID 18528)
-- Name: floors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.floors (
    id integer NOT NULL,
    "x-size" integer NOT NULL,
    "y-size" integer NOT NULL
);


ALTER TABLE public.floors OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18526)
-- Name: floors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.floors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.floors_id_seq OWNER TO postgres;

--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 218
-- Name: floors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.floors_id_seq OWNED BY public.floors.id;


--
-- TOC entry 311 (class 1259 OID 20158)
-- Name: furniture_puzzle_chances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.furniture_puzzle_chances (
    id integer NOT NULL,
    chance real NOT NULL,
    furniture_id integer
);


ALTER TABLE public.furniture_puzzle_chances OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 20156)
-- Name: furniture_puzzle_chances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.furniture_puzzle_chances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.furniture_puzzle_chances_id_seq OWNER TO postgres;

--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 310
-- Name: furniture_puzzle_chances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.furniture_puzzle_chances_id_seq OWNED BY public.furniture_puzzle_chances.id;


--
-- TOC entry 221 (class 1259 OID 18536)
-- Name: furnitures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.furnitures (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    category integer NOT NULL,
    description character varying(255) NOT NULL,
    promo_image character varying(64) NOT NULL,
    icon character varying(64) NOT NULL,
    model character varying(64) NOT NULL,
    occupy boolean NOT NULL,
    is_wall_object boolean DEFAULT false NOT NULL,
    rules jsonb NOT NULL,
    prestige integer NOT NULL,
    optimal_requirement integer NOT NULL,
    max_requirement integer NOT NULL,
    size jsonb NOT NULL
);


ALTER TABLE public.furnitures OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18534)
-- Name: furnitures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.furnitures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.furnitures_id_seq OWNER TO postgres;

--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 220
-- Name: furnitures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.furnitures_id_seq OWNED BY public.furnitures.id;


--
-- TOC entry 223 (class 1259 OID 18548)
-- Name: groups_tiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups_tiles (
    id integer NOT NULL,
    size jsonb NOT NULL,
    "position" jsonb NOT NULL,
    cost integer NOT NULL,
    previous jsonb NOT NULL,
    sector integer NOT NULL,
    is_start boolean NOT NULL
);


ALTER TABLE public.groups_tiles OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18546)
-- Name: groups_tiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_tiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_tiles_id_seq OWNER TO postgres;

--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 222
-- Name: groups_tiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_tiles_id_seq OWNED BY public.groups_tiles.id;


--
-- TOC entry 253 (class 1259 OID 19054)
-- Name: letters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.letters (
    id integer NOT NULL,
    is_everyone boolean NOT NULL,
    subject character varying(64) NOT NULL,
    message character varying(512) NOT NULL,
    items jsonb,
    "time" integer NOT NULL,
    "senderId" integer,
    "recipientId" integer
);


ALTER TABLE public.letters OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 19052)
-- Name: letters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.letters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.letters_id_seq OWNER TO postgres;

--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 252
-- Name: letters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.letters_id_seq OWNED BY public.letters.id;


--
-- TOC entry 285 (class 1259 OID 20046)
-- Name: logs_character_actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_character_actions (
    id integer NOT NULL,
    player_id integer NOT NULL,
    "time" integer NOT NULL,
    character_id integer NOT NULL,
    action_config_id integer NOT NULL,
    time_end integer NOT NULL
);


ALTER TABLE public.logs_character_actions OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 20044)
-- Name: logs_character_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_character_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_character_actions_id_seq OWNER TO postgres;

--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 284
-- Name: logs_character_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_character_actions_id_seq OWNED BY public.logs_character_actions.id;


--
-- TOC entry 287 (class 1259 OID 20054)
-- Name: logs_character_buffs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_character_buffs (
    id integer NOT NULL,
    player_id integer NOT NULL,
    "time" integer NOT NULL,
    action_name character varying(32) NOT NULL,
    config_id integer NOT NULL,
    buff_time integer NOT NULL
);


ALTER TABLE public.logs_character_buffs OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 20052)
-- Name: logs_character_buffs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_character_buffs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_character_buffs_id_seq OWNER TO postgres;

--
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 286
-- Name: logs_character_buffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_character_buffs_id_seq OWNED BY public.logs_character_buffs.id;


--
-- TOC entry 289 (class 1259 OID 20062)
-- Name: logs_character_interactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_character_interactions (
    id integer NOT NULL,
    player_id integer NOT NULL,
    "time" integer NOT NULL,
    character_id integer NOT NULL,
    action_name character varying(64) NOT NULL
);


ALTER TABLE public.logs_character_interactions OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 20060)
-- Name: logs_character_interactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_character_interactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_character_interactions_id_seq OWNER TO postgres;

--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 288
-- Name: logs_character_interactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_character_interactions_id_seq OWNED BY public.logs_character_interactions.id;


--
-- TOC entry 291 (class 1259 OID 20070)
-- Name: logs_character_raids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_character_raids (
    id integer NOT NULL,
    player_id integer NOT NULL,
    "time" integer NOT NULL,
    location_config_id integer NOT NULL,
    minutes integer NOT NULL,
    start_time integer NOT NULL,
    end_time integer NOT NULL
);


ALTER TABLE public.logs_character_raids OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 20068)
-- Name: logs_character_raids_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_character_raids_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_character_raids_id_seq OWNER TO postgres;

--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 290
-- Name: logs_character_raids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_character_raids_id_seq OWNED BY public.logs_character_raids.id;


--
-- TOC entry 295 (class 1259 OID 20086)
-- Name: logs_furniture_interactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_furniture_interactions (
    id integer NOT NULL,
    player_id integer NOT NULL,
    "time" integer NOT NULL,
    furniture_id integer NOT NULL,
    action character varying(64) NOT NULL
);


ALTER TABLE public.logs_furniture_interactions OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 20084)
-- Name: logs_furniture_interactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_furniture_interactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_furniture_interactions_id_seq OWNER TO postgres;

--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 294
-- Name: logs_furniture_interactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_furniture_interactions_id_seq OWNED BY public.logs_furniture_interactions.id;


--
-- TOC entry 297 (class 1259 OID 20094)
-- Name: logs_group_tiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_group_tiles (
    id integer NOT NULL,
    player_id integer NOT NULL,
    "time" integer NOT NULL,
    config_id integer NOT NULL,
    floor_id integer NOT NULL
);


ALTER TABLE public.logs_group_tiles OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 20092)
-- Name: logs_group_tiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_group_tiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_group_tiles_id_seq OWNER TO postgres;

--
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 296
-- Name: logs_group_tiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_group_tiles_id_seq OWNED BY public.logs_group_tiles.id;


--
-- TOC entry 293 (class 1259 OID 20078)
-- Name: logs_inventory_consumables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_inventory_consumables (
    id integer NOT NULL,
    player_id integer NOT NULL,
    "time" integer NOT NULL,
    consumable_config_id integer NOT NULL,
    count integer NOT NULL,
    action_name character varying(128) NOT NULL
);


ALTER TABLE public.logs_inventory_consumables OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 20076)
-- Name: logs_inventory_consumables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_inventory_consumables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_inventory_consumables_id_seq OWNER TO postgres;

--
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 292
-- Name: logs_inventory_consumables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_inventory_consumables_id_seq OWNED BY public.logs_inventory_consumables.id;


--
-- TOC entry 307 (class 1259 OID 20137)
-- Name: logs_inventory_things; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_inventory_things (
    id integer NOT NULL,
    player_id integer NOT NULL,
    "time" integer NOT NULL,
    thing_id integer NOT NULL,
    thing_config_id integer NOT NULL,
    action_name character varying(64) NOT NULL
);


ALTER TABLE public.logs_inventory_things OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 20135)
-- Name: logs_inventory_things_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_inventory_things_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_inventory_things_id_seq OWNER TO postgres;

--
-- TOC entry 3683 (class 0 OID 0)
-- Dependencies: 306
-- Name: logs_inventory_things_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_inventory_things_id_seq OWNED BY public.logs_inventory_things.id;


--
-- TOC entry 299 (class 1259 OID 20102)
-- Name: logs_loot_box_creations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_loot_box_creations (
    id integer NOT NULL,
    player_id integer NOT NULL,
    "time" integer NOT NULL,
    type character varying(24) NOT NULL,
    loot_box_id integer NOT NULL,
    location_config_id integer NOT NULL,
    items jsonb NOT NULL
);


ALTER TABLE public.logs_loot_box_creations OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 20100)
-- Name: logs_loot_box_creations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_loot_box_creations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_loot_box_creations_id_seq OWNER TO postgres;

--
-- TOC entry 3684 (class 0 OID 0)
-- Dependencies: 298
-- Name: logs_loot_box_creations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_loot_box_creations_id_seq OWNED BY public.logs_loot_box_creations.id;


--
-- TOC entry 301 (class 1259 OID 20113)
-- Name: logs_loot_box_opens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_loot_box_opens (
    id integer NOT NULL,
    player_id integer NOT NULL,
    "time" integer NOT NULL,
    type character varying(24) NOT NULL,
    loot_box_id integer NOT NULL,
    loot_box_config_id integer NOT NULL
);


ALTER TABLE public.logs_loot_box_opens OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 20111)
-- Name: logs_loot_box_opens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_loot_box_opens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_loot_box_opens_id_seq OWNER TO postgres;

--
-- TOC entry 3685 (class 0 OID 0)
-- Dependencies: 300
-- Name: logs_loot_box_opens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_loot_box_opens_id_seq OWNED BY public.logs_loot_box_opens.id;


--
-- TOC entry 281 (class 1259 OID 20030)
-- Name: logs_player_gates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_player_gates (
    id integer NOT NULL,
    player_id integer NOT NULL,
    "time" integer NOT NULL,
    action character varying(64) NOT NULL,
    ip character varying(64)
);


ALTER TABLE public.logs_player_gates OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 20028)
-- Name: logs_player_gates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_player_gates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_player_gates_id_seq OWNER TO postgres;

--
-- TOC entry 3686 (class 0 OID 0)
-- Dependencies: 280
-- Name: logs_player_gates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_player_gates_id_seq OWNED BY public.logs_player_gates.id;


--
-- TOC entry 303 (class 1259 OID 20121)
-- Name: logs_server; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_server (
    id integer NOT NULL,
    type character varying(64) NOT NULL,
    data character varying(256) NOT NULL,
    "time" bigint NOT NULL
);


ALTER TABLE public.logs_server OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 20119)
-- Name: logs_server_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_server_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_server_id_seq OWNER TO postgres;

--
-- TOC entry 3687 (class 0 OID 0)
-- Dependencies: 302
-- Name: logs_server_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_server_id_seq OWNED BY public.logs_server.id;


--
-- TOC entry 305 (class 1259 OID 20129)
-- Name: logs_soft_currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_soft_currency (
    id integer NOT NULL,
    player_id integer NOT NULL,
    "time" integer NOT NULL,
    action_name character varying(128) NOT NULL,
    is_addition boolean NOT NULL,
    amount integer NOT NULL,
    balance integer NOT NULL
);


ALTER TABLE public.logs_soft_currency OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 20127)
-- Name: logs_soft_currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_soft_currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_soft_currency_id_seq OWNER TO postgres;

--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 304
-- Name: logs_soft_currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_soft_currency_id_seq OWNED BY public.logs_soft_currency.id;


--
-- TOC entry 283 (class 1259 OID 20038)
-- Name: logs_user_achievments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_user_achievments (
    id integer NOT NULL,
    player_id integer NOT NULL,
    "time" integer NOT NULL,
    achievment_config_id integer NOT NULL
);


ALTER TABLE public.logs_user_achievments OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 20036)
-- Name: logs_user_achievments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_user_achievments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_user_achievments_id_seq OWNER TO postgres;

--
-- TOC entry 3689 (class 0 OID 0)
-- Dependencies: 282
-- Name: logs_user_achievments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_user_achievments_id_seq OWNED BY public.logs_user_achievments.id;


--
-- TOC entry 277 (class 1259 OID 19348)
-- Name: loot_box_group_chances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loot_box_group_chances (
    id integer NOT NULL,
    group_name character varying(32) NOT NULL,
    chance real NOT NULL,
    loot_box_id integer
);


ALTER TABLE public.loot_box_group_chances OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 19346)
-- Name: loot_box_group_chances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loot_box_group_chances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loot_box_group_chances_id_seq OWNER TO postgres;

--
-- TOC entry 3690 (class 0 OID 0)
-- Dependencies: 276
-- Name: loot_box_group_chances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loot_box_group_chances_id_seq OWNED BY public.loot_box_group_chances.id;


--
-- TOC entry 275 (class 1259 OID 19340)
-- Name: loot_box_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loot_box_items (
    id integer NOT NULL,
    group_name character varying(32) NOT NULL,
    config_id integer NOT NULL,
    chance real NOT NULL,
    count integer NOT NULL,
    loot_box_id integer
);


ALTER TABLE public.loot_box_items OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 19338)
-- Name: loot_box_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loot_box_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loot_box_items_id_seq OWNER TO postgres;

--
-- TOC entry 3691 (class 0 OID 0)
-- Dependencies: 274
-- Name: loot_box_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loot_box_items_id_seq OWNED BY public.loot_box_items.id;


--
-- TOC entry 225 (class 1259 OID 18559)
-- Name: loot_boxes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loot_boxes (
    id integer NOT NULL,
    type character varying(32) NOT NULL,
    name character varying(64) NOT NULL,
    icon character varying(64) NOT NULL,
    min_items integer NOT NULL,
    max_items integer NOT NULL
);


ALTER TABLE public.loot_boxes OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 18557)
-- Name: loot_boxes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loot_boxes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loot_boxes_id_seq OWNER TO postgres;

--
-- TOC entry 3692 (class 0 OID 0)
-- Dependencies: 224
-- Name: loot_boxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loot_boxes_id_seq OWNED BY public.loot_boxes.id;


--
-- TOC entry 269 (class 1259 OID 19311)
-- Name: loot_boxes_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loot_boxes_price (
    id integer NOT NULL,
    bought_count integer NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.loot_boxes_price OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 19309)
-- Name: loot_boxes_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loot_boxes_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loot_boxes_price_id_seq OWNER TO postgres;

--
-- TOC entry 3693 (class 0 OID 0)
-- Dependencies: 268
-- Name: loot_boxes_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loot_boxes_price_id_seq OWNED BY public.loot_boxes_price.id;


--
-- TOC entry 251 (class 1259 OID 18835)
-- Name: max_by_group_tiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.max_by_group_tiles (
    id integer NOT NULL,
    count_group_tiles integer NOT NULL,
    max_prestige integer NOT NULL,
    max_soft_currency integer NOT NULL,
    max_friends integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.max_by_group_tiles OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 18833)
-- Name: max_by_group_tiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.max_by_group_tiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.max_by_group_tiles_id_seq OWNER TO postgres;

--
-- TOC entry 3694 (class 0 OID 0)
-- Dependencies: 250
-- Name: max_by_group_tiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.max_by_group_tiles_id_seq OWNED BY public.max_by_group_tiles.id;


--
-- TOC entry 261 (class 1259 OID 19160)
-- Name: player_chains_progress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_chains_progress (
    id integer NOT NULL,
    "chainId" integer,
    "actionId" integer
);


ALTER TABLE public.player_chains_progress OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 19158)
-- Name: player_chains_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_chains_progress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_chains_progress_id_seq OWNER TO postgres;

--
-- TOC entry 3695 (class 0 OID 0)
-- Dependencies: 260
-- Name: player_chains_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_chains_progress_id_seq OWNED BY public.player_chains_progress.id;


--
-- TOC entry 233 (class 1259 OID 18617)
-- Name: player_characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_characters (
    id integer NOT NULL,
    exp integer NOT NULL,
    dirty boolean NOT NULL,
    sector integer NOT NULL,
    last_tick bigint NOT NULL,
    efficiency real NOT NULL,
    buffs jsonb NOT NULL,
    "position" jsonb NOT NULL,
    things jsonb NOT NULL,
    raid jsonb,
    action jsonb NOT NULL,
    placed boolean DEFAULT false NOT NULL,
    nft_key character varying DEFAULT '0'::character varying NOT NULL,
    "playerId" integer,
    "configId" integer,
    level integer DEFAULT 1 NOT NULL,
    satisfaction jsonb DEFAULT '[]'::jsonb NOT NULL
);


ALTER TABLE public.player_characters OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18615)
-- Name: player_characters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_characters_id_seq OWNER TO postgres;

--
-- TOC entry 3696 (class 0 OID 0)
-- Dependencies: 232
-- Name: player_characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_characters_id_seq OWNED BY public.player_characters.id;


--
-- TOC entry 255 (class 1259 OID 19080)
-- Name: player_consumables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_consumables (
    id integer NOT NULL,
    count integer DEFAULT 0 NOT NULL,
    "playerId" integer,
    "configId" integer
);


ALTER TABLE public.player_consumables OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 19078)
-- Name: player_consumables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_consumables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_consumables_id_seq OWNER TO postgres;

--
-- TOC entry 3697 (class 0 OID 0)
-- Dependencies: 254
-- Name: player_consumables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_consumables_id_seq OWNED BY public.player_consumables.id;


--
-- TOC entry 235 (class 1259 OID 18639)
-- Name: player_floors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_floors (
    id integer NOT NULL,
    soft_currency integer DEFAULT 0 NOT NULL,
    "playerId" integer,
    "configId" integer
);


ALTER TABLE public.player_floors OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 18637)
-- Name: player_floors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_floors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_floors_id_seq OWNER TO postgres;

--
-- TOC entry 3698 (class 0 OID 0)
-- Dependencies: 234
-- Name: player_floors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_floors_id_seq OWNED BY public.player_floors.id;


--
-- TOC entry 237 (class 1259 OID 18648)
-- Name: player_furnitures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_furnitures (
    id integer NOT NULL,
    sector integer NOT NULL,
    "position" jsonb NOT NULL,
    look_at jsonb NOT NULL,
    wall_pos integer DEFAULT 0 NOT NULL,
    nft_key character varying NOT NULL,
    placed boolean DEFAULT false NOT NULL,
    for_collect boolean DEFAULT false NOT NULL,
    "playerId" integer,
    "configId" integer
);


ALTER TABLE public.player_furnitures OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 18646)
-- Name: player_furnitures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_furnitures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_furnitures_id_seq OWNER TO postgres;

--
-- TOC entry 3699 (class 0 OID 0)
-- Dependencies: 236
-- Name: player_furnitures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_furnitures_id_seq OWNED BY public.player_furnitures.id;


--
-- TOC entry 239 (class 1259 OID 18673)
-- Name: player_letters_conditions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_letters_conditions (
    id integer NOT NULL,
    taken_items boolean DEFAULT false NOT NULL,
    read_time integer NOT NULL,
    "letterId" integer,
    "userId" integer
);


ALTER TABLE public.player_letters_conditions OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 18671)
-- Name: player_letters_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_letters_conditions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_letters_conditions_id_seq OWNER TO postgres;

--
-- TOC entry 3700 (class 0 OID 0)
-- Dependencies: 238
-- Name: player_letters_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_letters_conditions_id_seq OWNED BY public.player_letters_conditions.id;


--
-- TOC entry 257 (class 1259 OID 19089)
-- Name: player_loot_boxes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_loot_boxes (
    id integer NOT NULL,
    items jsonb NOT NULL,
    "playerId" integer,
    "configId" integer
);


ALTER TABLE public.player_loot_boxes OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 19087)
-- Name: player_loot_boxes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_loot_boxes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_loot_boxes_id_seq OWNER TO postgres;

--
-- TOC entry 3701 (class 0 OID 0)
-- Dependencies: 256
-- Name: player_loot_boxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_loot_boxes_id_seq OWNED BY public.player_loot_boxes.id;


--
-- TOC entry 259 (class 1259 OID 19100)
-- Name: player_things; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_things (
    id integer NOT NULL,
    "playerId" integer,
    "configId" integer
);


ALTER TABLE public.player_things OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 19098)
-- Name: player_things_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_things_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_things_id_seq OWNER TO postgres;

--
-- TOC entry 3702 (class 0 OID 0)
-- Dependencies: 258
-- Name: player_things_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_things_id_seq OWNED BY public.player_things.id;


--
-- TOC entry 231 (class 1259 OID 18597)
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    id integer NOT NULL,
    account_id integer NOT NULL,
    online boolean DEFAULT false NOT NULL,
    save_lock boolean DEFAULT false NOT NULL,
    soft_currency bigint DEFAULT '0'::bigint NOT NULL,
    achievments jsonb NOT NULL,
    achievment_counter jsonb NOT NULL,
    loot_boxes integer DEFAULT 0 NOT NULL,
    loot_box_time integer DEFAULT 0 NOT NULL,
    last_join bigint NOT NULL,
    groups_tiles jsonb NOT NULL,
    support_percents jsonb NOT NULL,
    block jsonb NOT NULL,
    reg_ip character varying(64) DEFAULT 'none'::character varying NOT NULL,
    reg_time integer NOT NULL,
    last_ip character varying(64) DEFAULT 'none'::character varying NOT NULL,
    last_sector integer DEFAULT 0 NOT NULL,
    buffs jsonb DEFAULT '[]'::jsonb NOT NULL
);


ALTER TABLE public.players OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18595)
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_id_seq OWNER TO postgres;

--
-- TOC entry 3703 (class 0 OID 0)
-- Dependencies: 230
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- TOC entry 267 (class 1259 OID 19279)
-- Name: raid_cells; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raid_cells (
    id integer NOT NULL,
    cells_count integer NOT NULL,
    prestige integer NOT NULL
);


ALTER TABLE public.raid_cells OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 19277)
-- Name: raid_cells_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.raid_cells_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.raid_cells_id_seq OWNER TO postgres;

--
-- TOC entry 3704 (class 0 OID 0)
-- Dependencies: 266
-- Name: raid_cells_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.raid_cells_id_seq OWNED BY public.raid_cells.id;


--
-- TOC entry 279 (class 1259 OID 19379)
-- Name: raid_count_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raid_count_items (
    id integer NOT NULL,
    min integer NOT NULL,
    max integer NOT NULL
);


ALTER TABLE public.raid_count_items OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 19377)
-- Name: raid_count_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.raid_count_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.raid_count_items_id_seq OWNER TO postgres;

--
-- TOC entry 3705 (class 0 OID 0)
-- Dependencies: 278
-- Name: raid_count_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.raid_count_items_id_seq OWNED BY public.raid_count_items.id;


--
-- TOC entry 227 (class 1259 OID 18578)
-- Name: raid_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raid_locations (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    icon character varying(64) NOT NULL,
    loot_box_id integer
);


ALTER TABLE public.raid_locations OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18576)
-- Name: raid_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.raid_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.raid_locations_id_seq OWNER TO postgres;

--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 226
-- Name: raid_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.raid_locations_id_seq OWNED BY public.raid_locations.id;


--
-- TOC entry 243 (class 1259 OID 18711)
-- Name: ru_lang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ru_lang (
    id integer NOT NULL,
    key character varying(64) NOT NULL,
    type character varying(64) NOT NULL,
    text character varying(255) NOT NULL
);


ALTER TABLE public.ru_lang OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 18709)
-- Name: ru_lang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ru_lang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ru_lang_id_seq OWNER TO postgres;

--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 242
-- Name: ru_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ru_lang_id_seq OWNED BY public.ru_lang.id;


--
-- TOC entry 229 (class 1259 OID 18589)
-- Name: things; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.things (
    id integer NOT NULL,
    "group" integer NOT NULL,
    name character varying(128) NOT NULL,
    icon character varying(64) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.things OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18587)
-- Name: things_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.things_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.things_id_seq OWNER TO postgres;

--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 228
-- Name: things_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.things_id_seq OWNED BY public.things.id;


--
-- TOC entry 265 (class 1259 OID 19220)
-- Name: unique_action_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unique_action_relations (
    id integer NOT NULL,
    first_character_id integer,
    second_character_id integer,
    is_start boolean DEFAULT false NOT NULL,
    chain_id integer,
    action_id integer,
    dialog_id integer,
    achievment_id integer,
    next_action_id integer
);


ALTER TABLE public.unique_action_relations OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 19218)
-- Name: unique_action_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unique_action_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unique_action_relations_id_seq OWNER TO postgres;

--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 264
-- Name: unique_action_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unique_action_relations_id_seq OWNED BY public.unique_action_relations.id;


--
-- TOC entry 263 (class 1259 OID 19212)
-- Name: unique_actions_chains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unique_actions_chains (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.unique_actions_chains OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 19210)
-- Name: unique_actions_chains_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unique_actions_chains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unique_actions_chains_id_seq OWNER TO postgres;

--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 262
-- Name: unique_actions_chains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unique_actions_chains_id_seq OWNED BY public.unique_actions_chains.id;


--
-- TOC entry 247 (class 1259 OID 18727)
-- Name: unique_translates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unique_translates (
    id integer NOT NULL,
    lang_key character varying(8) NOT NULL,
    "group" character varying(64) NOT NULL,
    content character varying(512) NOT NULL
);


ALTER TABLE public.unique_translates OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 18725)
-- Name: unique_translates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unique_translates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unique_translates_id_seq OWNER TO postgres;

--
-- TOC entry 3711 (class 0 OID 0)
-- Dependencies: 246
-- Name: unique_translates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unique_translates_id_seq OWNED BY public.unique_translates.id;


--
-- TOC entry 3174 (class 2604 OID 18447)
-- Name: achievments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievments ALTER COLUMN id SET DEFAULT nextval('public.achievments_id_seq'::regclass);


--
-- TOC entry 3175 (class 2604 OID 18458)
-- Name: actions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actions ALTER COLUMN id SET DEFAULT nextval('public.actions_id_seq'::regclass);


--
-- TOC entry 3176 (class 2604 OID 18470)
-- Name: buffs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buffs ALTER COLUMN id SET DEFAULT nextval('public.buffs_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 19335)
-- Name: character_duplicate_fines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_duplicate_fines ALTER COLUMN id SET DEFAULT nextval('public.character_duplicate_fines_id_seq'::regclass);


--
-- TOC entry 3179 (class 2604 OID 18492)
-- Name: character_levels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_levels ALTER COLUMN id SET DEFAULT nextval('public.character_levels_id_seq'::regclass);


--
-- TOC entry 3182 (class 2604 OID 18500)
-- Name: character_perks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_perks ALTER COLUMN id SET DEFAULT nextval('public.character_perks_id_seq'::regclass);


--
-- TOC entry 3257 (class 2604 OID 20153)
-- Name: character_puzzle_chances id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_puzzle_chances ALTER COLUMN id SET DEFAULT nextval('public.character_puzzle_chances_id_seq'::regclass);


--
-- TOC entry 3177 (class 2604 OID 18481)
-- Name: characters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 19322)
-- Name: characters_requirements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters_requirements ALTER COLUMN id SET DEFAULT nextval('public.characters_requirements_id_seq'::regclass);


--
-- TOC entry 3184 (class 2604 OID 18509)
-- Name: constants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constants ALTER COLUMN id SET DEFAULT nextval('public.constants_id_seq'::regclass);


--
-- TOC entry 3185 (class 2604 OID 18520)
-- Name: consumables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumables ALTER COLUMN id SET DEFAULT nextval('public.consumables_id_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 18741)
-- Name: dialogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dialogs ALTER COLUMN id SET DEFAULT nextval('public.dialogs_id_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 18706)
-- Name: en_lang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.en_lang ALTER COLUMN id SET DEFAULT nextval('public.en_lang_id_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 18722)
-- Name: es_lang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.es_lang ALTER COLUMN id SET DEFAULT nextval('public.es_lang_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 18531)
-- Name: floors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.floors ALTER COLUMN id SET DEFAULT nextval('public.floors_id_seq'::regclass);


--
-- TOC entry 3258 (class 2604 OID 20161)
-- Name: furniture_puzzle_chances id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.furniture_puzzle_chances ALTER COLUMN id SET DEFAULT nextval('public.furniture_puzzle_chances_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 18539)
-- Name: furnitures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.furnitures ALTER COLUMN id SET DEFAULT nextval('public.furnitures_id_seq'::regclass);


--
-- TOC entry 3192 (class 2604 OID 18551)
-- Name: groups_tiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups_tiles ALTER COLUMN id SET DEFAULT nextval('public.groups_tiles_id_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 19057)
-- Name: letters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.letters ALTER COLUMN id SET DEFAULT nextval('public.letters_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 20049)
-- Name: logs_character_actions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_character_actions ALTER COLUMN id SET DEFAULT nextval('public.logs_character_actions_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 20057)
-- Name: logs_character_buffs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_character_buffs ALTER COLUMN id SET DEFAULT nextval('public.logs_character_buffs_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 20065)
-- Name: logs_character_interactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_character_interactions ALTER COLUMN id SET DEFAULT nextval('public.logs_character_interactions_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 20073)
-- Name: logs_character_raids id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_character_raids ALTER COLUMN id SET DEFAULT nextval('public.logs_character_raids_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 20089)
-- Name: logs_furniture_interactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_furniture_interactions ALTER COLUMN id SET DEFAULT nextval('public.logs_furniture_interactions_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 20097)
-- Name: logs_group_tiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_group_tiles ALTER COLUMN id SET DEFAULT nextval('public.logs_group_tiles_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 20081)
-- Name: logs_inventory_consumables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_inventory_consumables ALTER COLUMN id SET DEFAULT nextval('public.logs_inventory_consumables_id_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 20140)
-- Name: logs_inventory_things id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_inventory_things ALTER COLUMN id SET DEFAULT nextval('public.logs_inventory_things_id_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 20105)
-- Name: logs_loot_box_creations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_loot_box_creations ALTER COLUMN id SET DEFAULT nextval('public.logs_loot_box_creations_id_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 20116)
-- Name: logs_loot_box_opens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_loot_box_opens ALTER COLUMN id SET DEFAULT nextval('public.logs_loot_box_opens_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 20033)
-- Name: logs_player_gates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_player_gates ALTER COLUMN id SET DEFAULT nextval('public.logs_player_gates_id_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 20124)
-- Name: logs_server id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_server ALTER COLUMN id SET DEFAULT nextval('public.logs_server_id_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 20132)
-- Name: logs_soft_currency id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_soft_currency ALTER COLUMN id SET DEFAULT nextval('public.logs_soft_currency_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 20041)
-- Name: logs_user_achievments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_user_achievments ALTER COLUMN id SET DEFAULT nextval('public.logs_user_achievments_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 19351)
-- Name: loot_box_group_chances id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_box_group_chances ALTER COLUMN id SET DEFAULT nextval('public.loot_box_group_chances_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 19343)
-- Name: loot_box_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_box_items ALTER COLUMN id SET DEFAULT nextval('public.loot_box_items_id_seq'::regclass);


--
-- TOC entry 3193 (class 2604 OID 18562)
-- Name: loot_boxes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_boxes ALTER COLUMN id SET DEFAULT nextval('public.loot_boxes_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 19314)
-- Name: loot_boxes_price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_boxes_price ALTER COLUMN id SET DEFAULT nextval('public.loot_boxes_price_id_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 18838)
-- Name: max_by_group_tiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.max_by_group_tiles ALTER COLUMN id SET DEFAULT nextval('public.max_by_group_tiles_id_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 19163)
-- Name: player_chains_progress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_chains_progress ALTER COLUMN id SET DEFAULT nextval('public.player_chains_progress_id_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 18620)
-- Name: player_characters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_characters ALTER COLUMN id SET DEFAULT nextval('public.player_characters_id_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 19083)
-- Name: player_consumables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_consumables ALTER COLUMN id SET DEFAULT nextval('public.player_consumables_id_seq'::regclass);


--
-- TOC entry 3211 (class 2604 OID 18642)
-- Name: player_floors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_floors ALTER COLUMN id SET DEFAULT nextval('public.player_floors_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 18651)
-- Name: player_furnitures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_furnitures ALTER COLUMN id SET DEFAULT nextval('public.player_furnitures_id_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 18676)
-- Name: player_letters_conditions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_letters_conditions ALTER COLUMN id SET DEFAULT nextval('public.player_letters_conditions_id_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 19092)
-- Name: player_loot_boxes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_loot_boxes ALTER COLUMN id SET DEFAULT nextval('public.player_loot_boxes_id_seq'::regclass);


--
-- TOC entry 3231 (class 2604 OID 19103)
-- Name: player_things id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_things ALTER COLUMN id SET DEFAULT nextval('public.player_things_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 18600)
-- Name: players id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 19282)
-- Name: raid_cells id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raid_cells ALTER COLUMN id SET DEFAULT nextval('public.raid_cells_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 19382)
-- Name: raid_count_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raid_count_items ALTER COLUMN id SET DEFAULT nextval('public.raid_count_items_id_seq'::regclass);


--
-- TOC entry 3194 (class 2604 OID 18581)
-- Name: raid_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raid_locations ALTER COLUMN id SET DEFAULT nextval('public.raid_locations_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 18714)
-- Name: ru_lang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ru_lang ALTER COLUMN id SET DEFAULT nextval('public.ru_lang_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 18592)
-- Name: things id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.things ALTER COLUMN id SET DEFAULT nextval('public.things_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 19223)
-- Name: unique_action_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_action_relations ALTER COLUMN id SET DEFAULT nextval('public.unique_action_relations_id_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 19215)
-- Name: unique_actions_chains id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_actions_chains ALTER COLUMN id SET DEFAULT nextval('public.unique_actions_chains_id_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 18730)
-- Name: unique_translates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_translates ALTER COLUMN id SET DEFAULT nextval('public.unique_translates_id_seq'::regclass);


--
-- TOC entry 3529 (class 0 OID 18444)
-- Dependencies: 203
-- Data for Name: achievments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.achievments (id, type, name, description, award_key, award_name, icon, actions) FROM stdin;
1	lol	Ach_Enter_game	Ach_D_Enter_game	chapalah	chapalah	lol	[{"key": "enterGame", "name": "зайти в игру", "count": 3}]
3	Listen	Ach_Listen_300	Ach_D_Listen_300	chapalah	chapalah	lol	[]
2	lol	Ach_Catch_Hippo	Ach_D_Catch_Hippo	chapalah	chapalah	lol	[{"key": "catchHipo", "name": "поймать бегемотика", "count": 999}]
4	Listen	Ach_Listen_250	Ach_D_Listen_250	chapalah	chapalah	lol	[]
5	Listen	Ach_Listen_200	Ach_D_Listen_200	chapalah	chapalah	lol	[]
6	Listen	Ach_Listen_150	Ach_D_Listen_150	chapalah	chapalah	lol	[]
7	Listen	Ach_Listen_100	Ach_D_Listen_100	chapalah	chapalah	lol	[]
8	Listen	Ach_Listen_75	Ach_D_Listen_75	chapalah	chapalah	lol	[]
9	Listen	Ach_Listen_50	Ach_D_Listen_50	chapalah	chapalah	lol	[]
10	Listen	Ach_Listen_25	Ach_D_Listen_25	chapalah	chapalah	lol	[]
11	Listen	Ach_Listen_10	Ach_D_Listen_10	chapalah	chapalah	lol	[]
12	Listen	Ach_Listen_1	Ach_D_Listen_1	chapalah	chapalah	lol	[]
13	Dialog	Ach_Dialog_5	Ach_D_Dialog_5	chapalah	chapalah	lol	[]
14	Dialog	Ach_Dialog_1	Ach_D_Dialog_1	chapalah	chapalah	lol	[]
15	Dialog	Ach_Dialog_10	Ach_D_Dialog_10	chapalah	chapalah	lol	[]
16	Dialog	Ach_Dialog_20	Ach_D_Dialog_20	chapalah	chapalah	lol	[]
17	Dialog	Ach_Dialog_35	Ach_D_Dialog_35	chapalah	chapalah	lol	[]
18	Dialog	Ach_Dialog_50	Ach_D_Dialog_50	chapalah	chapalah	lol	[]
19	AdvCount	Ach_AdventureCount_200	Ach_D_AdventureCount_200	chapalah	chapalah	lol	[]
20	AdvCount	Ach_AdventureCount_500	Ach_D_AdventureCount_500	chapalah	chapalah	lol	[]
21	AdvCount	Ach_AdventureCount_1000	Ach_D_AdventureCount_1000	chapalah	chapalah	lol	[]
22	AdvCount	Ach_AdventureCount_100	Ach_D_AdventureCount_100	chapalah	chapalah	lol	[]
23	AdvCount	Ach_AdventureCount_50	Ach_D_AdventureCount_50	chapalah	chapalah	lol	[]
24	AdvCount	Ach_AdventureCount_25	Ach_D_AdventureCount_25	chapalah	chapalah	lol	[]
25	AdvCount	Ach_AdventureCount_5	Ach_D_AdventureCount_5	chapalah	chapalah	lol	[]
26	AdvCount	Ach_AdventureCount_1	Ach_D_AdventureCount_1	chapalah	chapalah	lol	[]
27	AdvEggs	Ach_AdvEggs_10000	Ach_D_AdvEggs_10000	chapalah	chapalah	lol	[]
28	AdvEggs	Ach_AdvEggs_5000	Ach_D_AdvEggs_5000	chapalah	chapalah	lol	[]
29	AdvEggs	Ach_AdvEggs_1000	Ach_D_AdvEggs_1000	chapalah	chapalah	lol	[]
30	AdvEggs	Ach_AdvEggs_500	Ach_D_AdvEggs_500	chapalah	chapalah	lol	[]
31	AdvEggs	Ach_AdvEggs_200	Ach_D_AdvEggs_200	chapalah	chapalah	lol	[]
32	AdvEggs	Ach_AdvEggs_100	Ach_D_AdvEggs_100	chapalah	chapalah	lol	[]
33	AdvEggs	Ach_AdvEggs_50	Ach_D_AdvEggs_50	chapalah	chapalah	lol	[]
34	AdvEggs	Ach_AdvEggs_25	Ach_D_AdvEggs_25	chapalah	chapalah	lol	[]
35	AdvEggs	Ach_AdvEggs_5	Ach_D_AdvEggs_5	chapalah	chapalah	lol	[]
36	AdvTime	Ach_AdventureTime_1	Ach_D_AdventureTime_1	chapalah	chapalah	lol	[]
37	AdvTime	Ach_AdventureTime_10	Ach_D_AdventureTime_10	chapalah	chapalah	lol	[]
38	AdvTime	Ach_AdventureTime_50	Ach_D_AdventureTime_50	chapalah	chapalah	lol	[]
39	AdvTime	Ach_AdventureTime_100	Ach_D_AdventureTime_100	chapalah	chapalah	lol	[]
40	AdvTime	Ach_AdventureTime_500	Ach_D_AdventureTime_500	chapalah	chapalah	lol	[]
41	AdvTime	Ach_AdventureTime_1000	Ach_D_AdventureTime_1000	chapalah	chapalah	lol	[]
42	AdvSoloTime	Ach_AdventureSoloTime_5000	Ach_D_AdventureSoloTime_5000	chapalah	chapalah	lol	[]
43	AdvSoloTime	Ach_AdventureSoloTime_1000	Ach_D_AdventureSoloTime_1000	chapalah	chapalah	lol	[]
44	AdvSoloTime	Ach_AdventureSoloTime_500	Ach_D_AdventureSoloTime_500	chapalah	chapalah	lol	[]
45	AdvSoloTime	Ach_AdventureSoloTime_100	Ach_D_AdventureSoloTime_100	chapalah	chapalah	lol	[]
46	AdvSoloTime	Ach_AdventureSoloTime_50	Ach_D_AdventureSoloTime_50	chapalah	chapalah	lol	[]
47	SpawnCharacters	Ach_SpawnCharacters_5	Ach_D_SpawnCharacters_5	chapalah	chapalah	lol	[]
48	SpawnCharacters	Ach_SpawnCharacters_10	Ach_D_SpawnCharacters_10	chapalah	chapalah	lol	[]
49	SpawnCharacters	Ach_SpawnCharacters_25	Ach_D_SpawnCharacters_25	chapalah	chapalah	lol	[]
50	SpawnCharacters	Ach_SpawnCharacters_50	Ach_D_SpawnCharacters_50	chapalah	chapalah	lol	[]
51	SpawnCharacters	Ach_SpawnCharacters_75	Ach_D_SpawnCharacters_75	chapalah	chapalah	lol	[]
52	SpawnCharacters	Ach_SpawnCharacters_Max	Ach_D_SpawnCharacters_Max	chapalah	chapalah	lol	[]
53	Level10	Ach_Level10_50	Ach_D_Level10_50	chapalah	chapalah	lol	[]
54	Level10	Ach_Level10_30	Ach_D_Level10_30	chapalah	chapalah	lol	[]
55	Level10	Ach_Level10_15	Ach_D_Level10_15	chapalah	chapalah	lol	[]
56	Level10	Ach_Level10_5	Ach_D_Level10_5	chapalah	chapalah	lol	[]
57	Level15	Ach_Level15_5	Ach_D_Level15_5	chapalah	chapalah	lol	[]
58	Level15	Ach_Level15_15	Ach_D_Level15_15	chapalah	chapalah	lol	[]
59	Level15	Ach_Level15_30	Ach_D_Level15_30	chapalah	chapalah	lol	[]
60	Level15	Ach_Level15_50	Ach_D_Level15_50	chapalah	chapalah	lol	[]
61	LevelSolo	Ach_LevelSolo_15	Ach_D_LevelSolo_15	chapalah	chapalah	lol	[]
62	LevelSolo	Ach_LevelSolo_10	Ach_D_LevelSolo_10	chapalah	chapalah	lol	[]
63	LevelSolo	Ach_LevelSolo_5	Ach_D_LevelSolo_5	chapalah	chapalah	lol	[]
64	GetHippo	Ach_GetHippo_50	Ach_D_GetHippo_50	chapalah	chapalah	lol	[]
65	GetHippo	Ach_GetHippo_25	Ach_D_GetHippo_25	chapalah	chapalah	lol	[]
66	GetHippo	Ach_GetHippo_10	Ach_D_GetHippo_10	chapalah	chapalah	lol	[]
67	GetDino	Ach_GetDino_10	Ach_D_GetDino_10	chapalah	chapalah	lol	[]
68	GetDino	Ach_GetDino_25	Ach_D_GetDino_25	chapalah	chapalah	lol	[]
69	GetDino	Ach_GetDino_50	Ach_D_GetDino_50	chapalah	chapalah	lol	[]
70	GetPinguin	Ach_GetPinguin_50	Ach_D_GetPinguin_50	chapalah	chapalah	lol	[]
71	GetPinguin	Ach_GetPinguin_25	Ach_D_GetPinguin_25	chapalah	chapalah	lol	[]
72	GetPinguin	Ach_GetPinguin_10	Ach_D_GetPinguin_10	chapalah	chapalah	lol	[]
73	GetShark	Ach_GetShark_10	Ach_D_GetShark_10	chapalah	chapalah	lol	[]
74	GetShark	Ach_GetShark_25	Ach_D_GetShark_25	chapalah	chapalah	lol	[]
75	GetShark	Ach_GetShark_50	Ach_D_GetShark_50	chapalah	chapalah	lol	[]
76	GetCharacters	Ach_GetCharacters_5	Ach_D_GetCharacters_5	chapalah	chapalah	lol	[]
77	GetCharacters	Ach_GetCharacters_25	Ach_D_GetCharacters_25	chapalah	chapalah	lol	[]
78	GetCharacters	Ach_GetCharacters_50	Ach_D_GetCharacters_50	chapalah	chapalah	lol	[]
79	GetCharacters	Ach_GetCharacters_100	Ach_D_GetCharacters_100	chapalah	chapalah	lol	[]
80	BuyEggs	Ach_BuyEggs_10	Ach_D_BuyEggs_10	chapalah	chapalah	lol	[]
81	BuyEggs	Ach_BuyEggs_25	Ach_D_BuyEggs_25	chapalah	chapalah	lol	[]
82	BuyEggs	Ach_BuyEggs_50	Ach_D_BuyEggs_50	chapalah	chapalah	lol	[]
83	BuyEggs	Ach_BuyEggs_100	Ach_D_BuyEggs_100	chapalah	chapalah	lol	[]
84	BuyEggs	Ach_BuyEggs_500	Ach_D_BuyEggs_500	chapalah	chapalah	lol	[]
85	BuyEggs	Ach_BuyEggs_1000	Ach_D_BuyEggs_1000	chapalah	chapalah	lol	[]
86	CrashItem	Ach_CrashItem_1	Ach_D_CrashItem_1	chapalah	chapalah	lol	[]
87	CrashItem	Ach_CrashItem_10	Ach_D_CrashItem_10	chapalah	chapalah	lol	[]
88	CrashItem	Ach_CrashItem_50	Ach_D_CrashItem_50	chapalah	chapalah	lol	[]
89	CrashItem	Ach_CrashItem_100	Ach_D_CrashItem_100	chapalah	chapalah	lol	[]
90	CrashItem	Ach_CrashItem_500	Ach_D_CrashItem_500	chapalah	chapalah	lol	[]
91	CrashItem	Ach_CrashItem_1000	Ach_D_CrashItem_1000	chapalah	chapalah	lol	[]
92	CrashItem	Ach_CrashItem_5000	Ach_D_CrashItem_5000	chapalah	chapalah	lol	[]
93	BuildFur	Ach_BuildFur_10	Ach_D_BuildFur_10	chapalah	chapalah	lol	[]
94	BuildFur	Ach_BuildFur_25	Ach_D_BuildFur_25	chapalah	chapalah	lol	[]
95	BuildFur	Ach_BuildFur_50	Ach_D_BuildFur_50	chapalah	chapalah	lol	[]
96	BuildFur	Ach_BuildFur_100	Ach_D_BuildFur_100	chapalah	chapalah	lol	[]
97	GetAchiv	Ach_GetAchiv_10	Ach_D_GetAchiv_10	chapalah	chapalah	lol	[]
98	GetAchiv	Ach_GetAchiv_25	Ach_D_GetAchiv_25	chapalah	chapalah	lol	[]
99	GetAchiv	Ach_GetAchiv_50	Ach_D_GetAchiv_50	chapalah	chapalah	lol	[]
100	GetAchiv	Ach_GetAchiv_100	Ach_D_GetAchiv_100	chapalah	chapalah	lol	[]
101	FloorClean	Ach_FloorClean_All	Ach_D_FloorClean_All	chapalah	chapalah	lol	[]
102	FloorClean	Ach_FloorClean_1	Ach_D_FloorClean_1	chapalah	chapalah	lol	[]
\.


--
-- TOC entry 3531 (class 0 OID 18455)
-- Dependencies: 205
-- Data for Name: actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actions (id, name, "group", animation_id, rules, min_time, max_time, "unique", condition_ids) FROM stdin;
8	dance	2	1	[]	20	60	t	[]
1	sleep	1	1	[]	300	900	f	[]
2	clean	2	1	[]	120	300	f	[]
3	default speak	2	1	[]	120	600	f	[]
4	eat	1	1	[]	120	420	f	[]
5	drink	2	1	[]	120	420	f	[]
6	idle	2	1	[]	60	120	f	[]
7	sit	2	1	[]	120	300	f	[]
\.


--
-- TOC entry 3533 (class 0 OID 18467)
-- Dependencies: 207
-- Data for Name: buffs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buffs (id, "group", type, positive, multiply, name, icon, description, metadata) FROM stdin;
0	0	soft-currency-time	t	20	Buff_OrangeSweet	asd	Buff_D_OrangeSweet	asd
1	0	exp	t	50	Buff_BlackSweet	asd\n	Buff_D_BlackSweet	asd\n
2	0	additional-item-mint	t	100	Buff_RaspSweet	asd\n	Buff_D_RaspSweet	asd\n
\.


--
-- TOC entry 3599 (class 0 OID 19332)
-- Dependencies: 273
-- Data for Name: character_duplicate_fines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.character_duplicate_fines (id, count_duplicates, fine_percent) FROM stdin;
1	2	0.05
2	3	0.1
3	4	0.2
4	5	0.3
5	6	0.4
6	7	0.5
7	8	0.6
8	9	0.6
9	10	0.75
10	11	0.75
11	12	0.75
12	13	0.75
13	14	0.75
14	15	0.75
15	16	0.75
16	17	0.75
17	18	0.75
18	19	0.75
19	20	0.75
\.


--
-- TOC entry 3537 (class 0 OID 18489)
-- Dependencies: 211
-- Data for Name: character_levels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.character_levels (id, level, from_exp, price, efficiency_for_level) FROM stdin;
1	2	50	5	0.01
2	3	150	10	0.02
3	4	500	25	0.03
4	5	2000	100	0.06
5	6	2500	200	0.07
6	7	3800	400	0.08
7	8	6000	800	0.1
8	9	9500	1500	0.12
9	10	13500	3500	0.16
10	11	17000	6000	0.19
11	12	21000	15000	0.22
12	13	26000	30000	0.25
13	14	32000	50000	0.28
14	15	50000	100000	0.32
\.


--
-- TOC entry 3539 (class 0 OID 18497)
-- Dependencies: 213
-- Data for Name: character_perks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.character_perks (id, name, icon, type, value) FROM stdin;
0	Perk_Bussines	Perk_Bussines	soft-currency-for-eat	0
1	Perk_ButtonFairy	Perk_ButtonFairy	soft-currency-for-sleep	0
3	Perk_Buttonist	Perk_Buttonist	soft-currency-for-talk	0
7	Perk_Magician	Perk_Magician	soft-currency-time-drop	3600
13	Perk_Worker	Perk_Worker	boost-soft-currency-farm-time	0.1
2	Perk_Buttonfall	Perk_Buttonfall	additional-soft-currency	0.35
4	Perk_Cheater	Perk_Cheater	duplicate-soft-currency	0.5
5	Perk_Gift	Perk_Gift	additional-raid-item	0.8
6	Perk_Leader	Perk_Leader	experience-sector-boost	0.15
8	Perk_PowerGuys	Perk_PowerGuys	boost-sector-efficiency	0.05
9	Perk_Prestigionist	Perk_Prestigionist	additional-prestige	10
10	Perk_Speakersoul	Perk_Speakersoul	boost-collection-efficiency	0.05
11	Perk_Speedrun	Perk_Speedrun	raid-time-boost	0.15
12	Perk_Stockman	Perk_Stockman	additional-space-soft-currency	0.2
14	Perk_Favourite	Perk_Favourite	additional-efficiency	0.08
\.


--
-- TOC entry 3635 (class 0 OID 20150)
-- Dependencies: 309
-- Data for Name: character_puzzle_chances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.character_puzzle_chances (id, chance, character_id) FROM stdin;
1	0.01	0
2	0.01	1
3	0.01	2
4	0.01	3
5	0.01	4
6	0.01	5
7	0.01	6
8	0.01	7
9	0.01	8
10	0.01	9
11	0.01	10
12	0.01	11
13	0.01	12
14	0.01	13
15	0.01	14
16	0.01	15
17	0.01	16
18	0.01	17
19	0.01	18
20	0.01	19
\.


--
-- TOC entry 3535 (class 0 OID 18478)
-- Dependencies: 209
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characters (id, template_name, "group", promo_image, avatar, model, actions, friends, things, perks, can_be_starter) FROM stdin;
0	Shark_Fakir	1	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 15}, {"blocked": false, "characterIndex": 13}, {"blocked": false, "characterIndex": 9}]	[3, 10]	[12, 7]	f
2	Shark_Medjay	1	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 7}, {"blocked": false, "characterIndex": 11}, {"blocked": false, "characterIndex": 19}]	[9, 4]	[3, 10]	f
5	Dino_Boss	2	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 5}, {"blocked": false, "characterIndex": 17}, {"blocked": false, "characterIndex": 14}]	[22, 23, 27]	[13, 6]	f
1	Shark_Halif	1	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 10}, {"blocked": false, "characterIndex": 18}, {"blocked": false, "characterIndex": 8}]	[0, 2]	[1, 0]	f
3	Shark_Merchant	1	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 5}, {"blocked": false, "characterIndex": 16}, {"blocked": false, "characterIndex": 12}]	[8, 6, 7]	[5, 11]	f
4	Shark_Princess	1	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 17}, {"blocked": false, "characterIndex": 14}, {"blocked": false, "characterIndex": 6}]	[5, 1]	[14, 1]	f
6	Dino_Destroyer	2	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 16}, {"blocked": false, "characterIndex": 4}, {"blocked": false, "characterIndex": 10}]	[28, 24]	[4, 13]	f
17	Hippo_Photo	3	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 4}, {"blocked": false, "characterIndex": 5}, {"blocked": false, "characterIndex": 14}]	[12, 13]	[7, 5]	f
18	Hippo_Somelje	3	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 1}, {"blocked": false, "characterIndex": 7}, {"blocked": false, "characterIndex": 13}]	[16, 17]	[0, 12]	f
19	Hippo_Captain	3	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 9}, {"blocked": false, "characterIndex": 2}, {"blocked": false, "characterIndex": 12}]	[21, 20, 18]	[10, 2]	f
7	Dino_Lucky	2	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 2}, {"blocked": false, "characterIndex": 18}, {"blocked": false, "characterIndex": 13}]	[31, 32]	[7, 10]	f
8	Dino_Sleepy	2	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 1}, {"blocked": false, "characterIndex": 15}, {"blocked": false, "characterIndex": 11}]	[30, 29]	[1, 2]	f
10	Pin_Aristocrat	4	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 1}, {"blocked": false, "characterIndex": 15}, {"blocked": false, "characterIndex": 9}]	[34, 41, 39]	[14, 9]	f
12	Pin_Dancer	4	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 9}, {"blocked": false, "characterIndex": 19}, {"blocked": false, "characterIndex": 3}]	[33, 36]	[7, 14]	f
13	Pin_DJ	4	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 0}, {"blocked": false, "characterIndex": 18}, {"blocked": false, "characterIndex": 7}]	[40, 38]	[2, 13]	f
14	Pin_Romantic	4	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 4}, {"blocked": false, "characterIndex": 5}, {"blocked": false, "characterIndex": 17}]	[37, 35]	[9, 10]	f
16	Hippo_Officiant	3	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 3}, {"blocked": false, "characterIndex": 6}, {"blocked": false, "characterIndex": 11}]	[11, 19]	[9, 4]	f
15	Hippo_Tourist	3	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 0}, {"blocked": false, "characterIndex": 8}, {"blocked": false, "characterIndex": 10}]	[15, 14]	[11, 3]	t
9	Dino_Welder	2	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 10}, {"blocked": false, "characterIndex": 0}, {"blocked": false, "characterIndex": 12}]	[25, 26]	[2, 7]	t
11	Pin_Barman	4	aaa	aaa	aaa	[1, 2, 3, 5, 6, 7, 8]	[{"blocked": false, "characterIndex": 2}, {"blocked": false, "characterIndex": 16}, {"blocked": false, "characterIndex": 8}]	[42, 43]	[3, 12]	t
\.


--
-- TOC entry 3597 (class 0 OID 19319)
-- Dependencies: 271
-- Data for Name: characters_requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characters_requirements (id, book_row, furniture_id, furniture_group, character_id) FROM stdin;
5	0	-1	2	0
6	0	-1	2	1
7	0	-1	2	2
8	0	-1	2	3
9	0	-1	2	4
10	0	-1	2	5
11	0	-1	2	6
12	0	-1	2	7
13	0	-1	2	8
14	0	-1	2	9
15	0	-1	2	10
16	0	-1	2	11
17	0	-1	2	12
18	0	-1	2	13
19	0	-1	2	14
20	0	-1	2	15
21	0	-1	2	16
22	0	-1	2	17
23	0	-1	2	18
24	0	-1	2	19
25	0	-1	10	0
26	0	-1	4	0
27	0	-1	3	0
28	1	-1	9	0
29	2	-1	7	0
30	0	-1	10	1
31	0	-1	4	1
32	0	-1	3	1
33	1	-1	9	1
34	2	-1	7	1
35	0	-1	10	2
36	0	-1	4	2
37	0	-1	3	2
38	1	-1	9	2
39	2	-1	7	2
40	0	-1	10	3
41	0	-1	4	3
42	0	-1	3	3
43	1	-1	9	3
44	2	-1	7	3
45	0	-1	10	4
46	0	-1	4	4
47	0	-1	3	4
48	1	-1	9	4
49	2	-1	7	4
50	0	-1	10	5
51	0	-1	4	5
52	0	-1	3	5
53	1	-1	9	5
54	2	-1	7	5
55	0	-1	10	6
56	0	-1	4	6
57	0	-1	3	6
58	1	-1	9	6
59	2	-1	7	6
60	0	-1	10	7
61	0	-1	4	7
62	0	-1	3	7
63	1	-1	9	7
64	2	-1	7	7
65	0	-1	10	8
66	0	-1	4	8
67	0	-1	3	8
68	1	-1	9	8
69	2	-1	7	8
70	0	-1	10	9
71	0	-1	4	9
72	0	-1	3	9
73	1	-1	9	9
74	2	-1	7	9
75	0	-1	10	10
76	0	-1	4	10
77	0	-1	3	10
78	1	-1	9	10
79	2	-1	7	10
80	0	-1	10	11
81	0	-1	4	11
82	0	-1	3	11
83	1	-1	9	11
84	2	-1	7	11
85	0	-1	10	12
86	0	-1	4	12
87	0	-1	3	12
88	1	-1	9	12
89	2	-1	7	12
90	0	-1	10	13
91	0	-1	4	13
92	0	-1	3	13
93	1	-1	9	13
94	2	-1	7	13
95	0	-1	10	14
96	0	-1	4	14
97	0	-1	3	14
98	1	-1	9	14
99	2	-1	7	14
100	0	-1	10	15
101	0	-1	4	15
102	0	-1	3	15
103	1	-1	9	15
104	2	-1	7	15
105	0	-1	10	16
106	0	-1	4	16
107	0	-1	3	16
108	1	-1	9	16
109	2	-1	7	16
110	0	-1	10	17
111	0	-1	4	17
112	0	-1	3	17
113	1	-1	9	17
114	2	-1	7	17
115	0	-1	10	18
116	0	-1	4	18
117	0	-1	3	18
118	1	-1	9	18
119	2	-1	7	18
120	0	-1	10	19
121	0	-1	4	19
122	0	-1	3	19
123	1	-1	9	19
124	2	-1	7	19
125	0	63	-1	0
126	0	42	-1	1
127	0	73	-1	2
128	0	86	-1	3
129	0	110	-1	4
130	0	2	-1	5
131	0	117	-1	6
132	0	124	-1	7
133	0	51	-1	8
134	0	78	-1	9
135	0	10	-1	10
136	0	66	-1	11
137	0	5	-1	12
138	0	71	-1	13
139	0	21	-1	14
140	0	22	-1	15
141	0	31	-1	16
142	0	37	-1	17
143	0	45	-1	18
144	0	92	-1	19
145	1	30	-1	0
146	1	58	-1	1
147	1	115	-1	2
148	1	109	-1	3
149	1	57	-1	4
150	1	22	-1	5
151	1	32	-1	6
152	1	19	-1	7
153	1	11	-1	8
154	1	52	-1	9
155	1	109	-1	10
156	1	116	-1	11
157	1	8	-1	12
158	1	32	-1	13
159	1	133	-1	14
160	1	30	-1	15
161	1	65	-1	16
162	1	10	-1	17
163	1	57	-1	18
164	1	32	-1	19
165	1	123	-1	0
166	1	127	-1	1
167	1	116	-1	2
168	1	65	-1	3
169	1	126	-1	4
170	1	11	-1	5
171	1	133	-1	6
172	1	8	-1	7
173	1	133	-1	8
174	1	63	-1	9
175	1	128	-1	10
176	1	62	-1	11
177	1	115	-1	12
178	1	11	-1	13
179	1	52	-1	14
180	1	109	-1	15
181	1	123	-1	16
182	1	19	-1	17
183	1	115	-1	18
184	1	36	-1	19
185	2	49	-1	0
186	2	18	-1	1
187	2	135	-1	2
188	2	18	-1	3
189	2	60	-1	4
190	2	135	-1	5
191	2	135	-1	6
192	2	134	-1	7
193	2	18	-1	8
194	2	24	-1	9
195	2	74	-1	10
196	2	97	-1	11
197	2	18	-1	12
198	2	24	-1	13
199	2	49	-1	14
200	2	24	-1	15
201	2	18	-1	16
202	2	97	-1	17
203	2	135	-1	18
204	2	134	-1	19
205	3	76	-1	0
206	3	72	-1	1
207	3	9	-1	2
208	3	98	-1	3
209	3	74	-1	4
210	3	108	-1	5
211	3	104	-1	6
212	3	49	-1	7
213	3	103	-1	8
214	3	9	-1	9
215	3	9	-1	10
216	3	72	-1	11
217	3	98	-1	12
218	3	103	-1	13
219	3	46	-1	14
220	3	49	-1	15
221	3	82	-1	16
222	3	76	-1	17
223	3	108	-1	18
224	3	98	-1	19
\.


--
-- TOC entry 3541 (class 0 OID 18506)
-- Dependencies: 215
-- Data for Name: constants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constants (id, key, type, num_value, str_value, flt_value, arr_value) FROM stdin;
1	DEFAULT_CHARACTER_TICK	num	600	\N	\N	\N
2	CURRENCY_ACCOUNT_LIMIT	num	9999999	\N	\N	\N
11	CHANCE_ADDITIONAL_ITEM	flt	\N	\N	0.1	\N
21	EFFICIENCY_PERCENT_FOR_FRIEND	flt	\N	\N	3	\N
8	UNIQUE_ACTION_CHANCE	flt	\N	\N	3	\N
3	PERK_UNLOCK_LEVELS	arr	\N	\N	\N	[5, 10]
19	FURNITURE_ROWS_UNLOCK_LEVELS	arr	\N	\N	\N	[1, 4, 9, 14]
4	BASE_EXP_FOR_RAID_TIME	arr	\N	\N	\N	[50, 182, 522, 1000, 1538]
17	RAID_TIMES	arr	\N	\N	\N	[30, 120, 360, 720, 1200]
22	EFFICIENCY_PERCENT_FOR_ALL_FRIENDS	flt	\N	\N	0	\N
23	EFFICIENCY_PERCENT_FOR_THING	flt	\N	\N	3	\N
10	BONUS_FOR_FULL_FURNITURES_ROW	arr	\N	\N	\N	[1, 2, 2.5, 3]
20	EFFICIENCY_PERCENT_FOR_ITEM_IN_ROW	arr	\N	\N	\N	[2, 2, 2.5, 4]
24	SUPPORT_PERCENT_CHARACTER	flt	\N	\N	0.0005	\N
25	SUPPORT_PERCENT_FURNITURE	flt	\N	\N	0.01	\N
26	SUPPORT_PERCENT_BASE	flt	\N	\N	0	\N
27	MAX_SUPPORT_PERCENT_CHARACTER	flt	\N	\N	0.15	\N
28	MAX_SUPPORT_PERCENT_FURNITURE	flt	\N	\N	0.3	\N
29	MAX_SUPPORT_PERCENT_BASE	flt	\N	\N	0	\N
5	CHARACTER_STRONG_UNIT	flt	\N	\N	2	\N
6	DEFAULT_LOOT_BOX_COST	num	100	\N	\N	\N
7	MAX_LOOT_BOX_IN_DAY	num	7	\N	\N	\N
12	RAID_TIME_EFFICIENCY_BOOST	flt	\N	\N	0.75	\N
18	RAID_TIME_MULTIPLY	flt	\N	\N	1	\N
9	GAME_TIME_MULTIPLY	flt	\N	\N	30	\N
\.


--
-- TOC entry 3543 (class 0 OID 18517)
-- Dependencies: 217
-- Data for Name: consumables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumables (id, "group", name, icon, description, use_type, max_count, use_count, buff_id, value, only_characters) FROM stdin;
0	0	Cons_Gum	Cons_Gum	Cons_D_Gum	give-experience	99	1	-1	100	t
1	0	Cons_CoupleGum	Cons_CoupleGum	Cons_D_CoupleGum	give-experience	99	1	-1	500	t
2	0	Cons_ManyGum	Cons_ManyGum	Cons_D_ManyGum	give-experience	99	1	-1	2000	t
6	1	Cons_Part_Furniture	Cons_Part_Furniture	Cons_D_Part_Furniture	create-furniture-puzzle	99	12	-1	4	f
7	1	Cons_Part_Character	Cons_Part_Character	Cons_D_Part_Character	create-character-puzzle	99	12	-1	4	f
4	0	Cons_BlackSweet	Cons_BlackSweet	Cons_D_BlackSweet	give-buff	99	1	1	86400	f
3	0	Cons_OrangeSweet	Cons_OrangeSweet	Cons_D_OrangeSweet	give-buff	99	1	0	3600	f
5	0	Cons_RaspSweet	Cons_RaspSweet	Cons_D_RaspSweet	give-buff	99	1	2	86400	f
\.


--
-- TOC entry 3575 (class 0 OID 18738)
-- Dependencies: 249
-- Data for Name: dialogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dialogs (id, messages) FROM stdin;
\.


--
-- TOC entry 3567 (class 0 OID 18703)
-- Dependencies: 241
-- Data for Name: en_lang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.en_lang (id, key, type, text) FROM stdin;
1	login	auth	Email
2	password	auth	Password
3	sign-up	auth	Sign up
4	sign-in	auth	Sign in
5	something-went-wrong	notify	Something went wrong, try again.
6	cannot-buy-now	notify	Cannot buy now
7	max-count-for-day	notify	You have reached your daily limit
8	no-enough-money	notify	No enough money
9	space-blocked	notify	Choose a more suitable location for installation
10	buy-previous-group	notify	Need to buy the previous space
11	dont-available-slots	notify	No available raid slot
12	cannot-find-location	notify	Couldnt find the right location
13	maintenance-now	notify	The game is starting to have maintenance
14	group-tiles	notify	Group of tiles
15	character	notify	Character
16	furniture	notify	Furniture
17	loot-boxes	notify	Lootboxes
18	maintenance	notify	Maintenance
19	raid	notify	Raid
20	settings_header	settings	Settings
21	settings_sound_ui	settings	Interface sounds
22	settings_sound_ambient	settings	Ambient sounds
23	common_reset	common	Reset
24	common_close	common	Close
25	common_apply	common	Apply
26	regions_buy	regions	Do you want to buy this region? It will cost {0} buttons?
27	common_yes	common	Yes
28	common_no	common	No
29	common_confirm	common	Are you sure to continue?
30	message_new	message	New letter
31	message_readen	message	Viewed letter
32	message_open	message	Opened letter
33	common_cancel	common	Cancel
34	common_send	common	Send
35	common_confirmation	common	Confirmation
36	adventure_send_text	adventure	Do you really want to send this character to adventure?
37	adventure_time_selector	adventure	Adventure time
38	adventure_header	adventure	Adventure
39	adventure_claim_char	adventure	Take
40	adventure_return_force_1	adventure	Do you really want to return this character before declared time?
41	adventure_return_force_2	adventure	Adventure will be finished in:
42	common_return	common	Return
43	common_claim	common	Claim
44	adventure_location_info	adventure	On this location you can find so much different!
45	adventure_empty	adventure	EMPTY
46	filters_header	common	Filters
47	filters_alphabet	filters	A to Z
48	filters_alphabet_desc	filters	Z to A
49	filters_level	filters	From min lvl
50	filters_level_desc	filters	From max lvl
51	filters_power	filters	From min power
52	filters_power_desc	filters	From max power
53	filters_nft	filters	NFT
54	filters_regular	filters	Regular
55	filters_char_placed	filters	Placed
56	filters_char_free	filters	Free
57	filters_fur_placed	filters	Placed
58	filters_fur_free	filters	In warehouse
59	filters_prestige	filters	From min prestige
60	filters_prestige_desc	filters	From max prestige
61	filters_sorting	filters	Order by
62	common_buy	common	Buy
63	shop_purchased	shop	Purchased
64	shop_not_available	shop	Not in stock
65	shop_update	shop	Shop will be updated in {0}
66	book_prev_page	book	Prev. page
67	book_next_page	book	Next page
68	charcard_header	charcard	Personal card
69	charcard_reqs	charcard	Requirements
70	charcard_friends	charcard	Best friends
71	charcard_perks	charcard	Perks
72	Shark_Fakir	unit	Shark_Fakir
73	Shark_Halif	unit	Shark_Halif
74	Shark_Medjay	unit	Shark_Medjay
75	Shark_Merchant	unit	Shark_Merchant
76	Shark_Princess	unit	Shark_Princess
77	Dino_Boss	unit	Dino_Boss
78	Dino_Lucky	unit	Dino_Lucky
79	Dino_Sleepy	unit	Dino_Sleepy
80	Dino_Welder	unit	Dino_Welder
81	Dino_Destroyer	unit	Dino_Destroyer
82	Pin_Aristocrat	unit	Pin_Aristocrat
83	Pin_Barman	unit	Pin_Barman
84	Pin_Dancer	unit	Pin_Dancer
85	Pin_DJ	unit	Pin_DJ
86	Pin_Romantic	unit	Pin_Romantic
87	Hippo_Tourist	unit	Hippo_Tourist
88	Hippo_Captain	unit	Hippo_Captain
89	Hippo_Officiant	unit	Hippo_Officiant
90	Hippo_Photo	unit	Hippo_Photo
91	Hippo_Somelje	unit	Hippo_Somelje
92	Vikings	unit	Vikings
93	Unit_Sharks	unit	Unit_Sharks
94	Unit_Dino	unit	Unit_Dino
95	Unit_Pin	unit	Unit_Pin
96	Unit_Hippo	unit	Unit_Hippo
97	Armchair_1	furniture	Armchair_1
98	Bed_2	furniture	Bed_2
99	Bedside Table_2	furniture	Bedside Table_2
100	Bench_1	furniture	Bench_1
101	BookShelf_1	furniture	BookShelf_1
102	Carpet_1	furniture	Carpet_1
103	Chair_1	furniture	Chair_1
104	Closet_1	furniture	Closet_1
105	Easel_1	furniture	Easel_1
106	Gramophone_1	furniture	Gramophone_1
107	Painting_1	furniture	Painting_1
108	Radio_1	furniture	Radio_1
109	Shelf_1	furniture	Shelf_1
110	Shelf_2	furniture	Shelf_2
111	Sofa_1	furniture	Sofa_1
112	Table_1	furniture	Table_1
113	TV_1	furniture	TV_1
114	s2_Bed_1	furniture	s2_Bed_1
115	s2_Bed_2	furniture	s2_Bed_2
116	s2_Bench	furniture	s2_Bench
117	s2_Bookshelf	furniture	s2_Bookshelf
118	s2_Carpet	furniture	s2_Carpet
119	s2_Chair_1	furniture	s2_Chair_1
120	s2_Chair_2	furniture	s2_Chair_2
121	s2_Closet_1	furniture	s2_Closet_1
122	s2_Closet_2	furniture	s2_Closet_2
123	s2_CoffeTable	furniture	s2_CoffeTable
124	s2_Lamp	furniture	s2_Lamp
125	s2_Shelf	furniture	s2_Shelf
126	s2_Sofa_1	furniture	s2_Sofa_1
127	s2_Sofa_2	furniture	s2_Sofa_2
128	s2_Table	furniture	s2_Table
129	s2_TV	furniture	s2_TV
130	s2_Window	furniture	s2_Window
131	Fur_s3_Armchair	furniture	Fur_s3_Armchair
132	Fur_s3_Bed	furniture	Fur_s3_Bed
133	Fur_s3_Bench	furniture	Fur_s3_Bench
134	Fur_s3_Bookshelf	furniture	Fur_s3_Bookshelf
135	Fur_s3_Box_1	furniture	Fur_s3_Box_1
136	Fur_s3_Box_2	furniture	Fur_s3_Box_2
137	Fur_s3_Box_3	furniture	Fur_s3_Box_3
138	Fur_s3_Box_4	furniture	Fur_s3_Box_4
139	Fur_s3_Carpet	furniture	Fur_s3_Carpet
140	Fur_s3_Chair	furniture	Fur_s3_Chair
141	Fur_s3_Closet	furniture	Fur_s3_Closet
142	Fur_s3_CoffeTable	furniture	Fur_s3_CoffeTable
143	Fur_s3_Easel	furniture	Fur_s3_Easel
144	Fur_s3_Lamp	furniture	Fur_s3_Lamp
145	Fur_s3_Painting_2	furniture	Fur_s3_Painting_2
146	Fur_s3_Painting_3	furniture	Fur_s3_Painting_3
147	Fur_s3_Sofa_1	furniture	Fur_s3_Sofa_1
148	Fur_s3_Sofa_2	furniture	Fur_s3_Sofa_2
149	Fur_s3_Table	furniture	Fur_s3_Table
150	Fur_s3_Vase	furniture	Fur_s3_Vase
151	Fur_s3_Window_3	furniture	Fur_s3_Window_3
152	Fur_s3_Window_4	furniture	Fur_s3_Window_4
153	Fur_s3_WorkTable	furniture	Fur_s3_WorkTable
154	Fur_s4_Armchair_1	furniture	Fur_s4_Armchair_1
155	Fur_s4_Armchair_2	furniture	Fur_s4_Armchair_2
156	Fur_s4_Armchair_3	furniture	Fur_s4_Armchair_3
157	Fur_s4_Bed	furniture	Fur_s4_Bed
158	Fur_s4_Bench	furniture	Fur_s4_Bench
159	Fur_s4_Bookshelf	furniture	Fur_s4_Bookshelf
160	Fur_s4_Chair	furniture	Fur_s4_Chair
161	Fur_s4_Closet_1	furniture	Fur_s4_Closet_1
162	Fur_s4_Closet_2	furniture	Fur_s4_Closet_2
163	Fur_s4_CoffeTable	furniture	Fur_s4_CoffeTable
164	Fur_s4_Shelfs	furniture	Fur_s4_Shelfs
165	Fur_s4_Sofa_1	furniture	Fur_s4_Sofa_1
166	Fur_s4_Sofa_2	furniture	Fur_s4_Sofa_2
167	Fur_s4_Table_3	furniture	Fur_s4_Table_3
168	Fur_s4_Table_4	furniture	Fur_s4_Table_4
169	Fur_s5_Armchair	furniture	Fur_s5_Armchair
170	Fur_s5_Chair	furniture	Fur_s5_Chair
171	Fur_s5_Closet_3	furniture	Fur_s5_Closet_3
172	Fur_s5_Closet_4	furniture	Fur_s5_Closet_4
173	Fur_s5_Closet_5	furniture	Fur_s5_Closet_5
174	Fur_s5_Closet_6	furniture	Fur_s5_Closet_6
175	Fur_s5_CoffeTable_3	furniture	Fur_s5_CoffeTable_3
176	Fur_s5_CoffeTable_4	furniture	Fur_s5_CoffeTable_4
177	Fur_s5_CoffeTable_5	furniture	Fur_s5_CoffeTable_5
178	Fur_s5_Light	furniture	Fur_s5_Light
179	Fur_s5_Radio_2	furniture	Fur_s5_Radio_2
180	Fur_s5_Shelfs_4	furniture	Fur_s5_Shelfs_4
181	Fur_s5_Shelfs_5	furniture	Fur_s5_Shelfs_5
182	Fur_s5_Shelfs_6	furniture	Fur_s5_Shelfs_6
183	Fur_s5_Sofa_4	furniture	Fur_s5_Sofa_4
184	Fur_s5_Table_5	furniture	Fur_s5_Table_5
185	Fur_s5_Table_6	furniture	Fur_s5_Table_6
186	Fur_s5_Table_7	furniture	Fur_s5_Table_7
187	Fur_s5_Table_8	furniture	Fur_s5_Table_8
188	Fur_s5_Table_9	furniture	Fur_s5_Table_9
189	Fur_s5_Table_10	furniture	Fur_s5_Table_10
190	Fur_s5_Table_11	furniture	Fur_s5_Table_11
191	Fur_s5_Table_12	furniture	Fur_s5_Table_12
192	Fur_s5_Table_13	furniture	Fur_s5_Table_13
193	Fur_s5_Table_14	furniture	Fur_s5_Table_14
194	Fur_s5_Table_15	furniture	Fur_s5_Table_15
195	Fur_s5_Table_16	furniture	Fur_s5_Table_16
196	Fur_s5_Table_17	furniture	Fur_s5_Table_17
197	Fur_s5_Table_18	furniture	Fur_s5_Table_18
198	Fur_s5_Table_19	furniture	Fur_s5_Table_19
199	Fur_s5_Table_20	furniture	Fur_s5_Table_20
200	Fur_s5_Table_21	furniture	Fur_s5_Table_21
201	Fur_s5_Table_22	furniture	Fur_s5_Table_22
202	Fur_s5_Table_23	furniture	Fur_s5_Table_23
203	Fur_s5_Table_24	furniture	Fur_s5_Table_24
204	Fur_s6_Apple	furniture	Fur_s6_Apple
205	Fur_s6_Armchair_1	furniture	Fur_s6_Armchair_1
206	Fur_s6_Armchair_2	furniture	Fur_s6_Armchair_2
207	Fur_s6_Armchair_3	furniture	Fur_s6_Armchair_3
208	Fur_s6_Basket_1	furniture	Fur_s6_Basket_1
209	Fur_s6_Bookshelf	furniture	Fur_s6_Bookshelf
210	Fur_s6_Box	furniture	Fur_s6_Box
211	Fur_s6_Bush_1	furniture	Fur_s6_Bush_1
212	Fur_s6_Bush_2	furniture	Fur_s6_Bush_2
213	Fur_s6_Bush_3	furniture	Fur_s6_Bush_3
214	Fur_s6_Closet	furniture	Fur_s6_Closet
215	Fur_s6_CoffeTable_3	furniture	Fur_s6_CoffeTable_3
216	Fur_s6_CoffeTable_4	furniture	Fur_s6_CoffeTable_4
217	Fur_s6_Cup	furniture	Fur_s6_Cup
218	Fur_s6_Fruit	furniture	Fur_s6_Fruit
219	Fur_s6_Jar	furniture	Fur_s6_Jar
220	Fur_s6_Kettle	furniture	Fur_s6_Kettle
221	Fur_s6_Lamp_3	furniture	Fur_s6_Lamp_3
222	Fur_s6_Lamp_4	furniture	Fur_s6_Lamp_4
223	Fur_s6_Mirror	furniture	Fur_s6_Mirror
224	Fur_s6_Painting_3	furniture	Fur_s6_Painting_3
225	Fur_s6_Painting_4	furniture	Fur_s6_Painting_4
226	Fur_s6_Pasta	furniture	Fur_s6_Pasta
227	Fur_s6_Pinetree	furniture	Fur_s6_Pinetree
228	Fur_s6_Spoon	furniture	Fur_s6_Spoon
229	Fur_s6_Umbrella	furniture	Fur_s6_Umbrella
230	Fur_s6_Vase	furniture	Fur_s6_Vase
231	Fur_s6_Wardrobe	furniture	Fur_s6_Wardrobe
232	Fur_s6_WorkTable	furniture	Fur_s6_WorkTable
233	Buttons Collector	furniture	Buttons Collector
234	Armchair Group	furniture	Armchair Group
235	Bed Group	furniture	Bed Group
236	Chair Group	furniture	Chair Group
237	Closet Group	furniture	Closet Group
238	Decor Group	furniture	Decor Group
239	Test Group	furniture	Test Group
240	Lootbox Group	furniture	Lootbox Group
241	Luxury Group	furniture	Luxury Group
242	Nightstand Group	furniture	Nightstand Group
243	Sofa Group	furniture	Sofa Group
244	Special(NonDestroy)	furniture	Special(NonDestroy)
245	Table Group	furniture	Table Group
246	wallObjects Group	furniture	wallObjects Group
247	map_blocked	map	This enity is locked by other entities
248	Perk_Bussines	perks	Perk_Bussines
249	Perk_D_Bussines	perks	Perk_D_Bussines
250	Perk_ButtonFairy	perks	Perk_ButtonFairy
251	Perk_D_ButtonFairy	perks	Perk_D_ButtonFairy
252	Perk_Buttonfall	perks	Perk_Buttonfall
253	Perk_D_Buttonfall	perks	Perk_D_Buttonfall
254	Perk_Buttonist	perks	Perk_Buttonist
255	Perk_D_Buttonist	perks	Perk_D_Buttonist
256	Perk_Cheater	perks	Perk_Cheater
257	Perk_D_Cheater	perks	Perk_D_Cheater
258	Perk_Gift	perks	Perk_Gift
259	Perk_D_Gift	perks	Perk_D_Gift
260	Perk_Leader	perks	Perk_Leader
261	Perk_D_Leader	perks	Perk_D_Leader
262	Perk_Magician	perks	Perk_Magician
263	Perk_D_Magician	perks	Perk_D_Magician
264	Perk_PowerGuys	perks	Perk_PowerGuys
265	Perk_D_PowerGuys	perks	Perk_D_PowerGuys
266	Perk_Prestigionist	perks	Perk_Prestigionist
267	Perk_D_Prestigionist	perks	Perk_D_Prestigionist
268	Perk_Speakersoul	perks	Perk_Speakersoul
269	Perk_D_Speakersoul	perks	Perk_D_Speakersoul
270	Perk_Speedrun	perks	Perk_Speedrun
271	Perk_D_Speedrun	perks	Perk_D_Speedrun
272	Perk_Stockman	perks	Perk_Stockman
273	Perk_D_Stockman	perks	Perk_D_Stockman
274	Perk_Worker	perks	Perk_Worker
275	Perk_D_Worker	perks	Perk_D_Worker
276	Item_Alarm	items	Item_Alarm
277	Item_D_Alarm	items	Item_D_Alarm
278	Item_Beret	items	Item_Beret
279	Item_D_Beret	items	Item_D_Beret
280	Item_Binoculars	items	Item_Binoculars
281	Item_D_Binoculars	items	Item_D_Binoculars
282	Item_Blade	items	Item_Blade
283	Item_D_Blade	items	Item_D_Blade
284	Item_Bouqet	items	Item_Bouqet
285	Item_D_Bouqet	items	Item_D_Bouqet
286	Item_Bracer	items	Item_Bracer
287	Item_D_Bracer	items	Item_D_Bracer
288	Item_BrickPillow	items	Item_BrickPillow
289	Item_D_BrickPillow	items	Item_D_BrickPillow
290	Item_Camera	items	Item_Camera
291	Item_D_Camera	items	Item_D_Camera
292	Item_Cane	items	Item_Cane
293	Item_D_Cane	items	Item_D_Cane
294	Item_Cap	items	Item_Cap
295	Item_D_Cap	items	Item_D_Cap
296	Item_Casket	items	Item_Casket
297	Item_D_Casket	items	Item_D_Casket
298	Item_Discosphere	items	Item_Discosphere
299	Item_D_Discosphere	items	Item_D_Discosphere
300	Item_Drill	items	Item_Drill
301	Item_D_Drill	items	Item_D_Drill
302	Item_DVD	items	Item_DVD
303	Item_D_DVD	items	Item_D_DVD
304	Item_Fluite	items	Item_Fluite
305	Item_D_Fluite	items	Item_D_Fluite
306	Item_Frill	items	Item_Frill
307	Item_D_Frill	items	Item_D_Frill
308	Item_FruitPlate	items	Item_FruitPlate
309	Item_D_FruitPlate	items	Item_D_FruitPlate
310	Item_Gift	items	Item_Gift
311	Item_D_Gift	items	Item_D_Gift
312	Item_Glasscup	items	Item_Glasscup
313	Item_D_Glasscup	items	Item_D_Glasscup
314	Item_GoldCoin	items	Item_GoldCoin
315	Item_D_GoldCoin	items	Item_D_GoldCoin
316	Item_Hammer	items	Item_Hammer
317	Item_D_Hammer	items	Item_D_Hammer
318	Item_Helmet	items	Item_Helmet
319	Item_D_Helmet	items	Item_D_Helmet
320	Item_Jewelry	items	Item_Jewelry
321	Item_D_Jewelry	items	Item_D_Jewelry
322	Item_Micro	items	Item_Micro
323	Item_D_Micro	items	Item_D_Micro
324	Item_Napkin	items	Item_Napkin
325	Item_D_Napkin	items	Item_D_Napkin
326	Item_Patch	items	Item_Patch
327	Item_D_Patch	items	Item_D_Patch
328	Item_PhotoAlbum	items	Item_PhotoAlbum
329	Item_D_PhotoAlbum	items	Item_D_PhotoAlbum
330	Item_Rollex	items	Item_Rollex
331	Item_D_Rollex	items	Item_D_Rollex
332	Item_Sash	items	Item_Sash
333	Item_D_Sash	items	Item_D_Sash
334	Item_Scarf	items	Item_Scarf
335	Item_D_Scarf	items	Item_D_Scarf
336	Item_Shaker	items	Item_Shaker
337	Item_D_Shaker	items	Item_D_Shaker
338	Item_SilkHandkerchief	items	Item_SilkHandkerchief
339	Item_D_SilkHandkerchief	items	Item_D_SilkHandkerchief
340	Item_SilkPillow	items	Item_SilkPillow
341	Item_D_SilkPillow	items	Item_D_SilkPillow
342	Item_Skatch	items	Item_Skatch
343	Item_D_Skatch	items	Item_D_Skatch
344	Item_SnakeBasket	items	Item_SnakeBasket
345	Item_D_SnakeBasket	items	Item_D_SnakeBasket
346	Item_Tape	items	Item_Tape
347	Item_D_Tape	items	Item_D_Tape
348	Item_Ticket	items	Item_Ticket
349	Item_D_Ticket	items	Item_D_Ticket
350	Item_Tray	items	Item_Tray
351	Item_D_Tray	items	Item_D_Tray
352	Item_Wallet	items	Item_Wallet
353	Item_D_Wallet	items	Item_D_Wallet
354	Item_WelderMachine	items	Item_WelderMachine
355	Item_D_WelderMachine	items	Item_D_WelderMachine
356	Item_Weldermask	items	Item_Weldermask
357	Item_D_Weldermask	items	Item_D_Weldermask
358	Item_Whistle	items	Item_Whistle
359	Item_D_Whistle	items	Item_D_Whistle
360	Item_Wineglass	items	Item_Wineglass
361	Item_D_Wineglass	items	Item_D_Wineglass
362	Item_Wranch	items	Item_Wranch
363	Item_D_Wranch	items	Item_D_Wranch
366	book_invalid_charitem	book	This item cannot be placed on character
365	book_confirm_charitem	book	Are you sure you want place this item on character?
370	Ach_D_Catch_Hippo	achievement	Ach_D_Catch_Hippo
369	Ach_Catch_Hippo	achievement	Ach_Catch_Hippo
368	Ach_D_Enter_game	achievement	Ach_D_Enter_game
367	Ach_Enter_game	achievement	Ach_Enter_game
372	book_invalid_character	book	Impossible to use this consumable to this character right now
371	book_confirm_character	book	Are you sure you want to use this consumable to this character?
373	book_use_common	book	Are you sure you want to use this item?
375	charcard_lvlup_confirm	charcard	Are you sure you want to upgrade this unit? It gonna cost {0} buttons
374	charcard_lvlup	charcard	Upgrade
376	Perk_Favourite	perks	Perk_Favourite
377	Perk_D_Favourite	perks	Perk_D_Favourite
378	adventure_drag_here	adventure	DRAG HERE
379	adventure_select_character	adventure	Select Character
380	adventure_locked	adventure	LOCKED
381	adventure_low_level	adventure	Low Level
382	adventure_finished	adventure	FINISHED
383	auth_wrong_login	auth	Wrong password/email
384	auth_server_error	auth	Internal server error, try again
385	auth_used_email	auth	This email is already used
386	Cons_BlackSweet	consumables	Cons_BlackSweet
387	Cons_D_BlackSweet	consumables	Cons_D_BlackSweet
388	Cons_CoupleGum	consumables	Cons_CoupleGum
389	Cons_D_CoupleGum	consumables	Cons_D_CoupleGum
390	Cons_Gum	consumables	Cons_Gum
391	Cons_D_Gum	consumables	Cons_D_Gum
392	Cons_ManyGum	consumables	Cons_ManyGum
393	Cons_D_ManyGum	consumables	Cons_D_ManyGum
394	Cons_OrangeSweet	consumables	Cons_OrangeSweet
395	Cons_D_OrangeSweet	consumables	Cons_D_OrangeSweet
396	Cons_Part_Character	consumables	Cons_Part_Character
397	Cons_D_Part_Character	consumables	Cons_D_Part_Character
398	Cons_Part_Furniture	consumables	Cons_Part_Furniture
399	Cons_D_Part_Furniture	consumables	Cons_D_Part_Furniture
400	Cons_RaspSweet	consumables	Cons_RaspSweet
401	Cons_D_RaspSweet	consumables	Cons_D_RaspSweet
402	Ach_Listen_300	achievement	Ach_Listen_300
403	Ach_D_Listen_300	achievement	Ach_D_Listen_300
404	Ach_Listen_250	achievement	Ach_Listen_250
405	Ach_D_Listen_250	achievement	Ach_D_Listen_250
406	Ach_Listen_200	achievement	Ach_Listen_200
407	Ach_D_Listen_200	achievement	Ach_D_Listen_200
408	Ach_Listen_150	achievement	Ach_Listen_150
409	Ach_D_Listen_150	achievement	Ach_D_Listen_150
410	Ach_Listen_100	achievement	Ach_Listen_100
411	Ach_D_Listen_100	achievement	Ach_D_Listen_100
412	Ach_Listen_75	achievement	Ach_Listen_75
413	Ach_D_Listen_75	achievement	Ach_D_Listen_75
414	Ach_Listen_50	achievement	Ach_Listen_50
415	Ach_D_Listen_50	achievement	Ach_D_Listen_50
416	Ach_Listen_25	achievement	Ach_Listen_25
417	Ach_D_Listen_25	achievement	Ach_D_Listen_25
418	Ach_Listen_10	achievement	Ach_Listen_10
419	Ach_D_Listen_10	achievement	Ach_D_Listen_10
420	Ach_Listen_1	achievement	Ach_Listen_1
421	Ach_D_Listen_1	achievement	Ach_D_Listen_1
422	Ach_Dialog_5	achievement	Ach_Dialog_5
423	Ach_D_Dialog_5	achievement	Ach_D_Dialog_5
424	Ach_Dialog_1	achievement	Ach_Dialog_1
425	Ach_D_Dialog_1	achievement	Ach_D_Dialog_1
426	Ach_Dialog_10	achievement	Ach_Dialog_10
427	Ach_D_Dialog_10	achievement	Ach_D_Dialog_10
428	Ach_Dialog_20	achievement	Ach_Dialog_20
429	Ach_D_Dialog_20	achievement	Ach_D_Dialog_20
430	Ach_Dialog_35	achievement	Ach_Dialog_35
431	Ach_D_Dialog_35	achievement	Ach_D_Dialog_35
432	Ach_Dialog_50	achievement	Ach_Dialog_50
433	Ach_D_Dialog_50	achievement	Ach_D_Dialog_50
434	Ach_AdventureCount_200	achievement	Ach_AdventureCount_200
435	Ach_D_AdventureCount_200	achievement	Ach_D_AdventureCount_200
436	Ach_AdventureCount_500	achievement	Ach_AdventureCount_500
437	Ach_D_AdventureCount_500	achievement	Ach_D_AdventureCount_500
438	Ach_AdventureCount_1000	achievement	Ach_AdventureCount_1000
439	Ach_D_AdventureCount_1000	achievement	Ach_D_AdventureCount_1000
440	Ach_AdventureCount_100	achievement	Ach_AdventureCount_100
441	Ach_D_AdventureCount_100	achievement	Ach_D_AdventureCount_100
442	Ach_AdventureCount_50	achievement	Ach_AdventureCount_50
443	Ach_D_AdventureCount_50	achievement	Ach_D_AdventureCount_50
444	Ach_AdventureCount_25	achievement	Ach_AdventureCount_25
445	Ach_D_AdventureCount_25	achievement	Ach_D_AdventureCount_25
446	Ach_AdventureCount_5	achievement	Ach_AdventureCount_5
447	Ach_D_AdventureCount_5	achievement	Ach_D_AdventureCount_5
448	Ach_AdventureCount_1	achievement	Ach_AdventureCount_1
449	Ach_D_AdventureCount_1	achievement	Ach_D_AdventureCount_1
450	Ach_AdvEggs_10000	achievement	Ach_AdvEggs_10000
451	Ach_D_AdvEggs_10000	achievement	Ach_D_AdvEggs_10000
452	Ach_AdvEggs_5000	achievement	Ach_AdvEggs_5000
453	Ach_D_AdvEggs_5000	achievement	Ach_D_AdvEggs_5000
454	Ach_AdvEggs_1000	achievement	Ach_AdvEggs_1000
455	Ach_D_AdvEggs_1000	achievement	Ach_D_AdvEggs_1000
456	Ach_AdvEggs_500	achievement	Ach_AdvEggs_500
457	Ach_D_AdvEggs_500	achievement	Ach_D_AdvEggs_500
458	Ach_AdvEggs_200	achievement	Ach_AdvEggs_200
459	Ach_D_AdvEggs_200	achievement	Ach_D_AdvEggs_200
460	Ach_AdvEggs_100	achievement	Ach_AdvEggs_100
461	Ach_D_AdvEggs_100	achievement	Ach_D_AdvEggs_100
462	Ach_AdvEggs_50	achievement	Ach_AdvEggs_50
463	Ach_D_AdvEggs_50	achievement	Ach_D_AdvEggs_50
464	Ach_AdvEggs_25	achievement	Ach_AdvEggs_25
465	Ach_D_AdvEggs_25	achievement	Ach_D_AdvEggs_25
466	Ach_AdvEggs_5	achievement	Ach_AdvEggs_5
467	Ach_D_AdvEggs_5	achievement	Ach_D_AdvEggs_5
468	Ach_AdventureTime_1	achievement	Ach_AdventureTime_1
469	Ach_D_AdventureTime_1	achievement	Ach_D_AdventureTime_1
470	Ach_AdventureTime_10	achievement	Ach_AdventureTime_10
471	Ach_D_AdventureTime_10	achievement	Ach_D_AdventureTime_10
472	Ach_AdventureTime_50	achievement	Ach_AdventureTime_50
473	Ach_D_AdventureTime_50	achievement	Ach_D_AdventureTime_50
474	Ach_AdventureTime_100	achievement	Ach_AdventureTime_100
475	Ach_D_AdventureTime_100	achievement	Ach_D_AdventureTime_100
476	Ach_AdventureTime_500	achievement	Ach_AdventureTime_500
477	Ach_D_AdventureTime_500	achievement	Ach_D_AdventureTime_500
478	Ach_AdventureTime_1000	achievement	Ach_AdventureTime_1000
479	Ach_D_AdventureTime_1000	achievement	Ach_D_AdventureTime_1000
480	Ach_AdventureSoloTime_5000	achievement	Ach_AdventureSoloTime_5000
481	Ach_D_AdventureSoloTime_5000	achievement	Ach_D_AdventureSoloTime_5000
482	Ach_AdventureSoloTime_1000	achievement	Ach_AdventureSoloTime_1000
483	Ach_D_AdventureSoloTime_1000	achievement	Ach_D_AdventureSoloTime_1000
484	Ach_AdventureSoloTime_500	achievement	Ach_AdventureSoloTime_500
485	Ach_D_AdventureSoloTime_500	achievement	Ach_D_AdventureSoloTime_500
486	Ach_AdventureSoloTime_100	achievement	Ach_AdventureSoloTime_100
487	Ach_D_AdventureSoloTime_100	achievement	Ach_D_AdventureSoloTime_100
488	Ach_AdventureSoloTime_50	achievement	Ach_AdventureSoloTime_50
489	Ach_D_AdventureSoloTime_50	achievement	Ach_D_AdventureSoloTime_50
490	Ach_SpawnCharacters_5	achievement	Ach_SpawnCharacters_5
491	Ach_D_SpawnCharacters_5	achievement	Ach_D_SpawnCharacters_5
492	Ach_SpawnCharacters_10	achievement	Ach_SpawnCharacters_10
493	Ach_D_SpawnCharacters_10	achievement	Ach_D_SpawnCharacters_10
494	Ach_SpawnCharacters_25	achievement	Ach_SpawnCharacters_25
495	Ach_D_SpawnCharacters_25	achievement	Ach_D_SpawnCharacters_25
496	Ach_SpawnCharacters_50	achievement	Ach_SpawnCharacters_50
497	Ach_D_SpawnCharacters_50	achievement	Ach_D_SpawnCharacters_50
498	Ach_SpawnCharacters_75	achievement	Ach_SpawnCharacters_75
499	Ach_D_SpawnCharacters_75	achievement	Ach_D_SpawnCharacters_75
500	Ach_SpawnCharacters_Max	achievement	Ach_SpawnCharacters_Max
501	Ach_D_SpawnCharacters_Max	achievement	Ach_D_SpawnCharacters_Max
502	Ach_Level10_50	achievement	Ach_Level10_50
503	Ach_D_Level10_50	achievement	Ach_D_Level10_50
504	Ach_Level10_30	achievement	Ach_Level10_30
505	Ach_D_Level10_30	achievement	Ach_D_Level10_30
506	Ach_Level10_15	achievement	Ach_Level10_15
507	Ach_D_Level10_15	achievement	Ach_D_Level10_15
508	Ach_Level10_5	achievement	Ach_Level10_5
509	Ach_D_Level10_5	achievement	Ach_D_Level10_5
510	Ach_Level15_5	achievement	Ach_Level15_5
511	Ach_D_Level15_5	achievement	Ach_D_Level15_5
512	Ach_Level15_15	achievement	Ach_Level15_15
513	Ach_D_Level15_15	achievement	Ach_D_Level15_15
514	Ach_Level15_30	achievement	Ach_Level15_30
515	Ach_D_Level15_30	achievement	Ach_D_Level15_30
516	Ach_Level15_50	achievement	Ach_Level15_50
517	Ach_D_Level15_50	achievement	Ach_D_Level15_50
518	Ach_LevelSolo_15	achievement	Ach_LevelSolo_15
519	Ach_D_LevelSolo_15	achievement	Ach_D_LevelSolo_15
520	Ach_LevelSolo_10	achievement	Ach_LevelSolo_10
521	Ach_D_LevelSolo_10	achievement	Ach_D_LevelSolo_10
522	Ach_LevelSolo_5	achievement	Ach_LevelSolo_5
523	Ach_D_LevelSolo_5	achievement	Ach_D_LevelSolo_5
524	Ach_GetHippo_50	achievement	Ach_GetHippo_50
525	Ach_D_GetHippo_50	achievement	Ach_D_GetHippo_50
526	Ach_GetHippo_25	achievement	Ach_GetHippo_25
527	Ach_D_GetHippo_25	achievement	Ach_D_GetHippo_25
528	Ach_GetHippo_10	achievement	Ach_GetHippo_10
529	Ach_D_GetHippo_10	achievement	Ach_D_GetHippo_10
530	Ach_GetDino_10	achievement	Ach_GetDino_10
531	Ach_D_GetDino_10	achievement	Ach_D_GetDino_10
532	Ach_GetDino_25	achievement	Ach_GetDino_25
533	Ach_D_GetDino_25	achievement	Ach_D_GetDino_25
534	Ach_GetDino_50	achievement	Ach_GetDino_50
535	Ach_D_GetDino_50	achievement	Ach_D_GetDino_50
536	Ach_GetPinguin_50	achievement	Ach_GetPinguin_50
537	Ach_D_GetPinguin_50	achievement	Ach_D_GetPinguin_50
538	Ach_GetPinguin_25	achievement	Ach_GetPinguin_25
539	Ach_D_GetPinguin_25	achievement	Ach_D_GetPinguin_25
540	Ach_GetPinguin_10	achievement	Ach_GetPinguin_10
541	Ach_D_GetPinguin_10	achievement	Ach_D_GetPinguin_10
542	Ach_GetShark_10	achievement	Ach_GetShark_10
543	Ach_D_GetShark_10	achievement	Ach_D_GetShark_10
544	Ach_GetShark_25	achievement	Ach_GetShark_25
545	Ach_D_GetShark_25	achievement	Ach_D_GetShark_25
546	Ach_GetShark_50	achievement	Ach_GetShark_50
547	Ach_D_GetShark_50	achievement	Ach_D_GetShark_50
548	Ach_GetCharacters_5	achievement	Ach_GetCharacters_5
549	Ach_D_GetCharacters_5	achievement	Ach_D_GetCharacters_5
550	Ach_GetCharacters_25	achievement	Ach_GetCharacters_25
551	Ach_D_GetCharacters_25	achievement	Ach_D_GetCharacters_25
552	Ach_GetCharacters_50	achievement	Ach_GetCharacters_50
553	Ach_D_GetCharacters_50	achievement	Ach_D_GetCharacters_50
554	Ach_GetCharacters_100	achievement	Ach_GetCharacters_100
555	Ach_D_GetCharacters_100	achievement	Ach_D_GetCharacters_100
556	Ach_BuyEggs_10	achievement	Ach_BuyEggs_10
557	Ach_D_BuyEggs_10	achievement	Ach_D_BuyEggs_10
558	Ach_BuyEggs_25	achievement	Ach_BuyEggs_25
559	Ach_D_BuyEggs_25	achievement	Ach_D_BuyEggs_25
560	Ach_BuyEggs_50	achievement	Ach_BuyEggs_50
561	Ach_D_BuyEggs_50	achievement	Ach_D_BuyEggs_50
562	Ach_BuyEggs_100	achievement	Ach_BuyEggs_100
563	Ach_D_BuyEggs_100	achievement	Ach_D_BuyEggs_100
564	Ach_BuyEggs_500	achievement	Ach_BuyEggs_500
565	Ach_D_BuyEggs_500	achievement	Ach_D_BuyEggs_500
566	Ach_BuyEggs_1000	achievement	Ach_BuyEggs_1000
567	Ach_D_BuyEggs_1000	achievement	Ach_D_BuyEggs_1000
568	Ach_CrashItem_1	achievement	Ach_CrashItem_1
569	Ach_D_CrashItem_1	achievement	Ach_D_CrashItem_1
570	Ach_CrashItem_10	achievement	Ach_CrashItem_10
571	Ach_D_CrashItem_10	achievement	Ach_D_CrashItem_10
572	Ach_CrashItem_50	achievement	Ach_CrashItem_50
573	Ach_D_CrashItem_50	achievement	Ach_D_CrashItem_50
574	Ach_CrashItem_100	achievement	Ach_CrashItem_100
575	Ach_D_CrashItem_100	achievement	Ach_D_CrashItem_100
576	Ach_CrashItem_500	achievement	Ach_CrashItem_500
577	Ach_D_CrashItem_500	achievement	Ach_D_CrashItem_500
578	Ach_CrashItem_1000	achievement	Ach_CrashItem_1000
579	Ach_D_CrashItem_1000	achievement	Ach_D_CrashItem_1000
580	Ach_CrashItem_5000	achievement	Ach_CrashItem_5000
581	Ach_D_CrashItem_5000	achievement	Ach_D_CrashItem_5000
582	Ach_BuildFur_10	achievement	Ach_BuildFur_10
583	Ach_D_BuildFur_10	achievement	Ach_D_BuildFur_10
584	Ach_BuildFur_25	achievement	Ach_BuildFur_25
585	Ach_D_BuildFur_25	achievement	Ach_D_BuildFur_25
586	Ach_BuildFur_50	achievement	Ach_BuildFur_50
587	Ach_D_BuildFur_50	achievement	Ach_D_BuildFur_50
588	Ach_BuildFur_100	achievement	Ach_BuildFur_100
589	Ach_D_BuildFur_100	achievement	Ach_D_BuildFur_100
590	Ach_GetAchiv_10	achievement	Ach_GetAchiv_10
591	Ach_D_GetAchiv_10	achievement	Ach_D_GetAchiv_10
592	Ach_GetAchiv_25	achievement	Ach_GetAchiv_25
593	Ach_D_GetAchiv_25	achievement	Ach_D_GetAchiv_25
594	Ach_GetAchiv_50	achievement	Ach_GetAchiv_50
595	Ach_D_GetAchiv_50	achievement	Ach_D_GetAchiv_50
596	Ach_GetAchiv_100	achievement	Ach_GetAchiv_100
597	Ach_D_GetAchiv_100	achievement	Ach_D_GetAchiv_100
598	Ach_FloorClean_All	achievement	Ach_FloorClean_All
599	Ach_D_FloorClean_All	achievement	Ach_D_FloorClean_All
600	Ach_FloorClean_1	achievement	Ach_FloorClean_1
601	Ach_D_FloorClean_1	achievement	Ach_D_FloorClean_1
\.


--
-- TOC entry 3571 (class 0 OID 18719)
-- Dependencies: 245
-- Data for Name: es_lang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.es_lang (id, key, type, text) FROM stdin;
1	login	auth	Email
2	password	auth	Password
3	sign-up	auth	Sign up
4	sign-in	auth	Sign in
5	something-went-wrong	notify	Something went wrong, try again.
6	cannot-buy-now	notify	Cannot buy now
7	max-count-for-day	notify	You have reached your daily limit
8	no-enough-money	notify	No enough money
9	space-blocked	notify	Choose a more suitable location for installation
10	buy-previous-group	notify	Need to buy the previous space
11	dont-available-slots	notify	No available raid slot
12	cannot-find-location	notify	Couldnt find the right location
13	maintenance-now	notify	The game is starting to have maintenance
14	group-tiles	notify	Group of tiles
15	character	notify	Character
16	furniture	notify	Furniture
17	loot-boxes	notify	Lootboxes
18	maintenance	notify	Maintenance
19	raid	notify	Raid
20	settings_header	settings	Settings
21	settings_sound_ui	settings	Interface sounds
22	settings_sound_ambient	settings	Ambient sounds
23	common_reset	common	Reset
24	common_close	common	Close
25	common_apply	common	Apply
26	regions_buy	regions	Do you want to buy this region? It will cost {0} buttons?
27	common_yes	common	Yes
28	common_no	common	No
29	common_confirm	common	Are you sure to continue?
30	message_new	message	New letter
31	message_readen	message	Viewed letter
32	message_open	message	Opened letter
33	common_cancel	common	Cancel
34	common_send	common	Send
35	common_confirmation	common	Confirmation
36	adventure_send_text	adventure	Do you really want to send this character to adventure?
37	adventure_time_selector	adventure	Adventure time
38	adventure_header	adventure	Adventure
39	adventure_claim_char	adventure	Take
40	adventure_return_force_1	adventure	Do you really want to return this character before declared time?
41	adventure_return_force_2	adventure	Adventure will be finished in:
42	common_return	common	Return
43	common_claim	common	Claim
44	adventure_location_info	adventure	On this location you can find so much different!
45	adventure_empty	adventure	EMPTY
46	filters_header	common	Filters
47	filters_alphabet	filters	A to Z
48	filters_alphabet_desc	filters	Z to A
49	filters_level	filters	From min lvl
50	filters_level_desc	filters	From max lvl
51	filters_power	filters	From min power
52	filters_power_desc	filters	From max power
53	filters_nft	filters	NFT
54	filters_regular	filters	Regular
55	filters_char_placed	filters	Placed
56	filters_char_free	filters	Free
57	filters_fur_placed	filters	Placed
58	filters_fur_free	filters	In warehouse
59	filters_prestige	filters	From min prestige
60	filters_prestige_desc	filters	From max prestige
61	filters_sorting	filters	Order by
62	common_buy	common	Buy
63	shop_purchased	shop	Purchased
64	shop_not_available	shop	Not in stock
65	shop_update	shop	Shop will be updated in {0}
66	book_prev_page	book	Prev. page
67	book_next_page	book	Next page
68	charcard_header	charcard	Personal card
69	charcard_reqs	charcard	Requirements
70	charcard_friends	charcard	Best friends
71	charcard_perks	charcard	Perks
72	Shark_Fakir	unit	Shark_Fakir
73	Shark_Halif	unit	Shark_Halif
74	Shark_Medjay	unit	Shark_Medjay
75	Shark_Merchant	unit	Shark_Merchant
76	Shark_Princess	unit	Shark_Princess
77	Dino_Boss	unit	Dino_Boss
78	Dino_Lucky	unit	Dino_Lucky
79	Dino_Sleepy	unit	Dino_Sleepy
80	Dino_Welder	unit	Dino_Welder
81	Dino_Destroyer	unit	Dino_Destroyer
82	Pin_Aristocrat	unit	Pin_Aristocrat
83	Pin_Barman	unit	Pin_Barman
84	Pin_Dancer	unit	Pin_Dancer
85	Pin_DJ	unit	Pin_DJ
86	Pin_Romantic	unit	Pin_Romantic
87	Hippo_Tourist	unit	Hippo_Tourist
88	Hippo_Captain	unit	Hippo_Captain
89	Hippo_Officiant	unit	Hippo_Officiant
90	Hippo_Photo	unit	Hippo_Photo
91	Hippo_Somelje	unit	Hippo_Somelje
92	Vikings	unit	Vikings
93	Unit_Sharks	unit	Unit_Sharks
94	Unit_Dino	unit	Unit_Dino
95	Unit_Pin	unit	Unit_Pin
96	Unit_Hippo	unit	Unit_Hippo
97	Armchair_1	furniture	Armchair_1
98	Bed_2	furniture	Bed_2
99	Bedside Table_2	furniture	Bedside Table_2
100	Bench_1	furniture	Bench_1
101	BookShelf_1	furniture	BookShelf_1
102	Carpet_1	furniture	Carpet_1
103	Chair_1	furniture	Chair_1
104	Closet_1	furniture	Closet_1
105	Easel_1	furniture	Easel_1
106	Gramophone_1	furniture	Gramophone_1
107	Painting_1	furniture	Painting_1
108	Radio_1	furniture	Radio_1
109	Shelf_1	furniture	Shelf_1
110	Shelf_2	furniture	Shelf_2
111	Sofa_1	furniture	Sofa_1
112	Table_1	furniture	Table_1
113	TV_1	furniture	TV_1
114	s2_Bed_1	furniture	s2_Bed_1
115	s2_Bed_2	furniture	s2_Bed_2
116	s2_Bench	furniture	s2_Bench
117	s2_Bookshelf	furniture	s2_Bookshelf
118	s2_Carpet	furniture	s2_Carpet
119	s2_Chair_1	furniture	s2_Chair_1
120	s2_Chair_2	furniture	s2_Chair_2
121	s2_Closet_1	furniture	s2_Closet_1
122	s2_Closet_2	furniture	s2_Closet_2
123	s2_CoffeTable	furniture	s2_CoffeTable
124	s2_Lamp	furniture	s2_Lamp
125	s2_Shelf	furniture	s2_Shelf
126	s2_Sofa_1	furniture	s2_Sofa_1
127	s2_Sofa_2	furniture	s2_Sofa_2
128	s2_Table	furniture	s2_Table
129	s2_TV	furniture	s2_TV
130	s2_Window	furniture	s2_Window
131	Fur_s3_Armchair	furniture	Fur_s3_Armchair
132	Fur_s3_Bed	furniture	Fur_s3_Bed
133	Fur_s3_Bench	furniture	Fur_s3_Bench
134	Fur_s3_Bookshelf	furniture	Fur_s3_Bookshelf
135	Fur_s3_Box_1	furniture	Fur_s3_Box_1
136	Fur_s3_Box_2	furniture	Fur_s3_Box_2
137	Fur_s3_Box_3	furniture	Fur_s3_Box_3
138	Fur_s3_Box_4	furniture	Fur_s3_Box_4
139	Fur_s3_Carpet	furniture	Fur_s3_Carpet
140	Fur_s3_Chair	furniture	Fur_s3_Chair
141	Fur_s3_Closet	furniture	Fur_s3_Closet
142	Fur_s3_CoffeTable	furniture	Fur_s3_CoffeTable
143	Fur_s3_Easel	furniture	Fur_s3_Easel
144	Fur_s3_Lamp	furniture	Fur_s3_Lamp
145	Fur_s3_Painting_2	furniture	Fur_s3_Painting_2
146	Fur_s3_Painting_3	furniture	Fur_s3_Painting_3
147	Fur_s3_Sofa_1	furniture	Fur_s3_Sofa_1
148	Fur_s3_Sofa_2	furniture	Fur_s3_Sofa_2
149	Fur_s3_Table	furniture	Fur_s3_Table
150	Fur_s3_Vase	furniture	Fur_s3_Vase
151	Fur_s3_Window_3	furniture	Fur_s3_Window_3
152	Fur_s3_Window_4	furniture	Fur_s3_Window_4
153	Fur_s3_WorkTable	furniture	Fur_s3_WorkTable
154	Fur_s4_Armchair_1	furniture	Fur_s4_Armchair_1
155	Fur_s4_Armchair_2	furniture	Fur_s4_Armchair_2
156	Fur_s4_Armchair_3	furniture	Fur_s4_Armchair_3
157	Fur_s4_Bed	furniture	Fur_s4_Bed
158	Fur_s4_Bench	furniture	Fur_s4_Bench
159	Fur_s4_Bookshelf	furniture	Fur_s4_Bookshelf
160	Fur_s4_Chair	furniture	Fur_s4_Chair
161	Fur_s4_Closet_1	furniture	Fur_s4_Closet_1
162	Fur_s4_Closet_2	furniture	Fur_s4_Closet_2
163	Fur_s4_CoffeTable	furniture	Fur_s4_CoffeTable
164	Fur_s4_Shelfs	furniture	Fur_s4_Shelfs
165	Fur_s4_Sofa_1	furniture	Fur_s4_Sofa_1
166	Fur_s4_Sofa_2	furniture	Fur_s4_Sofa_2
167	Fur_s4_Table_3	furniture	Fur_s4_Table_3
168	Fur_s4_Table_4	furniture	Fur_s4_Table_4
169	Fur_s5_Armchair	furniture	Fur_s5_Armchair
170	Fur_s5_Chair	furniture	Fur_s5_Chair
171	Fur_s5_Closet_3	furniture	Fur_s5_Closet_3
172	Fur_s5_Closet_4	furniture	Fur_s5_Closet_4
173	Fur_s5_Closet_5	furniture	Fur_s5_Closet_5
174	Fur_s5_Closet_6	furniture	Fur_s5_Closet_6
175	Fur_s5_CoffeTable_3	furniture	Fur_s5_CoffeTable_3
176	Fur_s5_CoffeTable_4	furniture	Fur_s5_CoffeTable_4
177	Fur_s5_CoffeTable_5	furniture	Fur_s5_CoffeTable_5
178	Fur_s5_Light	furniture	Fur_s5_Light
179	Fur_s5_Radio_2	furniture	Fur_s5_Radio_2
180	Fur_s5_Shelfs_4	furniture	Fur_s5_Shelfs_4
181	Fur_s5_Shelfs_5	furniture	Fur_s5_Shelfs_5
182	Fur_s5_Shelfs_6	furniture	Fur_s5_Shelfs_6
183	Fur_s5_Sofa_4	furniture	Fur_s5_Sofa_4
184	Fur_s5_Table_5	furniture	Fur_s5_Table_5
185	Fur_s5_Table_6	furniture	Fur_s5_Table_6
186	Fur_s5_Table_7	furniture	Fur_s5_Table_7
187	Fur_s5_Table_8	furniture	Fur_s5_Table_8
188	Fur_s5_Table_9	furniture	Fur_s5_Table_9
189	Fur_s5_Table_10	furniture	Fur_s5_Table_10
190	Fur_s5_Table_11	furniture	Fur_s5_Table_11
191	Fur_s5_Table_12	furniture	Fur_s5_Table_12
192	Fur_s5_Table_13	furniture	Fur_s5_Table_13
193	Fur_s5_Table_14	furniture	Fur_s5_Table_14
194	Fur_s5_Table_15	furniture	Fur_s5_Table_15
195	Fur_s5_Table_16	furniture	Fur_s5_Table_16
196	Fur_s5_Table_17	furniture	Fur_s5_Table_17
197	Fur_s5_Table_18	furniture	Fur_s5_Table_18
198	Fur_s5_Table_19	furniture	Fur_s5_Table_19
199	Fur_s5_Table_20	furniture	Fur_s5_Table_20
200	Fur_s5_Table_21	furniture	Fur_s5_Table_21
201	Fur_s5_Table_22	furniture	Fur_s5_Table_22
202	Fur_s5_Table_23	furniture	Fur_s5_Table_23
203	Fur_s5_Table_24	furniture	Fur_s5_Table_24
204	Fur_s6_Apple	furniture	Fur_s6_Apple
205	Fur_s6_Armchair_1	furniture	Fur_s6_Armchair_1
206	Fur_s6_Armchair_2	furniture	Fur_s6_Armchair_2
207	Fur_s6_Armchair_3	furniture	Fur_s6_Armchair_3
208	Fur_s6_Basket_1	furniture	Fur_s6_Basket_1
209	Fur_s6_Bookshelf	furniture	Fur_s6_Bookshelf
210	Fur_s6_Box	furniture	Fur_s6_Box
211	Fur_s6_Bush_1	furniture	Fur_s6_Bush_1
212	Fur_s6_Bush_2	furniture	Fur_s6_Bush_2
213	Fur_s6_Bush_3	furniture	Fur_s6_Bush_3
214	Fur_s6_Closet	furniture	Fur_s6_Closet
215	Fur_s6_CoffeTable_3	furniture	Fur_s6_CoffeTable_3
216	Fur_s6_CoffeTable_4	furniture	Fur_s6_CoffeTable_4
217	Fur_s6_Cup	furniture	Fur_s6_Cup
218	Fur_s6_Fruit	furniture	Fur_s6_Fruit
219	Fur_s6_Jar	furniture	Fur_s6_Jar
220	Fur_s6_Kettle	furniture	Fur_s6_Kettle
221	Fur_s6_Lamp_3	furniture	Fur_s6_Lamp_3
222	Fur_s6_Lamp_4	furniture	Fur_s6_Lamp_4
223	Fur_s6_Mirror	furniture	Fur_s6_Mirror
224	Fur_s6_Painting_3	furniture	Fur_s6_Painting_3
225	Fur_s6_Painting_4	furniture	Fur_s6_Painting_4
226	Fur_s6_Pasta	furniture	Fur_s6_Pasta
227	Fur_s6_Pinetree	furniture	Fur_s6_Pinetree
228	Fur_s6_Spoon	furniture	Fur_s6_Spoon
229	Fur_s6_Umbrella	furniture	Fur_s6_Umbrella
230	Fur_s6_Vase	furniture	Fur_s6_Vase
231	Fur_s6_Wardrobe	furniture	Fur_s6_Wardrobe
232	Fur_s6_WorkTable	furniture	Fur_s6_WorkTable
233	Buttons Collector	furniture	Buttons Collector
234	Armchair Group	furniture	Armchair Group
235	Bed Group	furniture	Bed Group
236	Chair Group	furniture	Chair Group
237	Closet Group	furniture	Closet Group
238	Decor Group	furniture	Decor Group
239	Test Group	furniture	Test Group
240	Lootbox Group	furniture	Lootbox Group
241	Luxury Group	furniture	Luxury Group
242	Nightstand Group	furniture	Nightstand Group
243	Sofa Group	furniture	Sofa Group
244	Special(NonDestroy)	furniture	Special(NonDestroy)
245	Table Group	furniture	Table Group
246	wallObjects Group	furniture	wallObjects Group
247	map_blocked	map	This enity is locked by other entities
248	Perk_Bussines	perks	Perk_Bussines
249	Perk_D_Bussines	perks	Perk_D_Bussines
250	Perk_ButtonFairy	perks	Perk_ButtonFairy
251	Perk_D_ButtonFairy	perks	Perk_D_ButtonFairy
252	Perk_Buttonfall	perks	Perk_Buttonfall
253	Perk_D_Buttonfall	perks	Perk_D_Buttonfall
254	Perk_Buttonist	perks	Perk_Buttonist
255	Perk_D_Buttonist	perks	Perk_D_Buttonist
256	Perk_Cheater	perks	Perk_Cheater
257	Perk_D_Cheater	perks	Perk_D_Cheater
258	Perk_Gift	perks	Perk_Gift
259	Perk_D_Gift	perks	Perk_D_Gift
260	Perk_Leader	perks	Perk_Leader
261	Perk_D_Leader	perks	Perk_D_Leader
262	Perk_Magician	perks	Perk_Magician
263	Perk_D_Magician	perks	Perk_D_Magician
264	Perk_PowerGuys	perks	Perk_PowerGuys
265	Perk_D_PowerGuys	perks	Perk_D_PowerGuys
266	Perk_Prestigionist	perks	Perk_Prestigionist
267	Perk_D_Prestigionist	perks	Perk_D_Prestigionist
268	Perk_Speakersoul	perks	Perk_Speakersoul
269	Perk_D_Speakersoul	perks	Perk_D_Speakersoul
270	Perk_Speedrun	perks	Perk_Speedrun
271	Perk_D_Speedrun	perks	Perk_D_Speedrun
272	Perk_Stockman	perks	Perk_Stockman
273	Perk_D_Stockman	perks	Perk_D_Stockman
274	Perk_Worker	perks	Perk_Worker
275	Perk_D_Worker	perks	Perk_D_Worker
276	Item_Alarm	items	Item_Alarm
277	Item_D_Alarm	items	Item_D_Alarm
278	Item_Beret	items	Item_Beret
279	Item_D_Beret	items	Item_D_Beret
280	Item_Binoculars	items	Item_Binoculars
281	Item_D_Binoculars	items	Item_D_Binoculars
282	Item_Blade	items	Item_Blade
283	Item_D_Blade	items	Item_D_Blade
284	Item_Bouqet	items	Item_Bouqet
285	Item_D_Bouqet	items	Item_D_Bouqet
286	Item_Bracer	items	Item_Bracer
287	Item_D_Bracer	items	Item_D_Bracer
288	Item_BrickPillow	items	Item_BrickPillow
289	Item_D_BrickPillow	items	Item_D_BrickPillow
290	Item_Camera	items	Item_Camera
291	Item_D_Camera	items	Item_D_Camera
292	Item_Cane	items	Item_Cane
293	Item_D_Cane	items	Item_D_Cane
294	Item_Cap	items	Item_Cap
295	Item_D_Cap	items	Item_D_Cap
296	Item_Casket	items	Item_Casket
297	Item_D_Casket	items	Item_D_Casket
298	Item_Discosphere	items	Item_Discosphere
299	Item_D_Discosphere	items	Item_D_Discosphere
300	Item_Drill	items	Item_Drill
301	Item_D_Drill	items	Item_D_Drill
302	Item_DVD	items	Item_DVD
303	Item_D_DVD	items	Item_D_DVD
304	Item_Fluite	items	Item_Fluite
305	Item_D_Fluite	items	Item_D_Fluite
306	Item_Frill	items	Item_Frill
307	Item_D_Frill	items	Item_D_Frill
308	Item_FruitPlate	items	Item_FruitPlate
309	Item_D_FruitPlate	items	Item_D_FruitPlate
310	Item_Gift	items	Item_Gift
311	Item_D_Gift	items	Item_D_Gift
312	Item_Glasscup	items	Item_Glasscup
313	Item_D_Glasscup	items	Item_D_Glasscup
314	Item_GoldCoin	items	Item_GoldCoin
315	Item_D_GoldCoin	items	Item_D_GoldCoin
316	Item_Hammer	items	Item_Hammer
317	Item_D_Hammer	items	Item_D_Hammer
318	Item_Helmet	items	Item_Helmet
319	Item_D_Helmet	items	Item_D_Helmet
320	Item_Jewelry	items	Item_Jewelry
321	Item_D_Jewelry	items	Item_D_Jewelry
322	Item_Micro	items	Item_Micro
323	Item_D_Micro	items	Item_D_Micro
324	Item_Napkin	items	Item_Napkin
325	Item_D_Napkin	items	Item_D_Napkin
326	Item_Patch	items	Item_Patch
327	Item_D_Patch	items	Item_D_Patch
328	Item_PhotoAlbum	items	Item_PhotoAlbum
329	Item_D_PhotoAlbum	items	Item_D_PhotoAlbum
330	Item_Rollex	items	Item_Rollex
331	Item_D_Rollex	items	Item_D_Rollex
332	Item_Sash	items	Item_Sash
333	Item_D_Sash	items	Item_D_Sash
334	Item_Scarf	items	Item_Scarf
335	Item_D_Scarf	items	Item_D_Scarf
336	Item_Shaker	items	Item_Shaker
337	Item_D_Shaker	items	Item_D_Shaker
338	Item_SilkHandkerchief	items	Item_SilkHandkerchief
339	Item_D_SilkHandkerchief	items	Item_D_SilkHandkerchief
340	Item_SilkPillow	items	Item_SilkPillow
341	Item_D_SilkPillow	items	Item_D_SilkPillow
342	Item_Skatch	items	Item_Skatch
343	Item_D_Skatch	items	Item_D_Skatch
344	Item_SnakeBasket	items	Item_SnakeBasket
345	Item_D_SnakeBasket	items	Item_D_SnakeBasket
346	Item_Tape	items	Item_Tape
347	Item_D_Tape	items	Item_D_Tape
348	Item_Ticket	items	Item_Ticket
349	Item_D_Ticket	items	Item_D_Ticket
350	Item_Tray	items	Item_Tray
351	Item_D_Tray	items	Item_D_Tray
352	Item_Wallet	items	Item_Wallet
353	Item_D_Wallet	items	Item_D_Wallet
354	Item_WelderMachine	items	Item_WelderMachine
355	Item_D_WelderMachine	items	Item_D_WelderMachine
356	Item_Weldermask	items	Item_Weldermask
357	Item_D_Weldermask	items	Item_D_Weldermask
358	Item_Whistle	items	Item_Whistle
359	Item_D_Whistle	items	Item_D_Whistle
360	Item_Wineglass	items	Item_Wineglass
361	Item_D_Wineglass	items	Item_D_Wineglass
362	Item_Wranch	items	Item_Wranch
363	Item_D_Wranch	items	Item_D_Wranch
366	book_invalid_charitem	book	This item cannot be placed on character
365	book_confirm_charitem	book	Are you sure you want place this item on character?
370	Ach_D_Catch_Hippo	achievement	Ach_D_Catch_Hippo
369	Ach_Catch_Hippo	achievement	Ach_Catch_Hippo
368	Ach_D_Enter_game	achievement	Ach_D_Enter_game
367	Ach_Enter_game	achievement	Ach_Enter_game
372	book_invalid_character	book	Impossible to use this consumable to this character right now
371	book_confirm_character	book	Are you sure you want to use this consumable to this character?
373	book_use_common	book	Are you sure you want to use this item?
375	charcard_lvlup_confirm	charcard	Are you sure you want to upgrade this unit? It gonna cost {0} buttons
374	charcard_lvlup	charcard	Upgrade
376	Perk_Favourite	perks	Perk_Favourite
377	Perk_D_Favourite	perks	Perk_D_Favourite
378	adventure_drag_here	adventure	DRAG HERE
379	adventure_select_character	adventure	Select Character
380	adventure_locked	adventure	LOCKED
381	adventure_low_level	adventure	Low Level
382	adventure_finished	adventure	FINISHED
383	auth_wrong_login	auth	Wrong password/email
384	auth_server_error	auth	Internal server error, try again
385	auth_used_email	auth	This email is already used
386	Cons_BlackSweet	consumables	Cons_BlackSweet
387	Cons_D_BlackSweet	consumables	Cons_D_BlackSweet
388	Cons_CoupleGum	consumables	Cons_CoupleGum
389	Cons_D_CoupleGum	consumables	Cons_D_CoupleGum
390	Cons_Gum	consumables	Cons_Gum
391	Cons_D_Gum	consumables	Cons_D_Gum
392	Cons_ManyGum	consumables	Cons_ManyGum
393	Cons_D_ManyGum	consumables	Cons_D_ManyGum
394	Cons_OrangeSweet	consumables	Cons_OrangeSweet
395	Cons_D_OrangeSweet	consumables	Cons_D_OrangeSweet
396	Cons_Part_Character	consumables	Cons_Part_Character
397	Cons_D_Part_Character	consumables	Cons_D_Part_Character
398	Cons_Part_Furniture	consumables	Cons_Part_Furniture
399	Cons_D_Part_Furniture	consumables	Cons_D_Part_Furniture
400	Cons_RaspSweet	consumables	Cons_RaspSweet
401	Cons_D_RaspSweet	consumables	Cons_D_RaspSweet
402	Ach_Listen_300	achievement	Ach_Listen_300
403	Ach_D_Listen_300	achievement	Ach_D_Listen_300
404	Ach_Listen_250	achievement	Ach_Listen_250
405	Ach_D_Listen_250	achievement	Ach_D_Listen_250
406	Ach_Listen_200	achievement	Ach_Listen_200
407	Ach_D_Listen_200	achievement	Ach_D_Listen_200
408	Ach_Listen_150	achievement	Ach_Listen_150
409	Ach_D_Listen_150	achievement	Ach_D_Listen_150
410	Ach_Listen_100	achievement	Ach_Listen_100
411	Ach_D_Listen_100	achievement	Ach_D_Listen_100
412	Ach_Listen_75	achievement	Ach_Listen_75
413	Ach_D_Listen_75	achievement	Ach_D_Listen_75
414	Ach_Listen_50	achievement	Ach_Listen_50
415	Ach_D_Listen_50	achievement	Ach_D_Listen_50
416	Ach_Listen_25	achievement	Ach_Listen_25
417	Ach_D_Listen_25	achievement	Ach_D_Listen_25
418	Ach_Listen_10	achievement	Ach_Listen_10
419	Ach_D_Listen_10	achievement	Ach_D_Listen_10
420	Ach_Listen_1	achievement	Ach_Listen_1
421	Ach_D_Listen_1	achievement	Ach_D_Listen_1
422	Ach_Dialog_5	achievement	Ach_Dialog_5
423	Ach_D_Dialog_5	achievement	Ach_D_Dialog_5
424	Ach_Dialog_1	achievement	Ach_Dialog_1
425	Ach_D_Dialog_1	achievement	Ach_D_Dialog_1
426	Ach_Dialog_10	achievement	Ach_Dialog_10
427	Ach_D_Dialog_10	achievement	Ach_D_Dialog_10
428	Ach_Dialog_20	achievement	Ach_Dialog_20
429	Ach_D_Dialog_20	achievement	Ach_D_Dialog_20
430	Ach_Dialog_35	achievement	Ach_Dialog_35
431	Ach_D_Dialog_35	achievement	Ach_D_Dialog_35
432	Ach_Dialog_50	achievement	Ach_Dialog_50
433	Ach_D_Dialog_50	achievement	Ach_D_Dialog_50
434	Ach_AdventureCount_200	achievement	Ach_AdventureCount_200
435	Ach_D_AdventureCount_200	achievement	Ach_D_AdventureCount_200
436	Ach_AdventureCount_500	achievement	Ach_AdventureCount_500
437	Ach_D_AdventureCount_500	achievement	Ach_D_AdventureCount_500
438	Ach_AdventureCount_1000	achievement	Ach_AdventureCount_1000
439	Ach_D_AdventureCount_1000	achievement	Ach_D_AdventureCount_1000
440	Ach_AdventureCount_100	achievement	Ach_AdventureCount_100
441	Ach_D_AdventureCount_100	achievement	Ach_D_AdventureCount_100
442	Ach_AdventureCount_50	achievement	Ach_AdventureCount_50
443	Ach_D_AdventureCount_50	achievement	Ach_D_AdventureCount_50
444	Ach_AdventureCount_25	achievement	Ach_AdventureCount_25
445	Ach_D_AdventureCount_25	achievement	Ach_D_AdventureCount_25
446	Ach_AdventureCount_5	achievement	Ach_AdventureCount_5
447	Ach_D_AdventureCount_5	achievement	Ach_D_AdventureCount_5
448	Ach_AdventureCount_1	achievement	Ach_AdventureCount_1
449	Ach_D_AdventureCount_1	achievement	Ach_D_AdventureCount_1
450	Ach_AdvEggs_10000	achievement	Ach_AdvEggs_10000
451	Ach_D_AdvEggs_10000	achievement	Ach_D_AdvEggs_10000
452	Ach_AdvEggs_5000	achievement	Ach_AdvEggs_5000
453	Ach_D_AdvEggs_5000	achievement	Ach_D_AdvEggs_5000
454	Ach_AdvEggs_1000	achievement	Ach_AdvEggs_1000
455	Ach_D_AdvEggs_1000	achievement	Ach_D_AdvEggs_1000
456	Ach_AdvEggs_500	achievement	Ach_AdvEggs_500
457	Ach_D_AdvEggs_500	achievement	Ach_D_AdvEggs_500
458	Ach_AdvEggs_200	achievement	Ach_AdvEggs_200
459	Ach_D_AdvEggs_200	achievement	Ach_D_AdvEggs_200
460	Ach_AdvEggs_100	achievement	Ach_AdvEggs_100
461	Ach_D_AdvEggs_100	achievement	Ach_D_AdvEggs_100
462	Ach_AdvEggs_50	achievement	Ach_AdvEggs_50
463	Ach_D_AdvEggs_50	achievement	Ach_D_AdvEggs_50
464	Ach_AdvEggs_25	achievement	Ach_AdvEggs_25
465	Ach_D_AdvEggs_25	achievement	Ach_D_AdvEggs_25
466	Ach_AdvEggs_5	achievement	Ach_AdvEggs_5
467	Ach_D_AdvEggs_5	achievement	Ach_D_AdvEggs_5
468	Ach_AdventureTime_1	achievement	Ach_AdventureTime_1
469	Ach_D_AdventureTime_1	achievement	Ach_D_AdventureTime_1
470	Ach_AdventureTime_10	achievement	Ach_AdventureTime_10
471	Ach_D_AdventureTime_10	achievement	Ach_D_AdventureTime_10
472	Ach_AdventureTime_50	achievement	Ach_AdventureTime_50
473	Ach_D_AdventureTime_50	achievement	Ach_D_AdventureTime_50
474	Ach_AdventureTime_100	achievement	Ach_AdventureTime_100
475	Ach_D_AdventureTime_100	achievement	Ach_D_AdventureTime_100
476	Ach_AdventureTime_500	achievement	Ach_AdventureTime_500
477	Ach_D_AdventureTime_500	achievement	Ach_D_AdventureTime_500
478	Ach_AdventureTime_1000	achievement	Ach_AdventureTime_1000
479	Ach_D_AdventureTime_1000	achievement	Ach_D_AdventureTime_1000
480	Ach_AdventureSoloTime_5000	achievement	Ach_AdventureSoloTime_5000
481	Ach_D_AdventureSoloTime_5000	achievement	Ach_D_AdventureSoloTime_5000
482	Ach_AdventureSoloTime_1000	achievement	Ach_AdventureSoloTime_1000
483	Ach_D_AdventureSoloTime_1000	achievement	Ach_D_AdventureSoloTime_1000
484	Ach_AdventureSoloTime_500	achievement	Ach_AdventureSoloTime_500
485	Ach_D_AdventureSoloTime_500	achievement	Ach_D_AdventureSoloTime_500
486	Ach_AdventureSoloTime_100	achievement	Ach_AdventureSoloTime_100
487	Ach_D_AdventureSoloTime_100	achievement	Ach_D_AdventureSoloTime_100
488	Ach_AdventureSoloTime_50	achievement	Ach_AdventureSoloTime_50
489	Ach_D_AdventureSoloTime_50	achievement	Ach_D_AdventureSoloTime_50
490	Ach_SpawnCharacters_5	achievement	Ach_SpawnCharacters_5
491	Ach_D_SpawnCharacters_5	achievement	Ach_D_SpawnCharacters_5
492	Ach_SpawnCharacters_10	achievement	Ach_SpawnCharacters_10
493	Ach_D_SpawnCharacters_10	achievement	Ach_D_SpawnCharacters_10
494	Ach_SpawnCharacters_25	achievement	Ach_SpawnCharacters_25
495	Ach_D_SpawnCharacters_25	achievement	Ach_D_SpawnCharacters_25
496	Ach_SpawnCharacters_50	achievement	Ach_SpawnCharacters_50
497	Ach_D_SpawnCharacters_50	achievement	Ach_D_SpawnCharacters_50
498	Ach_SpawnCharacters_75	achievement	Ach_SpawnCharacters_75
499	Ach_D_SpawnCharacters_75	achievement	Ach_D_SpawnCharacters_75
500	Ach_SpawnCharacters_Max	achievement	Ach_SpawnCharacters_Max
501	Ach_D_SpawnCharacters_Max	achievement	Ach_D_SpawnCharacters_Max
502	Ach_Level10_50	achievement	Ach_Level10_50
503	Ach_D_Level10_50	achievement	Ach_D_Level10_50
504	Ach_Level10_30	achievement	Ach_Level10_30
505	Ach_D_Level10_30	achievement	Ach_D_Level10_30
506	Ach_Level10_15	achievement	Ach_Level10_15
507	Ach_D_Level10_15	achievement	Ach_D_Level10_15
508	Ach_Level10_5	achievement	Ach_Level10_5
509	Ach_D_Level10_5	achievement	Ach_D_Level10_5
510	Ach_Level15_5	achievement	Ach_Level15_5
511	Ach_D_Level15_5	achievement	Ach_D_Level15_5
512	Ach_Level15_15	achievement	Ach_Level15_15
513	Ach_D_Level15_15	achievement	Ach_D_Level15_15
514	Ach_Level15_30	achievement	Ach_Level15_30
515	Ach_D_Level15_30	achievement	Ach_D_Level15_30
516	Ach_Level15_50	achievement	Ach_Level15_50
517	Ach_D_Level15_50	achievement	Ach_D_Level15_50
518	Ach_LevelSolo_15	achievement	Ach_LevelSolo_15
519	Ach_D_LevelSolo_15	achievement	Ach_D_LevelSolo_15
520	Ach_LevelSolo_10	achievement	Ach_LevelSolo_10
521	Ach_D_LevelSolo_10	achievement	Ach_D_LevelSolo_10
522	Ach_LevelSolo_5	achievement	Ach_LevelSolo_5
523	Ach_D_LevelSolo_5	achievement	Ach_D_LevelSolo_5
524	Ach_GetHippo_50	achievement	Ach_GetHippo_50
525	Ach_D_GetHippo_50	achievement	Ach_D_GetHippo_50
526	Ach_GetHippo_25	achievement	Ach_GetHippo_25
527	Ach_D_GetHippo_25	achievement	Ach_D_GetHippo_25
528	Ach_GetHippo_10	achievement	Ach_GetHippo_10
529	Ach_D_GetHippo_10	achievement	Ach_D_GetHippo_10
530	Ach_GetDino_10	achievement	Ach_GetDino_10
531	Ach_D_GetDino_10	achievement	Ach_D_GetDino_10
532	Ach_GetDino_25	achievement	Ach_GetDino_25
533	Ach_D_GetDino_25	achievement	Ach_D_GetDino_25
534	Ach_GetDino_50	achievement	Ach_GetDino_50
535	Ach_D_GetDino_50	achievement	Ach_D_GetDino_50
536	Ach_GetPinguin_50	achievement	Ach_GetPinguin_50
537	Ach_D_GetPinguin_50	achievement	Ach_D_GetPinguin_50
538	Ach_GetPinguin_25	achievement	Ach_GetPinguin_25
539	Ach_D_GetPinguin_25	achievement	Ach_D_GetPinguin_25
540	Ach_GetPinguin_10	achievement	Ach_GetPinguin_10
541	Ach_D_GetPinguin_10	achievement	Ach_D_GetPinguin_10
542	Ach_GetShark_10	achievement	Ach_GetShark_10
543	Ach_D_GetShark_10	achievement	Ach_D_GetShark_10
544	Ach_GetShark_25	achievement	Ach_GetShark_25
545	Ach_D_GetShark_25	achievement	Ach_D_GetShark_25
546	Ach_GetShark_50	achievement	Ach_GetShark_50
547	Ach_D_GetShark_50	achievement	Ach_D_GetShark_50
548	Ach_GetCharacters_5	achievement	Ach_GetCharacters_5
549	Ach_D_GetCharacters_5	achievement	Ach_D_GetCharacters_5
550	Ach_GetCharacters_25	achievement	Ach_GetCharacters_25
551	Ach_D_GetCharacters_25	achievement	Ach_D_GetCharacters_25
552	Ach_GetCharacters_50	achievement	Ach_GetCharacters_50
553	Ach_D_GetCharacters_50	achievement	Ach_D_GetCharacters_50
554	Ach_GetCharacters_100	achievement	Ach_GetCharacters_100
555	Ach_D_GetCharacters_100	achievement	Ach_D_GetCharacters_100
556	Ach_BuyEggs_10	achievement	Ach_BuyEggs_10
557	Ach_D_BuyEggs_10	achievement	Ach_D_BuyEggs_10
558	Ach_BuyEggs_25	achievement	Ach_BuyEggs_25
559	Ach_D_BuyEggs_25	achievement	Ach_D_BuyEggs_25
560	Ach_BuyEggs_50	achievement	Ach_BuyEggs_50
561	Ach_D_BuyEggs_50	achievement	Ach_D_BuyEggs_50
562	Ach_BuyEggs_100	achievement	Ach_BuyEggs_100
563	Ach_D_BuyEggs_100	achievement	Ach_D_BuyEggs_100
564	Ach_BuyEggs_500	achievement	Ach_BuyEggs_500
565	Ach_D_BuyEggs_500	achievement	Ach_D_BuyEggs_500
566	Ach_BuyEggs_1000	achievement	Ach_BuyEggs_1000
567	Ach_D_BuyEggs_1000	achievement	Ach_D_BuyEggs_1000
568	Ach_CrashItem_1	achievement	Ach_CrashItem_1
569	Ach_D_CrashItem_1	achievement	Ach_D_CrashItem_1
570	Ach_CrashItem_10	achievement	Ach_CrashItem_10
571	Ach_D_CrashItem_10	achievement	Ach_D_CrashItem_10
572	Ach_CrashItem_50	achievement	Ach_CrashItem_50
573	Ach_D_CrashItem_50	achievement	Ach_D_CrashItem_50
574	Ach_CrashItem_100	achievement	Ach_CrashItem_100
575	Ach_D_CrashItem_100	achievement	Ach_D_CrashItem_100
576	Ach_CrashItem_500	achievement	Ach_CrashItem_500
577	Ach_D_CrashItem_500	achievement	Ach_D_CrashItem_500
578	Ach_CrashItem_1000	achievement	Ach_CrashItem_1000
579	Ach_D_CrashItem_1000	achievement	Ach_D_CrashItem_1000
580	Ach_CrashItem_5000	achievement	Ach_CrashItem_5000
581	Ach_D_CrashItem_5000	achievement	Ach_D_CrashItem_5000
582	Ach_BuildFur_10	achievement	Ach_BuildFur_10
583	Ach_D_BuildFur_10	achievement	Ach_D_BuildFur_10
584	Ach_BuildFur_25	achievement	Ach_BuildFur_25
585	Ach_D_BuildFur_25	achievement	Ach_D_BuildFur_25
586	Ach_BuildFur_50	achievement	Ach_BuildFur_50
587	Ach_D_BuildFur_50	achievement	Ach_D_BuildFur_50
588	Ach_BuildFur_100	achievement	Ach_BuildFur_100
589	Ach_D_BuildFur_100	achievement	Ach_D_BuildFur_100
590	Ach_GetAchiv_10	achievement	Ach_GetAchiv_10
591	Ach_D_GetAchiv_10	achievement	Ach_D_GetAchiv_10
592	Ach_GetAchiv_25	achievement	Ach_GetAchiv_25
593	Ach_D_GetAchiv_25	achievement	Ach_D_GetAchiv_25
594	Ach_GetAchiv_50	achievement	Ach_GetAchiv_50
595	Ach_D_GetAchiv_50	achievement	Ach_D_GetAchiv_50
596	Ach_GetAchiv_100	achievement	Ach_GetAchiv_100
597	Ach_D_GetAchiv_100	achievement	Ach_D_GetAchiv_100
598	Ach_FloorClean_All	achievement	Ach_FloorClean_All
599	Ach_D_FloorClean_All	achievement	Ach_D_FloorClean_All
600	Ach_FloorClean_1	achievement	Ach_FloorClean_1
601	Ach_D_FloorClean_1	achievement	Ach_D_FloorClean_1
\.


--
-- TOC entry 3545 (class 0 OID 18528)
-- Dependencies: 219
-- Data for Name: floors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.floors (id, "x-size", "y-size") FROM stdin;
0	9	42
1	9	42
\.


--
-- TOC entry 3637 (class 0 OID 20158)
-- Dependencies: 311
-- Data for Name: furniture_puzzle_chances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.furniture_puzzle_chances (id, chance, furniture_id) FROM stdin;
1	0.01	12
2	0.01	13
3	0.01	28
4	0.01	107
5	0.01	121
6	0.01	122
7	0.01	6
8	0.01	7
9	0.01	8
10	0.01	9
11	0.01	10
12	0.01	11
13	0.01	14
14	0.01	15
15	0.01	16
16	0.01	17
17	0.01	18
18	0.01	0
19	0.01	1
20	0.01	2
21	0.01	3
22	0.01	4
23	0.01	5
24	0.01	19
25	0.01	20
26	0.01	21
27	0.01	22
28	0.01	23
29	0.01	24
30	0.01	25
31	0.01	26
32	0.01	27
33	0.01	29
34	0.01	30
35	0.01	31
36	0.01	32
37	0.01	33
38	0.01	35
39	0.01	36
40	0.01	37
41	0.01	42
42	0.01	43
43	0.01	44
44	0.01	45
45	0.01	46
46	0.01	47
47	0.01	48
48	0.01	49
49	0.01	50
50	0.01	51
51	0.01	52
52	0.01	53
53	0.01	54
54	0.01	55
55	0.01	56
56	0.01	57
57	0.01	58
58	0.01	59
59	0.01	60
60	0.01	61
61	0.01	62
62	0.01	63
63	0.01	64
64	0.01	65
65	0.01	66
66	0.01	67
67	0.01	68
68	0.01	69
69	0.01	70
70	0.01	71
71	0.01	72
72	0.01	73
73	0.01	74
74	0.01	75
75	0.01	76
76	0.01	77
77	0.01	78
78	0.01	79
79	0.01	80
80	0.01	81
81	0.01	82
82	0.01	86
83	0.01	87
84	0.01	88
85	0.01	89
86	0.01	90
87	0.01	91
88	0.01	92
89	0.01	93
90	0.01	94
91	0.01	95
92	0.01	96
93	0.01	97
94	0.01	98
95	0.01	99
96	0.01	100
97	0.01	101
98	0.01	102
99	0.01	103
100	0.01	104
101	0.01	105
102	0.01	106
103	0.01	108
104	0.01	109
105	0.01	110
106	0.01	111
107	0.01	112
108	0.01	113
109	0.01	114
110	0.01	115
111	0.01	116
112	0.01	117
113	0.01	118
114	0.01	119
115	0.01	120
116	0.01	123
117	0.01	124
118	0.01	129
119	0.01	131
120	0.01	125
121	0.01	126
122	0.01	127
123	0.01	128
124	0.01	130
125	0.01	132
126	0.01	133
127	0.01	134
128	0.01	135
\.


--
-- TOC entry 3547 (class 0 OID 18536)
-- Dependencies: 221
-- Data for Name: furnitures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.furnitures (id, name, category, description, promo_image, icon, model, occupy, is_wall_object, rules, prestige, optimal_requirement, max_requirement, size) FROM stdin;
12	Shelf_1	4	asd	asd	asd	asd	t	f	[]	6	3	8	{"x": 1, "y": 2}
13	Shelf_2	4	asd	asd	asd	asd	t	f	[]	1	3	8	{"x": 1, "y": 2}
28	s2_Shelf	4	asd	asd	asd	asd	t	f	[]	3	3	8	{"x": 1, "y": 2}
107	Fur_s6_Apple	0	asd	asd	asd	asd	f	f	[]	3	3	8	{"x": 1, "y": 1}
121	Fur_s6_Fruit	0	asd	asd	asd	asd	t	f	[]	6	3	8	{"x": 1, "y": 1}
122	Fur_s6_Jar	5	asd	asd	asd	asd	t	f	[]	9	3	8	{"x": 1, "y": 1}
6	Chair_1	3	asd	asd	asd	asd	t	f	[]	0	1	1	{"x": 1, "y": 1}
7	Closet_1	4	asd	asd	asd	asd	t	f	[]	1	2	3	{"x": 1, "y": 2}
8	Easel_1	7	asd	asd	asd	asd	t	f	[]	3	1	2	{"x": 1, "y": 1}
9	Gramophone_1	7	asd	asd	asd	asd	t	f	[]	4	4	8	{"x": 1, "y": 1}
10	Painting_1	11	asd	asd	asd	asd	f	t	[]	2	2	4	{"x": 1, "y": 1}
11	Radio_1	7	asd	asd	asd	asd	t	f	[]	3	4	8	{"x": 1, "y": 1}
14	Sofa_1	9	asd	asd	asd	asd	t	f	[]	1	2	3	{"x": 1, "y": 2}
15	Table_1	10	asd	asd	asd	asd	t	f	[]	0	2	3	{"x": 1, "y": 2}
16	TV_1	7	asd	asd	asd	asd	t	f	[]	4	4	7	{"x": 1, "y": 1}
17	s2_Bed_1	2	asd	asd	asd	asd	t	f	[]	3	2	4	{"x": 2, "y": 2}
18	s2_Bed_2	2	asd	asd	asd	asd	t	f	[]	3	2	4	{"x": 2, "y": 2}
0	Armchair_1	1	asd	asd	asd	asd	t	f	[]	0	1	2	{"x": 1, "y": 1}
1	Bed_2	2	asd	asd	asd	asd	t	f	[]	0	1	2	{"x": 2, "y": 1}
2	Bedside Table_2	8	asd	asd	asd	asd	t	f	[]	1	1	1	{"x": 1, "y": 1}
3	Bench_1	3	asd	asd	asd	asd	t	f	[]	1	2	3	{"x": 2, "y": 1}
4	BookShelf_1	4	asd	asd	asd	asd	t	f	[]	1	2	3	{"x": 1, "y": 2}
5	Carpet_1	5	asd	asd	asd	asd	f	f	[]	1	2	4	{"x": 2, "y": 1}
19	s2_Bench	3	asd	asd	asd	asd	t	f	[]	1	1	3	{"x": 1, "y": 2}
20	s2_Bookshelf	4	asd	asd	asd	asd	t	f	[]	3	3	5	{"x": 1, "y": 2}
21	s2_Carpet	5	asd	asd	asd	asd	f	f	[]	1	2	4	{"x": 2, "y": 1}
22	s2_Chair_1	3	asd	asd	asd	asd	t	f	[]	2	1	2	{"x": 1, "y": 1}
23	s2_Chair_2	3	asd	asd	asd	asd	t	f	[]	1	1	1	{"x": 1, "y": 1}
24	s2_Closet_1	4	asd	asd	asd	asd	t	f	[]	5	3	6	{"x": 1, "y": 2}
25	s2_Closet_2	4	asd	asd	asd	asd	t	f	[]	3	2	4	{"x": 1, "y": 1}
26	s2_CoffeTable	10	asd	asd	asd	asd	t	f	[]	2	1	2	{"x": 1, "y": 1}
27	s2_Lamp	5	asd	asd	asd	asd	t	f	[]	2	1	3	{"x": 1, "y": 1}
29	s2_Sofa_1	9	asd	asd	asd	asd	t	f	[]	3	2	4	{"x": 1, "y": 2}
30	s2_Sofa_2	9	asd	asd	asd	asd	t	f	[]	3	2	4	{"x": 1, "y": 2}
31	s2_Table	10	asd	asd	asd	asd	t	f	[]	2	1	3	{"x": 1, "y": 2}
32	s2_TV	7	asd	asd	asd	asd	t	f	[]	5	5	8	{"x": 1, "y": 2}
33	s2_Window	11	asd	asd	asd	asd	f	t	[]	1	2	6	{"x": 1, "y": 1}
35	Fur_s3_Bed	2	asd	asd	asd	asd	t	f	[]	1	1	2	{"x": 1, "y": 2}
36	Fur_s3_Bench	3	asd	asd	asd	asd	t	f	[]	1	2	3	{"x": 1, "y": 2}
37	Fur_s3_Bookshelf	4	asd	asd	asd	asd	t	f	[]	1	2	3	{"x": 1, "y": 1}
42	Fur_s3_Carpet	5	asd	asd	asd	asd	f	f	[]	4	4	8	{"x": 2, "y": 2}
43	Fur_s3_Chair	3	asd	asd	asd	asd	t	f	[]	1	1	2	{"x": 1, "y": 1}
44	Fur_s3_Closet	4	asd	asd	asd	asd	t	f	[]	1	2	4	{"x": 1, "y": 1}
45	Fur_s3_CoffeTable	10	asd	asd	asd	asd	t	f	[]	2	2	4	{"x": 1, "y": 1}
46	Fur_s3_Easel	7	asd	asd	asd	asd	t	f	[]	4	1	3	{"x": 1, "y": 1}
47	Fur_s3_Lamp	5	asd	asd	asd	asd	t	f	[]	2	2	4	{"x": 1, "y": 1}
48	Fur_s3_Painting_2	11	asd	asd	asd	asd	f	t	[]	3	4	8	{"x": 1, "y": 1}
49	Fur_s3_Painting_3	11	asd	asd	asd	asd	f	t	[]	5	5	10	{"x": 1, "y": 2}
50	Fur_s3_Sofa_1	9	asd	asd	asd	asd	t	f	[]	2	2	4	{"x": 1, "y": 2}
51	Fur_s3_Sofa_2	9	asd	asd	asd	asd	t	f	[]	2	2	4	{"x": 1, "y": 2}
52	Fur_s3_Table	10	asd	asd	asd	asd	t	f	[]	3	3	5	{"x": 1, "y": 2}
53	Fur_s3_Vase	5	asd	asd	asd	asd	t	f	[]	2	2	6	{"x": 1, "y": 1}
54	Fur_s3_Window_3	11	asd	asd	asd	asd	f	t	[]	1	4	8	{"x": 1, "y": 1}
55	Fur_s3_Window_4	11	asd	asd	asd	asd	f	t	[]	1	4	8	{"x": 1, "y": 1}
56	Fur_s3_WorkTable	10	asd	asd	asd	asd	t	f	[]	3	1	4	{"x": 1, "y": 2}
57	Fur_s4_Armchair_1	1	asd	asd	asd	asd	t	f	[]	2	1	4	{"x": 1, "y": 1}
58	Fur_s4_Armchair_2	1	asd	asd	asd	asd	t	f	[]	3	1	4	{"x": 1, "y": 1}
59	Fur_s4_Armchair_3	1	asd	asd	asd	asd	t	f	[]	1	1	4	{"x": 1, "y": 1}
60	Fur_s4_Bed	2	asd	asd	asd	asd	t	f	[]	4	2	4	{"x": 2, "y": 2}
61	Fur_s4_Bench	3	asd	asd	asd	asd	t	f	[]	1	2	4	{"x": 1, "y": 2}
62	Fur_s4_Bookshelf	4	asd	asd	asd	asd	t	f	[]	3	2	5	{"x": 1, "y": 1}
63	Fur_s4_Chair	3	asd	asd	asd	asd	t	f	[]	2	1	2	{"x": 1, "y": 1}
64	Fur_s4_Closet_1	4	asd	asd	asd	asd	t	f	[]	1	2	5	{"x": 1, "y": 1}
65	Fur_s4_Closet_2	4	asd	asd	asd	asd	t	f	[]	2	2	5	{"x": 1, "y": 1}
66	Fur_s4_CoffeTable	10	asd	asd	asd	asd	t	f	[]	4	2	4	{"x": 1, "y": 1}
67	Fur_s4_Shelfs	4	asd	asd	asd	asd	t	f	[]	2	2	4	{"x": 1, "y": 1}
68	Fur_s4_Sofa_1	9	asd	asd	asd	asd	t	f	[]	2	2	3	{"x": 1, "y": 2}
69	Fur_s4_Sofa_2	9	asd	asd	asd	asd	t	f	[]	2	2	3	{"x": 1, "y": 2}
70	Fur_s4_Table_3	10	asd	asd	asd	asd	t	f	[]	2	2	4	{"x": 1, "y": 2}
71	Fur_s4_Table_4	10	asd	asd	asd	asd	t	f	[]	2	2	4	{"x": 1, "y": 2}
72	Fur_s5_Armchair	1	asd	asd	asd	asd	t	f	[]	5	1	3	{"x": 1, "y": 1}
73	Fur_s5_Chair	3	asd	asd	asd	asd	t	f	[]	3	1	2	{"x": 1, "y": 1}
74	Fur_s5_Closet_3	4	asd	asd	asd	asd	t	f	[]	8	6	12	{"x": 1, "y": 3}
75	Fur_s5_Closet_4	4	asd	asd	asd	asd	t	f	[]	6	4	8	{"x": 1, "y": 2}
76	Fur_s5_Closet_5	4	asd	asd	asd	asd	t	f	[]	6	4	8	{"x": 1, "y": 2}
77	Fur_s5_Closet_6	4	asd	asd	asd	asd	t	f	[]	3	3	5	{"x": 1, "y": 1}
78	Fur_s5_CoffeTable_3	10	asd	asd	asd	asd	t	f	[]	2	2	3	{"x": 1, "y": 1}
79	Fur_s5_CoffeTable_4	10	asd	asd	asd	asd	t	f	[]	2	2	3	{"x": 1, "y": 1}
80	Fur_s5_CoffeTable_5	10	asd	asd	asd	asd	t	f	[]	2	2	3	{"x": 1, "y": 2}
81	Fur_s5_Light	5	asd	asd	asd	asd	t	f	[]	3	3	6	{"x": 1, "y": 1}
82	Fur_s5_Radio_2	7	asd	asd	asd	asd	t	f	[]	3	4	8	{"x": 1, "y": 1}
86	Fur_s5_Sofa_4	9	asd	asd	asd	asd	t	f	[]	5	3	8	{"x": 1, "y": 3}
87	Fur_s5_Table_5	10	asd	asd	asd	asd	t	f	[]	5	4	8	{"x": 2, "y": 2}
88	Fur_s5_Table_6	10	asd	asd	asd	asd	t	f	[]	5	4	8	{"x": 2, "y": 2}
89	Fur_s5_Table_7	10	asd	asd	asd	asd	t	f	[]	5	4	8	{"x": 2, "y": 2}
90	Fur_s5_Table_8	10	asd	asd	asd	asd	t	f	[]	5	4	8	{"x": 2, "y": 2}
91	Fur_s5_Table_9	10	asd	asd	asd	asd	t	f	[]	4	4	8	{"x": 2, "y": 2}
92	Fur_s5_Table_10	10	asd	asd	asd	asd	t	f	[]	4	4	8	{"x": 1, "y": 2}
93	Fur_s5_Table_11	10	asd	asd	asd	asd	t	f	[]	5	3	8	{"x": 2, "y": 2}
94	Fur_s5_Table_12	10	asd	asd	asd	asd	t	f	[]	5	4	8	{"x": 2, "y": 2}
95	Fur_s5_Table_13	10	asd	asd	asd	asd	t	f	[]	5	4	8	{"x": 2, "y": 2}
96	Fur_s5_Table_14	10	asd	asd	asd	asd	t	f	[]	5	4	8	{"x": 2, "y": 2}
97	Fur_s5_Table_15	10	asd	asd	asd	asd	t	f	[]	5	4	8	{"x": 2, "y": 2}
98	Fur_s5_Table_16	10	asd	asd	asd	asd	t	f	[]	7	4	8	{"x": 1, "y": 2}
99	Fur_s5_Table_17	10	asd	asd	asd	asd	t	f	[]	6	6	10	{"x": 2, "y": 3}
100	Fur_s5_Table_18	10	asd	asd	asd	asd	t	f	[]	6	6	10	{"x": 2, "y": 3}
101	Fur_s5_Table_19	10	asd	asd	asd	asd	t	f	[]	6	6	10	{"x": 2, "y": 3}
102	Fur_s5_Table_20	10	asd	asd	asd	asd	t	f	[]	6	6	10	{"x": 2, "y": 3}
103	Fur_s5_Table_21	10	asd	asd	asd	asd	t	f	[]	8	6	12	{"x": 2, "y": 3}
104	Fur_s5_Table_22	10	asd	asd	asd	asd	t	f	[]	8	6	12	{"x": 2, "y": 3}
105	Fur_s5_Table_23	10	asd	asd	asd	asd	t	f	[]	8	6	12	{"x": 2, "y": 3}
106	Fur_s5_Table_24	10	asd	asd	asd	asd	t	f	[]	8	6	12	{"x": 2, "y": 3}
108	Fur_s6_Armchair_1	1	asd	asd	asd	asd	t	f	[]	5	1	3	{"x": 1, "y": 1}
109	Fur_s6_Armchair_2	1	asd	asd	asd	asd	t	f	[]	4	1	3	{"x": 1, "y": 1}
110	Fur_s6_Armchair_3	1	asd	asd	asd	asd	t	f	[]	4	1	3	{"x": 1, "y": 1}
111	Fur_s6_Basket_1	0	asd	asd	asd	asd	t	f	[]	1	1	1	{"x": 1, "y": 1}
112	Fur_s6_Bookshelf	4	asd	asd	asd	asd	t	f	[]	3	2	4	{"x": 1, "y": 1}
113	Fur_s6_Box	5	asd	asd	asd	asd	t	f	[]	1	1	1	{"x": 1, "y": 1}
114	Fur_s6_Bush_1	5	asd	asd	asd	asd	t	f	[]	1	3	7	{"x": 1, "y": 1}
115	Fur_s6_Bush_2	5	asd	asd	asd	asd	t	f	[]	1	3	7	{"x": 1, "y": 1}
116	Fur_s6_Bush_3	5	asd	asd	asd	asd	t	f	[]	2	3	7	{"x": 1, "y": 1}
117	Fur_s6_Closet	4	asd	asd	asd	asd	t	f	[]	4	4	8	{"x": 1, "y": 2}
118	Fur_s6_CoffeTable_3	10	asd	asd	asd	asd	t	f	[]	2	2	3	{"x": 1, "y": 1}
119	Fur_s6_CoffeTable_4	10	asd	asd	asd	asd	t	f	[]	2	2	3	{"x": 1, "y": 1}
120	Fur_s6_Cup	0	asd	asd	asd	asd	t	f	[]	1	1	1	{"x": 1, "y": 1}
123	Fur_s6_Kettle	5	asd	asd	asd	asd	t	f	[]	2	1	1	{"x": 1, "y": 1}
124	Fur_s6_Lamp_3	5	asd	asd	asd	asd	t	f	[]	2	1	3	{"x": 1, "y": 1}
129	Fur_s6_Pasta	0	asd	asd	asd	asd	t	f	[]	4	3	8	{"x": 1, "y": 1}
131	Fur_s6_Spoon	0	asd	asd	asd	asd	t	f	[]	9	3	8	{"x": 1, "y": 1}
300	Buttons Collector	300	asd	asd	asd	asd	t	f	[]	2	3	8	{"x": 1, "y": 2}
125	Fur_s6_Lamp_4	5	asd	asd	asd	asd	t	f	[]	3	2	5	{"x": 1, "y": 1}
126	Fur_s6_Mirror	11	asd	asd	asd	asd	f	t	[]	5	2	5	{"x": 1, "y": 2}
127	Fur_s6_Painting_3	11	asd	asd	asd	asd	f	t	[]	5	4	9	{"x": 1, "y": 1}
128	Fur_s6_Painting_4	11	asd	asd	asd	asd	f	t	[]	5	4	9	{"x": 1, "y": 1}
130	Fur_s6_Pinetree	5	asd	asd	asd	asd	t	f	[]	4	10	20	{"x": 1, "y": 1}
132	Fur_s6_Umbrella	5	asd	asd	asd	asd	t	f	[]	1	3	6	{"x": 1, "y": 1}
133	Fur_s6_Vase	5	asd	asd	asd	asd	t	f	[]	2	2	4	{"x": 1, "y": 1}
134	Fur_s6_Wardrobe	4	asd	asd	asd	asd	t	f	[]	5	4	8	{"x": 1, "y": 2}
135	Fur_s6_WorkTable	10	asd	asd	asd	asd	t	f	[]	5	1	3	{"x": 1, "y": 2}
\.


--
-- TOC entry 3549 (class 0 OID 18548)
-- Dependencies: 223
-- Data for Name: groups_tiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups_tiles (id, size, "position", cost, previous, sector, is_start) FROM stdin;
0	{"x": 9, "y": 7}	{"x": 0, "y": 23}	0	[-1]	0	t
1	{"x": 4, "y": 2}	{"x": 0, "y": 30}	250	[0]	0	f
2	{"x": 4, "y": 2}	{"x": 0, "y": 32}	600	[1]	0	f
3	{"x": 4, "y": 2}	{"x": 0, "y": 34}	1100	[2]	0	f
4	{"x": 5, "y": 1}	{"x": 4, "y": 35}	600	[5]	0	f
5	{"x": 5, "y": 1}	{"x": 4, "y": 34}	800	[6]	0	f
6	{"x": 5, "y": 1}	{"x": 4, "y": 33}	650	[7]	0	f
7	{"x": 5, "y": 1}	{"x": 4, "y": 32}	450	[8]	0	f
8	{"x": 5, "y": 1}	{"x": 4, "y": 31}	250	[9]	0	f
9	{"x": 5, "y": 1}	{"x": 4, "y": 30}	100	[0]	0	f
10	{"x": 9, "y": 2}	{"x": 0, "y": 36}	2000	[3, 4]	0	f
11	{"x": 9, "y": 2}	{"x": 0, "y": 38}	4800	[10]	0	f
12	{"x": 9, "y": 2}	{"x": 0, "y": 40}	7000	[11]	0	f
13	{"x": 9, "y": 2}	{"x": 0, "y": 21}	1000	[1, 8]	0	f
14	{"x": 9, "y": 2}	{"x": 0, "y": 19}	3500	[13, 3, 4]	0	f
15	{"x": 9, "y": 2}	{"x": 0, "y": 17}	7000	[14, 11]	0	f
16	{"x": 4, "y": 2}	{"x": 0, "y": 15}	8000	[15, 12]	0	f
18	{"x": 4, "y": 3}	{"x": 0, "y": 12}	11000	[16]	0	f
19	{"x": 9, "y": 2}	{"x": 0, "y": 10}	20000	[17, 18]	0	f
20	{"x": 9, "y": 2}	{"x": 0, "y": 8}	22000	[19]	0	f
21	{"x": 9, "y": 2}	{"x": 0, "y": 6}	25000	[20]	0	f
22	{"x": 9, "y": 2}	{"x": 0, "y": 4}	28000	[21]	0	f
23	{"x": 9, "y": 2}	{"x": 0, "y": 2}	33000	[22]	0	f
24	{"x": 9, "y": 2}	{"x": 0, "y": 0}	40000	[23]	0	f
25	{"x": 9, "y": 42}	{"x": 0, "y": 0}	50000	[0]	1	f
17	{"x": 5, "y": 5}	{"x": 4, "y": 12}	16000	[16, 12]	0	f
\.


--
-- TOC entry 3579 (class 0 OID 19054)
-- Dependencies: 253
-- Data for Name: letters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.letters (id, is_everyone, subject, message, items, "time", "senderId", "recipientId") FROM stdin;
1	t	Prize	You won	\N	1696945599	\N	\N
3	t	Soft currency	You won!	{"buttonEarnings": [{"amount": 10}]}	1696945599	\N	\N
\.


--
-- TOC entry 3611 (class 0 OID 20046)
-- Dependencies: 285
-- Data for Name: logs_character_actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_character_actions (id, player_id, "time", character_id, action_config_id, time_end) FROM stdin;
\.


--
-- TOC entry 3613 (class 0 OID 20054)
-- Dependencies: 287
-- Data for Name: logs_character_buffs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_character_buffs (id, player_id, "time", action_name, config_id, buff_time) FROM stdin;
\.


--
-- TOC entry 3615 (class 0 OID 20062)
-- Dependencies: 289
-- Data for Name: logs_character_interactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_character_interactions (id, player_id, "time", character_id, action_name) FROM stdin;
\.


--
-- TOC entry 3617 (class 0 OID 20070)
-- Dependencies: 291
-- Data for Name: logs_character_raids; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_character_raids (id, player_id, "time", location_config_id, minutes, start_time, end_time) FROM stdin;
\.


--
-- TOC entry 3621 (class 0 OID 20086)
-- Dependencies: 295
-- Data for Name: logs_furniture_interactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_furniture_interactions (id, player_id, "time", furniture_id, action) FROM stdin;
\.


--
-- TOC entry 3623 (class 0 OID 20094)
-- Dependencies: 297
-- Data for Name: logs_group_tiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_group_tiles (id, player_id, "time", config_id, floor_id) FROM stdin;
\.


--
-- TOC entry 3619 (class 0 OID 20078)
-- Dependencies: 293
-- Data for Name: logs_inventory_consumables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_inventory_consumables (id, player_id, "time", consumable_config_id, count, action_name) FROM stdin;
\.


--
-- TOC entry 3633 (class 0 OID 20137)
-- Dependencies: 307
-- Data for Name: logs_inventory_things; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_inventory_things (id, player_id, "time", thing_id, thing_config_id, action_name) FROM stdin;
\.


--
-- TOC entry 3625 (class 0 OID 20102)
-- Dependencies: 299
-- Data for Name: logs_loot_box_creations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_loot_box_creations (id, player_id, "time", type, loot_box_id, location_config_id, items) FROM stdin;
\.


--
-- TOC entry 3627 (class 0 OID 20113)
-- Dependencies: 301
-- Data for Name: logs_loot_box_opens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_loot_box_opens (id, player_id, "time", type, loot_box_id, loot_box_config_id) FROM stdin;
\.


--
-- TOC entry 3607 (class 0 OID 20030)
-- Dependencies: 281
-- Data for Name: logs_player_gates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_player_gates (id, player_id, "time", action, ip) FROM stdin;
1	7	1698319024	join	none
2	6	1698319065	join	none
3	7	1698322621	join	none
4	6	1698356137	join	none
5	6	1698356290	join	none
6	6	1698356407	join	none
7	6	1698356542	join	none
8	6	1698356760	join	none
9	6	1698357055	join	none
10	6	1698357151	join	none
11	6	1698357254	join	none
12	6	1698357390	join	none
13	6	1698361491	join	none
14	6	1698362017	join	none
15	6	1698390580	join	none
16	6	1698391790	join	none
17	11	1698393702	join	none
18	11	1698394496	join	none
19	6	1698394737	join	none
20	6	1698394822	join	none
21	11	1698394892	join	none
22	11	1698395152	join	none
23	7	1698396348	join	none
24	6	1698396703	join	none
25	6	1698396731	join	none
26	7	1698396817	join	none
27	6	1698397239	join	none
28	6	1698397286	join	none
29	7	1698397298	join	none
30	6	1698398501	join	none
31	7	1698398535	join	none
32	6	1698399159	join	none
33	6	1698399417	join	none
34	6	1698399439	join	none
35	7	1698399544	join	none
36	7	1698399565	join	none
37	7	1698402678	join	none
38	7	1698402708	join	none
39	6	1698410958	join	none
40	6	1698414415	join	none
41	6	1698415378	join	none
42	6	1698415549	join	none
43	6	1698415630	join	none
44	6	1698415670	join	none
45	6	1698416432	join	none
46	6	1698416447	join	none
47	6	1698416578	join	none
48	6	1698443403	join	none
49	6	1698443418	join	none
50	6	1698443428	join	none
51	6	1698443430	join	none
52	6	1698443434	join	none
53	6	1698443436	join	none
54	6	1698443439	join	none
55	6	1698443447	join	none
56	6	1698443465	join	none
57	6	1698443646	join	none
58	6	1698443686	join	none
59	6	1698443947	join	none
60	6	1698444011	join	none
61	6	1698444029	join	none
62	6	1698444200	join	none
63	6	1698444314	join	none
64	6	1698446969	join	none
65	6	1698447053	join	none
66	6	1698447122	join	none
67	6	1698447292	join	none
68	6	1698447345	join	none
69	6	1698447542	join	none
70	6	1698447575	join	none
71	6	1698448913	join	none
72	6	1698448988	join	none
73	6	1698449024	join	none
74	6	1698449106	join	none
75	6	1698449243	join	none
76	6	1698450472	join	none
77	6	1698450630	join	none
78	6	1698451876	join	none
\.


--
-- TOC entry 3629 (class 0 OID 20121)
-- Dependencies: 303
-- Data for Name: logs_server; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_server (id, type, data, "time") FROM stdin;
\.


--
-- TOC entry 3631 (class 0 OID 20129)
-- Dependencies: 305
-- Data for Name: logs_soft_currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_soft_currency (id, player_id, "time", action_name, is_addition, amount, balance) FROM stdin;
\.


--
-- TOC entry 3609 (class 0 OID 20038)
-- Dependencies: 283
-- Data for Name: logs_user_achievments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_user_achievments (id, player_id, "time", achievment_config_id) FROM stdin;
\.


--
-- TOC entry 3603 (class 0 OID 19348)
-- Dependencies: 277
-- Data for Name: loot_box_group_chances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loot_box_group_chances (id, group_name, chance, loot_box_id) FROM stdin;
5	character	0.02	1
3	furniture	0.12	1
2	consumable	0.35	1
1	character	0.03	0
9	soft-currency	0.25	1
4	thing	0.15	1
7	furniture	0.12	0
8	thing	0.15	0
6	consumable	0.35	0
10	soft-currency	0.25	0
\.


--
-- TOC entry 3601 (class 0 OID 19340)
-- Dependencies: 275
-- Data for Name: loot_box_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loot_box_items (id, group_name, config_id, chance, count, loot_box_id) FROM stdin;
163	thing	10	0.2	1	1
161	thing	8	0.05	1	1
165	thing	12	0.2	1	1
175	thing	22	0.12	1	1
164	thing	11	0.18	1	1
191	thing	38	0.2	1	1
160	thing	7	0.12	1	1
189	thing	36	0.2	1	1
173	thing	20	0.12	1	1
14	furniture	9	0.01	1	1
188	thing	35	0.2	1	1
159	thing	6	0.12	1	1
187	thing	34	0.05	1	1
186	thing	33	0.2	1	1
195	thing	42	0.2	1	1
184	thing	31	0.2	1	1
154	thing	1	0.18	1	1
172	thing	19	0.2	1	1
185	thing	32	0.18	1	1
192	thing	39	0.12	1	1
157	thing	4	0.2	1	1
168	thing	15	0.2	1	1
181	thing	28	0.2	1	1
177	thing	24	0.2	1	1
158	thing	5	0.2	1	1
176	thing	23	0.05	1	1
153	thing	0	0.2	1	1
156	thing	3	0.14	1	1
180	thing	27	0.12	1	1
171	thing	18	0.05	1	1
169	thing	16	0.2	1	1
182	thing	29	0.18	1	1
194	thing	41	0.12	1	1
467	furniture	60	0.04	1	0
468	furniture	127	0.05	1	0
469	furniture	69	0.12	1	0
470	furniture	110	0.1	1	0
471	furniture	111	0.05	1	0
472	furniture	68	0.12	1	0
473	furniture	67	0.15	1	0
474	furniture	128	0.05	1	0
475	furniture	134	0.09	1	0
476	furniture	91	0.09	1	0
477	furniture	61	0.15	1	0
478	furniture	92	0.09	1	0
479	furniture	96	0.07	1	0
480	furniture	135	0.04	1	0
481	furniture	63	0.03	1	0
482	furniture	101	0.06	1	0
483	furniture	126	0.03	1	0
484	furniture	72	0.04	1	0
485	furniture	66	0.09	1	0
486	furniture	119	0.08	1	0
487	furniture	62	0.1	1	0
488	furniture	74	0.03	1	0
489	furniture	59	0.1	1	0
490	furniture	89	0.07	1	0
491	furniture	108	0.05	1	0
492	furniture	86	0.09	1	0
493	furniture	71	0.12	1	0
494	furniture	116	0.05	1	0
495	furniture	114	0.05	1	0
106	furniture	106	0.01	1	1
496	furniture	133	0.05	1	0
497	furniture	94	0.07	1	0
498	furniture	95	0.07	1	0
499	furniture	132	0.07	1	0
500	furniture	131	0	1	0
501	furniture	129	0	1	0
128	furniture	130	0.01	1	1
502	furniture	124	0.04	1	0
503	furniture	99	0.03	1	0
504	furniture	80	0.2	1	0
82	furniture	79	0.07	1	1
76	furniture	73	0.05	1	1
105	furniture	105	0.03	1	1
108	furniture	109	0.05	1	1
68	furniture	65	0.1	1	1
85	furniture	82	0.07	1	1
37	furniture	29	0.08	1	1
90	furniture	90	0.07	1	1
41	furniture	33	0	1	1
58	furniture	55	0	1	1
57	furniture	54	0	1	1
44	furniture	37	0.15	1	1
56	furniture	53	0.08	1	1
26	furniture	4	0.2	1	1
73	furniture	70	0.12	1	1
78	furniture	75	0.03	1	1
114	furniture	115	0.05	1	1
112	furniture	113	0.02	1	1
93	furniture	93	0.07	1	1
79	furniture	76	0.03	1	1
63	furniture	60	0.04	1	1
126	furniture	127	0.05	1	1
72	furniture	69	0.12	1	1
109	furniture	110	0.1	1	1
110	furniture	111	0.05	1	1
71	furniture	68	0.12	1	1
70	furniture	67	0.15	1	1
127	furniture	128	0.05	1	1
131	furniture	134	0.09	1	1
91	furniture	91	0.09	1	1
64	furniture	61	0.15	1	1
92	furniture	92	0.09	1	1
96	furniture	96	0.07	1	1
132	furniture	135	0.04	1	1
66	furniture	63	0.03	1	1
101	furniture	101	0.06	1	1
125	furniture	126	0.03	1	1
75	furniture	72	0.04	1	1
69	furniture	66	0.09	1	1
118	furniture	119	0.08	1	1
65	furniture	62	0.1	1	1
77	furniture	74	0.03	1	1
62	furniture	59	0.1	1	1
89	furniture	89	0.07	1	1
107	furniture	108	0.05	1	1
86	furniture	86	0.09	1	1
74	furniture	71	0.12	1	1
115	furniture	116	0.05	1	1
113	furniture	114	0.05	1	1
130	furniture	133	0.05	1	1
94	furniture	94	0.07	1	1
95	furniture	95	0.07	1	1
129	furniture	132	0.07	1	1
123	furniture	131	0	1	1
122	furniture	129	0	1	1
121	furniture	124	0.04	1	1
99	furniture	99	0.03	1	1
83	furniture	80	0.2	1	1
162	thing	9	0.2	1	1
193	thing	40	0.2	1	1
167	thing	14	0.18	1	1
170	thing	17	0.2	1	1
166	thing	13	0.2	1	1
179	thing	26	0.2	1	1
196	thing	43	0.2	1	1
190	thing	37	0.18	1	1
183	thing	30	0.2	1	1
174	thing	21	0.12	1	1
178	thing	25	0.14	1	1
155	thing	2	0.2	1	1
199	consumable	2	0.01	1	1
202	consumable	5	0.01	1	1
205	furniture	12	0.01	1	0
206	furniture	13	0.01	1	0
207	furniture	28	0.01	1	0
208	furniture	107	0.01	1	0
209	furniture	121	0.01	1	0
210	furniture	122	0.01	1	0
211	furniture	6	0.01	1	0
212	furniture	7	0.01	1	0
213	furniture	8	0.01	1	0
214	furniture	9	0.01	1	0
215	furniture	10	0.01	1	0
216	furniture	11	0.01	1	0
217	furniture	14	0.01	1	0
218	furniture	15	0.01	1	0
219	furniture	16	0.01	1	0
220	furniture	17	0.01	1	0
221	furniture	18	0.01	1	0
222	furniture	0	0.01	1	0
223	furniture	1	0.01	1	0
224	furniture	2	0.01	1	0
225	furniture	3	0.01	1	0
226	furniture	4	0.01	1	0
227	furniture	5	0.01	1	0
228	furniture	19	0.01	1	0
229	furniture	20	0.01	1	0
230	furniture	21	0.01	1	0
231	furniture	22	0.01	1	0
232	furniture	23	0.01	1	0
233	furniture	24	0.01	1	0
234	furniture	25	0.01	1	0
235	furniture	26	0.01	1	0
236	furniture	27	0.01	1	0
237	furniture	29	0.01	1	0
238	furniture	30	0.01	1	0
239	furniture	31	0.01	1	0
240	furniture	32	0.01	1	0
241	furniture	33	0.01	1	0
242	furniture	35	0.01	1	0
243	furniture	36	0.01	1	0
244	furniture	37	0.01	1	0
245	furniture	42	0.01	1	0
246	furniture	43	0.01	1	0
247	furniture	44	0.01	1	0
248	furniture	45	0.01	1	0
249	furniture	46	0.01	1	0
250	furniture	47	0.01	1	0
251	furniture	48	0.01	1	0
252	furniture	49	0.01	1	0
253	furniture	50	0.01	1	0
254	furniture	51	0.01	1	0
255	furniture	52	0.01	1	0
256	furniture	53	0.01	1	0
257	furniture	54	0.01	1	0
258	furniture	55	0.01	1	0
259	furniture	56	0.01	1	0
260	furniture	57	0.01	1	0
261	furniture	58	0.01	1	0
262	furniture	59	0.01	1	0
263	furniture	60	0.01	1	0
264	furniture	61	0.01	1	0
265	furniture	62	0.01	1	0
266	furniture	63	0.01	1	0
267	furniture	64	0.01	1	0
268	furniture	65	0.01	1	0
269	furniture	66	0.01	1	0
270	furniture	67	0.01	1	0
271	furniture	68	0.01	1	0
272	furniture	69	0.01	1	0
273	furniture	70	0.01	1	0
274	furniture	71	0.01	1	0
275	furniture	72	0.01	1	0
276	furniture	73	0.01	1	0
197	consumable	0	0.1	1	1
203	consumable	6	0.8	1	1
204	consumable	7	0.5	1	1
198	consumable	1	0.05	1	1
200	consumable	3	0.1	1	1
201	consumable	4	0.1	1	1
505	thing	9	0.2	1	0
506	thing	40	0.2	1	0
507	thing	14	0.18	1	0
508	thing	17	0.2	1	0
509	thing	13	0.2	1	0
510	thing	26	0.2	1	0
511	thing	43	0.2	1	0
512	thing	37	0.18	1	0
513	thing	30	0.2	1	0
514	thing	21	0.12	1	0
515	thing	25	0.14	1	0
516	thing	2	0.2	1	0
517	consumable	2	0.01	1	0
518	consumable	5	0.01	1	0
519	consumable	0	0.1	1	0
520	consumable	6	0.8	1	0
521	consumable	7	0.5	1	0
522	consumable	1	0.05	1	0
523	consumable	3	0.1	1	0
524	consumable	4	0.1	1	0
525	character	3	0.01	1	0
526	character	5	0.01	1	0
527	character	10	0.01	1	0
528	character	19	0.01	1	0
529	furniture	15	0.2	1	0
530	furniture	2	0.2	1	0
531	furniture	35	0.15	1	0
406	soft-currency	0	0.15	75	1
408	soft-currency	0	0.1	125	1
410	soft-currency	0	0.06	200	1
409	soft-currency	0	0.1	150	1
405	soft-currency	0	0.2	50	1
277	furniture	74	0.01	1	0
278	furniture	75	0.01	1	0
279	furniture	76	0.01	1	0
280	furniture	77	0.01	1	0
281	furniture	78	0.01	1	0
282	furniture	79	0.01	1	0
283	furniture	80	0.01	1	0
284	furniture	81	0.01	1	0
285	furniture	82	0.01	1	0
286	furniture	86	0.01	1	0
287	furniture	87	0.01	1	0
288	furniture	88	0.01	1	0
289	furniture	89	0.01	1	0
290	furniture	90	0.01	1	0
291	furniture	91	0.01	1	0
292	furniture	92	0.01	1	0
293	furniture	93	0.01	1	0
294	furniture	94	0.01	1	0
295	furniture	95	0.01	1	0
296	furniture	96	0.01	1	0
297	furniture	97	0.01	1	0
298	furniture	98	0.01	1	0
299	furniture	99	0.01	1	0
300	furniture	100	0.01	1	0
301	furniture	101	0.01	1	0
302	furniture	102	0.01	1	0
303	furniture	103	0.01	1	0
304	furniture	104	0.01	1	0
305	furniture	105	0.01	1	0
306	furniture	106	0.01	1	0
307	furniture	108	0.01	1	0
308	furniture	109	0.01	1	0
309	furniture	110	0.01	1	0
310	furniture	111	0.01	1	0
311	furniture	112	0.01	1	0
312	furniture	113	0.01	1	0
313	furniture	114	0.01	1	0
314	furniture	115	0.01	1	0
315	furniture	116	0.01	1	0
316	furniture	117	0.01	1	0
317	furniture	118	0.01	1	0
318	furniture	119	0.01	1	0
319	furniture	120	0.01	1	0
320	furniture	123	0.01	1	0
321	furniture	124	0.01	1	0
322	furniture	129	0.01	1	0
323	furniture	131	0.01	1	0
324	furniture	125	0.01	1	0
325	furniture	126	0.01	1	0
326	furniture	127	0.01	1	0
327	furniture	128	0.01	1	0
328	furniture	130	0.01	1	0
329	furniture	132	0.01	1	0
330	furniture	133	0.01	1	0
331	furniture	134	0.01	1	0
332	furniture	135	0.01	1	0
333	character	0	0.01	1	0
334	character	1	0.01	1	0
335	character	2	0.01	1	0
336	character	3	0.01	1	0
337	character	4	0.01	1	0
338	character	5	0.01	1	0
339	character	6	0.01	1	0
340	character	7	0.01	1	0
341	character	8	0.01	1	0
342	character	9	0.01	1	0
343	character	10	0.01	1	0
344	character	11	0.01	1	0
345	character	12	0.01	1	0
346	character	13	0.01	1	0
347	character	14	0.01	1	0
348	character	15	0.01	1	0
349	character	16	0.01	1	0
350	character	17	0.01	1	0
351	character	18	0.01	1	0
352	character	19	0.01	1	0
353	thing	0	0.01	1	0
354	thing	1	0.01	1	0
355	thing	2	0.01	1	0
356	thing	3	0.01	1	0
357	thing	4	0.01	1	0
358	thing	5	0.01	1	0
359	thing	6	0.01	1	0
360	thing	7	0.01	1	0
361	thing	8	0.01	1	0
362	thing	9	0.01	1	0
363	thing	10	0.01	1	0
364	thing	11	0.01	1	0
365	thing	12	0.01	1	0
366	thing	13	0.01	1	0
367	thing	14	0.01	1	0
368	thing	15	0.01	1	0
369	thing	16	0.01	1	0
370	thing	17	0.01	1	0
371	thing	18	0.01	1	0
372	thing	19	0.01	1	0
373	thing	20	0.01	1	0
374	thing	21	0.01	1	0
375	thing	22	0.01	1	0
376	thing	23	0.01	1	0
377	thing	24	0.01	1	0
378	thing	25	0.01	1	0
379	thing	26	0.01	1	0
380	thing	27	0.01	1	0
381	thing	28	0.01	1	0
382	thing	29	0.01	1	0
384	thing	31	0.01	1	0
385	thing	32	0.01	1	0
386	thing	33	0.01	1	0
387	thing	34	0.01	1	0
388	thing	35	0.01	1	0
389	thing	36	0.01	1	0
390	thing	37	0.01	1	0
391	thing	38	0.01	1	0
392	thing	39	0.01	1	0
393	thing	40	0.01	1	0
394	thing	41	0.01	1	0
395	thing	42	0.01	1	0
396	thing	43	0.01	1	0
397	consumable	0	0.01	1	0
398	consumable	1	0.01	1	0
399	consumable	2	0.01	1	0
400	consumable	3	0.01	1	0
401	consumable	4	0.01	1	0
402	consumable	5	0.01	1	0
403	consumable	6	0.01	1	0
404	consumable	7	0.01	1	0
412	thing	10	0.2	1	0
413	thing	8	0.05	1	0
136	character	3	0.01	1	1
414	thing	12	0.2	1	0
138	character	5	0.01	1	1
415	thing	22	0.12	1	0
416	thing	11	0.18	1	0
383	thing	30	0.02	1	0
143	character	10	0.01	1	1
152	character	19	0.01	1	1
417	thing	38	0.2	1	0
418	thing	7	0.12	1	0
419	thing	36	0.2	1	0
420	thing	20	0.12	1	0
421	furniture	9	0.01	1	0
422	thing	35	0.2	1	0
423	thing	6	0.12	1	0
424	thing	34	0.05	1	0
425	thing	33	0.2	1	0
426	thing	42	0.2	1	0
18	furniture	15	0.2	1	1
24	furniture	2	0.2	1	1
42	furniture	35	0.15	1	1
16	furniture	11	0.05	1	1
31	furniture	22	0.18	1	1
35	furniture	26	0.1	1	1
29	furniture	20	0.1	1	1
43	furniture	36	0.15	1	1
48	furniture	45	0.1	1	1
47	furniture	44	0.15	1	1
52	furniture	49	0.05	1	1
12	furniture	7	0.2	1	1
21	furniture	18	0.07	1	1
49	furniture	46	0.07	1	1
53	furniture	50	0.1	1	1
51	furniture	48	0.05	1	1
38	furniture	30	0.08	1	1
28	furniture	19	0.14	1	1
11	furniture	6	0.2	1	1
10	furniture	122	0.05	1	1
23	furniture	1	0.2	1	1
45	furniture	42	0.15	1	1
54	furniture	51	0.15	1	1
20	furniture	17	0.07	1	1
59	furniture	56	0.09	1	1
50	furniture	47	0.08	1	1
13	furniture	8	0.7	1	1
36	furniture	27	0.13	1	1
34	furniture	25	0.08	1	1
22	furniture	0	0.2	1	1
46	furniture	43	0.15	1	1
19	furniture	16	0.09	1	1
33	furniture	24	0.05	1	1
39	furniture	31	0.1	1	1
25	furniture	3	0.2	1	1
30	furniture	21	0.17	1	1
17	furniture	14	0.2	1	1
32	furniture	23	0.15	1	1
40	furniture	32	0.05	1	1
27	furniture	5	0.17	1	1
9	furniture	121	0	1	1
8	furniture	107	0	1	1
7	furniture	28	0	1	1
5	furniture	12	0	1	1
6	furniture	13	0	1	1
15	furniture	10	0.03	1	1
55	furniture	52	0.15	1	1
150	character	17	0.13	1	1
147	character	14	0.13	1	1
148	character	15	0.15	1	1
137	character	4	0.15	1	1
133	character	0	0.15	1	1
142	character	9	0.15	1	1
141	character	8	0.15	1	1
146	character	13	0.13	1	1
144	character	11	0.15	1	1
151	character	18	0.13	1	1
149	character	16	0.15	1	1
145	character	12	0.15	1	1
103	furniture	103	0.03	1	1
120	furniture	123	0.04	1	1
119	furniture	120	0	1	1
116	furniture	117	0.08	1	1
67	furniture	64	0.1	1	1
87	furniture	87	0.07	1	1
117	furniture	118	0.08	1	1
60	furniture	57	0.09	1	1
61	furniture	58	0.07	1	1
88	furniture	88	0.07	1	1
111	furniture	112	0.08	1	1
80	furniture	77	0.1	1	1
100	furniture	100	0.06	1	1
97	furniture	97	0.02	1	1
84	furniture	81	0.1	1	1
98	furniture	98	0.03	1	1
102	furniture	102	0.06	1	1
104	furniture	104	0.03	1	1
140	character	7	0.13	1	1
139	character	6	0.13	1	1
135	character	2	0.13	1	1
124	furniture	125	0.04	1	1
134	character	1	0.13	1	1
81	furniture	78	0.07	1	1
427	thing	31	0.2	1	0
428	thing	1	0.18	1	0
429	thing	19	0.2	1	0
430	thing	32	0.18	1	0
431	thing	39	0.12	1	0
432	thing	4	0.2	1	0
433	thing	15	0.2	1	0
434	thing	28	0.2	1	0
435	thing	24	0.2	1	0
436	thing	5	0.2	1	0
437	thing	23	0.05	1	0
438	thing	0	0.2	1	0
439	thing	3	0.14	1	0
440	thing	27	0.12	1	0
441	thing	18	0.05	1	0
442	thing	16	0.2	1	0
443	thing	29	0.18	1	0
444	thing	41	0.12	1	0
445	furniture	106	0.01	1	0
446	furniture	130	0.01	1	0
447	furniture	79	0.07	1	0
448	furniture	73	0.05	1	0
449	furniture	105	0.03	1	0
450	furniture	109	0.05	1	0
451	furniture	65	0.1	1	0
452	furniture	82	0.07	1	0
453	furniture	29	0.08	1	0
454	furniture	90	0.07	1	0
455	furniture	33	0	1	0
456	furniture	55	0	1	0
457	furniture	54	0	1	0
458	furniture	37	0.15	1	0
459	furniture	53	0.08	1	0
460	furniture	4	0.2	1	0
461	furniture	70	0.12	1	0
462	furniture	75	0.03	1	0
463	furniture	115	0.05	1	0
464	furniture	113	0.02	1	0
465	furniture	93	0.07	1	0
466	furniture	76	0.03	1	0
532	furniture	11	0.05	1	0
533	furniture	22	0.18	1	0
534	furniture	26	0.1	1	0
535	furniture	20	0.1	1	0
536	furniture	36	0.15	1	0
537	furniture	45	0.1	1	0
538	furniture	44	0.15	1	0
539	furniture	49	0.05	1	0
540	furniture	7	0.2	1	0
541	furniture	18	0.07	1	0
542	furniture	46	0.07	1	0
543	furniture	50	0.1	1	0
544	furniture	48	0.05	1	0
545	furniture	30	0.08	1	0
546	furniture	19	0.14	1	0
547	furniture	6	0.2	1	0
548	furniture	122	0.05	1	0
549	furniture	1	0.2	1	0
550	furniture	42	0.15	1	0
551	furniture	51	0.15	1	0
552	furniture	17	0.07	1	0
553	furniture	56	0.09	1	0
554	furniture	47	0.08	1	0
555	furniture	8	0.7	1	0
556	furniture	27	0.13	1	0
557	furniture	25	0.08	1	0
558	furniture	0	0.2	1	0
559	furniture	43	0.15	1	0
560	furniture	16	0.09	1	0
561	furniture	24	0.05	1	0
562	furniture	31	0.1	1	0
563	furniture	3	0.2	1	0
564	furniture	21	0.17	1	0
565	furniture	14	0.2	1	0
566	furniture	23	0.15	1	0
567	furniture	32	0.05	1	0
568	furniture	5	0.17	1	0
569	furniture	121	0	1	0
570	furniture	107	0	1	0
571	furniture	28	0	1	0
572	furniture	12	0	1	0
573	furniture	13	0	1	0
574	furniture	10	0.03	1	0
575	furniture	52	0.15	1	0
576	character	17	0.13	1	0
577	character	14	0.13	1	0
578	character	15	0.15	1	0
579	character	4	0.15	1	0
580	character	0	0.15	1	0
581	character	9	0.15	1	0
582	character	8	0.15	1	0
583	character	13	0.13	1	0
584	character	11	0.15	1	0
585	character	18	0.13	1	0
586	character	16	0.15	1	0
587	character	12	0.15	1	0
588	furniture	103	0.03	1	0
589	furniture	123	0.04	1	0
590	furniture	120	0	1	0
591	furniture	117	0.08	1	0
592	furniture	64	0.1	1	0
593	furniture	87	0.07	1	0
594	furniture	118	0.08	1	0
595	furniture	57	0.09	1	0
596	furniture	58	0.07	1	0
597	furniture	88	0.07	1	0
598	furniture	112	0.08	1	0
599	furniture	77	0.1	1	0
600	furniture	100	0.06	1	0
601	furniture	97	0.02	1	0
602	furniture	81	0.1	1	0
603	furniture	98	0.03	1	0
604	furniture	102	0.06	1	0
605	furniture	104	0.03	1	0
606	character	7	0.13	1	0
607	character	6	0.13	1	0
608	character	2	0.13	1	0
609	furniture	125	0.04	1	0
610	character	1	0.13	1	0
611	furniture	78	0.07	1	0
407	soft-currency	0	0.12	100	1
411	soft-currency	0	0.03	500	1
\.


--
-- TOC entry 3551 (class 0 OID 18559)
-- Dependencies: 225
-- Data for Name: loot_boxes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loot_boxes (id, type, name, icon, min_items, max_items) FROM stdin;
1	mint	Disney	disney.png	0	0
0	currency	Default currency	currency.png	3	5
\.


--
-- TOC entry 3595 (class 0 OID 19311)
-- Dependencies: 269
-- Data for Name: loot_boxes_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loot_boxes_price (id, bought_count, price) FROM stdin;
1	0	100
2	1	200
3	2	500
4	3	1500
5	4	5000
6	5	15000
\.


--
-- TOC entry 3577 (class 0 OID 18835)
-- Dependencies: 251
-- Data for Name: max_by_group_tiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.max_by_group_tiles (id, count_group_tiles, max_prestige, max_soft_currency, max_friends) FROM stdin;
1	1	20	300	4
2	2	25	400	5
3	3	30	500	6
4	4	35	600	7
5	5	40	700	7
6	6	45	800	8
7	7	50	900	8
8	8	55	1000	9
9	9	60	1100	9
10	10	65	1200	10
11	11	70	1300	10
12	12	75	1400	11
13	13	80	1500	11
14	14	90	1600	12
15	15	100	1800	12
16	16	110	2000	13
17	17	125	2200	14
18	18	140	2400	15
19	19	155	2600	15
20	20	170	2800	16
21	21	185	3000	17
22	22	200	3400	18
23	23	220	3800	19
24	24	245	4200	20
25	25	275	4600	20
26	26	300	5000	20
\.


--
-- TOC entry 3587 (class 0 OID 19160)
-- Dependencies: 261
-- Data for Name: player_chains_progress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_chains_progress (id, "chainId", "actionId") FROM stdin;
\.


--
-- TOC entry 3559 (class 0 OID 18617)
-- Dependencies: 233
-- Data for Name: player_characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_characters (id, exp, dirty, sector, last_tick, efficiency, buffs, "position", things, raid, action, placed, nft_key, "playerId", "configId", level, satisfaction) FROM stdin;
317	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451924}	f	0	6	0	1	[]
252	101	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451936}	f	0	6	1	1	[]
273	101	f	0	1698402708	100	[]	{"x": 3, "y": 26}	[]	{"inRaid": true, "endTime": 1698398638, "minutes": 30, "locationId": 1, "raidSlotId": 1}	{"id": 8, "endTime": 1698402761}	f	0	7	1	1	[{"power": 20, "status": 0, "target": 6}, {"power": 20, "status": 0, "target": 30}, {"power": 20, "status": 0, "target": 31}, {"power": 20, "status": 0, "target": 32}, {"power": 0, "status": -3, "target": 126}]
254	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451936}	f	0	6	1	1	[]
109	101	f	0	1698451865	107	[]	{"x": 1, "y": 27}	[29, 30]	\N	{"id": 8, "endTime": 1698451932}	f	0	6	8	2	[{"power": 20, "status": 0, "target": 13}, {"power": 20, "status": 0, "target": 65}, {"power": 20, "status": 0, "target": 66}, {"power": 20, "status": 0, "target": 67}, {"power": 0, "status": -3, "target": 133}]
134	1	f	0	1698402708	106	[]	{"x": 0, "y": 23}	[3, 10]	\N	{"id": 8, "endTime": 1698402743}	f	0	7	0	1	[{"power": 20, "status": 0, "target": 5}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 27}, {"power": 0, "status": -3, "target": 125}]
137	1	f	0	1698402708	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402750}	f	0	7	3	1	[]
276	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402729}	f	0	7	1	1	[]
318	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451898}	f	0	6	0	1	[]
136	1	f	0	1698402708	106.5	[]	{"x": 1, "y": 1}	[4]	\N	{"id": 8, "endTime": 1698402747}	f	0	7	2	1	[]
316	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451906}	f	0	6	0	1	[]
123	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451928}	f	0	6	1	1	[]
320	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451935}	f	0	6	1	1	[]
241	2151	f	0	1698451876	101	[]	{"x": 0, "y": 23}	[]	\N	{"id": 8, "endTime": 1698451911}	f	0	6	0	2	[{"power": 0, "status": -3, "target": 5}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 27}, {"power": 0, "status": -3, "target": 125}]
102	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451912}	f	0	6	1	1	[]
319	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451902}	f	0	6	1	1	[]
171	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451923}	f	0	6	1	1	[]
287	2001	f	0	1698451876	101	[]	{"x": 0, "y": 23}	[]	\N	{"id": 8, "endTime": 1698451932}	f	0	6	0	2	[]
454	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310618}	f	0	10	4	1	[]
408	0	f	0	1698310373	100	[]	{"x": 5, "y": 25}	[]	\N	{"id": 8, "endTime": 1698310653}	t	0	10	11	1	[{"power": 0, "status": -3, "target": 16}, {"power": 0, "status": -3, "target": 80}, {"power": 0, "status": -3, "target": 81}, {"power": 0, "status": -3, "target": 82}, {"power": 0, "status": -3, "target": 136}]
455	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310600}	f	0	10	5	1	[]
456	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310601}	f	0	10	6	1	[]
457	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310623}	f	0	10	7	1	[]
458	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310619}	f	0	10	8	1	[]
324	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451931}	f	0	6	0	1	[]
195	51	f	0	1698451876	100	[]	{"x": 3, "y": 23}	[]	\N	{"id": 8, "endTime": 1698451921}	f	0	6	1	1	[]
154	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402758}	f	0	7	1	1	[]
155	1	f	0	1698402708	103	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402734}	f	0	7	4	1	[]
157	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402752}	f	0	7	1	1	[]
148	1	f	0	1698402708	100	[]	{"x": 5, "y": 23}	[]	\N	{"id": 8, "endTime": 1698402754}	f	0	7	12	1	[]
144	1	f	0	1698402708	100	[]	{"x": 4, "y": 25}	[]	\N	{"id": 8, "endTime": 1698402756}	f	0	7	13	1	[]
150	1	f	0	1698402708	106.5	[]	{"x": 1, "y": 1}	[19]	\N	{"id": 8, "endTime": 1698402739}	f	0	7	16	1	[]
404	0	f	0	1698402708	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402762}	f	0	7	13	1	[]
145	523	f	0	1698402708	100	[]	{"x": 0, "y": 23}	[]	\N	{"id": 8, "endTime": 1698402764}	f	0	7	14	1	[{"power": 20, "status": 0, "target": 19}, {"power": 20, "status": 0, "target": 95}, {"power": 20, "status": 0, "target": 96}, {"power": 20, "status": 0, "target": 97}, {"power": 0, "status": -3, "target": 139}]
322	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451905}	f	0	6	0	1	[]
323	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451906}	f	0	6	1	1	[]
234	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451912}	f	0	6	1	1	[]
111	1	f	0	1698451865	107	[]	{"x": 0, "y": 23}	[38, 40]	\N	{"id": 8, "endTime": 1698451908}	f	0	6	13	1	[]
406	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451903}	f	0	6	8	1	[]
181	1	f	0	1698451876	100	[]	{"x": 0, "y": 23}	[]	\N	{"id": 8, "endTime": 1698451919}	f	0	6	0	1	[]
149	1	f	0	1698402708	112.5	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402753}	f	0	7	15	1	[]
156	1	f	0	1698402708	112.5	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402744}	f	0	7	15	1	[]
153	1	f	0	1698402708	100	[]	{"x": 0, "y": 23}	[]	\N	{"id": 8, "endTime": 1698402730}	f	0	7	19	1	[{"power": 20, "status": 0, "target": 24}, {"power": 20, "status": 0, "target": 120}, {"power": 20, "status": 0, "target": 121}, {"power": 20, "status": 0, "target": 122}, {"power": 0, "status": -3, "target": 144}]
151	51	f	0	1698406722	111	[]	{"x": 7, "y": 23}	[]	\N	{"id": 8, "endTime": 1698406739}	t	0	7	17	1	[{"power": 20, "status": 0, "target": 22}, {"power": 20, "status": 0, "target": 110}, {"power": 20, "status": 0, "target": 111}, {"power": 20, "status": 0, "target": 112}, {"power": 0, "status": -3, "target": 142}]
147	101	f	0	1698402708	110	[]	{"x": 2, "y": 26}	[41, 39, 34]	{"inRaid": true, "endTime": 1698398633, "minutes": 30, "locationId": 1, "raidSlotId": 0}	{"id": 8, "endTime": 1698402760}	f	0	7	10	2	[{"power": 20, "status": 0, "target": 15}, {"power": 20, "status": 0, "target": 75}, {"power": 20, "status": 0, "target": 76}, {"power": 20, "status": 0, "target": 77}, {"power": 20, "status": 0, "target": 135}]
159	1	f	0	1698402708	112.5	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402746}	f	0	7	15	1	[]
210	1051	f	0	1697919828	104	[]	{"x": 2, "y": 28}	[]	\N	{"id": 8, "endTime": 1697920309}	t	0	8	13	1	[]
158	1	f	0	1698402708	106.5	[]	{"x": 1, "y": 1}	[5]	\N	{"id": 8, "endTime": 1698402766}	f	0	7	4	1	[]
321	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451914}	f	0	6	1	1	[]
411	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310600}	f	0	10	1	1	[]
413	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310619}	f	0	10	3	1	[]
412	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310622}	f	0	10	2	1	[]
333	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451904}	f	0	6	0	1	[]
173	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451897}	f	0	6	1	1	[]
337	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451927}	f	0	6	0	1	[]
110	1	f	0	1698451865	103	[]	{"x": 0, "y": 23}	[]	\N	{"id": 8, "endTime": 1698451902}	f	0	6	9	1	[]
174	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451902}	f	0	6	1	1	[]
336	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451902}	f	0	6	1	1	[]
334	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451903}	f	0	6	1	1	[]
342	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451920}	f	0	6	1	1	[]
326	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451916}	f	0	6	1	1	[]
345	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451931}	f	0	6	0	1	[]
168	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451898}	f	0	6	1	1	[]
340	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451925}	f	0	6	1	1	[]
332	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451919}	f	0	6	0	1	[]
327	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451919}	f	0	6	1	1	[]
341	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451918}	f	0	6	0	1	[]
347	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451910}	f	0	6	0	1	[]
114	1	f	0	1698451865	102.56	[]	{"x": 2, "y": 28}	[]	\N	{"id": 8, "endTime": 1698451910}	f	0	6	10	1	[]
343	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451912}	f	0	6	0	1	[]
325	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451926}	f	0	6	1	1	[]
338	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451920}	f	0	6	0	1	[]
346	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451927}	f	0	6	1	1	[]
330	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451919}	f	0	6	1	1	[]
329	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451905}	f	0	6	0	1	[]
339	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451904}	f	0	6	1	1	[]
335	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451920}	f	0	6	0	1	[]
331	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451904}	f	0	6	0	1	[]
175	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451906}	f	0	6	1	1	[]
344	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451910}	f	0	6	1	1	[]
328	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451932}	f	0	6	0	1	[]
178	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451904}	f	0	6	1	1	[]
185	51	f	0	1698451876	100	[]	{"x": 1, "y": 27}	[]	\N	{"id": 8, "endTime": 1698451930}	f	0	6	1	1	[]
405	0	f	0	1698402708	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402766}	f	0	7	2	1	[]
143	1	f	0	1698402708	106	[]	{"x": 3, "y": 26}	[25, 26]	\N	{"id": 8, "endTime": 1698402745}	f	0	7	9	1	[]
166	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451897}	f	0	6	1	1	[]
414	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310618}	f	0	10	4	1	[]
415	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310612}	f	0	10	5	1	[]
152	523	f	0	1698406722	111	[]	{"x": 3, "y": 26}	[]	\N	{"id": 8, "endTime": 1698406771}	t	0	7	18	1	[{"power": 20, "status": 0, "target": 23}, {"power": 20, "status": 0, "target": 115}, {"power": 20, "status": 0, "target": 116}, {"power": 20, "status": 0, "target": 117}, {"power": 0, "status": -3, "target": 143}]
417	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310598}	f	0	10	7	1	[]
426	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310606}	f	0	10	16	1	[]
400	0	f	0	1697919704	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920297}	f	0	8	1	1	[]
401	0	f	0	1697919704	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920334}	f	0	8	0	1	[]
402	0	f	0	1697919704	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920331}	f	0	8	1	1	[]
403	0	f	0	1697919704	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920317}	f	0	8	0	1	[]
396	0	f	0	1697919698	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920298}	f	0	8	1	1	[]
397	0	f	0	1697919698	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920319}	f	0	8	0	1	[]
398	0	f	0	1697919698	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920307}	f	0	8	1	1	[]
399	0	f	0	1697919698	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920303}	f	0	8	0	1	[]
425	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310589}	f	0	10	15	1	[]
193	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451901}	f	0	6	1	1	[]
198	1	f	0	1698451876	100	[]	{"x": 1, "y": 23}	[]	\N	{"id": 8, "endTime": 1698451905}	f	0	6	1	1	[]
184	1	f	0	1698451876	100	[]	{"x": 1, "y": 23}	[]	\N	{"id": 8, "endTime": 1698451927}	f	0	6	0	1	[]
419	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310603}	f	0	10	9	1	[]
421	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310598}	f	0	10	11	1	[]
194	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451903}	f	0	6	0	1	[]
349	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451900}	f	0	6	0	1	[]
348	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451915}	f	0	6	1	1	[]
416	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310619}	f	0	10	6	1	[]
418	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310623}	f	0	10	8	1	[]
420	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310624}	f	0	10	10	1	[]
422	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310602}	f	0	10	12	1	[]
423	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310607}	f	0	10	13	1	[]
424	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310616}	f	0	10	14	1	[]
224	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451922}	f	0	6	0	1	[]
222	1	f	0	1698451876	100	[]	{"x": 1, "y": 20}	[]	\N	{"id": 8, "endTime": 1698451929}	f	0	6	0	1	[]
358	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451925}	f	0	6	1	1	[]
365	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451902}	f	0	6	0	1	[]
357	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451930}	f	0	6	0	1	[]
363	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451902}	f	0	6	0	1	[]
367	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451906}	f	0	6	0	1	[]
350	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451922}	f	0	6	1	1	[]
356	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451899}	f	0	6	1	1	[]
360	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451922}	f	0	6	1	1	[]
362	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451911}	f	0	6	1	1	[]
163	2101	f	0	1698451876	101	[]	{"x": 0, "y": 23}	[]	\N	{"id": 8, "endTime": 1698451920}	f	0	6	0	2	[]
220	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451921}	f	0	6	0	1	[]
361	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451936}	f	0	6	0	1	[]
355	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451932}	f	0	6	0	1	[]
354	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451931}	f	0	6	1	1	[]
366	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451926}	f	0	6	1	1	[]
223	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451897}	f	0	6	1	1	[]
369	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451924}	f	0	6	0	1	[]
353	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451916}	f	0	6	0	1	[]
217	301	f	0	1697919709	103	[]	{"x": 2, "y": 29}	[]	{"inRaid": true, "endTime": 1697828811, "minutes": 30, "locationId": 1, "raidSlotId": 1}	{"id": 8, "endTime": 1697920297}	f	0	8	17	1	[]
214	1	f	0	1697919723	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920323}	f	0	8	12	1	[]
364	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451899}	f	0	6	1	1	[]
368	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451920}	f	0	6	1	1	[]
352	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451913}	f	0	6	1	1	[]
218	51	f	0	1697920004	104	[]	{"x": 1, "y": 28}	[]	\N	{"id": 8, "endTime": 1697920325}	t	0	8	18	1	[]
216	1	f	0	1697919817	103	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920330}	f	0	8	16	1	[]
219	51	f	0	1697920169	103	[]	{"x": 1, "y": 29}	[]	{"inRaid": true, "endTime": 1697828869, "minutes": 30, "locationId": 1, "raidSlotId": 0}	{"id": 8, "endTime": 1697920299}	f	0	8	19	1	[]
215	1	f	0	1697919817	103	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920319}	f	0	8	15	1	[]
359	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451918}	f	0	6	0	1	[]
351	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451911}	f	0	6	0	1	[]
428	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310603}	f	0	10	18	1	[]
429	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310625}	f	0	10	19	1	[]
459	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310585}	f	0	10	9	1	[]
427	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310615}	f	0	10	17	1	[]
126	3077	f	0	1698451902	110	[]	{"x": 0, "y": 26}	[]	\N	{"id": 8, "endTime": 1698451934}	t	0	6	1	3	[{"power": 20, "status": 0, "target": 6}, {"power": 20, "status": 0, "target": 30}, {"power": 20, "status": 0, "target": 31}, {"power": 20, "status": 0, "target": 32}, {"power": 0, "status": -3, "target": 126}]
106	1	f	0	1698451876	100	[]	{"x": 2, "y": 32}	[]	\N	{"id": 8, "endTime": 1698451901}	f	0	6	7	1	[{"power": 20, "status": 0, "target": 12}, {"power": 20, "status": 0, "target": 60}, {"power": 20, "status": 0, "target": 61}, {"power": 20, "status": 0, "target": 62}, {"power": 0, "status": -3, "target": 132}]
255	1	f	0	1698451876	100	[]	{"x": 0, "y": 25}	[]	\N	{"id": 8, "endTime": 1698451928}	f	0	6	0	1	[{"power": 20, "status": 0, "target": 5}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 27}, {"power": 0, "status": -3, "target": 125}]
108	1	f	0	1698451865	102.56	[]	{"x": 0, "y": 23}	[]	\N	{"id": 8, "endTime": 1698451899}	f	0	6	5	1	[]
308	1	f	0	1698451876	100	[]	{"x": 1, "y": 31}	[]	\N	{"id": 8, "endTime": 1698451901}	f	0	6	1	1	[{"power": 20, "status": 0, "target": 6}, {"power": 20, "status": 0, "target": 30}, {"power": 20, "status": 0, "target": 31}, {"power": 20, "status": 0, "target": 32}, {"power": 0, "status": -3, "target": 126}]
307	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451911}	f	0	6	1	1	[]
128	1	f	0	1698451876	100	[]	{"x": 0, "y": 31}	[]	\N	{"id": 8, "endTime": 1698451907}	f	0	6	1	1	[{"power": 20, "status": 0, "target": 6}, {"power": 20, "status": 0, "target": 30}, {"power": 20, "status": 0, "target": 31}, {"power": 20, "status": 0, "target": 32}, {"power": 0, "status": -3, "target": 126}]
125	1	f	0	1698451876	100	[]	{"x": 1, "y": 30}	[]	\N	{"id": 8, "endTime": 1698451902}	f	0	6	0	1	[{"power": 20, "status": 0, "target": 5}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 27}, {"power": 0, "status": -3, "target": 125}]
235	1	f	0	1698451876	100	[]	{"x": 0, "y": 25}	[]	\N	{"id": 8, "endTime": 1698451923}	f	0	6	1	1	[{"power": 20, "status": 0, "target": 6}, {"power": 20, "status": 0, "target": 30}, {"power": 20, "status": 0, "target": 31}, {"power": 20, "status": 0, "target": 32}, {"power": 0, "status": -3, "target": 126}]
115	1	f	0	1698451876	100	[]	{"x": 2, "y": 18}	[]	\N	{"id": 8, "endTime": 1698451936}	f	0	6	12	1	[]
118	1	f	0	1698451876	100	[]	{"x": 1, "y": 31}	[]	\N	{"id": 8, "endTime": 1698451918}	f	0	6	17	1	[{"power": 20, "status": 0, "target": 22}, {"power": 20, "status": 0, "target": 110}, {"power": 20, "status": 0, "target": 111}, {"power": 20, "status": 0, "target": 112}, {"power": 0, "status": -3, "target": 142}]
370	0	f	0	1698451894	111	[]	{"x": 0, "y": 23}	[3]	\N	{"id": 8, "endTime": 1698451922}	t	0	6	0	1	[{"power": 20, "status": 0, "target": 5}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 27}, {"power": 0, "status": -3, "target": 125}]
112	1	f	0	1698451865	102.51	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451936}	f	0	6	14	1	[]
430	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310601}	f	0	10	0	1	[]
431	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310607}	f	0	10	1	1	[]
432	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310619}	f	0	10	2	1	[]
433	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310585}	f	0	10	3	1	[]
434	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310588}	f	0	10	4	1	[]
129	1001	f	0	1698451894	108	[]	{"x": 1, "y": 23}	[]	\N	{"id": 8, "endTime": 1698451930}	t	0	6	0	1	[{"power": 20, "status": 0, "target": 5}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 27}, {"power": 0, "status": -3, "target": 125}]
435	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310606}	f	0	10	5	1	[]
436	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310596}	f	0	10	6	1	[]
437	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310594}	f	0	10	7	1	[]
438	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310603}	f	0	10	8	1	[]
248	1	f	0	1698451876	100	[]	{"x": 0, "y": 26}	[]	\N	{"id": 8, "endTime": 1698451916}	f	0	6	1	1	[{"power": 20, "status": 0, "target": 6}, {"power": 20, "status": 0, "target": 30}, {"power": 20, "status": 0, "target": 31}, {"power": 20, "status": 0, "target": 32}, {"power": 0, "status": -3, "target": 126}]
225	1	f	0	1698451876	100	[]	{"x": 1, "y": 24}	[]	\N	{"id": 8, "endTime": 1698451911}	f	0	6	1	1	[{"power": 20, "status": 0, "target": 6}, {"power": 20, "status": 0, "target": 30}, {"power": 20, "status": 0, "target": 31}, {"power": 20, "status": 0, "target": 32}, {"power": 0, "status": -3, "target": 126}]
375	0	f	0	1698402708	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402729}	f	0	7	1	1	[]
372	0	f	0	1698402708	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402734}	f	0	7	1	1	[]
105	1	f	0	1698451876	100	[]	{"x": 1, "y": 32}	[]	\N	{"id": 8, "endTime": 1698451928}	f	0	6	6	1	[{"power": 20, "status": 0, "target": 11}, {"power": 20, "status": 0, "target": 55}, {"power": 20, "status": 0, "target": 56}, {"power": 20, "status": 0, "target": 57}, {"power": 0, "status": -3, "target": 131}]
309	1	f	0	1698451876	100	[]	{"x": 3, "y": 17}	[]	\N	{"id": 8, "endTime": 1698451904}	f	0	6	0	1	[{"power": 20, "status": 0, "target": 5}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 27}, {"power": 0, "status": -3, "target": 125}]
373	0	f	0	1698402708	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402759}	f	0	7	0	1	[]
374	0	f	0	1698402708	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402739}	f	0	7	1	1	[]
268	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402730}	f	0	7	0	1	[]
121	1	f	0	1698451865	103	[]	{"x": 1, "y": 27}	[]	\N	{"id": 8, "endTime": 1698451935}	f	0	6	15	1	[]
170	1	f	0	1698451876	100	[]	{"x": 1, "y": 24}	[]	\N	{"id": 8, "endTime": 1698451929}	f	0	6	0	1	[{"power": 20, "status": 0, "target": 5}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 27}, {"power": 0, "status": -3, "target": 125}]
260	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451929}	f	0	6	0	1	[]
299	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451908}	f	0	6	1	1	[]
113	151	f	0	1698451876	100	[]	{"x": 0, "y": 23}	[]	\N	{"id": 8, "endTime": 1698451927}	f	0	6	11	1	[{"power": 20, "status": 0, "target": 16}, {"power": 20, "status": 0, "target": 80}, {"power": 20, "status": 0, "target": 81}, {"power": 20, "status": 0, "target": 82}, {"power": 0, "status": -3, "target": 136}]
298	1	f	0	1698451876	100	[]	{"x": 2, "y": 26}	[]	\N	{"id": 8, "endTime": 1698451921}	f	0	6	1	1	[]
310	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451902}	f	0	6	1	1	[]
176	1	f	0	1698451876	100	[]	{"x": 0, "y": 25}	[]	\N	{"id": 8, "endTime": 1698451929}	f	0	6	0	1	[{"power": 20, "status": 0, "target": 5}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 27}, {"power": 0, "status": -3, "target": 125}]
494	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451903}	f	0	6	11	1	[]
120	1	f	0	1698451876	100	[]	{"x": 1, "y": 27}	[]	\N	{"id": 8, "endTime": 1698451902}	f	0	6	19	1	[]
371	0	f	0	1698451876	100	[]	{"x": 1, "y": 26}	[]	\N	{"id": 8, "endTime": 1698451923}	f	0	6	0	1	[{"power": 20, "status": 0, "target": 5}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 27}, {"power": 0, "status": -3, "target": 125}]
493	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451934}	f	0	6	9	1	[]
495	0	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451936}	f	0	6	2	1	[]
104	1	f	0	1698451865	103.5	[]	{"x": 3, "y": 19}	[6]	\N	{"id": 8, "endTime": 1698451935}	f	0	6	3	1	[]
117	415	f	0	1698451905	114	[]	{"x": 2, "y": 25}	[11, 19]	\N	{"id": 8, "endTime": 1698451927}	t	0	6	16	1	[{"power": 20, "status": 0, "target": 21}, {"power": 20, "status": 0, "target": 105}, {"power": 20, "status": 0, "target": 106}, {"power": 20, "status": 0, "target": 107}, {"power": 0, "status": -3, "target": 141}]
409	0	f	0	1698310374	100	[]	{"x": 5, "y": 24}	[]	\N	{"id": 8, "endTime": 1698310701}	t	0	10	15	1	[{"power": 0, "status": -3, "target": 20}, {"power": 0, "status": -3, "target": 100}, {"power": 0, "status": -3, "target": 101}, {"power": 0, "status": -3, "target": 102}, {"power": 0, "status": -3, "target": 140}]
407	0	f	0	1698310372	100	[]	{"x": 4, "y": 26}	[]	\N	{"id": 8, "endTime": 1698310679}	t	0	10	9	1	[{"power": 0, "status": -3, "target": 14}, {"power": 0, "status": -3, "target": 70}, {"power": 0, "status": -3, "target": 71}, {"power": 0, "status": -3, "target": 72}, {"power": 0, "status": -3, "target": 134}]
107	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451896}	f	0	6	4	1	[]
124	1	f	0	1698451876	100	[]	{"x": 5, "y": 24}	[]	\N	{"id": 8, "endTime": 1698451923}	f	0	6	0	1	[]
439	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310621}	f	0	10	9	1	[]
133	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451928}	f	0	6	0	1	[]
165	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451914}	f	0	6	1	1	[]
179	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451907}	f	0	6	1	1	[]
132	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451900}	f	0	6	1	1	[]
169	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451929}	f	0	6	1	1	[]
180	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451912}	f	0	6	1	1	[]
119	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451931}	f	0	6	18	1	[]
199	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451919}	f	0	6	1	1	[]
167	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451905}	f	0	6	0	1	[]
127	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451907}	f	0	6	1	1	[]
172	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451917}	f	0	6	1	1	[]
131	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451912}	f	0	6	0	1	[]
116	1	f	0	1698451865	103	[]	{"x": 2, "y": 27}	[]	\N	{"id": 8, "endTime": 1698451909}	f	0	6	15	1	[]
182	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451919}	f	0	6	0	1	[]
135	1	f	0	1698402708	113	[]	{"x": 1, "y": 1}	[0, 2]	\N	{"id": 8, "endTime": 1698402733}	f	0	7	1	1	[]
142	1145	f	0	1698406737	117	[]	{"x": 5, "y": 23}	[29]	\N	{"id": 8, "endTime": 1698406752}	t	0	7	8	1	[{"power": 20, "status": 0, "target": 13}, {"power": 20, "status": 0, "target": 65}, {"power": 20, "status": 0, "target": 66}, {"power": 20, "status": 0, "target": 67}, {"power": 0, "status": -3, "target": 133}]
161	1	f	0	1698402708	106.5	[]	{"x": 1, "y": 1}	[5]	\N	{"id": 8, "endTime": 1698402764}	f	0	7	4	1	[]
141	1	f	0	1698406722	111	[]	{"x": 4, "y": 28}	[]	\N	{"id": 8, "endTime": 1698406739}	t	0	7	5	1	[{"power": 20, "status": 0, "target": 10}, {"power": 20, "status": 0, "target": 50}, {"power": 20, "status": 0, "target": 51}, {"power": 20, "status": 0, "target": 52}, {"power": 0, "status": -3, "target": 130}]
162	1	f	0	1698402708	112.5	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402737}	f	0	7	15	1	[]
160	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402753}	f	0	7	1	1	[]
177	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451922}	f	0	6	1	1	[]
164	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451899}	f	0	6	1	1	[]
139	1	f	0	1698402708	100	[]	{"x": 0, "y": 23}	[]	\N	{"id": 8, "endTime": 1698402755}	f	0	7	7	1	[]
140	51	f	0	1698402708	100	[]	{"x": 4, "y": 26}	[]	\N	{"id": 8, "endTime": 1698402738}	f	0	7	4	1	[{"power": 20, "status": 0, "target": 9}, {"power": 20, "status": 0, "target": 45}, {"power": 20, "status": 0, "target": 46}, {"power": 20, "status": 0, "target": 47}, {"power": 0, "status": -3, "target": 129}]
130	1	f	0	1698451876	100	[]	{"x": 0, "y": 25}	[]	\N	{"id": 8, "endTime": 1698451933}	f	0	6	1	1	[]
441	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310585}	f	0	10	11	1	[]
442	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310590}	f	0	10	12	1	[]
443	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310623}	f	0	10	13	1	[]
188	1	f	0	1698451876	100	[]	{"x": 2, "y": 27}	[]	\N	{"id": 8, "endTime": 1698451919}	f	0	6	0	1	[]
191	1	f	0	1698451876	100	[]	{"x": 0, "y": 20}	[]	\N	{"id": 8, "endTime": 1698451927}	f	0	6	0	1	[]
187	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451922}	f	0	6	1	1	[]
192	1	f	0	1698451876	100	[]	{"x": 3, "y": 22}	[]	\N	{"id": 8, "endTime": 1698451912}	f	0	6	0	1	[]
183	1	f	0	1698451876	100	[]	{"x": 3, "y": 21}	[]	\N	{"id": 8, "endTime": 1698451923}	f	0	6	0	1	[]
197	1	f	0	1698451876	100	[]	{"x": 2, "y": 19}	[]	\N	{"id": 8, "endTime": 1698451901}	f	0	6	0	1	[]
236	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451911}	f	0	6	0	1	[]
240	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451925}	f	0	6	1	1	[]
239	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451921}	f	0	6	0	1	[]
226	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451912}	f	0	6	0	1	[]
258	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451918}	f	0	6	1	1	[]
256	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451914}	f	0	6	1	1	[]
227	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451904}	f	0	6	1	1	[]
242	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451933}	f	0	6	1	1	[]
229	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451930}	f	0	6	0	1	[]
228	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451896}	f	0	6	0	1	[]
238	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451933}	f	0	6	0	1	[]
244	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451936}	f	0	6	1	1	[]
190	1	f	0	1698451876	100	[]	{"x": 1, "y": 29}	[]	\N	{"id": 8, "endTime": 1698451906}	f	0	6	0	1	[]
196	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451905}	f	0	6	1	1	[]
186	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451908}	f	0	6	0	1	[]
207	1	f	0	1697919723	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920306}	f	0	8	5	1	[]
189	1	f	0	1698451876	100	[]	{"x": 1, "y": 24}	[]	\N	{"id": 8, "endTime": 1698451928}	f	0	6	0	1	[]
208	1	f	0	1697919793	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920326}	f	0	8	8	1	[]
206	1	f	0	1697919723	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920322}	f	0	8	4	1	[]
209	1	f	0	1697919817	103	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920302}	f	0	8	9	1	[]
201	1	f	0	1697919723	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920324}	f	0	8	1	1	[]
200	1	f	0	1697919817	103	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920318}	f	0	8	0	1	[]
211	51	f	0	1697920024	101	[]	{"x": 1, "y": 27}	[]	\N	{"id": 8, "endTime": 1697920359}	t	0	8	14	1	[]
212	1	f	0	1697919817	103	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920311}	f	0	8	11	1	[]
213	1	f	0	1697920220	101	[]	{"x": 1, "y": 26}	[]	\N	{"id": 8, "endTime": 1697920318}	t	0	8	10	1	[]
203	1	f	0	1697920231	101	[]	{"x": 0, "y": 26}	[]	\N	{"id": 8, "endTime": 1697920334}	t	0	8	3	1	[]
204	1	f	0	1697919817	103	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920303}	f	0	8	6	1	[]
205	1	f	0	1697920018	112.5	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1697920309}	f	0	8	7	1	[]
202	51	f	0	1697919855	101	[]	{"x": 0, "y": 23}	[]	\N	{"id": 8, "endTime": 1697920357}	t	0	8	2	1	[]
445	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310621}	f	0	10	15	1	[]
246	1	f	0	1698451876	100	[]	{"x": 0, "y": 23}	[]	\N	{"id": 8, "endTime": 1698451928}	f	0	6	0	1	[]
233	1	f	0	1698451876	100	[]	{"x": 1, "y": 24}	[]	\N	{"id": 8, "endTime": 1698451917}	f	0	6	0	1	[]
253	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451935}	f	0	6	1	1	[]
257	1	f	0	1698451876	100	[]	{"x": 0, "y": 25}	[]	\N	{"id": 8, "endTime": 1698451901}	f	0	6	0	1	[]
249	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451933}	f	0	6	1	1	[]
230	1	f	0	1698451876	100	[]	{"x": 2, "y": 26}	[]	\N	{"id": 8, "endTime": 1698451913}	f	0	6	0	1	[]
245	2001	f	0	1698451876	101	[]	{"x": 0, "y": 23}	[]	\N	{"id": 8, "endTime": 1698451934}	f	0	6	0	2	[]
277	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402736}	f	0	7	1	1	[]
278	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402764}	f	0	7	0	1	[]
279	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402729}	f	0	7	1	1	[]
269	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402734}	f	0	7	1	1	[]
280	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402751}	f	0	7	0	1	[]
281	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402746}	f	0	7	1	1	[]
270	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402750}	f	0	7	1	1	[]
271	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402764}	f	0	7	0	1	[]
274	1	f	0	1698402708	110	[]	{"x": 1, "y": 1}	[33, 36]	\N	{"id": 8, "endTime": 1698402732}	f	0	7	12	1	[]
272	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402762}	f	0	7	0	1	[]
262	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402751}	f	0	7	0	1	[]
263	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402758}	f	0	7	1	1	[]
265	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402738}	f	0	7	1	1	[]
266	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402757}	f	0	7	1	1	[]
288	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451905}	f	0	6	1	1	[]
259	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451933}	f	0	6	1	1	[]
122	1	f	0	1698451876	100	[]	{"x": 0, "y": 28}	[]	\N	{"id": 8, "endTime": 1698451903}	f	0	6	0	1	[]
261	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451928}	f	0	6	1	1	[]
286	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451906}	f	0	6	1	1	[]
243	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451896}	f	0	6	0	1	[]
231	1	f	0	1698451876	100	[]	{"x": 0, "y": 24}	[]	\N	{"id": 8, "endTime": 1698451908}	f	0	6	0	1	[]
247	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451926}	f	0	6	1	1	[]
232	1	f	0	1698451876	100	[]	{"x": 1, "y": 27}	[]	\N	{"id": 8, "endTime": 1698451921}	f	0	6	1	1	[]
250	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451918}	f	0	6	1	1	[]
237	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451917}	f	0	6	1	1	[]
251	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451922}	f	0	6	1	1	[]
267	1	f	0	1698402708	106	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698402734}	f	0	7	0	1	[]
446	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310587}	f	0	10	16	1	[]
447	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310602}	f	0	10	17	1	[]
448	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310612}	f	0	10	18	1	[]
449	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310620}	f	0	10	19	1	[]
304	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451935}	f	0	6	1	1	[]
293	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451908}	f	0	6	0	1	[]
294	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451935}	f	0	6	1	1	[]
306	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451896}	f	0	6	0	1	[]
282	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451908}	f	0	6	1	1	[]
300	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451908}	f	0	6	0	1	[]
302	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451900}	f	0	6	1	1	[]
284	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451932}	f	0	6	0	1	[]
291	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451915}	f	0	6	1	1	[]
289	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451927}	f	0	6	1	1	[]
296	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451902}	f	0	6	1	1	[]
292	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451931}	f	0	6	1	1	[]
305	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451921}	f	0	6	1	1	[]
314	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451926}	f	0	6	1	1	[]
312	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451901}	f	0	6	1	1	[]
290	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451908}	f	0	6	0	1	[]
315	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451921}	f	0	6	0	1	[]
301	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451936}	f	0	6	0	1	[]
303	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451927}	f	0	6	1	1	[]
313	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451896}	f	0	6	0	1	[]
283	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451919}	f	0	6	1	1	[]
295	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451925}	f	0	6	0	1	[]
285	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451930}	f	0	6	1	1	[]
297	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451932}	f	0	6	0	1	[]
275	1	f	0	1698451876	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698451928}	f	0	6	1	1	[]
451	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310607}	f	0	10	1	1	[]
452	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310606}	f	0	10	2	1	[]
453	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310589}	f	0	10	3	1	[]
311	1	f	0	1698451876	100	[]	{"x": 2, "y": 27}	[]	\N	{"id": 8, "endTime": 1698451908}	f	0	6	0	1	[{"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 27}, {"power": 20, "status": 0, "target": 27}]
410	0	f	0	1698310481	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310618}	f	0	10	0	1	[]
440	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310614}	f	0	10	10	1	[]
444	0	f	0	1698310003	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310625}	f	0	10	14	1	[]
450	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310604}	f	0	10	0	1	[]
460	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310600}	f	0	10	10	1	[]
461	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310612}	f	0	10	11	1	[]
462	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310607}	f	0	10	12	1	[]
463	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310586}	f	0	10	13	1	[]
464	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310615}	f	0	10	14	1	[]
465	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310621}	f	0	10	15	1	[]
466	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310596}	f	0	10	16	1	[]
467	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310620}	f	0	10	17	1	[]
468	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310621}	f	0	10	18	1	[]
469	0	f	0	1698310083	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310617}	f	0	10	19	1	[]
470	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310615}	f	0	10	0	1	[]
471	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310602}	f	0	10	1	1	[]
472	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310624}	f	0	10	2	1	[]
473	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310592}	f	0	10	3	1	[]
474	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310621}	f	0	10	4	1	[]
475	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310609}	f	0	10	5	1	[]
476	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310598}	f	0	10	6	1	[]
477	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310614}	f	0	10	7	1	[]
478	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310612}	f	0	10	8	1	[]
479	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310607}	f	0	10	9	1	[]
480	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310593}	f	0	10	10	1	[]
481	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310587}	f	0	10	11	1	[]
482	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310607}	f	0	10	12	1	[]
483	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310601}	f	0	10	13	1	[]
484	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310589}	f	0	10	14	1	[]
485	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310587}	f	0	10	15	1	[]
486	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310604}	f	0	10	16	1	[]
487	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310600}	f	0	10	17	1	[]
488	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310605}	f	0	10	18	1	[]
489	0	f	0	1698310472	100	[]	{"x": 1, "y": 1}	[]	\N	{"id": 8, "endTime": 1698310596}	f	0	10	19	1	[]
138	1	f	0	1698406722	111	[]	{"x": 6, "y": 23}	[]	\N	{"id": 8, "endTime": 1698406754}	t	0	7	6	1	[{"power": 20, "status": 0, "target": 11}, {"power": 20, "status": 0, "target": 55}, {"power": 20, "status": 0, "target": 56}, {"power": 20, "status": 0, "target": 57}, {"power": 0, "status": -3, "target": 131}]
221	1	f	0	1698451876	100	[]	{"x": 0, "y": 26}	[]	\N	{"id": 8, "endTime": 1698451933}	f	0	6	0	1	[{"power": 20, "status": 0, "target": 5}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 27}, {"power": 0, "status": -3, "target": 125}]
101	5127	f	0	1698451865	107	[]	{"x": 0, "y": 23}	[3, 10]	\N	{"id": 8, "endTime": 1698451929}	f	0	6	0	2	[{"power": 20, "status": 0, "target": 5}, {"power": 20, "status": 0, "target": 25}, {"power": 20, "status": 0, "target": 26}, {"power": 20, "status": 0, "target": 27}, {"power": 0, "status": -3, "target": 125}]
264	101	f	0	1698402708	106	[]	{"x": 0, "y": 23}	[2, 0]	\N	{"id": 8, "endTime": 1698402740}	f	0	7	1	1	[{"power": 20, "status": 0, "target": 6}, {"power": 20, "status": 0, "target": 30}, {"power": 20, "status": 0, "target": 31}, {"power": 20, "status": 0, "target": 32}, {"power": 0, "status": -3, "target": 126}]
146	1	f	0	1698406722	111	[]	{"x": 5, "y": 23}	[]	\N	{"id": 8, "endTime": 1698406780}	t	0	7	11	1	[{"power": 20, "status": 0, "target": 16}, {"power": 20, "status": 0, "target": 80}, {"power": 20, "status": 0, "target": 81}, {"power": 20, "status": 0, "target": 82}, {"power": 0, "status": -3, "target": 136}]
491	2522	f	0	1698396431	104	[]	{"x": 0, "y": 23}	[]	\N	{"id": 8, "endTime": 1698396451}	t	0	11	11	1	[{"power": 0, "status": -3, "target": 16}, {"power": 20, "status": 0, "target": 80}, {"power": 0, "status": -3, "target": 81}, {"power": 20, "status": 0, "target": 82}, {"power": 0, "status": -3, "target": 136}]
492	0	f	0	1698395332	100	[]	{"x": 0, "y": 23}	[]	{"inRaid": true, "endTime": 1698397736, "minutes": 1200, "locationId": 1, "raidSlotId": 0}	{"id": 8, "endTime": 1698395361}	f	0	11	15	1	[{"power": 0, "status": -3, "target": 20}, {"power": 0, "status": -3, "target": 100}, {"power": 0, "status": -3, "target": 101}, {"power": 0, "status": -3, "target": 102}, {"power": 0, "status": -3, "target": 140}]
103	1	f	0	1698451876	100	[]	{"x": 1, "y": 25}	[]	\N	{"id": 8, "endTime": 1698451929}	f	0	6	2	1	[{"power": 20, "status": 0, "target": 35}, {"power": 20, "status": 0, "target": 35}, {"power": 20, "status": 0, "target": 35}, {"power": 20, "status": 0, "target": 35}, {"power": 20, "status": 0, "target": 35}, {"power": 20, "status": 0, "target": 35}, {"power": 20, "status": 0, "target": 35}, {"power": 20, "status": 0, "target": 35}, {"power": 20, "status": 0, "target": 35}, {"power": 20, "status": 0, "target": 36}, {"power": 20, "status": 0, "target": 36}, {"power": 20, "status": 0, "target": 36}, {"power": 20, "status": 0, "target": 37}, {"power": 20, "status": 0, "target": 37}]
490	182	f	0	1698396420	104	[]	{"x": 3, "y": 27}	[]	\N	{"id": 8, "endTime": 1698396477}	t	0	11	9	1	[{"power": 0, "status": -3, "target": 14}, {"power": 20, "status": 0, "target": 70}, {"power": 0, "status": -3, "target": 71}, {"power": 20, "status": 0, "target": 72}, {"power": 0, "status": -3, "target": 134}]
\.


--
-- TOC entry 3581 (class 0 OID 19080)
-- Dependencies: 255
-- Data for Name: player_consumables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_consumables (id, count, "playerId", "configId") FROM stdin;
1	10	6	0
2	10	6	1
4	10	6	3
5	10	6	4
8	10	6	1
13	16	6	6
16	16	6	7
17	10	7	0
18	10	7	1
22	10	7	5
23	10	7	0
26	10	7	3
32	16	7	7
33	10	8	0
34	10	8	1
35	10	8	2
36	10	8	3
37	10	8	4
38	10	8	5
39	10	8	0
40	10	8	1
41	10	8	2
42	10	8	3
43	10	8	4
44	10	8	5
45	16	8	6
46	16	8	7
48	16	8	7
150	1	11	7
6	9	6	5
47	12	8	6
151	1	11	2
14	4	6	7
7	9	6	0
152	1	11	4
153	1	11	7
31	4	7	6
29	4	7	6
24	8	7	1
19	8	7	2
25	9	7	2
154	1	11	0
155	1	11	6
3	7	6	2
9	6	6	2
15	4	6	6
30	4	7	7
49	30	10	0
50	30	10	1
51	30	10	2
52	30	10	6
53	30	10	7
54	30	10	4
55	30	10	3
56	30	10	5
57	30	10	0
58	30	10	1
59	30	10	2
60	30	10	6
61	30	10	7
62	30	10	4
63	30	10	3
64	30	10	5
65	30	10	0
66	30	10	1
67	30	10	2
68	30	10	6
69	30	10	7
70	30	10	4
71	30	10	3
72	30	10	5
73	30	10	0
74	30	10	1
75	30	10	2
76	30	10	6
77	30	10	7
78	30	10	4
79	30	10	3
80	30	10	5
27	9	7	4
21	9	7	4
20	7	7	3
28	9	7	5
84	1	6	4
85	1	6	6
86	1	6	0
87	1	6	7
88	1	6	0
89	1	6	6
90	1	6	5
92	1	6	5
94	1	6	6
96	1	6	7
98	1	6	0
100	1	6	5
101	1	6	6
102	1	6	1
103	1	6	5
104	1	6	7
105	1	6	5
106	1	6	0
107	1	6	6
108	1	6	1
109	1	6	0
110	1	6	0
111	1	6	2
112	1	6	7
113	1	6	5
114	1	6	1
115	1	6	4
116	1	6	5
117	1	6	6
118	1	6	3
119	1	6	2
120	1	6	2
121	1	6	4
122	1	6	6
123	1	6	7
124	1	6	0
125	1	6	0
126	1	6	7
127	1	6	0
128	1	6	7
129	1	6	6
130	1	6	7
131	1	6	6
132	1	6	6
133	1	6	6
134	1	6	3
135	1	6	6
136	1	6	7
137	1	6	6
138	1	6	6
139	1	6	6
140	1	6	7
141	1	6	6
142	1	6	7
143	1	6	7
144	1	6	6
145	1	6	0
146	1	6	7
147	1	6	6
148	1	6	6
149	1	6	7
156	1	11	6
157	1	11	6
158	1	11	7
159	1	11	7
160	1	11	7
161	1	11	3
162	1	11	7
163	1	11	6
164	1	11	3
165	1	11	6
166	1	11	6
167	1	11	7
168	1	11	7
169	1	7	7
170	1	7	2
171	1	7	6
172	1	7	7
173	1	7	6
174	1	7	1
175	1	7	6
176	1	7	7
177	1	7	7
178	1	7	7
179	1	7	6
180	1	7	7
181	1	7	6
182	1	7	6
183	1	7	7
184	1	7	7
11	9	6	4
10	8	6	3
12	7	6	5
185	1	7	6
186	1	7	7
187	1	7	6
188	1	7	6
189	1	7	6
190	1	7	6
191	1	7	6
192	1	7	6
193	1	7	6
194	1	7	6
195	1	7	6
196	1	7	7
197	1	6	6
198	1	6	7
199	1	6	7
200	1	6	3
201	1	6	7
202	1	6	7
203	1	6	6
204	1	6	7
205	1	6	6
206	1	6	6
207	1	6	7
208	1	7	2
209	1	7	6
210	1	7	6
211	1	6	3
212	1	6	6
213	1	6	0
214	1	6	7
215	1	6	6
216	1	6	4
217	1	6	6
218	1	6	6
219	1	6	6
220	1	6	6
221	1	6	6
222	1	6	6
\.


--
-- TOC entry 3561 (class 0 OID 18639)
-- Dependencies: 235
-- Data for Name: player_floors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_floors (id, soft_currency, "playerId", "configId") FROM stdin;
12	0	6	1
16	0	8	1
11	2000	6	0
14	0	7	1
15	244	8	0
13	300	7	0
20	0	10	1
19	23	10	0
22	0	11	1
21	52	11	0
\.


--
-- TOC entry 3563 (class 0 OID 18648)
-- Dependencies: 237
-- Data for Name: player_furnitures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_furnitures (id, sector, "position", look_at, wall_pos, nft_key, placed, for_collect, "playerId", "configId") FROM stdin;
645	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	0
646	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	1
649	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	4
652	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	7
653	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	8
654	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	9
655	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	10
656	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	11
657	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	12
658	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	13
659	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	14
660	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	15
661	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	16
663	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	18
664	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	19
665	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	20
666	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	21
667	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	22
668	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	23
669	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	24
670	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	25
671	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	26
672	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	27
673	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	28
674	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	29
675	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	30
676	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	31
677	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	32
678	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	33
681	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	37
682	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	42
683	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	43
685	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	45
686	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	46
687	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	47
688	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	48
689	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	49
690	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	50
692	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	52
694	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	54
695	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	55
696	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	56
697	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	57
698	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	58
699	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	59
700	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	60
701	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	61
702	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	62
703	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	63
704	0	{"x": 8, "y": 31}	{"x": -1, "y": 0}	0	1	t	f	6	64
705	0	{"x": 7, "y": 30}	{"x": -1, "y": 0}	0	1	t	f	6	65
662	0	{"x": 3, "y": 21}	{"x": -1, "y": 0}	0	1	f	f	6	17
680	0	{"x": 4, "y": 17}	{"x": -1, "y": 0}	0	1	f	f	6	36
693	0	{"x": 5, "y": 12}	{"x": -1, "y": 0}	0	1	t	f	6	53
650	0	{"x": 3, "y": 21}	{"x": -1, "y": 0}	0	1	t	f	6	5
648	0	{"x": 5, "y": 33}	{"x": 1, "y": 0}	0	1	t	f	6	3
684	0	{"x": 0, "y": 23}	{"x": -1, "y": 0}	0	1	f	f	6	44
679	0	{"x": 4, "y": 34}	{"x": -1, "y": 0}	0	1	t	f	6	35
651	0	{"x": 1, "y": 18}	{"x": 0, "y": -1}	0	1	t	f	6	6
691	0	{"x": 1, "y": 24}	{"x": -1, "y": 0}	0	1	f	f	6	51
706	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	66
709	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	69
713	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	73
715	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	75
716	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	76
717	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	77
718	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	78
719	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	79
720	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	80
721	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	81
722	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	82
723	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	86
726	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	89
729	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	92
730	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	93
731	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	94
732	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	95
733	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	96
736	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	99
744	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	107
746	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	109
748	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	111
749	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	112
750	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	113
751	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	114
752	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	115
753	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	116
754	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	117
755	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	118
756	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	119
757	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	120
758	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	121
759	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	122
760	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	123
761	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	124
762	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	125
763	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	126
764	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	127
765	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	128
766	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	129
725	0	{"x": 4, "y": 18}	{"x": -1, "y": 0}	0	1	t	f	6	88
714	0	{"x": 8, "y": 28}	{"x": -1, "y": 0}	0	1	t	f	6	74
711	0	{"x": 8, "y": 26}	{"x": -1, "y": 0}	0	1	t	f	6	71
728	0	{"x": 4, "y": 24}	{"x": -1, "y": 0}	0	1	f	f	6	91
707	0	{"x": 5, "y": 25}	{"x": 0, "y": 1}	0	1	f	f	6	67
727	0	{"x": 4, "y": 26}	{"x": -1, "y": 0}	0	1	f	f	6	90
741	0	{"x": 6, "y": 22}	{"x": -1, "y": 0}	0	1	f	f	6	104
712	0	{"x": 6, "y": 21}	{"x": -1, "y": 0}	0	1	f	f	6	72
735	0	{"x": 8, "y": 24}	{"x": -1, "y": 0}	0	1	t	f	6	98
739	0	{"x": 6, "y": 25}	{"x": -1, "y": 0}	0	1	t	f	6	102
710	0	{"x": 5, "y": 22}	{"x": -1, "y": 0}	0	1	f	f	6	70
745	0	{"x": 8, "y": 23}	{"x": -1, "y": 0}	0	1	t	f	6	108
747	0	{"x": 8, "y": 22}	{"x": -1, "y": 0}	0	1	t	f	6	110
724	0	{"x": 5, "y": 28}	{"x": -1, "y": 0}	0	1	t	f	6	87
738	0	{"x": 4, "y": 25}	{"x": -1, "y": 0}	0	1	t	f	6	101
740	0	{"x": 6, "y": 22}	{"x": -1, "y": 0}	0	1	t	f	6	103
742	0	{"x": 4, "y": 20}	{"x": -1, "y": 0}	0	1	t	f	6	105
734	0	{"x": 1, "y": 22}	{"x": -1, "y": 0}	0	1	f	f	6	97
737	0	{"x": 1, "y": 20}	{"x": 1, "y": 0}	0	1	t	f	6	100
743	0	{"x": 2, "y": 24}	{"x": -1, "y": 0}	0	1	f	f	6	106
767	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	130
768	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	131
769	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	132
770	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	133
771	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	134
772	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	6	135
774	1	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	t	t	6	300
794	0	{"x": 7, "y": 26}	{"x": -1, "y": 0}	0	1	f	f	7	18
775	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	57
776	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	0
777	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	1
779	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	3
780	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	4
781	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	5
782	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	6
784	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	8
787	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	11
788	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	12
789	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	13
790	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	14
791	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	15
792	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	16
796	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	20
797	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	21
798	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	22
799	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	23
800	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	24
801	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	25
802	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	26
803	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	27
804	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	28
805	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	29
807	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	31
808	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	32
809	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	33
811	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	36
812	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	37
813	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	42
814	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	43
816	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	45
817	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	46
818	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	47
819	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	48
820	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	49
821	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	50
822	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	51
823	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	52
824	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	53
793	0	{"x": 0, "y": 28}	{"x": -1, "y": 0}	0	1	t	f	7	17
810	0	{"x": 7, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	35
815	0	{"x": 2, "y": 28}	{"x": 0, "y": -1}	0	1	f	f	7	44
795	0	{"x": 0, "y": 23}	{"x": -1, "y": 0}	0	1	t	f	7	19
783	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	7
647	0	{"x": 8, "y": 21}	{"x": -1, "y": 0}	0	1	t	f	6	2
708	0	{"x": 7, "y": 28}	{"x": -1, "y": 0}	0	1	t	f	6	68
773	0	{"x": 1, "y": 28}	{"x": 1, "y": 0}	0	1	t	t	6	300
806	0	{"x": 4, "y": 23}	{"x": -1, "y": 0}	0	1	t	f	7	30
785	0	{"x": 4, "y": 26}	{"x": -1, "y": 0}	0	1	t	f	7	9
786	0	{"x": 8, "y": 23}	{"x": -1, "y": 0}	0	1	t	f	7	10
778	0	{"x": 5, "y": 23}	{"x": -1, "y": 0}	0	1	f	f	7	2
825	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	54
826	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	55
827	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	56
828	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	57
832	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	61
836	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	65
839	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	68
840	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	69
842	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	71
844	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	73
851	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	80
857	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	89
858	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	90
859	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	91
860	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	92
861	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	93
862	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	94
863	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	95
864	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	96
866	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	98
868	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	100
870	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	102
872	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	104
873	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	105
874	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	106
875	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	107
878	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	110
879	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	111
880	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	112
881	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	113
882	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	114
883	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	115
884	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	116
885	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	117
838	0	{"x": 3, "y": 29}	{"x": -1, "y": 0}	0	1	f	f	7	67
843	0	{"x": 5, "y": 29}	{"x": -1, "y": 0}	0	1	f	f	7	72
829	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	58
845	0	{"x": 0, "y": 29}	{"x": 0, "y": -1}	0	1	f	f	7	74
848	0	{"x": 6, "y": 28}	{"x": -1, "y": 0}	0	1	f	f	7	77
876	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	108
830	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	59
831	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	60
837	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	66
850	0	{"x": 1, "y": 28}	{"x": -1, "y": 0}	0	1	f	f	7	79
877	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	109
841	0	{"x": 5, "y": 26}	{"x": -1, "y": 0}	0	1	f	f	7	70
849	0	{"x": 8, "y": 24}	{"x": -1, "y": 0}	0	1	f	f	7	78
854	0	{"x": 0, "y": 26}	{"x": -1, "y": 0}	0	1	f	f	7	86
834	0	{"x": 6, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	63
856	0	{"x": 7, "y": 28}	{"x": -1, "y": 0}	0	1	t	f	7	88
847	0	{"x": 4, "y": 23}	{"x": -1, "y": 0}	0	1	f	f	7	76
853	0	{"x": 7, "y": 24}	{"x": -1, "y": 0}	0	1	f	f	7	82
835	0	{"x": 6, "y": 26}	{"x": -1, "y": 0}	0	1	f	f	7	64
852	0	{"x": 6, "y": 27}	{"x": -1, "y": 0}	0	1	f	f	7	81
869	0	{"x": 7, "y": 25}	{"x": -1, "y": 0}	0	1	t	f	7	101
871	0	{"x": 5, "y": 26}	{"x": -1, "y": 0}	0	1	t	f	7	103
867	0	{"x": 1, "y": 23}	{"x": 0, "y": -1}	0	1	t	f	7	99
846	0	{"x": 0, "y": 26}	{"x": -1, "y": 0}	0	1	t	f	7	75
865	0	{"x": 2, "y": 28}	{"x": -1, "y": 0}	0	1	t	f	7	97
886	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	118
887	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	119
888	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	120
889	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	121
890	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	122
891	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	123
892	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	124
893	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	125
894	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	126
895	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	127
896	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	128
897	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	129
898	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	130
899	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	131
900	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	132
901	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	133
902	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	134
903	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	7	135
905	1	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	t	t	7	300
833	0	{"x": 6, "y": 29}	{"x": -1, "y": 0}	0	1	f	f	7	62
906	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	7	89
904	0	{"x": 1, "y": 27}	{"x": 0, "y": 1}	0	1	t	t	7	300
907	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	0
908	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	1
909	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	2
910	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	3
911	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	4
912	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	5
913	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	6
914	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	7
915	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	8
916	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	9
917	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	10
918	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	11
919	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	12
920	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	13
921	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	14
922	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	15
923	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	16
924	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	17
925	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	18
926	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	19
927	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	20
928	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	21
929	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	22
930	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	23
931	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	24
932	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	25
933	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	26
934	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	27
935	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	28
936	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	29
937	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	30
938	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	31
939	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	32
940	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	33
941	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	35
942	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	36
943	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	37
944	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	42
945	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	43
946	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	44
947	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	45
948	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	46
949	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	47
950	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	48
951	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	49
952	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	50
953	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	51
954	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	52
955	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	53
956	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	54
957	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	55
958	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	56
959	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	57
960	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	58
961	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	59
962	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	60
963	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	61
964	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	62
965	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	63
966	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	64
967	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	65
968	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	66
969	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	67
970	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	68
971	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	69
972	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	70
973	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	71
974	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	72
975	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	73
976	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	74
977	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	75
978	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	76
979	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	77
980	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	78
981	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	79
982	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	80
983	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	81
984	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	82
985	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	86
986	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	87
987	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	88
988	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	89
989	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	90
990	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	91
991	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	92
992	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	93
993	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	94
994	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	95
995	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	96
996	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	97
997	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	98
998	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	99
999	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	100
1000	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	101
1001	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	102
1002	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	103
1003	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	104
1004	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	105
1005	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	106
1006	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	107
1007	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	108
1008	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	109
1009	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	110
1010	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	111
1011	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	112
1012	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	113
1013	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	114
1014	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	115
1016	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	117
1018	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	119
1019	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	120
1020	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	121
1021	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	122
1022	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	123
1023	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	124
1024	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	125
1025	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	126
1026	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	127
1027	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	128
1028	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	129
1029	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	130
1030	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	131
1031	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	132
1032	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	133
1033	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	134
1034	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	8	135
1036	1	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	t	t	8	300
1037	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	8	19
1038	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	7	18
1039	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	7	107
855	0	{"x": 7, "y": 23}	{"x": -1, "y": 0}	0	1	f	f	7	87
1040	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	65
1017	0	{"x": 1, "y": 28}	{"x": -1, "y": 0}	0	1	t	f	8	118
1035	0	{"x": 1, "y": 25}	{"x": -1, "y": 0}	0	1	t	t	8	300
1015	0	{"x": 2, "y": 28}	{"x": -1, "y": 0}	0	1	t	f	8	116
1172	1	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	t	t	10	300
1171	0	{"x": 7, "y": 25}	{"x": -1, "y": 0}	0	1	t	t	10	300
1173	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	12
1174	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	13
1175	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	28
1176	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	107
1177	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	121
1178	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	122
1179	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	6
1180	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	7
1181	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	8
1182	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	9
1183	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	10
1184	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	11
1185	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	14
1186	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	15
1187	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	16
1188	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	17
1189	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	18
1190	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	0
1191	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	1
1192	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	2
1193	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	3
1194	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	4
1195	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	5
1196	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	19
1197	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	20
1198	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	21
1199	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	22
1200	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	23
1201	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	24
1202	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	25
1203	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	26
1204	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	27
1205	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	29
1206	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	30
1207	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	31
1208	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	32
1209	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	33
1210	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	35
1211	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	36
1212	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	37
1213	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	42
1214	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	43
1215	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	44
1216	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	45
1217	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	46
1218	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	47
1219	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	48
1220	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	49
1221	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	50
1222	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	51
1223	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	52
1224	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	53
1225	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	54
1226	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	55
1227	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	56
1228	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	57
1229	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	58
1230	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	59
1231	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	60
1232	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	61
1233	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	62
1234	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	63
1235	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	64
1236	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	65
1237	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	66
1238	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	67
1239	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	68
1240	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	69
1241	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	70
1242	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	71
1243	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	72
1244	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	73
1245	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	74
1246	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	75
1247	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	76
1248	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	77
1249	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	78
1250	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	79
1251	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	80
1252	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	81
1253	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	82
1254	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	86
1255	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	87
1256	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	88
1257	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	89
1258	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	90
1259	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	91
1260	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	92
1261	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	93
1262	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	94
1263	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	95
1264	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	96
1265	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	97
1266	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	98
1267	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	99
1268	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	100
1269	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	101
1270	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	102
1271	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	103
1272	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	104
1273	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	105
1274	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	106
1275	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	108
1276	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	109
1277	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	110
1278	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	111
1279	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	112
1280	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	113
1281	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	114
1282	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	115
1283	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	116
1284	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	117
1285	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	118
1286	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	119
1287	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	120
1288	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	123
1289	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	124
1290	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	129
1291	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	131
1292	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	125
1293	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	126
1294	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	127
1295	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	128
1296	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	130
1297	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	132
1298	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	133
1299	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	134
1300	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	135
1301	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	12
1302	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	13
1303	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	28
1304	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	107
1305	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	121
1306	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	122
1307	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	6
1308	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	7
1309	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	8
1310	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	9
1311	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	10
1312	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	11
1313	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	14
1314	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	15
1315	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	16
1316	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	17
1317	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	18
1318	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	0
1319	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	1
1320	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	2
1321	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	3
1322	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	4
1323	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	5
1324	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	19
1325	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	20
1326	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	21
1327	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	22
1328	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	23
1329	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	24
1330	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	25
1331	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	26
1332	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	27
1333	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	29
1334	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	30
1335	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	31
1336	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	32
1337	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	33
1338	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	35
1339	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	36
1340	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	37
1341	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	42
1342	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	43
1343	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	44
1344	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	45
1345	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	46
1346	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	47
1347	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	48
1348	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	49
1349	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	50
1350	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	51
1351	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	52
1352	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	53
1353	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	54
1354	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	55
1355	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	56
1356	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	57
1357	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	58
1358	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	59
1359	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	60
1360	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	61
1361	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	62
1362	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	63
1363	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	64
1364	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	65
1365	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	66
1366	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	67
1367	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	68
1368	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	69
1369	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	70
1370	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	71
1371	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	72
1372	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	73
1373	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	74
1374	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	75
1375	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	76
1376	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	77
1377	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	78
1378	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	79
1379	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	80
1380	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	81
1381	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	82
1382	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	86
1383	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	87
1384	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	88
1385	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	89
1386	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	90
1387	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	91
1388	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	92
1389	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	93
1390	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	94
1391	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	95
1392	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	96
1393	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	97
1394	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	98
1395	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	99
1396	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	100
1397	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	101
1398	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	102
1399	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	103
1400	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	104
1401	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	105
1402	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	106
1403	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	108
1404	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	109
1405	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	110
1406	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	111
1407	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	112
1408	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	113
1409	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	114
1410	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	115
1411	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	116
1412	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	117
1413	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	118
1414	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	119
1415	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	120
1416	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	123
1417	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	124
1418	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	129
1419	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	131
1420	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	125
1421	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	126
1422	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	127
1423	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	128
1424	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	130
1425	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	132
1426	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	133
1427	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	134
1428	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	135
1429	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	12
1430	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	13
1431	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	28
1432	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	107
1433	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	121
1434	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	122
1435	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	6
1436	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	7
1437	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	8
1438	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	9
1439	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	10
1440	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	11
1441	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	14
1442	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	15
1443	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	16
1444	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	17
1445	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	18
1446	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	0
1447	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	1
1448	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	2
1449	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	3
1450	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	4
1451	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	5
1452	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	19
1453	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	20
1454	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	21
1455	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	22
1456	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	23
1457	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	24
1458	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	25
1459	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	26
1460	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	27
1461	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	29
1462	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	30
1463	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	31
1464	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	32
1465	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	33
1466	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	35
1467	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	36
1468	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	37
1469	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	42
1470	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	43
1471	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	44
1472	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	45
1473	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	46
1474	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	47
1475	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	48
1476	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	49
1477	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	50
1478	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	51
1479	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	52
1480	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	53
1481	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	54
1482	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	55
1483	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	56
1484	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	57
1485	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	58
1486	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	59
1487	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	60
1488	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	61
1489	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	62
1490	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	63
1491	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	64
1492	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	65
1493	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	66
1494	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	67
1495	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	68
1496	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	69
1497	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	70
1498	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	71
1499	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	72
1500	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	73
1501	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	74
1502	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	75
1503	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	76
1504	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	77
1505	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	78
1506	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	79
1507	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	80
1508	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	81
1509	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	82
1510	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	86
1511	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	87
1512	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	88
1513	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	89
1514	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	90
1515	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	91
1516	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	92
1517	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	93
1518	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	94
1519	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	95
1520	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	96
1521	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	97
1522	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	98
1523	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	99
1524	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	100
1525	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	101
1526	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	102
1527	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	103
1528	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	104
1529	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	105
1530	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	106
1531	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	108
1532	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	109
1533	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	110
1534	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	111
1535	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	112
1536	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	113
1537	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	114
1538	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	115
1539	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	116
1540	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	117
1541	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	118
1542	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	119
1543	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	120
1544	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	123
1545	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	124
1546	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	129
1547	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	131
1548	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	125
1549	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	126
1550	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	127
1551	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	128
1552	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	130
1553	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	132
1554	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	133
1555	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	134
1556	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	135
1557	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	12
1558	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	13
1559	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	28
1560	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	107
1561	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	121
1562	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	122
1563	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	6
1564	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	7
1565	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	8
1566	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	9
1567	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	10
1568	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	11
1569	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	14
1570	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	15
1571	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	16
1572	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	17
1573	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	18
1574	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	0
1575	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	1
1576	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	2
1577	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	3
1578	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	4
1579	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	5
1580	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	19
1581	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	20
1582	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	21
1583	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	22
1584	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	23
1585	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	24
1586	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	25
1587	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	26
1588	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	27
1589	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	29
1590	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	30
1591	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	31
1592	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	32
1593	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	33
1594	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	35
1595	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	36
1596	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	37
1597	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	42
1598	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	43
1599	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	44
1600	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	45
1601	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	46
1602	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	47
1603	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	48
1604	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	49
1605	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	50
1606	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	51
1607	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	52
1608	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	53
1609	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	54
1610	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	55
1611	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	56
1612	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	57
1613	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	58
1614	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	59
1615	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	60
1616	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	61
1617	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	62
1618	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	63
1619	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	64
1620	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	65
1621	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	66
1622	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	67
1623	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	68
1624	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	69
1625	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	70
1626	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	71
1627	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	72
1628	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	73
1629	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	74
1630	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	75
1631	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	76
1632	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	77
1633	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	78
1634	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	79
1635	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	80
1636	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	81
1637	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	82
1638	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	86
1639	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	87
1640	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	88
1641	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	89
1642	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	90
1643	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	91
1644	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	92
1645	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	93
1646	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	94
1647	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	95
1648	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	96
1649	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	97
1650	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	98
1651	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	99
1652	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	100
1653	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	101
1654	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	102
1655	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	103
1656	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	104
1657	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	105
1658	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	106
1659	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	108
1660	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	109
1661	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	110
1662	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	111
1663	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	112
1664	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	113
1665	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	114
1666	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	115
1667	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	116
1668	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	117
1669	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	118
1670	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	119
1671	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	120
1672	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	123
1673	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	124
1674	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	129
1675	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	131
1676	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	125
1677	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	126
1678	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	127
1679	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	128
1680	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	130
1681	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	132
1682	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	133
1683	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	134
1684	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	f	f	10	135
1685	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	86
1686	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	120
1687	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	111
1688	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	36
1689	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	31
1690	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	8
1691	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	36
1692	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	20
1693	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	3
1694	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	64
1695	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	47
1696	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	66
1697	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	26
1698	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	37
1699	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	117
1700	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	66
1701	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	8
1702	0	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	t	t	11	300
1703	1	{"x": 2, "y": 25}	{"x": -1, "y": 0}	0	1	t	t	11	300
1704	0	{"x": 4, "y": 24}	{"x": -1, "y": 0}	0	1	t	f	11	116
1705	0	{"x": 7, "y": 27}	{"x": -1, "y": 0}	0	1	t	f	11	47
1706	0	{"x": 5, "y": 29}	{"x": -1, "y": 0}	0	1	t	f	11	96
1707	0	{"x": 2, "y": 28}	{"x": 0, "y": 0}	0	1	t	f	11	6
1708	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	7	50
1709	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	7	122
1710	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	23
1711	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	93
1712	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	57
1713	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	112
1714	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	0
1715	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	115
1716	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	31
1717	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	48
1718	0	{"x": 1, "y": 1}	{"x": 0, "y": 0}	0	1	f	f	6	99
\.


--
-- TOC entry 3565 (class 0 OID 18673)
-- Dependencies: 239
-- Data for Name: player_letters_conditions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_letters_conditions (id, taken_items, read_time, "letterId", "userId") FROM stdin;
1	f	1696945691	1	6
2	t	1696945830	3	6
\.


--
-- TOC entry 3583 (class 0 OID 19089)
-- Dependencies: 257
-- Data for Name: player_loot_boxes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_loot_boxes (id, items, "playerId", "configId") FROM stdin;
147	[{"count": 1, "group": "consumable", "configId": 6}, {"count": 1, "group": "consumable", "configId": 6}, {"count": 1, "group": "thing", "configId": 34}, {"count": 100, "group": "soft-currency", "configId": 0}]	6	1
148	[{"count": 1, "group": "consumable", "configId": 3}, {"count": 1, "group": "consumable", "configId": 7}, {"count": 1, "group": "furniture", "configId": 3}, {"count": 50, "group": "soft-currency", "configId": 0}]	6	1
149	[{"count": 1, "group": "furniture", "configId": 44}, {"count": 1, "group": "thing", "configId": 24}, {"count": 200, "group": "soft-currency", "configId": 0}, {"count": 1, "group": "furniture", "configId": 47}]	6	1
150	[{"count": 1, "group": "consumable", "configId": 7}, {"count": 100, "group": "soft-currency", "configId": 0}, {"count": 1, "group": "furniture", "configId": 135}, {"count": 1, "group": "consumable", "configId": 3}]	6	1
151	[{"count": 1, "group": "consumable", "configId": 3}, {"count": 1, "group": "furniture", "configId": 43}, {"count": 1, "group": "furniture", "configId": 23}, {"count": 1, "group": "furniture", "configId": 20}]	6	1
152	[{"count": 1, "group": "thing", "configId": 36}, {"count": 1, "group": "thing", "configId": 16}, {"count": 1, "group": "furniture", "configId": 3}, {"count": 1, "group": "furniture", "configId": 25}]	6	1
153	[{"count": 1, "group": "character", "configId": 11}, {"count": 1, "group": "character", "configId": 16}, {"count": 1, "group": "furniture", "configId": 52}, {"count": 100, "group": "soft-currency", "configId": 0}]	6	1
\.


--
-- TOC entry 3585 (class 0 OID 19100)
-- Dependencies: 259
-- Data for Name: player_things; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_things (id, "playerId", "configId") FROM stdin;
1	8	0
2	8	1
3	8	2
4	8	3
5	8	4
6	8	5
7	8	6
8	8	7
9	8	8
10	8	9
11	8	10
12	8	11
13	8	12
14	8	13
15	8	14
16	8	15
17	8	16
18	8	17
19	8	18
20	8	19
21	8	20
22	8	21
23	8	22
24	8	23
25	8	24
26	8	25
27	8	26
28	8	27
29	8	28
30	8	29
31	8	30
32	8	31
33	8	32
34	8	33
35	8	34
36	8	35
37	8	36
38	8	37
39	8	38
40	8	39
41	8	40
42	8	41
43	8	42
44	8	43
45	8	0
46	8	1
47	8	2
48	8	3
49	8	4
50	8	5
51	8	6
52	8	7
53	8	8
54	8	9
55	8	10
56	8	11
57	8	12
58	8	13
59	8	14
60	8	15
61	8	16
62	8	17
63	8	18
64	8	19
65	8	20
66	8	21
67	8	22
68	8	23
69	8	24
70	8	25
71	8	26
72	8	27
73	8	28
74	8	29
75	8	30
76	8	31
77	8	32
78	8	33
79	8	34
80	8	35
81	8	36
82	8	37
83	8	38
84	8	39
85	8	40
86	8	41
87	8	42
88	8	43
90	7	1
92	7	3
93	7	4
95	7	6
96	7	7
97	7	8
99	7	10
100	7	11
101	7	12
103	7	14
104	7	15
105	7	16
106	7	17
107	7	18
109	7	20
110	7	21
111	7	22
112	7	23
113	7	24
114	7	25
116	7	27
117	7	28
119	7	30
120	7	31
121	7	32
122	7	33
123	7	34
124	7	35
125	7	36
126	7	37
127	7	38
129	7	40
130	7	41
131	7	42
132	7	43
134	7	1
137	7	4
138	7	5
139	7	6
140	7	7
141	7	8
142	7	9
144	7	11
145	7	12
146	7	13
148	7	15
149	7	16
150	7	17
151	7	18
152	7	19
153	7	20
154	7	21
155	7	22
156	7	23
157	7	24
159	7	26
160	7	27
161	7	28
162	7	29
163	7	30
164	7	31
165	7	32
168	7	35
170	7	37
171	7	38
172	7	39
173	7	40
175	7	42
176	7	43
177	6	0
178	6	1
179	6	2
180	6	3
181	6	4
182	6	5
184	6	7
185	6	8
186	6	9
187	6	10
188	6	11
189	6	12
190	6	13
191	6	14
192	6	15
193	6	16
194	6	17
195	6	18
196	6	19
197	6	20
198	6	21
199	6	22
200	6	23
201	6	24
202	6	25
203	6	26
204	6	27
205	6	28
206	6	29
207	6	30
208	6	31
209	6	32
210	6	33
211	6	34
212	6	35
213	6	36
214	6	37
215	6	38
216	6	39
217	6	40
218	6	41
219	6	42
220	6	43
221	6	0
222	6	1
223	6	2
225	6	4
226	6	5
227	6	6
228	6	7
229	6	8
230	6	9
233	6	12
234	6	13
235	6	14
236	6	15
237	6	16
238	6	17
239	6	18
241	6	20
242	6	21
243	6	22
244	6	23
245	6	24
246	6	25
247	6	26
248	6	27
249	6	28
252	6	31
253	6	32
254	6	33
255	6	34
256	6	35
257	6	36
258	6	37
260	6	39
262	6	41
263	6	42
264	6	43
265	10	29
266	10	36
267	10	20
268	10	9
269	10	35
270	10	4
271	10	30
272	10	13
273	10	41
274	10	18
275	10	8
276	10	33
277	10	28
278	10	38
279	10	3
280	10	39
281	10	2
282	10	37
283	10	43
284	10	6
285	10	32
286	10	27
287	10	5
288	10	40
289	10	19
290	10	31
291	10	12
292	10	34
293	10	7
294	10	17
295	10	42
296	10	1
297	10	0
298	10	23
299	10	10
300	10	22
301	10	14
302	10	11
303	10	15
304	10	26
305	10	25
306	10	21
307	10	16
308	10	24
309	6	35
\.


--
-- TOC entry 3557 (class 0 OID 18597)
-- Dependencies: 231
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (id, account_id, online, save_lock, soft_currency, achievments, achievment_counter, loot_boxes, loot_box_time, last_join, groups_tiles, support_percents, block, reg_ip, reg_time, last_ip, last_sector, buffs) FROM stdin;
7	36	f	f	102469	[{"configId": 1, "receivedUnixTime": 1696846266}, {"configId": 3, "receivedUnixTime": 1698398535}, {"configId": 4, "receivedUnixTime": 1698398535}, {"configId": 5, "receivedUnixTime": 1698398535}, {"configId": 6, "receivedUnixTime": 1698398535}, {"configId": 7, "receivedUnixTime": 1698398535}, {"configId": 8, "receivedUnixTime": 1698398535}, {"configId": 9, "receivedUnixTime": 1698398535}, {"configId": 10, "receivedUnixTime": 1698398535}, {"configId": 11, "receivedUnixTime": 1698398535}, {"configId": 12, "receivedUnixTime": 1698398535}, {"configId": 13, "receivedUnixTime": 1698398535}, {"configId": 14, "receivedUnixTime": 1698398535}, {"configId": 15, "receivedUnixTime": 1698398535}, {"configId": 16, "receivedUnixTime": 1698398535}, {"configId": 17, "receivedUnixTime": 1698398535}, {"configId": 18, "receivedUnixTime": 1698398535}, {"configId": 19, "receivedUnixTime": 1698398535}, {"configId": 20, "receivedUnixTime": 1698398535}, {"configId": 21, "receivedUnixTime": 1698398535}, {"configId": 22, "receivedUnixTime": 1698398535}, {"configId": 23, "receivedUnixTime": 1698398535}, {"configId": 24, "receivedUnixTime": 1698398535}, {"configId": 25, "receivedUnixTime": 1698398535}, {"configId": 26, "receivedUnixTime": 1698398535}, {"configId": 27, "receivedUnixTime": 1698398535}, {"configId": 28, "receivedUnixTime": 1698398535}, {"configId": 29, "receivedUnixTime": 1698398535}, {"configId": 30, "receivedUnixTime": 1698398535}, {"configId": 31, "receivedUnixTime": 1698398535}, {"configId": 32, "receivedUnixTime": 1698398535}, {"configId": 33, "receivedUnixTime": 1698398535}, {"configId": 34, "receivedUnixTime": 1698398535}, {"configId": 35, "receivedUnixTime": 1698398535}, {"configId": 36, "receivedUnixTime": 1698398535}, {"configId": 37, "receivedUnixTime": 1698398535}, {"configId": 38, "receivedUnixTime": 1698398535}, {"configId": 39, "receivedUnixTime": 1698398535}, {"configId": 40, "receivedUnixTime": 1698398535}, {"configId": 41, "receivedUnixTime": 1698398535}, {"configId": 42, "receivedUnixTime": 1698398535}, {"configId": 43, "receivedUnixTime": 1698398535}, {"configId": 44, "receivedUnixTime": 1698398535}, {"configId": 45, "receivedUnixTime": 1698398535}, {"configId": 46, "receivedUnixTime": 1698398535}, {"configId": 47, "receivedUnixTime": 1698398535}, {"configId": 48, "receivedUnixTime": 1698398535}, {"configId": 49, "receivedUnixTime": 1698398535}, {"configId": 50, "receivedUnixTime": 1698398535}, {"configId": 51, "receivedUnixTime": 1698398535}, {"configId": 52, "receivedUnixTime": 1698398535}, {"configId": 53, "receivedUnixTime": 1698398535}, {"configId": 54, "receivedUnixTime": 1698398535}, {"configId": 55, "receivedUnixTime": 1698398535}, {"configId": 56, "receivedUnixTime": 1698398535}, {"configId": 57, "receivedUnixTime": 1698398535}, {"configId": 58, "receivedUnixTime": 1698398535}, {"configId": 59, "receivedUnixTime": 1698398535}, {"configId": 60, "receivedUnixTime": 1698398535}, {"configId": 61, "receivedUnixTime": 1698398535}, {"configId": 62, "receivedUnixTime": 1698398535}, {"configId": 63, "receivedUnixTime": 1698398535}, {"configId": 64, "receivedUnixTime": 1698398535}, {"configId": 65, "receivedUnixTime": 1698398535}, {"configId": 66, "receivedUnixTime": 1698398535}, {"configId": 67, "receivedUnixTime": 1698398535}, {"configId": 68, "receivedUnixTime": 1698398535}, {"configId": 69, "receivedUnixTime": 1698398535}, {"configId": 70, "receivedUnixTime": 1698398535}, {"configId": 71, "receivedUnixTime": 1698398535}, {"configId": 72, "receivedUnixTime": 1698398535}, {"configId": 73, "receivedUnixTime": 1698398535}, {"configId": 74, "receivedUnixTime": 1698398535}, {"configId": 75, "receivedUnixTime": 1698398535}, {"configId": 76, "receivedUnixTime": 1698398535}, {"configId": 77, "receivedUnixTime": 1698398535}, {"configId": 78, "receivedUnixTime": 1698398535}, {"configId": 79, "receivedUnixTime": 1698398535}, {"configId": 80, "receivedUnixTime": 1698398535}, {"configId": 81, "receivedUnixTime": 1698398535}, {"configId": 82, "receivedUnixTime": 1698398535}, {"configId": 83, "receivedUnixTime": 1698398535}, {"configId": 84, "receivedUnixTime": 1698398535}, {"configId": 85, "receivedUnixTime": 1698398535}, {"configId": 86, "receivedUnixTime": 1698398535}, {"configId": 87, "receivedUnixTime": 1698398535}, {"configId": 88, "receivedUnixTime": 1698398535}, {"configId": 89, "receivedUnixTime": 1698398535}, {"configId": 90, "receivedUnixTime": 1698398535}, {"configId": 91, "receivedUnixTime": 1698398535}, {"configId": 92, "receivedUnixTime": 1698398535}, {"configId": 93, "receivedUnixTime": 1698398535}, {"configId": 94, "receivedUnixTime": 1698398535}, {"configId": 95, "receivedUnixTime": 1698398535}, {"configId": 96, "receivedUnixTime": 1698398535}, {"configId": 97, "receivedUnixTime": 1698398535}, {"configId": 98, "receivedUnixTime": 1698398535}, {"configId": 99, "receivedUnixTime": 1698398535}, {"configId": 100, "receivedUnixTime": 1698398535}, {"configId": 101, "receivedUnixTime": 1698398535}, {"configId": 102, "receivedUnixTime": 1698398535}]	{"enterGame": 53}	0	1698319024	1696844792	{}	{"thing": 0, "common": 0, "character": 0, "furniture": 0.09}	{"reason": "0", "blockTime": 0, "blockedTo": 0}	none	1696844792	none	0	[{"time": 172800, "timeEnd": 1698492373, "configId": 1}]
10	50	f	f	0	[{"configId": 1, "receivedUnixTime": 1698309994}]	{"enterGame": 4}	0	0	1698309730	{}	{"thing": 0, "common": 0, "character": 0, "furniture": 0}	{"reason": "0", "blockTime": 0, "blockedTo": 0}	none	1698309730	none	0	[]
11	49	f	f	346	[{"configId": 3, "receivedUnixTime": 1698393702}, {"configId": 4, "receivedUnixTime": 1698393702}, {"configId": 5, "receivedUnixTime": 1698393702}, {"configId": 6, "receivedUnixTime": 1698393702}, {"configId": 7, "receivedUnixTime": 1698393702}, {"configId": 8, "receivedUnixTime": 1698393702}, {"configId": 9, "receivedUnixTime": 1698393702}, {"configId": 10, "receivedUnixTime": 1698393702}, {"configId": 11, "receivedUnixTime": 1698393702}, {"configId": 12, "receivedUnixTime": 1698393702}, {"configId": 13, "receivedUnixTime": 1698393702}, {"configId": 14, "receivedUnixTime": 1698393702}, {"configId": 15, "receivedUnixTime": 1698393702}, {"configId": 16, "receivedUnixTime": 1698393702}, {"configId": 17, "receivedUnixTime": 1698393702}, {"configId": 18, "receivedUnixTime": 1698393702}, {"configId": 19, "receivedUnixTime": 1698393702}, {"configId": 20, "receivedUnixTime": 1698393702}, {"configId": 21, "receivedUnixTime": 1698393702}, {"configId": 22, "receivedUnixTime": 1698393702}, {"configId": 23, "receivedUnixTime": 1698393702}, {"configId": 24, "receivedUnixTime": 1698393702}, {"configId": 25, "receivedUnixTime": 1698393702}, {"configId": 26, "receivedUnixTime": 1698393702}, {"configId": 27, "receivedUnixTime": 1698393702}, {"configId": 28, "receivedUnixTime": 1698393702}, {"configId": 29, "receivedUnixTime": 1698393702}, {"configId": 30, "receivedUnixTime": 1698393702}, {"configId": 31, "receivedUnixTime": 1698393702}, {"configId": 32, "receivedUnixTime": 1698393702}, {"configId": 33, "receivedUnixTime": 1698393702}, {"configId": 34, "receivedUnixTime": 1698393702}, {"configId": 35, "receivedUnixTime": 1698393702}, {"configId": 36, "receivedUnixTime": 1698393702}, {"configId": 37, "receivedUnixTime": 1698393702}, {"configId": 38, "receivedUnixTime": 1698393702}, {"configId": 39, "receivedUnixTime": 1698393702}, {"configId": 40, "receivedUnixTime": 1698393702}, {"configId": 41, "receivedUnixTime": 1698393702}, {"configId": 42, "receivedUnixTime": 1698393702}, {"configId": 43, "receivedUnixTime": 1698393702}, {"configId": 44, "receivedUnixTime": 1698393702}, {"configId": 45, "receivedUnixTime": 1698393702}, {"configId": 46, "receivedUnixTime": 1698393702}, {"configId": 47, "receivedUnixTime": 1698393702}, {"configId": 48, "receivedUnixTime": 1698393702}, {"configId": 49, "receivedUnixTime": 1698393702}, {"configId": 50, "receivedUnixTime": 1698393702}, {"configId": 51, "receivedUnixTime": 1698393702}, {"configId": 52, "receivedUnixTime": 1698393702}, {"configId": 53, "receivedUnixTime": 1698393702}, {"configId": 54, "receivedUnixTime": 1698393702}, {"configId": 55, "receivedUnixTime": 1698393702}, {"configId": 56, "receivedUnixTime": 1698393702}, {"configId": 57, "receivedUnixTime": 1698393702}, {"configId": 58, "receivedUnixTime": 1698393702}, {"configId": 59, "receivedUnixTime": 1698393702}, {"configId": 60, "receivedUnixTime": 1698393702}, {"configId": 61, "receivedUnixTime": 1698393702}, {"configId": 62, "receivedUnixTime": 1698393702}, {"configId": 63, "receivedUnixTime": 1698393702}, {"configId": 64, "receivedUnixTime": 1698393702}, {"configId": 65, "receivedUnixTime": 1698393702}, {"configId": 66, "receivedUnixTime": 1698393702}, {"configId": 67, "receivedUnixTime": 1698393702}, {"configId": 68, "receivedUnixTime": 1698393702}, {"configId": 69, "receivedUnixTime": 1698393702}, {"configId": 70, "receivedUnixTime": 1698393702}, {"configId": 71, "receivedUnixTime": 1698393702}, {"configId": 72, "receivedUnixTime": 1698393702}, {"configId": 73, "receivedUnixTime": 1698393702}, {"configId": 74, "receivedUnixTime": 1698393702}, {"configId": 75, "receivedUnixTime": 1698393702}, {"configId": 76, "receivedUnixTime": 1698393702}, {"configId": 77, "receivedUnixTime": 1698393702}, {"configId": 78, "receivedUnixTime": 1698393702}, {"configId": 79, "receivedUnixTime": 1698393702}, {"configId": 80, "receivedUnixTime": 1698393702}, {"configId": 81, "receivedUnixTime": 1698393702}, {"configId": 82, "receivedUnixTime": 1698393702}, {"configId": 83, "receivedUnixTime": 1698393702}, {"configId": 84, "receivedUnixTime": 1698393702}, {"configId": 85, "receivedUnixTime": 1698393702}, {"configId": 86, "receivedUnixTime": 1698393702}, {"configId": 87, "receivedUnixTime": 1698393702}, {"configId": 88, "receivedUnixTime": 1698393702}, {"configId": 89, "receivedUnixTime": 1698393702}, {"configId": 90, "receivedUnixTime": 1698393702}, {"configId": 91, "receivedUnixTime": 1698393702}, {"configId": 92, "receivedUnixTime": 1698393702}, {"configId": 93, "receivedUnixTime": 1698393702}, {"configId": 94, "receivedUnixTime": 1698393702}, {"configId": 95, "receivedUnixTime": 1698393702}, {"configId": 96, "receivedUnixTime": 1698393702}, {"configId": 97, "receivedUnixTime": 1698393702}, {"configId": 98, "receivedUnixTime": 1698393702}, {"configId": 99, "receivedUnixTime": 1698393702}, {"configId": 100, "receivedUnixTime": 1698393702}, {"configId": 101, "receivedUnixTime": 1698393702}, {"configId": 102, "receivedUnixTime": 1698393702}, {"configId": 1, "receivedUnixTime": 1698395152}]	{"enterGame": 3}	1	1698395064	1698393702	{"0": [9]}	{"thing": 0, "common": 0, "character": 0.009500000000000005, "furniture": 0}	{"reason": "0", "blockTime": 0, "blockedTo": 0}	none	1698393702	none	0	[{"time": 40320, "timeEnd": 1698435423, "configId": 1}, {"time": 1080, "timeEnd": 1698397125, "configId": 0}]
8	48	f	f	50415	[{"configId": 1, "receivedUnixTime": 1697113504}]	{"enterGame": 93}	0	1697552084	1697055193	{}	{"thing": 0, "common": 0, "character": 0.010500000000000006, "furniture": 0}	{"reason": "0", "blockTime": 0, "blockedTo": 0}	none	1697055193	none	1	[]
6	39	f	f	4908787	[{"configId": 1, "receivedUnixTime": 1696679963}, {"configId": 3, "receivedUnixTime": 1698362017}, {"configId": 4, "receivedUnixTime": 1698362017}, {"configId": 5, "receivedUnixTime": 1698362017}, {"configId": 6, "receivedUnixTime": 1698362017}, {"configId": 7, "receivedUnixTime": 1698362017}, {"configId": 8, "receivedUnixTime": 1698362017}, {"configId": 9, "receivedUnixTime": 1698362017}, {"configId": 10, "receivedUnixTime": 1698362017}, {"configId": 11, "receivedUnixTime": 1698362017}, {"configId": 12, "receivedUnixTime": 1698362017}, {"configId": 13, "receivedUnixTime": 1698362017}, {"configId": 14, "receivedUnixTime": 1698362017}, {"configId": 15, "receivedUnixTime": 1698362017}, {"configId": 16, "receivedUnixTime": 1698362017}, {"configId": 17, "receivedUnixTime": 1698362017}, {"configId": 18, "receivedUnixTime": 1698362017}, {"configId": 19, "receivedUnixTime": 1698362017}, {"configId": 20, "receivedUnixTime": 1698362017}, {"configId": 21, "receivedUnixTime": 1698362017}, {"configId": 22, "receivedUnixTime": 1698362017}, {"configId": 23, "receivedUnixTime": 1698362017}, {"configId": 24, "receivedUnixTime": 1698362017}, {"configId": 25, "receivedUnixTime": 1698362017}, {"configId": 26, "receivedUnixTime": 1698362017}, {"configId": 27, "receivedUnixTime": 1698362017}, {"configId": 28, "receivedUnixTime": 1698362017}, {"configId": 29, "receivedUnixTime": 1698362017}, {"configId": 30, "receivedUnixTime": 1698362017}, {"configId": 31, "receivedUnixTime": 1698362017}, {"configId": 32, "receivedUnixTime": 1698362017}, {"configId": 33, "receivedUnixTime": 1698362017}, {"configId": 34, "receivedUnixTime": 1698362017}, {"configId": 35, "receivedUnixTime": 1698362017}, {"configId": 36, "receivedUnixTime": 1698362017}, {"configId": 37, "receivedUnixTime": 1698362017}, {"configId": 38, "receivedUnixTime": 1698362017}, {"configId": 39, "receivedUnixTime": 1698362017}, {"configId": 40, "receivedUnixTime": 1698362017}, {"configId": 41, "receivedUnixTime": 1698362017}, {"configId": 42, "receivedUnixTime": 1698362017}, {"configId": 43, "receivedUnixTime": 1698362017}, {"configId": 44, "receivedUnixTime": 1698362017}, {"configId": 45, "receivedUnixTime": 1698362017}, {"configId": 46, "receivedUnixTime": 1698362017}, {"configId": 47, "receivedUnixTime": 1698362017}, {"configId": 48, "receivedUnixTime": 1698362017}, {"configId": 49, "receivedUnixTime": 1698362017}, {"configId": 50, "receivedUnixTime": 1698362017}, {"configId": 51, "receivedUnixTime": 1698362017}, {"configId": 52, "receivedUnixTime": 1698362017}, {"configId": 53, "receivedUnixTime": 1698362017}, {"configId": 54, "receivedUnixTime": 1698362017}, {"configId": 55, "receivedUnixTime": 1698362017}, {"configId": 56, "receivedUnixTime": 1698362017}, {"configId": 57, "receivedUnixTime": 1698362017}, {"configId": 58, "receivedUnixTime": 1698362017}, {"configId": 59, "receivedUnixTime": 1698362017}, {"configId": 60, "receivedUnixTime": 1698362017}, {"configId": 61, "receivedUnixTime": 1698362017}, {"configId": 62, "receivedUnixTime": 1698362017}, {"configId": 63, "receivedUnixTime": 1698362017}, {"configId": 64, "receivedUnixTime": 1698362017}, {"configId": 65, "receivedUnixTime": 1698362017}, {"configId": 66, "receivedUnixTime": 1698362017}, {"configId": 67, "receivedUnixTime": 1698362017}, {"configId": 68, "receivedUnixTime": 1698362017}, {"configId": 69, "receivedUnixTime": 1698362017}, {"configId": 70, "receivedUnixTime": 1698362017}, {"configId": 71, "receivedUnixTime": 1698362017}, {"configId": 72, "receivedUnixTime": 1698362017}, {"configId": 73, "receivedUnixTime": 1698362017}, {"configId": 74, "receivedUnixTime": 1698362017}, {"configId": 75, "receivedUnixTime": 1698362017}, {"configId": 76, "receivedUnixTime": 1698362017}, {"configId": 77, "receivedUnixTime": 1698362017}, {"configId": 78, "receivedUnixTime": 1698362017}, {"configId": 79, "receivedUnixTime": 1698362017}, {"configId": 80, "receivedUnixTime": 1698362017}, {"configId": 81, "receivedUnixTime": 1698362017}, {"configId": 82, "receivedUnixTime": 1698362017}, {"configId": 83, "receivedUnixTime": 1698362017}, {"configId": 84, "receivedUnixTime": 1698362017}, {"configId": 85, "receivedUnixTime": 1698362017}, {"configId": 86, "receivedUnixTime": 1698362017}, {"configId": 87, "receivedUnixTime": 1698362017}, {"configId": 88, "receivedUnixTime": 1698362017}, {"configId": 89, "receivedUnixTime": 1698362017}, {"configId": 90, "receivedUnixTime": 1698362017}, {"configId": 91, "receivedUnixTime": 1698362017}, {"configId": 92, "receivedUnixTime": 1698362017}, {"configId": 93, "receivedUnixTime": 1698362017}, {"configId": 94, "receivedUnixTime": 1698362017}, {"configId": 95, "receivedUnixTime": 1698362017}, {"configId": 96, "receivedUnixTime": 1698362017}, {"configId": 97, "receivedUnixTime": 1698362017}, {"configId": 98, "receivedUnixTime": 1698362017}, {"configId": 99, "receivedUnixTime": 1698362017}, {"configId": 100, "receivedUnixTime": 1698362017}, {"configId": 101, "receivedUnixTime": 1698362017}, {"configId": 102, "receivedUnixTime": 1698362017}]	{"enterGame": 480}	0	1698451876	1696591344	{"0": [1, 9, 8, 7, 6, 2, 5, 4, 3, 10, 13, 14, 15, 17, 16]}	{"thing": 0, "common": 0, "character": 0.0025, "furniture": 0}	{"reason": "0", "blockTime": 0, "blockedTo": 0}	none	1696591344	none	0	[]
\.


--
-- TOC entry 3593 (class 0 OID 19279)
-- Dependencies: 267
-- Data for Name: raid_cells; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raid_cells (id, cells_count, prestige) FROM stdin;
1	2	0
2	3	50
3	4	100
4	5	200
\.


--
-- TOC entry 3605 (class 0 OID 19379)
-- Dependencies: 279
-- Data for Name: raid_count_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raid_count_items (id, min, max) FROM stdin;
1	3	5
4	30	35
0	1	2
3	24	26
2	10	17
\.


--
-- TOC entry 3553 (class 0 OID 18578)
-- Dependencies: 227
-- Data for Name: raid_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raid_locations (id, name, icon, loot_box_id) FROM stdin;
1	disney land	disney.png	1
\.


--
-- TOC entry 3569 (class 0 OID 18711)
-- Dependencies: 243
-- Data for Name: ru_lang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ru_lang (id, key, type, text) FROM stdin;
1	login	auth	Почта
2	password	auth	Пароль
3	sign-up	auth	Регистрация
4	sign-in	auth	Вход
6	cannot-buy-now	notify	Невозможно купить сейчас
15	character	notify	Персонаж
16	furniture	notify	Мебель
17	loot-boxes	notify	Эггбоксы
18	maintenance	notify	Обслуживание
20	settings_header	settings	Настройки
21	settings_sound_ui	settings	Звуки интерфейса
22	settings_sound_ambient	settings	Звуки окружения
23	common_reset	common	Сбросить
24	common_close	common	Закрыть
25	common_apply	common	Применить
27	common_yes	common	Да
28	common_no	common	Нет
29	common_confirm	common	Вы действительно хотите выполнить это действие?
30	message_new	message	Новое письмо
31	message_readen	message	Прочитанное письмо
32	message_open	message	Открытое письмо
33	common_cancel	common	Отменить
34	common_send	common	Отправить
35	common_confirmation	common	Подтверждение
37	adventure_time_selector	adventure	Время приключений
38	adventure_header	adventure	Гостинная
39	adventure_claim_char	adventure	Забрать
40	adventure_return_force_1	adventure	Вы действительно хотите вернуть персонажа досрочно?
41	adventure_return_force_2	adventure	Он вернётся сам:
42	common_return	common	Вернуть
43	common_claim	common	Забрать
45	adventure_empty	adventure	ПУСТО
46	filters_header	common	Фильтры
47	filters_alphabet	filters	От А до Я
48	filters_alphabet_desc	filters	От Я до А
49	filters_level	filters	От мин. уровня
50	filters_level_desc	filters	От макс. уровня
51	filters_power	filters	От мин. силы
52	filters_power_desc	filters	От макс. силы
53	filters_nft	filters	NFT
54	filters_regular	filters	Обычные
55	filters_char_placed	filters	Занятые
56	filters_char_free	filters	Свободные
57	filters_fur_placed	filters	Установленные
58	filters_fur_free	filters	На складе
59	filters_prestige	filters	От мин. престижа
60	filters_prestige_desc	filters	От макс. престижа
61	filters_sorting	filters	Сортировка
62	common_buy	common	Купить
63	shop_purchased	shop	Приобретено
64	shop_not_available	shop	Нет в наличии
65	shop_update	shop	Магазин обновится через {0}
66	book_prev_page	book	Предыдущая страница
67	book_next_page	book	Следующая страница
68	charcard_header	charcard	Личная карточка
69	charcard_reqs	charcard	Потребности
70	charcard_friends	charcard	Лучшие друзья
71	charcard_perks	charcard	Перки
72	Shark_Fakir	unit	Факир
73	Shark_Halif	unit	Халиф
74	Shark_Medjay	unit	Меджай
75	Shark_Merchant	unit	Торговец
76	Shark_Princess	unit	Принцесса
77	Dino_Boss	unit	Босс
78	Dino_Lucky	unit	Счастливчик
79	Dino_Sleepy	unit	Засоня
80	Dino_Welder	unit	Сварщик
82	Pin_Aristocrat	unit	Аристократ
83	Pin_Barman	unit	Бармен
84	Pin_Dancer	unit	Танцор
85	Pin_DJ	unit	Диджей
86	Pin_Romantic	unit	Романтик
87	Hippo_Tourist	unit	Турист
88	Hippo_Captain	unit	Капитан
90	Hippo_Photo	unit	Фотограф
91	Hippo_Somelje	unit	Сомелье
92	Vikings	unit	Vikings
93	Unit_Sharks	unit	Акулы
94	Unit_Dino	unit	Динозавры
95	Unit_Pin	unit	Пингвины
7	max-count-for-day	notify	На сегодня, пожалуй, хватит
36	adventure_send_text	adventure	Вы действительно хотите отправить персонажа в приключение?
44	adventure_location_info	adventure	Какая большая комната, \\r\\n интересно, что тут можно найти для нашего дома?
96	Unit_Hippo	unit	Бегемоты
372	book_invalid_character	book	Сейчас нельзя применить этот предмет к данному персонажу
371	book_confirm_character	book\n	Вы действительно хотите применить этот предмет к данному персонажу?
135	Fur_s3_Box_1	furniture	Fur_s3_Box_1
136	Fur_s3_Box_2	furniture	Fur_s3_Box_2
137	Fur_s3_Box_3	furniture	Fur_s3_Box_3
138	Fur_s3_Box_4	furniture	Fur_s3_Box_4
204	Fur_s6_Apple	furniture	Fur_s6_Apple
98	Bed_2	furniture	Кровать "Детская"
373	book_use_common	book	Вы действительно хотите использовать данный предмет?
217	Fur_s6_Cup	furniture	Fur_s6_Cup
218	Fur_s6_Fruit	furniture	Fur_s6_Fruit
226	Fur_s6_Pasta	furniture	Fur_s6_Pasta
228	Fur_s6_Spoon	furniture	Fur_s6_Spoon
233	Buttons Collector	furniture	Buttons Collector
234	Armchair Group	furniture	Armchair Group
235	Bed Group	furniture	Bed Group
236	Chair Group	furniture	Chair Group
237	Closet Group	furniture	Closet Group
238	Decor Group	furniture	Decor Group
239	Test Group	furniture	Test Group
240	Lootbox Group	furniture	Lootbox Group
241	Luxury Group	furniture	Luxury Group
242	Nightstand Group	furniture	Nightstand Group
243	Sofa Group	furniture	Sofa Group
244	Special(NonDestroy)	furniture	Special(NonDestroy)
245	Table Group	furniture	Table Group
246	wallObjects Group	furniture	wallObjects Group
247	map_blocked	map	Предмет заблокирован другими предметами
248	Perk_Bussines	perks	Бизнес-ланч
280	Item_Binoculars	items	Бинокль
282	Item_Blade	items	Клинок
286	Item_Bracer	items	Наручи
290	Item_Camera	items	Фотоаппарат
298	Item_Discosphere	items	Дискошар
300	Item_Drill	items	Дрель
302	Item_DVD	items	Диск
304	Item_Fluite	items	Флейта
310	Item_Gift	items	Подарок
316	Item_Hammer	items	Молоточек
320	Item_Jewelry	items	Украшение
249	Perk_D_Bussines	perks	После хорошей трапезы пуговицы сами появляются у меня в руках! Честное слово
251	Perk_D_ButtonFairy	perks	Стоит мне только прилечь отдохнуть, как пуговица сразу оказывается у меня под подушкой
253	Perk_D_Buttonfall	perks	Пока я нахожусь на полке могу производить дополнительную пуговицу. Правда у меня это получается не всегда...
255	Perk_D_Buttonist	perks	Мне точно кто-то подкладывает пуговицу после того как я с кем-нибудь пообщаюсь
276	Item_Alarm	items	Будильник
277	Item_D_Alarm	items	Даже будильник не всегда может меня разбудить
278	Item_Beret	items	Модный берет
279	Item_D_Beret	items	Как бы ты его не надел, он все равно будет смотреться круто
281	Item_D_Binoculars	items	Главное смотреть с правильной стороны
283	Item_D_Blade	items	Не переживайте - он не заточен
284	Item_Bouqet	items	Букет
285	Item_D_Bouqet	items	Цветы идеальный подарок для обаятельной леди
287	Item_D_Bracer	items	Прекрасный элемент защиты и украшения
292	Item_Cane	items	Трость
81	Dino_Destroyer	unit	Ломастер
370	Ach_D_Catch_Hippo	achievement	Ach_D_Catch_Hippo
369	Ach_Catch_Hippo	achievement	Ach_Catch_Hippo
368	Ach_D_Enter_game	achievement	Зайдите в игру 3 раза
367	Ach_Enter_game	achievement	Зайти в игру
97	Armchair_1	furniture	Простое кресло
99	Bedside Table_2	furniture	Тумбочка "Спички"
100	Bench_1	furniture	Скамья "Простушка"
101	BookShelf_1	furniture	Книжная полка "Простушка"
102	Carpet_1	furniture	Маленький коврик
103	Chair_1	furniture	Стул "Спички"
104	Closet_1	furniture	Шкаф "Простушка"
105	Easel_1	furniture	Обычный мольберт
106	Gramophone_1	furniture	Грамофон
107	Painting_1	furniture	Картина "Восход"
108	Radio_1	furniture	Игрушечное радио
109	Shelf_1	furniture	Полка "Черная коробка"
110	Shelf_2	furniture	Полка "Ваза"
111	Sofa_1	furniture	Диван "Простушка"
113	TV_1	furniture	Телевизор "Спички"
114	s2_Bed_1	furniture	Модная кровать "Домино"
115	s2_Bed_2	furniture	Большая кровать "Домино"
117	s2_Bookshelf	furniture	Книжная полка "Домино"
118	s2_Carpet	furniture	Половичок "Домашний"
119	s2_Chair_1	furniture	Стул "Домашний"
120	s2_Chair_2	furniture	Стул "Пуговица"
121	s2_Closet_1	furniture	Большой шкаф "Домино"
122	s2_Closet_2	furniture	Шкаф "Домино"
123	s2_CoffeTable	furniture	Тумбочка "Домино"
124	s2_Lamp	furniture	Лампа-провод
125	s2_Shelf	furniture	Полка "Домино"
126	s2_Sofa_1	furniture	Диван "Домино черный"
127	s2_Sofa_2	furniture	Диван "Домино белый"
129	s2_TV	furniture	Телевизор "Домино"
130	s2_Window	furniture	Окно "Минимализм"
131	Fur_s3_Armchair	furniture	Кресло-шезлонг
132	Fur_s3_Bed	furniture	Кровать "Мороженое"
133	Fur_s3_Bench	furniture	Лавка "Батарейка"
134	Fur_s3_Bookshelf	furniture	Книжный шкаф "Мороженое"
139	Fur_s3_Carpet	furniture	Пушистый ковер
142	Fur_s3_CoffeTable	furniture	Столик "Гайка"
144	Fur_s3_Lamp	furniture	Лампа "Деревяшка"
145	Fur_s3_Painting_2	furniture	Картина "Лепесток"
146	Fur_s3_Painting_3	furniture	Картина "Букет"
147	Fur_s3_Sofa_1	furniture	Диван "Батарейка"
148	Fur_s3_Sofa_2	furniture	Диван "Мороженое"
149	Fur_s3_Table	furniture	Стол "Мороженое"
150	Fur_s3_Vase	furniture	Ваза "Пластиковый куст"
151	Fur_s3_Window_3	furniture	Окно "Мороженое"
152	Fur_s3_Window_4	furniture	Окно "Мороженое"
153	Fur_s3_WorkTable	furniture	Стол "Точилка"
154	Fur_s4_Armchair_1	furniture	Кресло "Ложка"
155	Fur_s4_Armchair_2	furniture	Кресло-кружка "Сервиз" 
158	Fur_s4_Bench	furniture	Скамья "Мороженое"
140	Fur_s3_Chair	furniture	Стул "Мороженое"
330	Item_Rollex	items	Часы
342	Item_Skatch	items	Чертежи
343	Item_D_Skatch	items	Работаем строго по чертежам!
348	Item_Ticket	items	Билет
329	Item_D_PhotoAlbum	items	Толстенький альбом с сотнями фотографий
331	Item_D_Rollex	items	Сделаны на заказ
332	Item_Sash	items	Кушак
333	Item_D_Sash	items	Как его правильно надевать?
334	Item_Scarf	items	Декоративный шарфик
335	Item_D_Scarf	items	Последний писк моды
336	Item_Shaker	items	Шейкер
346	Item_Tape	items	Рулетка
347	Item_D_Tape	items	Семь раз отмерь, один раз отрежь
156	Fur_s4_Armchair_3	furniture	Кресло "Тюбик"
159	Fur_s4_Bookshelf	furniture	Книжный шкаф "Конфетница"
160	Fur_s4_Chair	furniture	Стульчик "Орех"
161	Fur_s4_Closet_1	furniture	Вешалка из катушек
162	Fur_s4_Closet_2	furniture	Шкаф "Конфетница"
163	Fur_s4_CoffeTable	furniture	Столик "Стеклышко"
164	Fur_s4_Shelfs	furniture	Полка "Мороженое" 
165	Fur_s4_Sofa_1	furniture	Диван "Флакончик"
166	Fur_s4_Sofa_2	furniture	Диван "Гребешок"
167	Fur_s4_Table_3	furniture	Стол "Ножка"
168	Fur_s4_Table_4	furniture	Столик "Паззл"
169	Fur_s5_Armchair	furniture	Кресло-кружка "Ночь"
170	Fur_s5_Chair	furniture	Стульчик "Звездочка"
171	Fur_s5_Closet_3	furniture	Гардероб "Аристократ"
172	Fur_s5_Closet_4	furniture	Шкаф "Аристократ"
173	Fur_s5_Closet_5	furniture	Закрытый шкаф "Аристократ"
174	Fur_s5_Closet_6	furniture	Шкаф "Конфетница-флаг"
175	Fur_s5_CoffeTable_3	furniture	Столик "Пятак"
176	Fur_s5_CoffeTable_4	furniture	Столик "Медняк"
177	Fur_s5_CoffeTable_5	furniture	Столик "Линейка"
178	Fur_s5_Light	furniture	Уютная лампа
179	Fur_s5_Radio_2	furniture	Радио-кирпичек
180	Fur_s5_Shelfs_4	furniture	Полка "Малышка"
181	Fur_s5_Shelfs_5	furniture	Полка "Сестрица"
182	Fur_s5_Shelfs_6	furniture	Полка "Читатель"
183	Fur_s5_Sofa_4	furniture	Диван "Конструктор"
184	Fur_s5_Table_5	furniture	Стол-конструктор "Простота"
185	Fur_s5_Table_6	furniture	Стол-конструктор "Утро"
186	Fur_s5_Table_7	furniture	Стол-конструктор "Бизнес"
187	Fur_s5_Table_8	furniture	Стол-конструктор "Кофе"
188	Fur_s5_Table_9	furniture	Чистый стол-конструктор
189	Fur_s5_Table_10	furniture	Стол "Конструктор"
190	Fur_s5_Table_11	furniture	Стол-шашечка "Зеленый"
191	Fur_s5_Table_12	furniture	Стол-шашечка "Модерн"
192	Fur_s5_Table_13	furniture	Стол-шашечка "Романтика"
193	Fur_s5_Table_14	furniture	Стол-шашечка "Розовый"
194	Fur_s5_Table_15	furniture	Стол-шашечка "Циферблат"
195	Fur_s5_Table_16	furniture	Стол "Аристократ"
196	Fur_s5_Table_17	furniture	Стол-карта "Завтрак"
197	Fur_s5_Table_18	furniture	Стол-карта "Фиалка"
198	Fur_s5_Table_19	furniture	Стол-карта "Праздник"
199	Fur_s5_Table_20	furniture	Стол-карта "Чаепитие"
200	Fur_s5_Table_21	furniture	Стол-дайс "Вечеринка"
201	Fur_s5_Table_22	furniture	Стол-дайс "Азия"
202	Fur_s5_Table_23	furniture	Стол-дайс "Дзен"
203	Fur_s5_Table_24	furniture	Стол-дайс "Аристократ"
205	Fur_s6_Armchair_1	furniture	Кресло-кружка "Бариста"
206	Fur_s6_Armchair_2	furniture	Кресло-кружка "Церемония"
207	Fur_s6_Armchair_3	furniture	Кресло-кружка "Наоборот"
208	Fur_s6_Basket_1	furniture	Кукольная корзинка
209	Fur_s6_Bookshelf	furniture	Книжный шкаф "Деталька"
210	Fur_s6_Box	furniture	Мини-коробка
211	Fur_s6_Bush_1	furniture	Горшок-наперсток
212	Fur_s6_Bush_2	furniture	Игрушечная корзинка
213	Fur_s6_Bush_3	furniture	Пластиковый кактус
214	Fur_s6_Closet	furniture	Закрытый шкаф "Деталька"
215	Fur_s6_CoffeTable_3	furniture	Тумбочка "Деталька"
216	Fur_s6_CoffeTable_4	furniture	Мини-столик "Деталька"
219	Fur_s6_Jar	furniture	Игрушечная свечка
220	Fur_s6_Kettle	furniture	Игрушечный кувшин
221	Fur_s6_Lamp_3	furniture	Лампа кукол
222	Fur_s6_Lamp_4	furniture	Макет лампы
223	Fur_s6_Mirror	furniture	Маленькие зеркала
224	Fur_s6_Painting_3	furniture	Картина "Дерево"
225	Fur_s6_Painting_4	furniture	Картина "Месяц"
227	Fur_s6_Pinetree	furniture	Бумажная елка
229	Fur_s6_Umbrella	furniture	Игрушечные зонтики
230	Fur_s6_Vase	furniture	Кукольная вазочка
231	Fur_s6_Wardrobe	furniture	Шкаф "Деталька"
232	Fur_s6_WorkTable	furniture	Письменный стол "Деталька"
89	Hippo_Officiant	unit	Официант
374	charcard_lvlup	charcard	Повысить
112	Table_1	furniture	Стол "Простушка"
116	s2_Bench	furniture	Столик "Домино белый"
128	s2_Table	furniture	Столик "Домино черный"
157	Fur_s4_Bed	furniture	Кровать-портсигар
141	Fur_s3_Closet	furniture	Шкаф "Мороженое"
143	Fur_s3_Easel	furniture	Мольберт "Мороженое"
250	Perk_ButtonFairy	perks	Пугвичная фея
252	Perk_Buttonfall	perks	Пугвицопад
254	Perk_Buttonist	perks	Пугвитолог
256	Perk_Cheater	perks	Маленький хитрюга
258	Perk_Gift	perks	Подарочный предмет
260	Perk_Leader	perks	Лидер
262	Perk_Magician	perks	Фокусник
264	Perk_PowerGuys	perks	Сила друзей
266	Perk_Prestigionist	perks	Уютнолог
268	Perk_Speakersoul	perks	Душа компании
270	Perk_Speedrun	perks	Скороход
272	Perk_Stockman	perks	Кладовщик
274	Perk_Worker	perks	Трудяга
378	adventure_drag_here	adventure	ПЕРЕМЕСТИТЕ
380	adventure_locked	adventure	НЕДОСТУПНО
381	adventure_low_level	adventure	Низкий уровень
382	adventure_finished	adventure	ВЕРНУЛСЯ
379	adventure_select_character	adventure	Свободно
383	auth_wrong_login	auth	Введен неверный логин/пароль
384	auth_server_error	auth	Произошла ошибка на сервере, повторите попытку
385	auth_used_email	auth	Данная почта уже используется
5	something-went-wrong	notify	Что-то пошло не так, попробуйте снова
8	no-enough-money	notify	Не хватает пуговиц
9	space-blocked	notify	Попробуй поставить в другое место
10	buy-previous-group	notify	Эй! Не спеши так. Сперва купи, то что стоит раньше
11	dont-available-slots	notify	Слишком много персонажиков в приключении
12	cannot-find-location	notify	Нет подходящей локации
13	maintenance-now	notify	Упс! Время небольшого технического обновления
14	group-tiles	notify	Область полки
19	raid	notify	Приключение
26	regions_buy	regions	Вы действительно хотите приобрести это место на полке? Это обойдется вам в {0} пуговиц?
322	Item_Micro	items	Микрофон
328	Item_PhotoAlbum	items	Фотоальбом
365	book_confirm_charitem	book	Вы действительно хотите одеть данный предмет на персонажа?
366	book_invalid_charitem	book	Данный предмет нельзя одеть на персонажа
257	Perk_D_Cheater	perks	Иногда я краду пуговицу со склада, но только для того чтобы сделать из нее две. К сожалению не всегда успешно...
259	Perk_D_Gift	perks	Если я иду в приключение, то почти всегда нахожу дополнительный предмет
263	Perk_D_Magician	perks	Не знаю это дар или проклятие, но каждый час я нахожу пуговицу в самых необычных местах
265	Perk_D_PowerGuys	perks	Пока мы все живем на одной полке - мы будем намного сильнее!
267	Perk_D_Prestigionist	perks	Я могу сделать уютным, даже самое неопрятное и пыльное место
269	Perk_D_Speakersoul	perks	Мы с друзьями из моей коллекции будем намного сильнее, если окажемся на одной полке. Имей это в виду
271	Perk_D_Speedrun	perks	Я не торопыга, но из приключений возвращаюсь намного быстрее моих друзей
273	Perk_D_Stockman	perks	Я неплохо заведую хозяйством, поэтому мы можем уместить намного больше пуговиц на складе если я буду на полке
275	Perk_D_Worker	perks	Я всегда работаю очень усердно, поэтому и пуговицы добываю быстрее остальных
375	charcard_lvlup_confirm	charcard	Поднять уровень персонажа за {0} кнопок?
376	Perk_Favourite	perks	Фаворит
377	Perk_D_Favourite	perks	Мне кажется или я намного популярнее своих друзей? 
288	Item_BrickPillow	items	Кирпич-подушка
289	Item_D_BrickPillow	items	Хе-хе, шеф до сих пор не догадывается зачем я ношу с собой кирпичи
291	Item_D_Camera	items	Последняя модель фотокамеры, может снимать даже под водой
293	Item_D_Cane	items	Со мной все хорошо. Это просто часть образа
294	Item_Cap	items	Фуражка
295	Item_D_Cap	items	Чтобы все знали кто тут капитан
296	Item_Casket	items	Шкатулка
297	Item_D_Casket	items	Одна монетка хорошо, а сотня лучше
299	Item_D_Discosphere	items	Зажигаем!
301	Item_D_Drill	items	Только не включайте ее по утрам
303	Item_D_DVD	items	Последние хиты музыки
305	Item_D_Fluite	items	По слухам -  эта флейта может заставить танцевать кого угодно
306	Item_Frill	items	Жабо
307	Item_D_Frill	items	Костюм меня точно не полнит?
308	Item_FruitPlate	items	Тарелка с фруктами
309	Item_D_FruitPlate	items	Полезное и очень сытное угощение
311	Item_D_Gift	items	Сюрприз! Я если честно сам подзабыл что внутри...
312	Item_Glasscup	items	Граненный стакан
313	Item_D_Glasscup	items	Классический стакан для классических напитков
314	Item_GoldCoin	items	Золотая монета
360	Item_Wineglass	items	Фужер
315	Item_D_GoldCoin	items	Не сломай об нее зубы
317	Item_D_Hammer	items	Один раз по пальцу, один по гвоздю
318	Item_Helmet	items	Каска начальника
319	Item_D_Helmet	items	Белый цвет напоминает всем, что на этой стройке главный я
321	Item_D_Jewelry	items	Невероятно красивые и дорогие
323	Item_D_Micro	items	Устроим караоке!
324	Item_Napkin	items	Тканевая салфетка
325	Item_D_Napkin	items	Обязательный элемент любого сервиса
326	Item_Patch	items	Пластырь
327	Item_D_Patch	items	Для предотвращения последствий производственных травм
337	Item_D_Shaker	items	Кому тут сделать самый вкусный превкусный коктейль? 
338	Item_SilkHandkerchief	items	Шелковый платочек
339	Item_D_SilkHandkerchief	items	Тонкий аромат шалфея чувствуется от него за версту
340	Item_SilkPillow	items	Шелковая подушка
341	Item_D_SilkPillow	items	Мягкая и удобная подушка достойная султанов
344	Item_SnakeBasket	items	Корзинка со змей
345	Item_D_SnakeBasket	items	Без флейты лучше не рисковать
349	Item_D_Ticket	items	Куда мы отправимся на этот раз?
351	Item_D_Tray	items	Настолько идеальный, что в нем можно видеть свое отражение
352	Item_Wallet	items	Кошелек
353	Item_D_Wallet	items	С ним я выгляжу солиднее
354	Item_WelderMachine	items	Сварочный аппарат
355	Item_D_WelderMachine	items	Зачем мне дышать огнем, если эта штука делает это за меня?
356	Item_Weldermask	items	Маска сварщика
357	Item_D_Weldermask	items	Постоянно забываю опускать ее на лицо
358	Item_Whistle	items	Капитанский свисток
359	Item_D_Whistle	items	Помогает там, где голос бессилен 
361	Item_D_Wineglass	items	Изящный фужер только для дорогих напитков
362	Item_Wranch	items	Гаечный ключ
363	Item_D_Wranch	items	Ключ есть, осталось найти гайки
386	Cons_BlackSweet	consumables	Cons_BlackSweet
387	Cons_D_BlackSweet	consumables	Cons_D_BlackSweet
396	Cons_Part_Character	consumables	Cons_Part_Character
397	Cons_D_Part_Character	consumables	Cons_D_Part_Character
398	Cons_Part_Furniture	consumables	Cons_Part_Furniture
399	Cons_D_Part_Furniture	consumables	Cons_D_Part_Furniture
400	Cons_RaspSweet	consumables	Cons_RaspSweet
401	Cons_D_RaspSweet	consumables	Cons_D_RaspSweet
261	Perk_D_Leader	perks	Я прирожденный лидер, поэтому все мои друзья будут набираться опыта намного быстрее. Но помни - на полке может быть только\nодин лидер!"
350	Item_Tray	items	Поднос
394	Cons_OrangeSweet	consumables	Апельсиновая конфета
395	Cons_D_OrangeSweet	consumables	Увеличивает количество получаемых пуговиц
392	Cons_ManyGum	consumables	Куча жевачек
390	Cons_Gum	consumables	Жевачка
389	Cons_D_CoupleGum	consumables	Дает персонажу много опыта
393	Cons_D_ManyGum	consumables	Дает персонажу очень много опыта
388	Cons_CoupleGum	consumables	Много жевачек
391	Cons_D_Gum	consumables	Дает персонажу немного опыта
402	Ach_Listen_300	achievement	Ach_Listen_300
403	Ach_D_Listen_300	achievement	Ach_D_Listen_300
404	Ach_Listen_250	achievement	Ach_Listen_250
405	Ach_D_Listen_250	achievement	Ach_D_Listen_250
406	Ach_Listen_200	achievement	Ach_Listen_200
407	Ach_D_Listen_200	achievement	Ach_D_Listen_200
408	Ach_Listen_150	achievement	Ach_Listen_150
409	Ach_D_Listen_150	achievement	Ach_D_Listen_150
410	Ach_Listen_100	achievement	Ach_Listen_100
411	Ach_D_Listen_100	achievement	Ach_D_Listen_100
412	Ach_Listen_75	achievement	Ach_Listen_75
413	Ach_D_Listen_75	achievement	Ach_D_Listen_75
414	Ach_Listen_50	achievement	Ach_Listen_50
415	Ach_D_Listen_50	achievement	Ach_D_Listen_50
416	Ach_Listen_25	achievement	Ach_Listen_25
417	Ach_D_Listen_25	achievement	Ach_D_Listen_25
418	Ach_Listen_10	achievement	Ach_Listen_10
419	Ach_D_Listen_10	achievement	Ach_D_Listen_10
420	Ach_Listen_1	achievement	Ach_Listen_1
421	Ach_D_Listen_1	achievement	Ach_D_Listen_1
422	Ach_Dialog_5	achievement	Ach_Dialog_5
423	Ach_D_Dialog_5	achievement	Ach_D_Dialog_5
424	Ach_Dialog_1	achievement	Ach_Dialog_1
425	Ach_D_Dialog_1	achievement	Ach_D_Dialog_1
426	Ach_Dialog_10	achievement	Ach_Dialog_10
427	Ach_D_Dialog_10	achievement	Ach_D_Dialog_10
428	Ach_Dialog_20	achievement	Ach_Dialog_20
429	Ach_D_Dialog_20	achievement	Ach_D_Dialog_20
430	Ach_Dialog_35	achievement	Ach_Dialog_35
431	Ach_D_Dialog_35	achievement	Ach_D_Dialog_35
432	Ach_Dialog_50	achievement	Ach_Dialog_50
433	Ach_D_Dialog_50	achievement	Ach_D_Dialog_50
434	Ach_AdventureCount_200	achievement	Ach_AdventureCount_200
435	Ach_D_AdventureCount_200	achievement	Ach_D_AdventureCount_200
436	Ach_AdventureCount_500	achievement	Ach_AdventureCount_500
437	Ach_D_AdventureCount_500	achievement	Ach_D_AdventureCount_500
438	Ach_AdventureCount_1000	achievement	Ach_AdventureCount_1000
439	Ach_D_AdventureCount_1000	achievement	Ach_D_AdventureCount_1000
440	Ach_AdventureCount_100	achievement	Ach_AdventureCount_100
441	Ach_D_AdventureCount_100	achievement	Ach_D_AdventureCount_100
442	Ach_AdventureCount_50	achievement	Ach_AdventureCount_50
443	Ach_D_AdventureCount_50	achievement	Ach_D_AdventureCount_50
444	Ach_AdventureCount_25	achievement	Ach_AdventureCount_25
445	Ach_D_AdventureCount_25	achievement	Ach_D_AdventureCount_25
446	Ach_AdventureCount_5	achievement	Ach_AdventureCount_5
447	Ach_D_AdventureCount_5	achievement	Ach_D_AdventureCount_5
448	Ach_AdventureCount_1	achievement	Ach_AdventureCount_1
449	Ach_D_AdventureCount_1	achievement	Ach_D_AdventureCount_1
450	Ach_AdvEggs_10000	achievement	Ach_AdvEggs_10000
451	Ach_D_AdvEggs_10000	achievement	Ach_D_AdvEggs_10000
452	Ach_AdvEggs_5000	achievement	Ach_AdvEggs_5000
453	Ach_D_AdvEggs_5000	achievement	Ach_D_AdvEggs_5000
454	Ach_AdvEggs_1000	achievement	Ach_AdvEggs_1000
455	Ach_D_AdvEggs_1000	achievement	Ach_D_AdvEggs_1000
456	Ach_AdvEggs_500	achievement	Ach_AdvEggs_500
457	Ach_D_AdvEggs_500	achievement	Ach_D_AdvEggs_500
458	Ach_AdvEggs_200	achievement	Ach_AdvEggs_200
459	Ach_D_AdvEggs_200	achievement	Ach_D_AdvEggs_200
460	Ach_AdvEggs_100	achievement	Ach_AdvEggs_100
461	Ach_D_AdvEggs_100	achievement	Ach_D_AdvEggs_100
462	Ach_AdvEggs_50	achievement	Ach_AdvEggs_50
463	Ach_D_AdvEggs_50	achievement	Ach_D_AdvEggs_50
464	Ach_AdvEggs_25	achievement	Ach_AdvEggs_25
465	Ach_D_AdvEggs_25	achievement	Ach_D_AdvEggs_25
466	Ach_AdvEggs_5	achievement	Ach_AdvEggs_5
467	Ach_D_AdvEggs_5	achievement	Ach_D_AdvEggs_5
468	Ach_AdventureTime_1	achievement	Ach_AdventureTime_1
469	Ach_D_AdventureTime_1	achievement	Ach_D_AdventureTime_1
470	Ach_AdventureTime_10	achievement	Ach_AdventureTime_10
471	Ach_D_AdventureTime_10	achievement	Ach_D_AdventureTime_10
472	Ach_AdventureTime_50	achievement	Ach_AdventureTime_50
473	Ach_D_AdventureTime_50	achievement	Ach_D_AdventureTime_50
474	Ach_AdventureTime_100	achievement	Ach_AdventureTime_100
475	Ach_D_AdventureTime_100	achievement	Ach_D_AdventureTime_100
476	Ach_AdventureTime_500	achievement	Ach_AdventureTime_500
477	Ach_D_AdventureTime_500	achievement	Ach_D_AdventureTime_500
478	Ach_AdventureTime_1000	achievement	Ach_AdventureTime_1000
479	Ach_D_AdventureTime_1000	achievement	Ach_D_AdventureTime_1000
480	Ach_AdventureSoloTime_5000	achievement	Ach_AdventureSoloTime_5000
481	Ach_D_AdventureSoloTime_5000	achievement	Ach_D_AdventureSoloTime_5000
482	Ach_AdventureSoloTime_1000	achievement	Ach_AdventureSoloTime_1000
483	Ach_D_AdventureSoloTime_1000	achievement	Ach_D_AdventureSoloTime_1000
484	Ach_AdventureSoloTime_500	achievement	Ach_AdventureSoloTime_500
485	Ach_D_AdventureSoloTime_500	achievement	Ach_D_AdventureSoloTime_500
486	Ach_AdventureSoloTime_100	achievement	Ach_AdventureSoloTime_100
487	Ach_D_AdventureSoloTime_100	achievement	Ach_D_AdventureSoloTime_100
488	Ach_AdventureSoloTime_50	achievement	Ach_AdventureSoloTime_50
489	Ach_D_AdventureSoloTime_50	achievement	Ach_D_AdventureSoloTime_50
490	Ach_SpawnCharacters_5	achievement	Ach_SpawnCharacters_5
491	Ach_D_SpawnCharacters_5	achievement	Ach_D_SpawnCharacters_5
492	Ach_SpawnCharacters_10	achievement	Ach_SpawnCharacters_10
493	Ach_D_SpawnCharacters_10	achievement	Ach_D_SpawnCharacters_10
494	Ach_SpawnCharacters_25	achievement	Ach_SpawnCharacters_25
495	Ach_D_SpawnCharacters_25	achievement	Ach_D_SpawnCharacters_25
496	Ach_SpawnCharacters_50	achievement	Ach_SpawnCharacters_50
497	Ach_D_SpawnCharacters_50	achievement	Ach_D_SpawnCharacters_50
498	Ach_SpawnCharacters_75	achievement	Ach_SpawnCharacters_75
499	Ach_D_SpawnCharacters_75	achievement	Ach_D_SpawnCharacters_75
500	Ach_SpawnCharacters_Max	achievement	Ach_SpawnCharacters_Max
501	Ach_D_SpawnCharacters_Max	achievement	Ach_D_SpawnCharacters_Max
502	Ach_Level10_50	achievement	Ach_Level10_50
503	Ach_D_Level10_50	achievement	Ach_D_Level10_50
504	Ach_Level10_30	achievement	Ach_Level10_30
505	Ach_D_Level10_30	achievement	Ach_D_Level10_30
506	Ach_Level10_15	achievement	Ach_Level10_15
507	Ach_D_Level10_15	achievement	Ach_D_Level10_15
508	Ach_Level10_5	achievement	Ach_Level10_5
509	Ach_D_Level10_5	achievement	Ach_D_Level10_5
510	Ach_Level15_5	achievement	Ach_Level15_5
511	Ach_D_Level15_5	achievement	Ach_D_Level15_5
512	Ach_Level15_15	achievement	Ach_Level15_15
513	Ach_D_Level15_15	achievement	Ach_D_Level15_15
514	Ach_Level15_30	achievement	Ach_Level15_30
515	Ach_D_Level15_30	achievement	Ach_D_Level15_30
516	Ach_Level15_50	achievement	Ach_Level15_50
517	Ach_D_Level15_50	achievement	Ach_D_Level15_50
518	Ach_LevelSolo_15	achievement	Ach_LevelSolo_15
519	Ach_D_LevelSolo_15	achievement	Ach_D_LevelSolo_15
520	Ach_LevelSolo_10	achievement	Ach_LevelSolo_10
521	Ach_D_LevelSolo_10	achievement	Ach_D_LevelSolo_10
522	Ach_LevelSolo_5	achievement	Ach_LevelSolo_5
523	Ach_D_LevelSolo_5	achievement	Ach_D_LevelSolo_5
524	Ach_GetHippo_50	achievement	Ach_GetHippo_50
525	Ach_D_GetHippo_50	achievement	Ach_D_GetHippo_50
526	Ach_GetHippo_25	achievement	Ach_GetHippo_25
527	Ach_D_GetHippo_25	achievement	Ach_D_GetHippo_25
528	Ach_GetHippo_10	achievement	Ach_GetHippo_10
529	Ach_D_GetHippo_10	achievement	Ach_D_GetHippo_10
530	Ach_GetDino_10	achievement	Ach_GetDino_10
531	Ach_D_GetDino_10	achievement	Ach_D_GetDino_10
532	Ach_GetDino_25	achievement	Ach_GetDino_25
533	Ach_D_GetDino_25	achievement	Ach_D_GetDino_25
534	Ach_GetDino_50	achievement	Ach_GetDino_50
535	Ach_D_GetDino_50	achievement	Ach_D_GetDino_50
536	Ach_GetPinguin_50	achievement	Ach_GetPinguin_50
537	Ach_D_GetPinguin_50	achievement	Ach_D_GetPinguin_50
538	Ach_GetPinguin_25	achievement	Ach_GetPinguin_25
539	Ach_D_GetPinguin_25	achievement	Ach_D_GetPinguin_25
540	Ach_GetPinguin_10	achievement	Ach_GetPinguin_10
541	Ach_D_GetPinguin_10	achievement	Ach_D_GetPinguin_10
542	Ach_GetShark_10	achievement	Ach_GetShark_10
543	Ach_D_GetShark_10	achievement	Ach_D_GetShark_10
544	Ach_GetShark_25	achievement	Ach_GetShark_25
545	Ach_D_GetShark_25	achievement	Ach_D_GetShark_25
546	Ach_GetShark_50	achievement	Ach_GetShark_50
547	Ach_D_GetShark_50	achievement	Ach_D_GetShark_50
548	Ach_GetCharacters_5	achievement	Ach_GetCharacters_5
549	Ach_D_GetCharacters_5	achievement	Ach_D_GetCharacters_5
550	Ach_GetCharacters_25	achievement	Ach_GetCharacters_25
551	Ach_D_GetCharacters_25	achievement	Ach_D_GetCharacters_25
552	Ach_GetCharacters_50	achievement	Ach_GetCharacters_50
553	Ach_D_GetCharacters_50	achievement	Ach_D_GetCharacters_50
554	Ach_GetCharacters_100	achievement	Ach_GetCharacters_100
555	Ach_D_GetCharacters_100	achievement	Ach_D_GetCharacters_100
556	Ach_BuyEggs_10	achievement	Ach_BuyEggs_10
557	Ach_D_BuyEggs_10	achievement	Ach_D_BuyEggs_10
558	Ach_BuyEggs_25	achievement	Ach_BuyEggs_25
559	Ach_D_BuyEggs_25	achievement	Ach_D_BuyEggs_25
560	Ach_BuyEggs_50	achievement	Ach_BuyEggs_50
561	Ach_D_BuyEggs_50	achievement	Ach_D_BuyEggs_50
562	Ach_BuyEggs_100	achievement	Ach_BuyEggs_100
563	Ach_D_BuyEggs_100	achievement	Ach_D_BuyEggs_100
564	Ach_BuyEggs_500	achievement	Ach_BuyEggs_500
565	Ach_D_BuyEggs_500	achievement	Ach_D_BuyEggs_500
566	Ach_BuyEggs_1000	achievement	Ach_BuyEggs_1000
567	Ach_D_BuyEggs_1000	achievement	Ach_D_BuyEggs_1000
568	Ach_CrashItem_1	achievement	Ach_CrashItem_1
569	Ach_D_CrashItem_1	achievement	Ach_D_CrashItem_1
570	Ach_CrashItem_10	achievement	Ach_CrashItem_10
571	Ach_D_CrashItem_10	achievement	Ach_D_CrashItem_10
572	Ach_CrashItem_50	achievement	Ach_CrashItem_50
573	Ach_D_CrashItem_50	achievement	Ach_D_CrashItem_50
574	Ach_CrashItem_100	achievement	Ach_CrashItem_100
575	Ach_D_CrashItem_100	achievement	Ach_D_CrashItem_100
576	Ach_CrashItem_500	achievement	Ach_CrashItem_500
577	Ach_D_CrashItem_500	achievement	Ach_D_CrashItem_500
578	Ach_CrashItem_1000	achievement	Ach_CrashItem_1000
579	Ach_D_CrashItem_1000	achievement	Ach_D_CrashItem_1000
580	Ach_CrashItem_5000	achievement	Ach_CrashItem_5000
581	Ach_D_CrashItem_5000	achievement	Ach_D_CrashItem_5000
582	Ach_BuildFur_10	achievement	Ach_BuildFur_10
583	Ach_D_BuildFur_10	achievement	Ach_D_BuildFur_10
584	Ach_BuildFur_25	achievement	Ach_BuildFur_25
585	Ach_D_BuildFur_25	achievement	Ach_D_BuildFur_25
586	Ach_BuildFur_50	achievement	Ach_BuildFur_50
587	Ach_D_BuildFur_50	achievement	Ach_D_BuildFur_50
588	Ach_BuildFur_100	achievement	Ach_BuildFur_100
589	Ach_D_BuildFur_100	achievement	Ach_D_BuildFur_100
590	Ach_GetAchiv_10	achievement	Ach_GetAchiv_10
591	Ach_D_GetAchiv_10	achievement	Ach_D_GetAchiv_10
592	Ach_GetAchiv_25	achievement	Ach_GetAchiv_25
593	Ach_D_GetAchiv_25	achievement	Ach_D_GetAchiv_25
594	Ach_GetAchiv_50	achievement	Ach_GetAchiv_50
595	Ach_D_GetAchiv_50	achievement	Ach_D_GetAchiv_50
596	Ach_GetAchiv_100	achievement	Ach_GetAchiv_100
597	Ach_D_GetAchiv_100	achievement	Ach_D_GetAchiv_100
598	Ach_FloorClean_All	achievement	Ach_FloorClean_All
599	Ach_D_FloorClean_All	achievement	Ach_D_FloorClean_All
600	Ach_FloorClean_1	achievement	Ach_FloorClean_1
601	Ach_D_FloorClean_1	achievement	Ach_D_FloorClean_1
\.


--
-- TOC entry 3555 (class 0 OID 18589)
-- Dependencies: 229
-- Data for Name: things; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.things (id, "group", name, icon, description) FROM stdin;
29	0	Item_Alarm	Item_Alarm	Item_D_Alarm
36	0	Item_Beret	Item_Beret	Item_D_Beret
20	0	Item_Binoculars	Item_Binoculars	Item_D_Binoculars
9	0	Item_Blade	Item_Blade	Item_D_Blade
35	0	Item_Bouqet	Item_Bouqet	Item_D_Bouqet
4	0	Item_Bracer	Item_Bracer	Item_D_Bracer
30	0	Item_BrickPillow	Item_BrickPillow	Item_D_BrickPillow
13	0	Item_Camera	Item_Camera	Item_D_Camera
41	0	Item_Cane	Item_Cane	Item_D_Cane
18	0	Item_Cap	Item_Cap	Item_D_Cap
8	0	Item_Casket	Item_Casket	Item_D_Casket
33	0	Item_Discosphere	Item_Discosphere	Item_D_Discosphere
28	0	Item_Drill	Item_Drill	Item_D_Drill
38	0	Item_DVD	Item_DVD	Item_D_DVD
3	0	Item_Fluite	Item_Fluite	Item_D_Fluite
39	0	Item_Frill	Item_Frill	Item_D_Frill
2	0	Item_FruitPlate	Item_FruitPlate	Item_D_FruitPlate
37	0	Item_Gift	Item_Gift	Item_D_Gift
43	0	Item_Glasscup	Item_Glasscup	Item_D_Glasscup
6	0	Item_GoldCoin	Item_GoldCoin	Item_D_GoldCoin
32	0	Item_Hammer	Item_Hammer	Item_D_Hammer
27	0	Item_Helmet	Item_Helmet	Item_D_Helmet
5	0	Item_Jewelry	Item_Jewelry	Item_D_Jewelry
40	0	Item_Micro	Item_Micro	Item_D_Micro
19	0	Item_Napkin	Item_Napkin	Item_D_Napkin
31	0	Item_Patch	Item_Patch	Item_D_Patch
12	0	Item_PhotoAlbum	Item_PhotoAlbum	Item_D_PhotoAlbum
34	0	Item_Rollex	Item_Rollex	Item_D_Rollex
7	0	Item_Sash	Item_Sash	Item_D_Sash
17	0	Item_Scarf	Item_Scarf	Item_D_Scarf
42	0	Item_Shaker	Item_Shaker	Item_D_Shaker
1	0	Item_SilkHandkerchief	Item_SilkHandkerchief	Item_D_SilkHandkerchief
0	0	Item_SilkPillow	Item_SilkPillow	Item_D_SilkPillow
23	0	Item_Skatch	Item_Skatch	Item_D_Skatch
10	0	Item_SnakeBasket	Item_SnakeBasket	Item_D_SnakeBasket
22	0	Item_Tape	Item_Tape	Item_D_Tape
14	0	Item_Ticket	Item_Ticket	Item_D_Ticket
11	0	Item_Tray	Item_Tray	Item_D_Tray
15	0	Item_Wallet	Item_Wallet	Item_D_Wallet
26	0	Item_WelderMachine	Item_WelderMachine	Item_D_WelderMachine
25	0	Item_Weldermask	Item_Weldermask	Item_D_Weldermask
21	0	Item_Whistle	Item_Whistle	Item_D_Whistle
16	0	Item_Wineglass	Item_Wineglass	Item_D_Wineglass
24	0	Item_Wranch	Item_Wranch	Item_D_Wranch
\.


--
-- TOC entry 3591 (class 0 OID 19220)
-- Dependencies: 265
-- Data for Name: unique_action_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unique_action_relations (id, first_character_id, second_character_id, is_start, chain_id, action_id, dialog_id, achievment_id, next_action_id) FROM stdin;
\.


--
-- TOC entry 3589 (class 0 OID 19212)
-- Dependencies: 263
-- Data for Name: unique_actions_chains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unique_actions_chains (id, name) FROM stdin;
\.


--
-- TOC entry 3573 (class 0 OID 18727)
-- Dependencies: 247
-- Data for Name: unique_translates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unique_translates (id, lang_key, "group", content) FROM stdin;
\.


--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 202
-- Name: achievments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.achievments_id_seq', 102, true);


--
-- TOC entry 3713 (class 0 OID 0)
-- Dependencies: 204
-- Name: actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actions_id_seq', 1, false);


--
-- TOC entry 3714 (class 0 OID 0)
-- Dependencies: 206
-- Name: buffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buffs_id_seq', 1, false);


--
-- TOC entry 3715 (class 0 OID 0)
-- Dependencies: 272
-- Name: character_duplicate_fines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.character_duplicate_fines_id_seq', 1, true);


--
-- TOC entry 3716 (class 0 OID 0)
-- Dependencies: 210
-- Name: character_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.character_levels_id_seq', 1, false);


--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 212
-- Name: character_perks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.character_perks_id_seq', 1, false);


--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 308
-- Name: character_puzzle_chances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.character_puzzle_chances_id_seq', 20, true);


--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 208
-- Name: characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_id_seq', 1, false);


--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 270
-- Name: characters_requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_requirements_id_seq', 1, false);


--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 214
-- Name: constants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.constants_id_seq', 2, true);


--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 216
-- Name: consumables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consumables_id_seq', 1, false);


--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 248
-- Name: dialogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dialogs_id_seq', 1, false);


--
-- TOC entry 3724 (class 0 OID 0)
-- Dependencies: 240
-- Name: en_lang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.en_lang_id_seq', 1, false);


--
-- TOC entry 3725 (class 0 OID 0)
-- Dependencies: 244
-- Name: es_lang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.es_lang_id_seq', 1, false);


--
-- TOC entry 3726 (class 0 OID 0)
-- Dependencies: 218
-- Name: floors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.floors_id_seq', 1, false);


--
-- TOC entry 3727 (class 0 OID 0)
-- Dependencies: 310
-- Name: furniture_puzzle_chances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.furniture_puzzle_chances_id_seq', 128, true);


--
-- TOC entry 3728 (class 0 OID 0)
-- Dependencies: 220
-- Name: furnitures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.furnitures_id_seq', 1, false);


--
-- TOC entry 3729 (class 0 OID 0)
-- Dependencies: 222
-- Name: groups_tiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_tiles_id_seq', 1, false);


--
-- TOC entry 3730 (class 0 OID 0)
-- Dependencies: 252
-- Name: letters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.letters_id_seq', 3, true);


--
-- TOC entry 3731 (class 0 OID 0)
-- Dependencies: 284
-- Name: logs_character_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_character_actions_id_seq', 1, false);


--
-- TOC entry 3732 (class 0 OID 0)
-- Dependencies: 286
-- Name: logs_character_buffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_character_buffs_id_seq', 1, false);


--
-- TOC entry 3733 (class 0 OID 0)
-- Dependencies: 288
-- Name: logs_character_interactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_character_interactions_id_seq', 1, false);


--
-- TOC entry 3734 (class 0 OID 0)
-- Dependencies: 290
-- Name: logs_character_raids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_character_raids_id_seq', 1, false);


--
-- TOC entry 3735 (class 0 OID 0)
-- Dependencies: 294
-- Name: logs_furniture_interactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_furniture_interactions_id_seq', 1, false);


--
-- TOC entry 3736 (class 0 OID 0)
-- Dependencies: 296
-- Name: logs_group_tiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_group_tiles_id_seq', 1, false);


--
-- TOC entry 3737 (class 0 OID 0)
-- Dependencies: 292
-- Name: logs_inventory_consumables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_inventory_consumables_id_seq', 1, false);


--
-- TOC entry 3738 (class 0 OID 0)
-- Dependencies: 306
-- Name: logs_inventory_things_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_inventory_things_id_seq', 1, false);


--
-- TOC entry 3739 (class 0 OID 0)
-- Dependencies: 298
-- Name: logs_loot_box_creations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_loot_box_creations_id_seq', 1, false);


--
-- TOC entry 3740 (class 0 OID 0)
-- Dependencies: 300
-- Name: logs_loot_box_opens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_loot_box_opens_id_seq', 1, false);


--
-- TOC entry 3741 (class 0 OID 0)
-- Dependencies: 280
-- Name: logs_player_gates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_player_gates_id_seq', 78, true);


--
-- TOC entry 3742 (class 0 OID 0)
-- Dependencies: 302
-- Name: logs_server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_server_id_seq', 1, false);


--
-- TOC entry 3743 (class 0 OID 0)
-- Dependencies: 304
-- Name: logs_soft_currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_soft_currency_id_seq', 1, false);


--
-- TOC entry 3744 (class 0 OID 0)
-- Dependencies: 282
-- Name: logs_user_achievments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_user_achievments_id_seq', 1, false);


--
-- TOC entry 3745 (class 0 OID 0)
-- Dependencies: 276
-- Name: loot_box_group_chances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loot_box_group_chances_id_seq', 6, true);


--
-- TOC entry 3746 (class 0 OID 0)
-- Dependencies: 274
-- Name: loot_box_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loot_box_items_id_seq', 611, true);


--
-- TOC entry 3747 (class 0 OID 0)
-- Dependencies: 224
-- Name: loot_boxes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loot_boxes_id_seq', 1, false);


--
-- TOC entry 3748 (class 0 OID 0)
-- Dependencies: 268
-- Name: loot_boxes_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loot_boxes_price_id_seq', 6, true);


--
-- TOC entry 3749 (class 0 OID 0)
-- Dependencies: 250
-- Name: max_by_group_tiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.max_by_group_tiles_id_seq', 4, true);


--
-- TOC entry 3750 (class 0 OID 0)
-- Dependencies: 260
-- Name: player_chains_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_chains_progress_id_seq', 1, false);


--
-- TOC entry 3751 (class 0 OID 0)
-- Dependencies: 232
-- Name: player_characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_characters_id_seq', 495, true);


--
-- TOC entry 3752 (class 0 OID 0)
-- Dependencies: 254
-- Name: player_consumables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_consumables_id_seq', 222, true);


--
-- TOC entry 3753 (class 0 OID 0)
-- Dependencies: 234
-- Name: player_floors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_floors_id_seq', 22, true);


--
-- TOC entry 3754 (class 0 OID 0)
-- Dependencies: 236
-- Name: player_furnitures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_furnitures_id_seq', 1718, true);


--
-- TOC entry 3755 (class 0 OID 0)
-- Dependencies: 238
-- Name: player_letters_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_letters_conditions_id_seq', 5, true);


--
-- TOC entry 3756 (class 0 OID 0)
-- Dependencies: 256
-- Name: player_loot_boxes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_loot_boxes_id_seq', 154, true);


--
-- TOC entry 3757 (class 0 OID 0)
-- Dependencies: 258
-- Name: player_things_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_things_id_seq', 309, true);


--
-- TOC entry 3758 (class 0 OID 0)
-- Dependencies: 230
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_id_seq', 11, true);


--
-- TOC entry 3759 (class 0 OID 0)
-- Dependencies: 266
-- Name: raid_cells_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.raid_cells_id_seq', 4, true);


--
-- TOC entry 3760 (class 0 OID 0)
-- Dependencies: 278
-- Name: raid_count_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.raid_count_items_id_seq', 1, false);


--
-- TOC entry 3761 (class 0 OID 0)
-- Dependencies: 226
-- Name: raid_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.raid_locations_id_seq', 1, false);


--
-- TOC entry 3762 (class 0 OID 0)
-- Dependencies: 242
-- Name: ru_lang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ru_lang_id_seq', 1, true);


--
-- TOC entry 3763 (class 0 OID 0)
-- Dependencies: 228
-- Name: things_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.things_id_seq', 1, false);


--
-- TOC entry 3764 (class 0 OID 0)
-- Dependencies: 264
-- Name: unique_action_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unique_action_relations_id_seq', 1, false);


--
-- TOC entry 3765 (class 0 OID 0)
-- Dependencies: 262
-- Name: unique_actions_chains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unique_actions_chains_id_seq', 1, false);


--
-- TOC entry 3766 (class 0 OID 0)
-- Dependencies: 246
-- Name: unique_translates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unique_translates_id_seq', 1, false);


--
-- TOC entry 3340 (class 2606 OID 20035)
-- Name: logs_player_gates PK_03b294a7dd9ffc9c63fed4b5156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_player_gates
    ADD CONSTRAINT "PK_03b294a7dd9ffc9c63fed4b5156" PRIMARY KEY (id);


--
-- TOC entry 3360 (class 2606 OID 20118)
-- Name: logs_loot_box_opens PK_04079a4a25f19c59a60d67cb8eb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_loot_box_opens
    ADD CONSTRAINT "PK_04079a4a25f19c59a60d67cb8eb" PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 20051)
-- Name: logs_character_actions PK_05c846cf5ddf1f78873348cec47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_character_actions
    ADD CONSTRAINT "PK_05c846cf5ddf1f78873348cec47" PRIMARY KEY (id);


--
-- TOC entry 3350 (class 2606 OID 20075)
-- Name: logs_character_raids PK_1858621370bfe7d834fb6069423; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_character_raids
    ADD CONSTRAINT "PK_1858621370bfe7d834fb6069423" PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 18556)
-- Name: groups_tiles PK_287c0cca6b10653eeede9c4026a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups_tiles
    ADD CONSTRAINT "PK_287c0cca6b10653eeede9c4026a" PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 20155)
-- Name: character_puzzle_chances PK_2d2e84780a98566fec7465ac4e6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_puzzle_chances
    ADD CONSTRAINT "PK_2d2e84780a98566fec7465ac4e6" PRIMARY KEY (id);


--
-- TOC entry 3358 (class 2606 OID 20110)
-- Name: logs_loot_box_creations PK_33c006ea4ab73713d3bd58561af; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_loot_box_creations
    ADD CONSTRAINT "PK_33c006ea4ab73713d3bd58561af" PRIMARY KEY (id);


--
-- TOC entry 3338 (class 2606 OID 19384)
-- Name: raid_count_items PK_39ccbec81ace0dcfd54ab0a775e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raid_count_items
    ADD CONSTRAINT "PK_39ccbec81ace0dcfd54ab0a775e" PRIMARY KEY (id);


--
-- TOC entry 3302 (class 2606 OID 18716)
-- Name: ru_lang PK_3c463fccfcf49f89816d4ad5859; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ru_lang
    ADD CONSTRAINT "PK_3c463fccfcf49f89816d4ad5859" PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 18659)
-- Name: player_furnitures PK_4157dafd7f1be29224c01ff9007; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_furnitures
    ADD CONSTRAINT "PK_4157dafd7f1be29224c01ff9007" PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 20043)
-- Name: logs_user_achievments PK_45e370f2c2707f996847d643f1f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_user_achievments
    ADD CONSTRAINT "PK_45e370f2c2707f996847d643f1f" PRIMARY KEY (id);


--
-- TOC entry 3366 (class 2606 OID 20142)
-- Name: logs_inventory_things PK_486ce49a18f1640a16433388c83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_inventory_things
    ADD CONSTRAINT "PK_486ce49a18f1640a16433388c83" PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 18679)
-- Name: player_letters_conditions PK_49832cbc3415133bb1fd329c76e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_letters_conditions
    ADD CONSTRAINT "PK_49832cbc3415133bb1fd329c76e" PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 19353)
-- Name: loot_box_group_chances PK_4cbf3702d86217f4dd3af01b305; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_box_group_chances
    ADD CONSTRAINT "PK_4cbf3702d86217f4dd3af01b305" PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 18627)
-- Name: player_characters PK_4faad69f48d86dfa28b6390cccf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_characters
    ADD CONSTRAINT "PK_4faad69f48d86dfa28b6390cccf" PRIMARY KEY (id);


--
-- TOC entry 3264 (class 2606 OID 18475)
-- Name: buffs PK_53268009dd6e8003a4c40495275; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buffs
    ADD CONSTRAINT "PK_53268009dd6e8003a4c40495275" PRIMARY KEY (id);


--
-- TOC entry 3322 (class 2606 OID 19217)
-- Name: unique_actions_chains PK_54304ede8c44b6c0132463db3fe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_actions_chains
    ADD CONSTRAINT "PK_54304ede8c44b6c0132463db3fe" PRIMARY KEY (id);


--
-- TOC entry 3324 (class 2606 OID 19229)
-- Name: unique_action_relations PK_5ef12bf745bfed22566615995f0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_action_relations
    ADD CONSTRAINT "PK_5ef12bf745bfed22566615995f0" PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 20126)
-- Name: logs_server PK_5fe068af8d227fd0865c05cad20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_server
    ADD CONSTRAINT "PK_5fe068af8d227fd0865c05cad20" PRIMARY KEY (id);


--
-- TOC entry 3370 (class 2606 OID 20163)
-- Name: furniture_puzzle_chances PK_7489b4d81f0e58049ff8ddeb4f4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.furniture_puzzle_chances
    ADD CONSTRAINT "PK_7489b4d81f0e58049ff8ddeb4f4" PRIMARY KEY (id);


--
-- TOC entry 3308 (class 2606 OID 18743)
-- Name: dialogs PK_75ffe676a97ca2eb5510ec88b11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dialogs
    ADD CONSTRAINT "PK_75ffe676a97ca2eb5510ec88b11" PRIMARY KEY (id);


--
-- TOC entry 3310 (class 2606 OID 18840)
-- Name: max_by_group_tiles PK_76781ca5675f6bd56799ef4fccb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.max_by_group_tiles
    ADD CONSTRAINT "PK_76781ca5675f6bd56799ef4fccb" PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 18464)
-- Name: actions PK_7bfb822f56be449c0b8adbf83cf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actions
    ADD CONSTRAINT "PK_7bfb822f56be449c0b8adbf83cf" PRIMARY KEY (id);


--
-- TOC entry 3332 (class 2606 OID 19337)
-- Name: character_duplicate_fines PK_7cc686657acd5142ed2664d1a38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_duplicate_fines
    ADD CONSTRAINT "PK_7cc686657acd5142ed2664d1a38" PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 18545)
-- Name: furnitures PK_7effa6aa3ab998c431ea028393a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.furnitures
    ADD CONSTRAINT "PK_7effa6aa3ab998c431ea028393a" PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 18525)
-- Name: consumables PK_88ce43ef80ea7ac74b91dbd8614; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumables
    ADD CONSTRAINT "PK_88ce43ef80ea7ac74b91dbd8614" PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 19324)
-- Name: characters_requirements PK_8a2efa4e46158dd975b9622bfe9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters_requirements
    ADD CONSTRAINT "PK_8a2efa4e46158dd975b9622bfe9" PRIMARY KEY (id);


--
-- TOC entry 3284 (class 2606 OID 18586)
-- Name: raid_locations PK_9786af22003b4b82f14e123c453; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raid_locations
    ADD CONSTRAINT "PK_9786af22003b4b82f14e123c453" PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 18724)
-- Name: es_lang PK_9ca04bd5d694c4db4bec0bada68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.es_lang
    ADD CONSTRAINT "PK_9ca04bd5d694c4db4bec0bada68" PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 18486)
-- Name: characters PK_9d731e05758f26b9315dac5e378; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT "PK_9d731e05758f26b9315dac5e378" PRIMARY KEY (id);


--
-- TOC entry 3320 (class 2606 OID 19165)
-- Name: player_chains_progress PK_a6cb7bee2378fb161e9e4cb8619; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_chains_progress
    ADD CONSTRAINT "PK_a6cb7bee2378fb161e9e4cb8619" PRIMARY KEY (id);


--
-- TOC entry 3300 (class 2606 OID 18708)
-- Name: en_lang PK_b031dd4ebe34dae40747b15d669; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.en_lang
    ADD CONSTRAINT "PK_b031dd4ebe34dae40747b15d669" PRIMARY KEY (id);


--
-- TOC entry 3272 (class 2606 OID 18514)
-- Name: constants PK_b05c708f105d3b8b351fdb07967; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constants
    ADD CONSTRAINT "PK_b05c708f105d3b8b351fdb07967" PRIMARY KEY (id);


--
-- TOC entry 3328 (class 2606 OID 19316)
-- Name: loot_boxes_price PK_b19abf5282441dc7f4960e0ea2e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_boxes_price
    ADD CONSTRAINT "PK_b19abf5282441dc7f4960e0ea2e" PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 18594)
-- Name: things PK_b19ac605b3912ed10128f2ac322; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.things
    ADD CONSTRAINT "PK_b19ac605b3912ed10128f2ac322" PRIMARY KEY (id);


--
-- TOC entry 3334 (class 2606 OID 19345)
-- Name: loot_box_items PK_b33513f0e67f4b23fcb4ad40a36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_box_items
    ADD CONSTRAINT "PK_b33513f0e67f4b23fcb4ad40a36" PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 20091)
-- Name: logs_furniture_interactions PK_bbd90ad6353ae3741c51e0edb64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_furniture_interactions
    ADD CONSTRAINT "PK_bbd90ad6353ae3741c51e0edb64" PRIMARY KEY (id);


--
-- TOC entry 3312 (class 2606 OID 19062)
-- Name: letters PK_bf70c41d26aa84cf2651d571889; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.letters
    ADD CONSTRAINT "PK_bf70c41d26aa84cf2651d571889" PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 20134)
-- Name: logs_soft_currency PK_c28702ebcd2a04d68f5611cd066; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_soft_currency
    ADD CONSTRAINT "PK_c28702ebcd2a04d68f5611cd066" PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 19105)
-- Name: player_things PK_c558d62039b2e33979cb29caf0e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_things
    ADD CONSTRAINT "PK_c558d62039b2e33979cb29caf0e" PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 19097)
-- Name: player_loot_boxes PK_c7492a634128c3ff08e06163a73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_loot_boxes
    ADD CONSTRAINT "PK_c7492a634128c3ff08e06163a73" PRIMARY KEY (id);


--
-- TOC entry 3352 (class 2606 OID 20083)
-- Name: logs_inventory_consumables PK_c8642dfce67d26c42f808cb3fc4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_inventory_consumables
    ADD CONSTRAINT "PK_c8642dfce67d26c42f808cb3fc4" PRIMARY KEY (id);


--
-- TOC entry 3314 (class 2606 OID 19086)
-- Name: player_consumables PK_cd589ace9cad98f7700a7dc49af; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_consumables
    ADD CONSTRAINT "PK_cd589ace9cad98f7700a7dc49af" PRIMARY KEY (id);


--
-- TOC entry 3260 (class 2606 OID 18452)
-- Name: achievments PK_d7d04156611d9693fd2f02b16b2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievments
    ADD CONSTRAINT "PK_d7d04156611d9693fd2f02b16b2" PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 18533)
-- Name: floors PK_dae78234002afa84842d3a08ee0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.floors
    ADD CONSTRAINT "PK_dae78234002afa84842d3a08ee0" PRIMARY KEY (id);


--
-- TOC entry 3292 (class 2606 OID 18645)
-- Name: player_floors PK_db011a6abd929a153aadf700b1d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_floors
    ADD CONSTRAINT "PK_db011a6abd929a153aadf700b1d" PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 18614)
-- Name: players PK_de22b8fdeee0c33ab55ae71da3b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT "PK_de22b8fdeee0c33ab55ae71da3b" PRIMARY KEY (id);


--
-- TOC entry 3306 (class 2606 OID 18735)
-- Name: unique_translates PK_e689693c4932e128a5c78460b4c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_translates
    ADD CONSTRAINT "PK_e689693c4932e128a5c78460b4c" PRIMARY KEY (id);


--
-- TOC entry 3346 (class 2606 OID 20059)
-- Name: logs_character_buffs PK_e6e521cbc118d314494557971d2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_character_buffs
    ADD CONSTRAINT "PK_e6e521cbc118d314494557971d2" PRIMARY KEY (id);


--
-- TOC entry 3348 (class 2606 OID 20067)
-- Name: logs_character_interactions PK_e7c8ca6861741b89a849281aa04; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_character_interactions
    ADD CONSTRAINT "PK_e7c8ca6861741b89a849281aa04" PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 18494)
-- Name: character_levels PK_eba1f582874d604b15f31e1d6cf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_levels
    ADD CONSTRAINT "PK_eba1f582874d604b15f31e1d6cf" PRIMARY KEY (id);


--
-- TOC entry 3326 (class 2606 OID 19284)
-- Name: raid_cells PK_ed4a633dedf7d1cba470a72dddd; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raid_cells
    ADD CONSTRAINT "PK_ed4a633dedf7d1cba470a72dddd" PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 20099)
-- Name: logs_group_tiles PK_f21916bb7f80065eee1ad866e41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_group_tiles
    ADD CONSTRAINT "PK_f21916bb7f80065eee1ad866e41" PRIMARY KEY (id);


--
-- TOC entry 3282 (class 2606 OID 18567)
-- Name: loot_boxes PK_fc2488231b8ea777005320e65d8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_boxes
    ADD CONSTRAINT "PK_fc2488231b8ea777005320e65d8" PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 18503)
-- Name: character_perks PK_fc6138c6eaf14773b33434e27ed; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_perks
    ADD CONSTRAINT "PK_fc6138c6eaf14773b33434e27ed" PRIMARY KEY (id);


--
-- TOC entry 3298 (class 2606 OID 18681)
-- Name: player_letters_conditions REL_5ea1559df0219d558302f5dc4a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_letters_conditions
    ADD CONSTRAINT "REL_5ea1559df0219d558302f5dc4a" UNIQUE ("letterId");


--
-- TOC entry 3372 (class 2606 OID 18749)
-- Name: player_characters FK_0b9e4d0568c361c6d6691c47580; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_characters
    ADD CONSTRAINT "FK_0b9e4d0568c361c6d6691c47580" FOREIGN KEY ("configId") REFERENCES public.characters(id);


--
-- TOC entry 3374 (class 2606 OID 18764)
-- Name: player_floors FK_186577e8aa9a10d703b8b833827; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_floors
    ADD CONSTRAINT "FK_186577e8aa9a10d703b8b833827" FOREIGN KEY ("playerId") REFERENCES public.players(id);


--
-- TOC entry 3390 (class 2606 OID 19285)
-- Name: unique_action_relations FK_1940a035718e0ea0f032d75a93d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_action_relations
    ADD CONSTRAINT "FK_1940a035718e0ea0f032d75a93d" FOREIGN KEY (dialog_id) REFERENCES public.dialogs(id);


--
-- TOC entry 3391 (class 2606 OID 19245)
-- Name: unique_action_relations FK_2770d0725d8cbb498f0da645537; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_action_relations
    ADD CONSTRAINT "FK_2770d0725d8cbb498f0da645537" FOREIGN KEY (second_character_id) REFERENCES public.characters(id);


--
-- TOC entry 3392 (class 2606 OID 19267)
-- Name: unique_action_relations FK_2a42bd48c6b45f4e21fa3ac9eac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_action_relations
    ADD CONSTRAINT "FK_2a42bd48c6b45f4e21fa3ac9eac" FOREIGN KEY (chain_id) REFERENCES public.unique_actions_chains(id);


--
-- TOC entry 3382 (class 2606 OID 19106)
-- Name: player_consumables FK_31b0d5a2c528dfd4ca9506ed366; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_consumables
    ADD CONSTRAINT "FK_31b0d5a2c528dfd4ca9506ed366" FOREIGN KEY ("playerId") REFERENCES public.players(id);


--
-- TOC entry 3371 (class 2606 OID 19372)
-- Name: raid_locations FK_375d41d99da57b8e046da04b7fe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raid_locations
    ADD CONSTRAINT "FK_375d41d99da57b8e046da04b7fe" FOREIGN KEY (loot_box_id) REFERENCES public.loot_boxes(id);


--
-- TOC entry 3400 (class 2606 OID 20164)
-- Name: character_puzzle_chances FK_3990c6e029384684f70e44de9a0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_puzzle_chances
    ADD CONSTRAINT "FK_3990c6e029384684f70e44de9a0" FOREIGN KEY (character_id) REFERENCES public.characters(id);


--
-- TOC entry 3376 (class 2606 OID 18779)
-- Name: player_furnitures FK_4095196e1f3d080d4756421ed4f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_furnitures
    ADD CONSTRAINT "FK_4095196e1f3d080d4756421ed4f" FOREIGN KEY ("configId") REFERENCES public.furnitures(id);


--
-- TOC entry 3399 (class 2606 OID 19367)
-- Name: loot_box_group_chances FK_49481741dd7e082186e8a4095da; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_box_group_chances
    ADD CONSTRAINT "FK_49481741dd7e082186e8a4095da" FOREIGN KEY (loot_box_id) REFERENCES public.loot_boxes(id);


--
-- TOC entry 3378 (class 2606 OID 19073)
-- Name: player_letters_conditions FK_5ea1559df0219d558302f5dc4a0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_letters_conditions
    ADD CONSTRAINT "FK_5ea1559df0219d558302f5dc4a0" FOREIGN KEY ("letterId") REFERENCES public.letters(id);


--
-- TOC entry 3373 (class 2606 OID 18744)
-- Name: player_characters FK_71508be5c33f3e0fc728dd2c28e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_characters
    ADD CONSTRAINT "FK_71508be5c33f3e0fc728dd2c28e" FOREIGN KEY ("playerId") REFERENCES public.players(id);


--
-- TOC entry 3401 (class 2606 OID 20169)
-- Name: furniture_puzzle_chances FK_75a3b24ce15dbd82228b96d801e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.furniture_puzzle_chances
    ADD CONSTRAINT "FK_75a3b24ce15dbd82228b96d801e" FOREIGN KEY (furniture_id) REFERENCES public.furnitures(id);


--
-- TOC entry 3380 (class 2606 OID 19063)
-- Name: letters FK_8f666caed989585e290c766d37b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.letters
    ADD CONSTRAINT "FK_8f666caed989585e290c766d37b" FOREIGN KEY ("senderId") REFERENCES public.players(id);


--
-- TOC entry 3397 (class 2606 OID 19325)
-- Name: characters_requirements FK_914fccb72831479451b2c8dd55c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters_requirements
    ADD CONSTRAINT "FK_914fccb72831479451b2c8dd55c" FOREIGN KEY (character_id) REFERENCES public.characters(id);


--
-- TOC entry 3398 (class 2606 OID 19362)
-- Name: loot_box_items FK_99d4f3c2dd1876865c86eb12188; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_box_items
    ADD CONSTRAINT "FK_99d4f3c2dd1876865c86eb12188" FOREIGN KEY (loot_box_id) REFERENCES public.loot_boxes(id);


--
-- TOC entry 3388 (class 2606 OID 19205)
-- Name: player_chains_progress FK_9b7402769cb8c2d636dc75447d5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_chains_progress
    ADD CONSTRAINT "FK_9b7402769cb8c2d636dc75447d5" FOREIGN KEY ("actionId") REFERENCES public.actions(id);


--
-- TOC entry 3393 (class 2606 OID 19272)
-- Name: unique_action_relations FK_9cc417428fee44bbd94658ea750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_action_relations
    ADD CONSTRAINT "FK_9cc417428fee44bbd94658ea750" FOREIGN KEY (action_id) REFERENCES public.actions(id);


--
-- TOC entry 3394 (class 2606 OID 19240)
-- Name: unique_action_relations FK_a023200067372c0b2ccd74d1ffd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_action_relations
    ADD CONSTRAINT "FK_a023200067372c0b2ccd74d1ffd" FOREIGN KEY (first_character_id) REFERENCES public.characters(id);


--
-- TOC entry 3379 (class 2606 OID 18799)
-- Name: player_letters_conditions FK_a802b91640c8115b310046a6013; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_letters_conditions
    ADD CONSTRAINT "FK_a802b91640c8115b310046a6013" FOREIGN KEY ("userId") REFERENCES public.players(id);


--
-- TOC entry 3386 (class 2606 OID 19131)
-- Name: player_things FK_abdaab317c4cdfd3d343ecd9070; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_things
    ADD CONSTRAINT "FK_abdaab317c4cdfd3d343ecd9070" FOREIGN KEY ("configId") REFERENCES public.things(id);


--
-- TOC entry 3395 (class 2606 OID 19290)
-- Name: unique_action_relations FK_b015ad2b0c6488f8a1c40f04500; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_action_relations
    ADD CONSTRAINT "FK_b015ad2b0c6488f8a1c40f04500" FOREIGN KEY (achievment_id) REFERENCES public.achievments(id);


--
-- TOC entry 3375 (class 2606 OID 18769)
-- Name: player_floors FK_b1cde16479fba7b02d71bb054b3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_floors
    ADD CONSTRAINT "FK_b1cde16479fba7b02d71bb054b3" FOREIGN KEY ("configId") REFERENCES public.floors(id);


--
-- TOC entry 3383 (class 2606 OID 19111)
-- Name: player_consumables FK_b5b0ac2dc5fa8c2e040ec5196aa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_consumables
    ADD CONSTRAINT "FK_b5b0ac2dc5fa8c2e040ec5196aa" FOREIGN KEY ("configId") REFERENCES public.consumables(id);


--
-- TOC entry 3389 (class 2606 OID 19250)
-- Name: player_chains_progress FK_c0b81f7c70ebe06b9f41e4bc813; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_chains_progress
    ADD CONSTRAINT "FK_c0b81f7c70ebe06b9f41e4bc813" FOREIGN KEY ("chainId") REFERENCES public.unique_action_relations(id);


--
-- TOC entry 3384 (class 2606 OID 19121)
-- Name: player_loot_boxes FK_d125eb155f16c080d2bdf42de38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_loot_boxes
    ADD CONSTRAINT "FK_d125eb155f16c080d2bdf42de38" FOREIGN KEY ("configId") REFERENCES public.loot_boxes(id);


--
-- TOC entry 3387 (class 2606 OID 19126)
-- Name: player_things FK_d48e0b2f62d2acead6f7693cd0a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_things
    ADD CONSTRAINT "FK_d48e0b2f62d2acead6f7693cd0a" FOREIGN KEY ("playerId") REFERENCES public.players(id);


--
-- TOC entry 3381 (class 2606 OID 19068)
-- Name: letters FK_ddbb9b0aca484d1bcc411a2eb68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.letters
    ADD CONSTRAINT "FK_ddbb9b0aca484d1bcc411a2eb68" FOREIGN KEY ("recipientId") REFERENCES public.players(id);


--
-- TOC entry 3385 (class 2606 OID 19116)
-- Name: player_loot_boxes FK_e48e5745244a2e887088527b462; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_loot_boxes
    ADD CONSTRAINT "FK_e48e5745244a2e887088527b462" FOREIGN KEY ("playerId") REFERENCES public.players(id);


--
-- TOC entry 3377 (class 2606 OID 18774)
-- Name: player_furnitures FK_edbbab14a51f2b108e5ee5bd0ad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_furnitures
    ADD CONSTRAINT "FK_edbbab14a51f2b108e5ee5bd0ad" FOREIGN KEY ("playerId") REFERENCES public.players(id);


--
-- TOC entry 3396 (class 2606 OID 19295)
-- Name: unique_action_relations FK_f2d21d5f6fae726d2f43cf39f97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_action_relations
    ADD CONSTRAINT "FK_f2d21d5f6fae726d2f43cf39f97" FOREIGN KEY (next_action_id) REFERENCES public.actions(id);


--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-10-28 22:19:25

--
-- PostgreSQL database dump complete
--

