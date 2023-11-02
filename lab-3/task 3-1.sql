/*Выберите лист времке (timestamp) покупки времени 
использования объектов членом клуба 'David Farrell'*/
USE cd;
SELECT bookings.starttime, bookings.memid, members.surname, members.firstname, members.memid
FROM members
JOIN bookings ON (surname = 'Farrel' AND firstname = 'David') AND members.memid = bookings.memid;
