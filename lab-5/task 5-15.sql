/*Составьте список участников (включая гостей) вместе с количеством часов, 
которые они забронировали для объекта,  округленным до ближайших десяти часов. 
Ранжируйте их по этой округленной цифре, получая в результате имя, фамилию, округленные часы и звание (== ранг). 
Сортировка по званию (== рангу), фамилии и имени.*/
USE cd;
SELECT CONCAT(m.firstname,' ', m.surname) AS 'фио', ROUND(b.slots, -1) AS 'забронированные часы', 
RANK() OVER (ORDER BY ROUND(SUM(b.slots, -1))) as 'rank'
FROM members AS m JOIN bookings AS b ON m.facid=b.facid
WHERE ROUND(b.slots, -1) NOT NULL
ORDER BY 'rank', 'фио';