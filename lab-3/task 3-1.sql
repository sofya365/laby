/*Выберите лист времке  (timestamp) покупки времени 
использования объектов членом клуба 'David Farrell'.*/
USE cd;
SELECT bookings.starttime, bookings.memid, members.surname, members.firstname, members.memid
FROM members
JOIN bookings
ON members.memid = bookings.memid
WHERE (surname='Farrell' and firstname='David')