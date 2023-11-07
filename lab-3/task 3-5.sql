/* Выберите ФИО (== имя + фамилия) всех, кто покупал корты 1 и 2*/
USE cd;
SELECT CONCAT(m.surname,' ', m.firstname)AS name, f.facility FROM members AS m
JOIN facilities AS f ON m.members=m.facilities
WHERE(f.facility like '%Court 1%' OR f.facility like '%Court 2%')

