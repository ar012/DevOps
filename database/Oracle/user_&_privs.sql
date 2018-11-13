Create User Set privileges on Database:
=======================================

CREATE USER INVENTORY1 IDENTIFIED BY INVENTORY1;

GRANT CONNECT,RESOURCE,DBA TO INVENTORY1;

GRANT CREATE SESSION,GRANT ANY PRIVILEGE TO INVENTORY1;

GRANT UNLIMITED TABLESPACE TO INVENTORY1;

Grants:
=======
List of Grants:
===============
You can GRANT and REVOKE privileges on various database objects in Oracle.

SELECT: It gives the ability to perform SELECT statements on the table.
======
GRANT SELECT ON sales TO scott;

UPDATE: It gives the ability to perform UPDATE statements on the table.
======
GRANT UPDATE ON sales TO scott;

DELETE: It gives the ability to perform DELETE statements on the table.
======
GRANT DELETE ON sales TO scott;

INSERT: It gives the ability to perform INSERT statements on the table.
======
GRANT INSERT ON sales TO scott;

ALL : It gives the ability to perform SELECT, UPDATE, DELETE, UPDATE statements on the table.
=====
GRANT ALL ON sales TO scott;

ALTER: It gives the ability to perform ALTER TABLE statements to change the table definition.
======
GRANT ALTER ON sales TO scott;

REFERENCES: It gives the ability to create a constraint that refers to the table 
===========
i.e. you can create a foreign constraint referring to this table.
GRANT REFERENCES ON sales TO scott;

INDEX: It gives the ability to create an index on the table with the create index statement.
======
GRANT INDEX ON sales TO scott;

GRANT SELECT ON sales TO SCOTT;

GRANT DELETE ON PRODUCT TO SCOTT;

GRANT SELECT, DELETE, UPDATE ON PRODUCT TO SCOTT;

GRANT SELECT, DELETE, UPDATE ON PRODUCT TO SCOTT WITH GRANT OPTION;

GRANT ALL ON SALES TO SCOTT;

GRANT ALTER ON PRODUCT TO SCOTT;

Revoke:
=======
REVOKE DELETE ON SALES FROM SCOTT;

REVOKE ALL ON PRODUCT FROM SCOTT;

REVOKE UPDATE ON SALES FROM SCOTT;



