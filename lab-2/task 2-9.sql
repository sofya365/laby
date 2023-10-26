/* Выбрать всех членов клуба, зарегистрированных с сентября 2012 
года.*/
SELECT firstname FROM members WHERE joindate LIKE '%2012-09%';