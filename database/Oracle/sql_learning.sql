SQL LEARNING:
-------------
-------------
Exercise 1:
==========
1. Produce a list of rows showing all columns from the SALES table.
2. Produce a list of rows showing all columns from the PRODUCT table.
3. Produce a list of rows showing all columns from the CUSTOMER table.
4. Produce a list of rows showing sales date, order number, product number, customer number, quantity, total amount from SALES table.
5. Product a list of rows showing product number, product name, color from PRODUCT table.


Filtering DATA (WHERE command):
===============================
SELECT * FROM CUSTOMER WHERE FIRST_NAME = 'JOHN';
SELECT SALES_DATE, ORDER_ID, PRODUCT_ID FROM SALES WHERE SALES_DATE = '01-JAN-2015';
select * from sales where total_amount > 100;

Exercise 2
==========
1. Produce a list of rows showing all columns from the SALES table where total amount greater than 1000.
Ans:
select * from sales where total_amount > 1000;

2. Produce a list of rows showing all columns from the SALES table where total amount is not equal to 44.
Ans:
select * from sales where total_amount != 44;

3. Produce a list of rows showing all columns from the SALES table where quantity is less than or equal to 10.
Ans:
select * from sales where quantity <=10;

4. Produce a list of rows showing all columns from the SALES table where sales date is equal to 9th February 2015
Ans:
select * from sales where sales_date = '09-feb-2015';

5. Produce a list of rows showing all columns from the PRODUCT table where color is equal to RED.
Ans:
select * from product where color = 'RED';

6. Produce a list of rows showing all columns from the SALES table where total amount is greater than sales amount.
Ans:
select * from sales where total_amount > sales_amount;


BETWEEN, NOT BETWEEN Operators:
==============================
SELECT * FROM sales WHERE total_amount BETWEEN 100 and 1000;
SELECT * FROM sales WHERE total_amount NOT BETWEEN 100 and 1000;

IN, NOT IN Operators:
====================
SELECT * FROM sales WHERE total_amount IN (550, 44, 66);
SELECT * FROM sales WHERE total_amount NOT IN (550, 44, 66);

LIKE, NOT LIKE Operators: This operators help in selecting DATA which matches a pattern.
=========================
select * from product where product_name like 'Micro%';
select * from product where product_category like 'Mob_le';

All, ANY operators:
==================
select * from sales where total_amount > all(550, 44, 66);

select * from sales
where total_amount > any (550, 44, 66);

Logical Oprerators: AND, OR, NOT
================================

select * from sales;

select * from sales
where sales_date = '09-feb-2015'
and total_amount > 1000;

select * from sales
where sales_date ='09-FEB-2015'
or total_amount > 1000;

select * from sales
where total_amount between 1000 and 2000;

select * from sales
where not (total_amount between 1000 and 2000);

Logical operators:
=================


NULL, NOT NULL values:
======================
select * from product
where color is null;

select * from product
where color is not null;

Exercise 3
==========
1. Produce a list of rows showing all columns from the SALES table where total amount is not between 1 and 100.
Ans:
select * from sales
where not (total_amount between 1 and 100);

2. Produce a list of rows showing all columns from the SALES table where quantity has values 20 or 2 or 10
Ans:
select * from sales
where quantity = 20 or quantity = 2  or quantity = 10;

3. Produce a list of rows showing all columns from the PRODUCT table where product name starts with MOB
Ans:
SELECT * FROM product 
WHERE product_name = 'MOB%';

4. Produce a list of rows showing all columns from the SALES table where total amount is greater than 50, 100 and 200.
Ans:
select * from sales
where total_amount > all (50, 100, 200);

5. Produce a list of rows showing all columns from the PRODUCT table where color is equal to null value.
Ans: 
select * from product
where color is null;

6. Produce a list of rows showing all columns from the SALES table where total amount is greater than 100 and quantity is less than 20 
Ans: 
select * from sales
where total_amount > 100 and quantity < 200;


Arithmetic Operators: +, -, *, /, %
===================================
select sales_date, sales_amount, tax_amount, total_amount, 
sales_amount+tax_amount, 
sales_amount-tax_amount, 
sales_amount*10 
from sales;


Exercise 4
==========
1. Produce a list of rows showing sales date, product number, order number, sales amount, tax amount and a calculated column (sum of sales amount and tax amount) from the SALES table.
2. Produce a list of rows showing all columns from the SALES table where quantity plus 10 is greater than or equal to 20
3. Produce a list of rows showing sales date, product number, order number, sales amount, tax amount and a calculated column (total amount minus 30) from the SALES table.


Sorting Data (ORDER BY):
=======================
Sort in Ascending(ASC):
=======================
SELECT sales_date, sales_amount, tax_amount, total_amount  FROM sales ORDER BY sales_date;

