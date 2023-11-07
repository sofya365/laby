/*Выберите всех членов клуба и членов, которые их рекомендовали,  
отсортировав их по имени и фамилии.*/
USE cd;
SELECT m.memid, m.surname AS 'Фамилия', m.firstname AS 'Имя', m.recommendedby AS 'id рекомендовавшего',
m1.surname AS 'Фамилия рекомендовавшего', m1.firstname AS 'Имя рекомендовавшего' FROM members AS m
LEFT JOIN members AS m1 ON m.recommendedby = m1.memid
ORDER BY m.surname, m.firstname;