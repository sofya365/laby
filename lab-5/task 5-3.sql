/* Рассчитайте для каждого члена количество рекомендаций, 
данных этим членом клуба, исключив членов, которые не давали 
рекомендаций.*/
USE cd;
SELECT CONCAT(m.surname, ' ', m.firstname) AS 'имя', COUNT(m1.memid) AS 'количество рекомендаций' FROM members AS m
LEFT JOIN members AS m1 ON m1.recommendedby = m.memid 
WHERE m1.memid IS NOT NULL 
GROUP BY m.memid;