DDL commands:
============
CREATE COMMAND:
--------------
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID NUMBER(10),
    CUSTOMER_NAME VARCHAR2(50),
    CITY VARCHAR2(50),
    JOIN_DATE DATE
);


ALTER commands:
==============
DESC customers;

add column:
-----------
ALTER TABLE customers ADD (customer_country varchar2(50));

modify column:
--------------
ALTER TABLE customers MODIFY (customer_name varchar2(70));

drop column:
------------
ALTER TABLE customers DROP COLUMN customer_country;

drop table:
-----------
DROP TABLE customers;


Create table using data from other table:
=========================================

CREATE TABLE SALES_BACK
AS
SELECT * FROM SALES;

SELECT * FROM SALES_BACK;

CREATE TABLE SALES_JANUARY
AS
SELECT * FROM SALES
WHERE SALES_DATE BETWEEN '01-JAN-2015' AND '31-JAN-2015';

SELECT * FROM SALES_JANUARY;

CREATE TABLE SALES_JAN
AS 
SELECT SALES_DATE, TOTAL_AMOUNT FROM SALES
WHERE SALES_DATE BETWEEN '01-JAN-15' AND '31-JAN-15';

SELECT * FROM SALES_JAN;

Exercise
========
1. Create table called MOVIES that stores below columns
	movie number (accepts only numbers)
	movie name (accepts numbers and characters and maximum length can be 100)
	movie type (accepts numbers and characters and maximum length can be 40)
	movie release date (accepts only dates)

2. Add a new column movie language (accepts numbers and characters and maximum
length can be 30) to the MOVIES table.
3. Modify the MOVIES table by increasing the maximum length of column movie type to 50.
4. Go ahead and delete the MOVIES table.

Ans:
====
CREATE TABLE MOVIES
(
    movie_number number,
    movie_name varchar2(100),
    movie_type varchar2(40),
    movie_releas_date date
);

ALTER TABLE MOVIES ADD (movie_language varchar2(30));

ALTER TABLE MOVIES MODIFY (movie_type varchar2(50));

DROP TABLE MOVIES;

DESC MOVIES;

CREATE TABLE MOVIES
(
MOVIE_NUMBER NUMBER PRIMARY KEY,
MOVIE_NAME VARCHAR2(100),
MOVIE_TYPE VARCHAR2(40),
MOVIE_RELEASE_DATE DATE
);

DML COMMAND:
===========

COMMIT/ROLLBACK:
===============
desc customers;

INSERT INTO customers
(customer_id, customer_name, join_date)
VALUES
(5000, 'JHON', '01-JAN-15');

COMMIT;

INSERT INTO customers (customer_id, customer_name, join_date) VALUES (5000, 'JHON', '01-JAN-15');

INSERT INTO customers (customer_id, customer_name, join_date) VALUES (5010, 'MONI', '01-FEB-15');

SELECT * FROM CUSTOMERS;


Inserting data from that table:
===============================

INSERT INTO CUSTOMERS (CUSTOMER_ID, CUSTOMER_NAME, JOIN_DATE)
SELECT CUSTOMER_ID, CUSTOMER_NAME, JOIN_DATE FROM CUSTOMERS;

COMMIT;

INSERT INTO customers
(customer_id, customer_name, join_date) 
SELECT customer_id, customer_name, join_date FROM customers WHERE customer_id > 5000;


Delete data from a table:
========================
 DELETE FROM customers WHERE customer_id = 5001
 AND customer_name = 'RAJ';
 
 COMMIT;

ROLLBACK:
========

 
 DELETE FROM customers WHERE customer_id = 5010
 AND customer_name = 'MONI';
 
 ROLLBACK;

Update:
======
UPDATE customers SET customer_name = 'JHON A' 
WHERE customer_id = 5000;
 
UPDATE customers SET customer_name = 'manik hossain', join_date = '15-feb-2015'
WHERE customer_id = 5010;
 
COMMIT;

