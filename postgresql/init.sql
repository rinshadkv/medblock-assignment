
CREATE ROLE ehrbase WITH LOGIN PASSWORD 'ehrbase';
CREATE ROLE ehrbase_restricted WITH LOGIN PASSWORD 'ehrbase_restricted';
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'medblock') THEN
        CREATE DATABASE medblock
            OWNER = ehrbase
            ENCODING = 'UTF8'
            LC_COLLATE = 'C'
            LC_CTYPE = 'C'
            TEMPLATE = template0;
    END IF;
END $$;
GRANT ALL PRIVILEGES ON DATABASE medblock TO ehrbase;
GRANT ALL PRIVILEGES ON DATABASE medblock TO ehrbase_restricted;

\c medblock
REVOKE CREATE ON SCHEMA public from PUBLIC;
CREATE SCHEMA IF NOT EXISTS ehr AUTHORIZATION ehrbase;
GRANT USAGE ON SCHEMA ehr to ehrbase_restricted;
ALTER DEFAULT PRIVILEGES FOR USER ehrbase IN SCHEMA ehr GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO ehrbase_restricted;
ALTER DEFAULT PRIVILEGES FOR USER ehrbase IN SCHEMA ehr GRANT SELECT ON SEQUENCES TO ehrbase_restricted;

CREATE SCHEMA IF NOT EXISTS ext AUTHORIZATION ehrbase;
GRANT USAGE ON SCHEMA ext to ehrbase_restricted;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" SCHEMA ext;

-- setup the search_patch so the extensions can be found
ALTER DATABASE medblock SET search_path TO ext;
-- ensure INTERVAL is ISO8601 encoded
ALTER DATABASE medblock SET intervalstyle = 'iso_8601';

ALTER FUNCTION jsonb_path_query(jsonb,jsonpath,jsonb,boolean) ROWS 1;
