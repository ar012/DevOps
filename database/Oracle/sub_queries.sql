Sub Queries: A sub query is a query within a query which can return on or more rows.
============ A sub query exucutes first before the main query.

SELECT * FROM SALES
WHERE CUSTOMER_ID =
(
SELECT CUSTOMER_ID FROM CUSTOMER
WHERE LAST_NAME = 'JOSEPH'
);

SELECT * FROM SALES
WHERE CUSTOMER_ID IN
(
SELECT CUSTOMER_ID FROM CUSTOMER
WHERE LAST_NAME = 'JOSEPH' OR LAST_NAME = 'MANN'
);

SELECT * FROM SALES
WHERE CUSTOMER_ID IN
(
SELECT CUSTOMER_ID FROM CUSTOMER
WHERE REGION = 'SOUTH'
);


Multiple Column Subsequence:
===========================
-- Pairwise Comparisons

SELECT sales_date, order_id, customer_id, product_id, unit_price FROM sales
WHERE (product_id, unit_price) IN
(
SELECT product_id, unit_price FROM sales
WHERE sales_date = '01-jan-2015'
);

-- Non-Pairwise Comparisons
SELECT sales_date, order_id, customer_id, product_id, unit_price FROM sales
WHERE product_id IN
(
SELECT product_id FROM sales
WHERE sales_date = '01-jan-2015'
)
AND unit_price IN
(
SELECT unit_price FROM sales
WHERE sales_date = '01-jan-2015'
);

Using sub-query in the FROM clause:
===================================
SELECT s.sales_date,
       s.order_id,
       s.customer_id,
       s.salesperson_id,
       s.total_amount,
       st.sales_total
FROM sales s,
(
SELECT SUM(total_amount) AS sales_total
FROM sales
) st;
       

SELECT s.sales_date,
       s.order_id,
       s.customer_id,
       s.salesperson_id,
       s.total_amount,
       st.sales_total
FROM sales s,
(
SELECT sales_date, SUM(total_amount) AS sales_total
FROM sales
GROUP BY sales_date
) st
WHERE s.sales_date = st.sales_date;

WITH Clause:
============
WITH st AS
(
SELECT sales_date, SUM(total_amount) AS sales_total
FROM sales
GROUP BY sales_date
) 
SELECT s.sales_date,
       s.order_id,
       s.customer_id,
       s.salesperson_id,
       s.total_amount,
       st.sales_total
FROM sales s, st
WHERE s.sales_date = st.sales_date;

Scalar sub-query:
=================
SELECT s.sales_date,
       s.order_id,
       s.customer_id,
       s.salesperson_id,
       s.total_amount,
       (
        SELECT SUM(total_amount) AS sales_total
        FROM sales
        ) 
FROM sales s;

Correlated Sub-query:
=====================
SELECT * 
FROM SALES X
WHERE TOTAL_AMOUNT > (
SELECT AVG(TOTAL_AMOUNT) 
FROM SALES Y
WHERE Y.CUSTOMER_ID = X.CUSTOMER_ID
)
ORDER BY CUSTOMER_ID;

