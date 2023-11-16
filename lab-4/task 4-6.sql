/*Увеличьте стоимость аренды  корта 1 (facid = 0) на 10% для 
членов и гостей.*/
USE cd;
UPDATE facilities SET membercost=6+0.6, guestcost=30+3 WHERE facid = 0;
SELECT * FROM facilities;