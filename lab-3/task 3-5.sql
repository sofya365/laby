/* Выберите ФИО (== имя + фамилия) всех, кто покупал корты 1 и 2*/
USE cd;
SELECT m.surname, m.firstname, f.facility FROM members AS m
JOIN facilities AS f ON (f.facility = 'Tennis Court 1' OR f.facility = 'Tennis Court 2')



