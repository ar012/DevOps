-- Function: public.uuid_generate_v4()

-- DROP FUNCTION public.uuid_generate_v4();

CREATE OR REPLACE FUNCTION public.uuid_generate_v4()
  RETURNS uuid AS
'$libdir/uuid-ossp', 'uuid_generate_v4'
  LANGUAGE c VOLATILE STRICT
  COST 1;
ALTER FUNCTION public.uuid_generate_v4()
  OWNER TO "CTrends_conn";


-- Table: public.table1

-- DROP TABLE public.table1;

CREATE TABLE public.table1
(
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  name character varying,
  CONSTRAINT pk_table1 PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.table1
  OWNER TO postgres;

INSERT INTO table1 (name)
VALUES('Rashed');

--------------------------------------------------------------------





Step 1 - Install PostgreSQL 9.6
===============================

Step 2 - Configure UFW Firewall
===============================


Step 3 - Configure the PostgreSQL MASTER Server
===============================================

PostgreSQL Master(ws33)'s IP address = 192.168.100.56

PostgreSQL Slave(ws22)'s IP address = 192.168.100.121

REPLICA USER: replica
PASS:	aqwe123@










