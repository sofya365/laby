/*Создайте список объектов с общим доходом менее 1000. 
Создайте выходную таблицу, состоящую из названия объекта и дохода, 
отсортированного по доходу. Помните, что для гостей и участников 
действуют разные цены!*/
USE cd;
SELECT f.facility AS 'обьект', SUM(CASE 
WHEN b.memid = 0 THEN f.guestcost * b.slots ELSE f.membercost * b.slots 
END) AS 'общий доход'
FROM facilities AS f
JOIN bookings AS b ON f.facid = b.facid
GROUP BY f.facility
HAVING 'общий доход' < 1000
ORDER BY 'общий доход' DESC;