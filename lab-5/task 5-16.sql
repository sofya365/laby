/*Составьте список трех крупнейших объектов, приносящих доход (включая связи). 
Вывод названия и ранга объекта, отсортированный по рангу и названию объекта.*/
USE cd;
SELECT f.facility, RANK() OVER (ORDER BY SUM(CASE 
WHEN b.memid = 0 THEN f.guestcost * b.slots ELSE f.membercost * b.slots 
END) DESC) as 'ранг'
FROM facilities f
JOIN bookings b ON f.facid = b.facid 
GROUP BY f.facility 
ORDER BY ранг, f.facility
LIMIT 3;