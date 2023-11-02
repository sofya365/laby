/*Выберите всех членов клуба и членов, которые их рекомендовали,  
отсортировав их по имени и фамилии.*/
USE cd;
SELECT DISTINCT m.memid, m.surname, m.firstname, m.recommendedby FROM members AS m
JOIN members AS m1 ON m.memid = m1.recommendedby WHERE m.recommendedby IS NOT NULL;