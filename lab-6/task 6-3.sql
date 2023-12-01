/*Выберите процент использования объектов по месяцам, упорядочив по возрастанию*/
USE cd;
WITH slots as (
  SELECT facility, SUM(b.slots) as rent_count,
      DATE_FORMAT(b.starttime, "%m %Y") as дата
    FROM facilities as f
      JOIN bookings as b ON b.facid = f.facid
    GROUP BY f.facid, дата
)
SELECT s1.facility, CONCAT(ROUND(s1.rent_count / SUM(s2.rent_count) * 100, 1), '%') as usability, s1.дата
FROM slots as s1
JOIN slots as s2 ON s1.дата = s2.дата
GROUP BY s1.facility, s1.rent_count, s1.дата
ORDER BY CAST(usability as FLOAT) ASC;