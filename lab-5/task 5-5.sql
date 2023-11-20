/* Рассчитайте количество аренд каждого из объектов клуба за 
сентябрь 2012 года.*/
USE cd;
SELECT COUNT(b.slots), f.facility FROM bookings AS b
INNER JOIN facilities AS f ON b.facid = f.facid
WHERE DATE(b.starttime) >= '2012-09-01' AND DATE(b.starttime) <= '2012-09-30'
GROUP BY f.facid;