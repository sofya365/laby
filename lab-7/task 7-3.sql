/*Напишите процедуру, которая считает окупаемость каждого объекта клуба на основании оплаты аренд за месяц. 
Применить ее к июлю 2012 года. */
USE cd1;
DELIMITER $$
DROP PROCEDURE IF EXISTS payback $$
CREATE PROCEDURE payback(yourdate DATE)
  BEGIN
    SELECT IF (SUM(p.payment) - f.monthlymaintenance = 0, 123456789, f.initialoutlay / (SUM(p.payment) - f.monthlymaintenance)) AS occupate
	FROM bookings b
	INNER JOIN payments p ON b.bookid = p.bookid
	INNER JOIN facilities f ON b.facid = f.facid
	WHERE DATE_FORMAT(starttime, '%y %m') = DATE_FORMAT(yourdate, '%y %m')
	GROUP BY b.facid 
    ORDER BY b.facid;
  END $$
DELIMITER ;
CALL payback('2012-07-14');