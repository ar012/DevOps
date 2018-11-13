CREATE TABLE customers (
 id SERIAL PRIMARY KEY,
 customer_name VARCHAR NOT NULL
);

ALTER TABLE customers 
ADD COLUMN phone VARCHAR;

ALTER TABLE custoemr 
ADD COLUMN fax VARCHAR,
ADD COLUMN email VARCHAR;

INSERT INTO customers (customer_name)
VALUES
 ('Apple'),
 ('Samsung'),
 ('Sony');
