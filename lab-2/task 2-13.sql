/* Выберите имя, фамилию и дату вступления в клуб последних из 
всех вступивших.*/
select m.firstname, m.surname, b.starttime from members as m join bookings as b on m.memid = b.memid order by b.starttime desc;