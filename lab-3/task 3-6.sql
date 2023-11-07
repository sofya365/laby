/*Выберите список бронирований на 14 сентября 2012 г., чтоимость 
которых более 30. Включите в выходные данные название заведения, имя 
участника, отформатированное как одиночное столбец и стоимость. 
Упорядочивайте по убыванию стоимости и не используйте подзапросы.
Помните, что у гостей разные затраты по сравнению с участниками 
(указанные затраты указаны за получасовой «интервал»), а идентификатор 
гостя всегда имеет идентификатор 0. */
USE cd;
SELECT * FROM facilities;
SELECT facilities.facility,
concat(members.firstname,' ',members.surname) AS name,
CASE
WHEN bookings.memid=0 THEN bookings.slots*facilities.guestcost ELSE bookings.slots*facilities.membercost 
END AS cost
FROM bookings
JOIN facilities ON bookings.facid=facilities.facid
JOIN members ON bookings.memid=members.memid
WHERE DATE(starttime)='2012-09-14'
AND ((bookings.memid=0 AND bookings.slots*facilities.guestcost>30) OR (bookings.memid!=0 AND bookings.slots*facilities.membercost>30))
ORDER BY cost DESC;
