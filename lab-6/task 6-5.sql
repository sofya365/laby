/*Выведите наименования всех объектов клуба заглавными буквами, если они содержат в названии слово ‘Tennis’*/
USE cd;
SELECT UPPER(facility) AS 'объект' FROM facilities
WHERE BINARY fasility LIKE '%Tennis%';