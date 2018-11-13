Create Index:
=============
SELECT * FROM CUSTOMER;

CREATE INDEX CUSTOMER_CITY_INEDX ON CUSTOMER(CITY);

SELECT * FROM CUSTOMER 
WHERE CITY = 'Atlanta';

Unique Index:
=============
CREATE INDEX CUSTOMER_UNI_INDEX ON CUSTOMER(CUSTOMER_ID);

SELECT * FROM CUSTOMER
WHERE CUSTOMER_ID = '11';

Rename Index:
=============
ALTER INDEX CUSTOMER_CITY_INEDX RENAME TO CUSTOMER_CI_IN;

Drop Index:
===========
DROP INDEX CUSTOMER_CI_IN;
