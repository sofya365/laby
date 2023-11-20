/*Составьте список имен и идентификаторов каждого участника, 
а также их первого бронирования после 1 сентября 2012 г. 
Упорядочите по идентификатору участника.*/
USE cd;
SELECT m.firstname AS 'имя', m.memid AS 'идентификатор', MIN(b.starttime) AS 'первое бронирование' FROM members AS m
LEFT JOIN bookings AS b ON m.memid=b.memid
WHERE DATE(b.starttime) > '2012-09-01' AND m.firstname != 'GUEST'
GROUP BY m.memid;