Truncate:
========
TRUNCATE TABLE customers;

Exercise
========
1. Insert 3 rows into the MOVIES table, Below is the MOVIES table structure.
Movie_number	number,
Movie_name	varchar2(100),
Movie_type	varchar2(40),
Movie_release_date	date




2. Modify movie release date of movie number 101 from ’12-jan-2015’ to ’14-jan-2015’
3. Delete the row from MOVIES table where the movie name is RUSH HOUR.

Answers:
========
1. INSERT INTO movies VALUES
(
101,
'TERMINATOR',
'ACTION',
'12-JAN-2015'
);
COMMIT;

INSERT INTO movies VALUES
(
102,
'BABIES DAY OUT',
'COMEDY',
'11-FEB-2014'
);
COMMIT;

INSERT INTO movies VALUES
(
103,
'RUSH HOUR',
'ACTION',
'12-DEC-2001'
);
COMMIT;

2.
UPDATE movies set movie_release_date = '14-jan-2015'
WHERE movie_number = 101;
COMMIT;

3. 
DELETE from movies
WHERE movie_name = 'RUSH HOUR';
COMMIT;

Constraints:NOT NULL, Unique, Primary key, Check, Foreign Key
===========
NOT NULL:
--------
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID NUMBER(10) NOT NULL,
    CUSTOMER_NAME VARCHAR2(50),
    CITY VARCHAR2(50),
    JOIN_DATE DATE
);
 
INSERT INTO customers (customer_id, customer_name, join_date)
VALUES (NULL, 'manik', '01-Mar-15');

UNIQUE:
-------
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID NUMBER(10) UNIQUE,
    CUSTOMER_NAME VARCHAR2(50),
    CITY VARCHAR2(50),
    JOIN_DATE DATE
);

PRIMARY KEY: (NOT NULL + UNIQUE = PRIMARY KEY)
------------
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID NUMBER(10) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(50),
    CITY VARCHAR2(50),
    JOIN_DATE DATE
);

Check:
------
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID NUMBER(10) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(50),
    CITY VARCHAR2(50),
    JOIN_DATE DATE,
    ACTIVE_FLAG VARCHAR2(1) CHECK (ACTIVE_FLAG IN ('Y','N'))
);
 
INSERT INTO customers (customer_id, customer_name, join_date, active_flag)
VALUES (7000, 'JOHN', '01-Mar-15', 'Y');

COMMIT

SELECT * FROM CUSTOMERS;

FOREIGN KEY:
------------
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID NUMBER(10) PRIMARY KEY,
    PRODUCT_ID NUMBER(10) REFERENCES PRODUCT(PRODUCT_ID),
    CUSTOMER_NAME VARCHAR2(50),
    CITY VARCHAR2(50),
    JOIN_DATE DATE
);

Constraints on multiple columns:
===============================

CREATE TABLE SALES_HIST(
SALES_DATE DATE,
CUSTOMER_ID NUMBER,
PRODUCT_ID NUMBER, QUANTITY NUMBER,
AMOUNT NUMBER,
CONSTRAINT PRODUCT_DT_PK
PRIMARY KEY (SALES_DATE, CUSTOMER_ID, PRODUCT_ID)
);

Adding constraint to an existing table:
======================================
ALTER TABLE SALES_HIST
ADD CONSTRAINT PRODUCT_DT_PK
PRIMARY KEY (SALES_DATE, CUSTOMER_ID, PRODUCT_ID);

Disable, enable, drop constraint:
================================
ALTER TABLE SALES_HIST DISABLE CONSTRAINT PRODUCT_DT_PK;
ALTER TABLE SALES_HIST ENABLE CONSTRAINT PRODUCT_DT_PK;
ALTER TABLE SALES_HIST DROP CONSTRAINT PRODUCT_DT_PK;

========================================================
========================================================

Creating Views:
==============
SELECT * FROM CUSTOMER;

