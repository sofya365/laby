/*Добавьте еще одно spa с такими же характеристиками как в 
задании 1, сгенерировав новое ID.*/
USE cd;
INSERT INTO facilities(facid, facility, membercost, guestcost, initialoutlay, monthlymaintenance)
VALUES((SELECT MAX(facid) + 1 FROM facilities), 'Spa', 20, 30, 100000, 800);
SELECT * FROM facilities;