/*Составьте список общего количества часов, забронированных на один объект, помня,
что интервал длится полчаса. Выходная таблица должна состоять из идентификатора объекта, 
имени и забронированных часов, отсортированных по идентификатору объекта. 
Попробуйте отформатировать часы с точностью до двух десятичных знаков.*/
USE cd;
SELECT bookings.facid AS 'идентификатор объекта',facilities.facility AS 'имя объекта', ROUND(SUM( bookings.slots) / 2, 2) AS 'забронированные часы'
FROM facilities
JOIN bookings ON facilities.facid = bookings.facid
GROUP BY идентификатор объекта, имя объекта
ORDER BY идентификатор объекта;