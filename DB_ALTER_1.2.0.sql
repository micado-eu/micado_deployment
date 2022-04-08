ALTER TABLE micadoapp.charts
    ADD COLUMN link text;
ALTER TABLE micadoapp.charts
    ADD COLUMN function text;
    
    
CREATE TABLE micadoapp.board
(
    id smallint,
    name text,
    picture text,
    PRIMARY KEY (id)

)
WITH (
    OIDS = FALSE
);

ALTER TABLE micadoapp.board
    OWNER to micadoapp;
    
    
    
CREATE SEQUENCE micadoapp.board_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 32767
    CACHE 1;

ALTER SEQUENCE micadoapp.board_id_seq
    OWNER TO micadoapp;
    
    
ALTER TABLE micadoapp.charts
    ALTER COLUMN title TYPE text COLLATE pg_catalog."default";
    
    ALTER TABLE micadoapp.charts
    ALTER COLUMN category TYPE text COLLATE pg_catalog."default";
    
ALTER TABLE micadoapp.charts
    ALTER COLUMN format TYPE text COLLATE pg_catalog."default";
    
ALTER TABLE micadoapp.charts
    ALTER COLUMN type TYPE text COLLATE pg_catalog."default";
    
ALTER TABLE micadoapp.charts
    ALTER COLUMN x TYPE text COLLATE pg_catalog."default";

ALTER TABLE micadoapp.charts
    ALTER COLUMN y TYPE text COLLATE pg_catalog."default";
ALTER TABLE micadoapp.charts
    ALTER COLUMN board TYPE text COLLATE pg_catalog."default";
