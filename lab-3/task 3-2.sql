/* Выберите теннисные корты, забронированные пользователями на 
19 сентября 2012 года*/
USE cd;
SELECT facilities.facid, facilities.facility, bookings.facid, bookings.starttime FROM facilities
JOIN bookings ON facilities.facid=bookings.facid
WHERE DATE(starttime)='2012-09-19' AND facility LIKE '%Tennis Court%';
