/*Объедините имена членов и названия объектов в обдну таблицу с одним столбцом.*/
SELECT firstname AS NAME FROM members
UNION ALL
SELECT facility AS NAME FROM facilities