/* Выберите 10 фамилий членов клуба упорядочите их по алфавиту 
без повторов.*/ 
SELECT surname FROM members WHERE memid > 1 AND memid < 12 ORDER BY surname;