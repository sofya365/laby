/* Составьте список общего количества бронирований на каждый 
объект в месяц в 2012 году.*/
USE cd;
SELECT SUM(b.slots), f.facility, MONTH(b.starttime) FROM bookings AS b
INNER JOIN facilities AS f ON b.facid = f.facid
WHERE YEAR(starttime) = '2012'
GROUP BY f.facid, MONTH(b.starttime);