/*Подсчитайте количество участников, чья фамилия начинается на определенную букву, отсортировав по буквам в порядке убывания.*/
USE cd;
SELECT LEFT(surname,1) AS 'первая_буква', COUNT(*) AS count_members
FROM members
GROUP BY первая_буква
ORDER BY первая_буква DESC;