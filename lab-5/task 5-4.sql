/* Рассчитайте количество аренд каждого из объектов клуба.*/
USE cd;
SELECT SUM(b.slots), f.facility FROM bookings AS b
INNER JOIN facilities AS f ON b.facid = f.facid
GROUP BY f.facid;