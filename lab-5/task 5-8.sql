/*Составьте список объектов вместе с их общим доходом. Выходная 
таблица должна состоять из названия объекта и доходов, отсортированных 
по доходам. Помните, что для гостей и участников действуют разные цены!*/
USE cd;
SELECT f.facility AS 'обьект', SUM(CASE 
WHEN b.memid = 0 THEN f.guestcost * b.slots ELSE f.membercost * b.slots 
END) AS 'общий доход'
FROM facilities AS f
JOIN bookings AS b ON f.facid = b.facid
GROUP BY f.facility
ORDER BY 'общий доход' DESC;