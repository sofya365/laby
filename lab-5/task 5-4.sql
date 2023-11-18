/* Рассчитайте количество аренд каждого из объектов клуба.*/
USE cd;
SELECT COUNT(b.slots), f.facility FROM bookings AS b
JOIN facilities AS f ON b.facid = f.facid
GROUP BY f.facid;