/*Создайте функцию, которая рассчитывает стоимость каждой аренды (для каждой записи таблицы bookings)*/
USE cd1;
DELIMITER $$
DROP FUNCTION IF EXISTS CalculateCost $$
CREATE FUNCTION CalculateCost(memid INT, facid INT, slots INT) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE cost DECIMAL(10, 2);
    SET cost = (SELECT IF(memid = 0, guestcost * slots, membercost * slots)
    FROM facilities as f WHERE facid = f.facid);
    RETURN cost;
END $$
DELIMITER ;
SELECT CalculateCost(memid, facid, slots)
FROM bookings;