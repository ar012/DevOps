PostgrSQL Index Types: B-tree, Hash, GiST, SP-GiST, GIN and BRIN.
-----------------------------------------------------------------
By default, the CREATE INDEX command creates B-tree indexes, which fit the most common situations. 

The CREATE INDEX Command:
=========================
CREATE INDEX index_name ON table_name (Column_name);


--Single-Column Index-- 
=======================

--Multi-column Index--
======================
CREATE INDEX index_name 
ON table_name (column1_name, column2_name, ..)

--Unique Index--
================
CREATE UNIQUE INDEX index_name
ON table_name (column_name);

--Partial Index--
=================
CREATE INDEX index_name
ON table_name (conditional_expression);

--Implicit Index--
==================

Create B-tree index:
===================
CREATE INDEX test1_id_index ON test1 (id);

Create Hash index:
====================
CREATE INDEX hash_content_index ON test1 USING HASH (content);


PostgreSQL “DESCRIBE TABLE”
==========================

\d myTable 	--> describe table
\d+ 		--> 

It also works for other objects:
--------------------------------
\d myView 	--> describe view
\d myIndex 	--> describe index
\d mySequence 	--> describe sequence

The standard SQL information schema to retrieve details of objects in the database.
===================================================================================
SELECT *
FROM information_schema.columns
WHERE table_name = 'test1';

Drop Index command:
===================
DROP INDEX index_name;

System Catalog Meta-Commands
=======================================
--psql command-line tool--
==========================
\dd object-name	--> Display comments for object-name

\db		--> List all tablespaces

\dn		--> List all schemas

\d_\dt		--> List all tables

\di		--> List all indexes

\ds		--> List all sequences

\dv		--> List all views

\dS		--> List all PostgreSQL-defined tables

\d table-name	--> Show table definition

\d index-name	--> Show index definition

\d view-name	--> Show view definition

\d sequence-name--> Show sequence definition

\dp		--> List all privileges

\dl		--> List all large objects

\da		--> List all aggregates

\df		--> List all functions

\dc		--> List all conversions

\dC		--> List all casts

\df function-name--> List all functions with given name

\do		--> List all operators

\do operator-name--> List all operators with given name

\dT		--> List all types

\dD		--> List all domains

\dg		--> List all groups

\du		--> List all users

\l		--. List all databases in this cluster








