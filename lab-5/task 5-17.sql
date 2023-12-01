/*Классифицируйте объекты на группы одинакового размера 
(высокие, средние и низкие в зависимости от их доходов). 
Упорядочите по классификации и названию объекта.*/
USE cd;
SELECT facility, 
CASE 
  WHEN income = 1 THEN 'Высокий доход'
  WHEN incom = 2 THEN 'Средний доход'
  WHEN income = 3 THEN 'Низкий доход'
END AS income
FROM (
  SELECT f.facility, SUM(CASE WHEN b.memid = 0 THEN f.guestcost * b.slots ELSE f.membercost * b.slots END) AS revenue,
  NTILE(3) OVER (ORDER BY SUM(CASE WHEN b.memid = 0 THEN f.guestcost * b.slots ELSE f.membercost * b.slots END) AS income
  FROM facilities f
  INNER JOIN bookings b ON f.facid = b.facid
  GROUP BY f.facility
) as subquery
ORDER BY income, facility;
