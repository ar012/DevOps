----------------------------
PostgreSQL Roles Management:			http://www.postgresqltutorial.com/postgresql-roles/
===========================


create role testrole;

create user testuser;

create role ebs_conn;

create user abdurrazzak;

SELECT rolname FROM pg_roles;

SELECT * FROM pg_roles;

SELECT rolsuper FROM pg_roles


-------------------------------------------------------
Creating user, database and adding access on PostgreSQL
=======================================================


$ sudo -u postgres psql --> The command gets you the psql command line interface in full admin mode.

Creating user:
--------------
$ sudo -u postgres createuser <username> --> sudo -u postgres createuser u_pio
					 --> sudo -u postgres createuser pio_user

Creating Database
-----------------
$ sudo -u postgres createdb <dbname>	--> sudo -u postgres createdb db_pio
					--> sudo -u postgres createdb pio_db


Giving the user a password:
---------------------------
$ sudo -u postgres psql
psql=# alter user <username> with encrypted password '<password>';

					--> alter user u_pio with encrypted password 'p_pio';
					--> alter user pio_user with encrypted password 'pio2018';


Granting privileges on database:
--------------------------------
psql=# grant all privileges on database <dbname> to <username> ;
					--> grant all privileges on database db_pio to u_pio ;
					--> grant all privileges on database pio_db to pio_user;



CREATE DATABASE piodb;
CREATE USER pio_admin WITH ENCRYPTED PASSWORD 'pio_admin';
GRANT ALL PRIVILEGES ON DATABASE piodb TO pio_admin;




https://medium.com/coding-blocks/creating-user-database-and-adding-access-on-postgresql-8bfcd2f4a91e


------------------------------------------
Give all the permissions to a user on a DB
==========================================




The user needs access to the database, obviously:

GRANT CONNECT ON DATABASE my_db TO my_user;
And (at least) the USAGE privilege on the schema:

GRANT USAGE ON SCHEMA public TO my_user;
Then, all permissions for all tables (requires Postgres 9.0 or later):

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO my_user;
And don't forget sequences (if any):

GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO my_user;



In PostgreSQL 9.0+ you would do the following:

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA MY_SCHEMA TO MY_GROUP;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA MY_SCHEMA TO MY_GROUP;
If you want to enable this for newly created relations too, then set the default permissions:

ALTER DEFAULT PRIVILEGES IN SCHEMA MY_SCHEMA
  GRANT ALL PRIVILEGES ON TABLES TO MY_GROUP;
ALTER DEFAULT PRIVILEGES IN SCHEMA MY_SCHEMA
  GRANT ALL PRIVILEGES ON SEQUENCES TO MY_GROUP;

----------------------
CREATE ROLE eSumit;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO eSumit;

GRANT ALL PRIVILEGES ON DATABASE "postgres" to eSumit;

ALTER USER eSumit WITH SUPERUSER;






