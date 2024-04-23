DROP TABLE IF EXISTS public.events CASCADE;
DROP TABLE IF EXISTS public.organizers CASCADE;
DROP TABLE IF EXISTS public.products CASCADE;
DROP TABLE IF EXISTS public.registrations CASCADE;

CREATE TABLE public.events (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    start_date date,
    end_date date,
    organizer_id integer NOT NULL
);

ALTER TABLE public.events OWNER TO ticketing;

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO ticketing;

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


CREATE TABLE public.organizers (
    id integer NOT NULL,
    description character varying(255),
    name character varying(255) NOT NULL
);

ALTER TABLE public.organizers OWNER TO ticketing;

CREATE SEQUENCE public.organizers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.organizers_id_seq OWNER TO ticketing;

ALTER SEQUENCE public.organizers_id_seq OWNED BY public.organizers.id;


CREATE TABLE public.products (
    id integer NOT NULL,
    description character varying(255),
    event_id integer NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(38,2) NOT NULL
);

ALTER TABLE public.products OWNER TO ticketing;

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.products_id_seq OWNER TO ticketing;

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


CREATE TABLE public.registrations (
    id integer NOT NULL,
    product_id integer NOT NULL,
    ticket_code character varying(255) NOT NULL,
    attendee_name character varying(255) NOT NULL
);

ALTER TABLE public.registrations OWNER TO ticketing;

CREATE SEQUENCE public.registrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.registrations_id_seq OWNER TO ticketing;

ALTER SEQUENCE public.registrations_id_seq OWNED BY public.registrations.id;


ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);

ALTER TABLE ONLY public.organizers ALTER COLUMN id SET DEFAULT nextval('public.organizers_id_seq'::regclass);

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);

ALTER TABLE ONLY public.registrations ALTER COLUMN id SET DEFAULT nextval('public.registrations_id_seq'::regclass);


ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.organizers
    ADD CONSTRAINT organizers_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_organizer_fk FOREIGN KEY (organizer_id) REFERENCES public.organizers(id);

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_event_fk FOREIGN KEY (event_id) REFERENCES public.events(id);

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_product_fk FOREIGN KEY (product_id) REFERENCES public.products(id);