Sort in Descending (DESC):
========================= 
SELECT sales_date, sales_amount, tax_amount, total_amount FROM sales ORDER BY sales_date DESC;

Sort by more than one column:
============================
SELECT sales_date, sales_amount, tax_amount, total_amount FROM sales ORDER BY sales_date, sales_amount;

How are null values treated while sorting data?
In effect, NULL is treate a s very large value by Oracle.
---------------------------------------------------------
SELECT product_name, color FROM product ORDER BY color; 
SELECT product_name, color FROM product ORDER BY color DESC; 

Exercise 5
==========
1. Produce a list of rows showing sales date, product number, order number, sales amount, tax amount from the SALES table and sort it by column tax amount in ascending order.
2. Produce a list of rows showing sales date, product number, order number, sales amount, tax amount from the SALES table and sort it by column sales amount and tax amount in ascending order.
3. Produce a list of rows showing order number, sales date, product number, sales amount, tax amount from the SALES table and sort it by order number in descending order.
Ans: 
select order_id, sales_date, product_id, sales_amount, tax_amount from sales order by order_id desc;

SET Operators: 
=============
UNION:
=====
SELECT  sales_date, product_id, customer_id FROM sales
UNION
SELECT  sales_date, product_id, customer_id FROM sales_history;

UNION ALL:
========
SELECT  sales_date, product_id, customer_id FROM sales
UNION ALL
SELECT  sales_date, product_id, customer_id FROM sales_history;=

INTERSECT:
=========
SELECT  sales_date, product_id, customer_id FROM sales
INTERSECT
SELECT  sales_date, product_id, customer_id FROM sales_history;

MINUS:
=====
SELECT  sales_date, product_id, customer_id FROM sales
MINUS
SELECT  sales_date, product_id, customer_id FROM sales_history;

Exercise
1. Produce a list of ALL rows showing order number by combining data from SALES and SALES_HISTORY table.
SELECT ORDER_ID FROM SALES
UNION ALL
SELECT ORDER_ID FROM SALES;

2. Produce a list of DISTINCT rows from SALES and SALES_HISTORY table using column order number.
SELECT ORDER_ID FROM SALES
UNION
SELECT ORDER_ID FROM SALES;

3. Produce a list of COMMON rows between SALES and SALES_HISTORY table using column order number.
SELECT ORDER_ID FROM SALES
INTERSECT
SELECT ORDER_ID FROM SALES;

4. Produce a list of rows which are present in SALES table and are not present in SALES_HISTORY table using column order number.
SELECT ORDER_ID FROM SALES
MINUS
SELECT ORDER_ID FROM SALES;

Aggregate/Summery functions:
===========================
MIN()--> Returns the smallest value
=====================================
MAX()--> Returns the largest value
==================================
SUM()--> Returns the sum of the values
======================================
AVG()--> Returns the average of the values
=========================================
COUNT()--> Returns the number of rows
=====================================
FIRST()--> Returns the first value of the group
===============================================
LAST()--> Returns the last value of the group
=============================================
SELECT COUNT(*), MIN(Total_amount), MAX(total_amount), SUM(total_amount), AVG(total_amount) FROM sales;

GROUP BY:
=========
SELECT sales_date, SUM(total_amount) FROM sales 
GROUP BY sales_date;

SELECT sales_date, SUM(total_amount) FROM sales 
GROUP BY sales_date ORDER BY sales_date;

SELECT sales_date, product_id, customer_id, SUM(total_amount) as sum
FROM sales
WHERE sales_date BETWEEN '01-Jan-2015' AND '31-Jan-2015'
GROUP BY sales_date, product_id, customer_id 
ORDER BY sales_date, product_id, customer_id;

HAVING clause:
==============
SELECT sales_date, product_id, SUM(total_amount) as sum
FROM sales
WHERE sales_date BETWEEN '01-Jan-2015' AND '31-Jan-2015'
GROUP BY sales_date, product_id
HAVING SUM(total_amount) > 100;

Exercise
========
1. Write a query that shows the number of rows in SALES table.
2. Produce a list which shows total sales volume broken by sales date from SALES table.
3. Produce a list which shows maximum sales volume broken by sales date and order number from SALES table.
4. Produce a list which shows minimum sales volume broken by sales date from SALES table and minimum sales volume is less than 100. (Hint: use HAVING clause)
Answers:
=======
1. 
SELECT count(*) FROM sales
2. 
SELECT sales_date, SUM(total_amount)
FROM sales
GROUP BY sales_date
3. 
SELECT sales_date, order_id, MAX(total_amount)
FROM sales
GROUP BY sales_date, order_id
4. 
SELECT sales_date, MIN(total_amount)
FROM sales
GROUP BY sales_date
HAVING MIN(total_amount)< 100

