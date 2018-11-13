

Dual Table:
==========
SELECT user FROM dual;

SELECT sysdate FROM dual;


Number related functions or Numeric built in functions:
======================================================
SELECT ROUND(49.5121244) FROM dual;
SELECT ROUND(59.482365) FROM dual;
SELECT  ROUND(49.5121244, 4) FROM dual;

SELECT POWER(1024, 3) FROM dual;

SELECT CEIL(49.25) FROM dual;

SELECT SQRT(256466) FROM dual;


Character built in functions:
=============================
select upper('Bangladesh') from dual;

select lower('Bangladesh') from dual;

select length('Bangladesh') from dual;

select substr('bangladesh', 1,6) from dual;

select substr('bangladesh', 7, 4) from dual;

select decode(30, 20,'Twuenty', 10,'Ten', 30,'Thirty') from dual;

SELECT UPPER('Bangladesh'), 
('Bangladesh'), 
LENGTH('Bangladesh'), 
SUBSTR('Bangladesh', 1, 6), 
DECODE(50, 10,'TEN', 20,'TWENTY', 50,'FIFTY')
FROM dual; 

Date formating built in functions:
=================================

select months_between('01-mar-15', '01-jan-14') from dual;

select add_months('15-jan-17', 3) from dual;

select last_day('21-feb-2020') from dual;

SELECT NEXT_DAY('01-JAN-2016', 'MONDAY') FROM DUAL;


select months_between('01-may-2013', '01-jun-10'), 
add_months('20-apr-15',5), 
last_day('16-feb-14'),
next_day('10-dec-09', 'Sunday')
from dual;

select last_day(sales_date), add_months(sales_date, 12), sales_date from sales;


Exercise
========
Run these below SQL statements and check the result.
1. SELECT ADD_MONTHS('01-Aug-09', 3) FROM DUAL;
2. SELECT ADD_MONTHS('01-Aug-09', -3) FROM DUAL;
3. SELECT CONCAT('RUSH ', 'HOUR') FROM DUAL;
4. SELECT LENGTH('SQL Course') FROM DUAL;
5. SELECT LPAD('course', 9) FROM DUAL;
6. SELECT RPAD('course', 9) FROM DUAL;
7. SELECT INSTR('Oracle Course', 'r') FROM DUAL;
8. SELECT LOG(10, 20) FROM DUAL;
9. SELECT LAST_DAY(TO_DATE('2015/03/15', 'yyyy/mm/dd')) FROM
DUAL;
10.SELECT MONTHS_BETWEEN (TO_DATE ('2015/01/01','yyyy/mm/dd'),
TO_DATE ('2015/03/01', 'yyyy/mm/dd') ) FROM DUAL;


Case Statement: This is equal to IF THEN ELSE
===============
SELECT sales_date, total_amount,
CASE
WHEN total_amount <= 100 THEN 'Low'
WHEN total_amount < 1000 THEN 'Medium'
ELSE 'High'
END
FROM sales;

select order_id, total_amount, 
case
when total_amount <= 100 then 'Low'
when total_amount < 1000 then 'Medium'
else 'High'
end
from sales;

Alias Name:
===========
SELECT sales_date AS "Sales Date", total_amount AS "Total Amount",
CASE
WHEN total_amount <= 100 THEN 'Low'
WHEN total_amount < 1000 THEN 'Medium'
ELSE 'High'
END AS "Total Bracket"
FROM sales;

DISTINCT:
========
select distinct sales_date, order_id from sales;

PSEUDO COLLUMNS in Oracle:
==========================
SELECT * FROM SALES;

SELECT SYSDATE FROM DUAL;

SELECT SYSDATE, USER FROM DUAL;

SELECT ROWNUM, ROWID, SALES_DATE, ORDER_ID FROM SALES;




