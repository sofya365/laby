/*Выберите список всех членов, включая человека, который их 
рекомендовал (если таковой имеется), без использования каких-либо 
объединений. Исключите в списке дубликаты, упорядочите лист по ФИО (==   
имя + фамилия).*/
USE cd;
SELECT memid,
concat(m1.surname, ' ', m1.firstname) AS 'Участник', (SELECT concat(m.surname, ' ', m.firstname) FROM members m WHERE m.memid = m1.recommendedby) AS 'Рекомендован '
FROM members m1 WHERE surname != 'GUEST'
ORDER BY Участник;