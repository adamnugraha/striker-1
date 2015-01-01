drop table if exists alerts cascade;
--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alerts; Type: TABLE; Schema: public; Owner: alteeve; Tablespace: 
--

CREATE TABLE alerts (
    id integer NOT NULL,
    node_id bigint,
    field text,
    value text,
    units text,
    status status,
    msg_tag text,
    msg_args text,
    "timestamp" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.alerts OWNER TO alteeve;

--
-- Name: alerts_id_seq; Type: SEQUENCE; Schema: public; Owner: alteeve
--

CREATE SEQUENCE alerts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alerts_id_seq OWNER TO alteeve;

--
-- Name: alerts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alteeve
--

ALTER SEQUENCE alerts_id_seq OWNED BY alerts.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alteeve
--

ALTER TABLE ONLY alerts ALTER COLUMN id SET DEFAULT nextval('alerts_id_seq'::regclass);


--
-- Name: alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: alteeve; Tablespace: 
--

ALTER TABLE ONLY alerts
    ADD CONSTRAINT alerts_pkey PRIMARY KEY (id);


--
-- Name: alerts_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alteeve
--

ALTER TABLE ONLY alerts
    ADD CONSTRAINT alerts_node_id_fkey FOREIGN KEY (node_id) REFERENCES node(node_id);


--
-- PostgreSQL database dump complete
--
