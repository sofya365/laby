/* Выберите членов клуба, которые рекомендовали других членов для вступления */
USE cd;
SELECT m.memid, m.surname, m.firstname FROM members AS m
JOIN members AS m1 ON m.memid=m1.recommendedby;