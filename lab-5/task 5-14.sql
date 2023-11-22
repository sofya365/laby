/*Выведите идентификатор объекта, в котором забронировано наибольшее количество мест (slot). 
Убедитесь, что в случае ничьей все результаты привязки будут выведены.*/
USE cd;
SELECT facid
FROM bookings
WHERE slots = (SELECT MAX(slots) FROM bookings);