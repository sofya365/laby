/* Рассчитайте количество аренд каждого из объектов клуба за 
сентябрь 2012 года.*/
USE cd;
SELECT COUNT(b.slots), f.facility FROM bookings AS b
JOIN facilities AS f ON b.facid = f.facid
WHERE DATE(starttime) LIKE '%2012-09%'
GROUP BY f.facid;