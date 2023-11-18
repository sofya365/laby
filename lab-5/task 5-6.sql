/* Составьте список общего количества бронирований на каждый 
объект в месяц в 2012 году.*/
USE cd;
SELECT COUNT(b.slots), f.facility, MONTH(b.starttime) FROM bookings AS b
JOIN facilities AS f ON b.facid = f.facid
WHERE YEAR(starttime) LIKE '%2012-09%'
GROUP BY f.facid, MONTH(b.starttime);