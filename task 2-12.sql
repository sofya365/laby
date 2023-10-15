/* Найдите дату последней регистрации члена клуба.*/
select max(starttime) as 'last registration' from bookings;