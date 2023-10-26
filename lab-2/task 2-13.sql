/* Выберите имя, фамилию и дату вступления в клуб последних из 
всех вступивших.*/
SELECT firstname, surname, joindate FROM members where memid = memid ORDER BY joindate DESC;