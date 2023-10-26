/* Найдите дату последней регистрации члена клуба.*/
SELECT max(joindate) AS 'last registration' FROM members;