CREATE VIEW CUSTOMER_SOUTH AS
SELECT CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS_LINE1, CITY, COUNTRY, REGION
FROM CUSTOMER
WHERE REGION = 'SOUTH';

SELECT * FROM CUSTOMER_SOUTH;

Modifying View:
===============
CREATE OR REPLACE VIEW CUSTOMER_SOUTH AS
SELECT CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS_LINE1, CITY, COUNTRY, REGION, ADDRESS_LINE2
FROM CUSTOMER
WHERE REGION = 'SOUTH';

Updating View:
==============
UPDATE CUSTOMER_SOUTH SET ADDRESS_LINE1 = '2345 PETER DRIVE'
WHERE CUSTOMER_ID = 10;

COMMIT;

Create view more than one tables:
=================================
CREATE VIEW SALES_SOUTH AS
SELECT S.SALES_DATE, S.ORDER_ID, S.PRODUCT_ID, S.SALES_AMOUNT, S.TOTAL_AMOUNT, C.REGION
FROM SALES S, CUSTOMER C
WHERE S.CUSTOMER_ID = C.CUSTOMER_ID
AND C.REGION = 'SOUTH';

SELECT * FROM SALES_SOUTH;

CREATE VIEW SALES_NORTH AS
SELECT S.SALES_DATE, S.ORDER_ID, S.PRODUCT_ID, S.SALES_AMOUNT, S.TOTAL_AMOUNT, C.REGION
FROM SALES S, CUSTOMER C
WHERE S.CUSTOMER_ID = C.CUSTOMER_ID
AND C.REGION = 'NORTH';

SELECT * FROM SALES_NORTH;

Exercise
========

1. Create view called SALES_MOBILE that captures below columns and where product
category is equal to Mobile.

SALES_DATE (Source: SALES table)
ORDER_ID (Source: SALES table)
QUANTITY (Source: SALES table)
UNIT_PRICE (Source: SALES table)
TOTAL_AMOUNT (Source: SALES table)
PRODUCT_NAME (Source: PRODUCT table)
PRODUCT_CATEGORY (Source: PRODUCT table)

2. Add a new column PRODUCT_ID to the SALES_MOBILE view.

3. Go ahead and delete the SALES_MOBILE view.

Answers:
=======
1. 
CREATE VIEW SALES_MOBILE AS
SELECT S.SALES_DATE, S.ORDER_ID, S.QUANTITY, S.UNIT_PRICE,
S.TOTAL_AMOUNT, P.PRODUCT_NAME, P.PRODUCT_CATEGORY
FROM SALES S, PRODUCT P
WHERE S.PRODUCT_ID = P.PRODUCT_ID
AND PRODUCT_CATEGORY = 'Mobile';

2. 
CREATE OR REPLACE VIEW SALES_MOBILE AS
SELECT S.SALES_DATE, S.ORDER_ID, S.QUANTITY, S.UNIT_PRICE,
S.TOTAL_AMOUNT, P.PRODUCT_NAME, P.PRODUCT_CATEGORY,
S.PRODUCT_ID
FROM SALES S, PRODUCT P
WHERE S.PRODUCT_ID = P.PRODUCT_ID
AND PRODUCT_CATEGORY = 'Mobile';

3. 
DROP view SALES_MOBILE;


Synonyms: Alternative name for objects:
=======================================
CREATE SYNONYM INVENTORY_DATA FOR SALES;

SELECT * FROM INVENTORY_DATA;

DROP SYNONYM INVENTORY_DATA;

SEQUENCES:
==========

CREATE SEQUENCE CUSTOMER_SEQUENCE 
MINVALUE 1
MAXVALUE 99999
START WITH 1
INCREMENT BY 1
CACHE 10;

SELECT CUSTOMER_SEQUENCE.NEXTVAL FROM DUAL;

SELECT CUSTOMER_SEQUENCE.CURRVAL FROM DUAL;

DROP SEQUENCE CUSTOMER_SEQUENCE;


