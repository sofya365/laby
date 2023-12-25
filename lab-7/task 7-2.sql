/*Создайте таблицу payments со структурой (payid INT PK, FK on booking.bookid; payment  DECIMAL. 
Добавьте в таблицу bookings поле payed, смысл которого оплачена или не оплачена аренда. 
Создайте триггеры*/
/* создание таблицы payments и добавление payed*/
USE cd1;
CREATE TABLE payments (
  payid INT PRIMARY KEY AUTO_INCREMENT,
  bookid INT,
  payment DECIMAL,
  FOREIGN KEY (bookid) REFERENCES cd.bookings(bookid)
);
ALTER TABLE bookings ADD COLUMN payed TINYINT DEFAULT 0;
/*Создайте триггеры, которые: 1) Запрещают удаление записей, если они уже оплачены;*/
DELIMITER $$
DROP TRIGGER IF EXISTS prevent_payment_deletion $$
CREATE TRIGGER prevent_payment_deletion 
BEFORE DELETE ON bookings 
FOR EACH ROW 
BEGIN
  IF (OLD.payed = 1) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Can not delete a paid booking!';
  END IF;
END$$
DELIMITER ;
/*2) После отметки оплаты, заносят в таблицу payments запись с соответствующим значением PK 
и суммой оплаты, для вычисления которой используется функция созданная в Task-7-1.*/
/*3) При отмене оплаты - удаляет соответствующую запись в таблице payments.*/
DELIMITER $$
DROP TRIGGER IF EXISTS payment_record $$
CREATE TRIGGER payment_record 
AFTER UPDATE ON bookings
FOR EACH ROW
BEGIN
    CASE
        WHEN NEW.payed = OLD.payed THEN BEGIN END;
        WHEN NEW.payed = 1 THEN
            INSERT INTO payments(bookid, payment)
            VALUES(NEW.bookid, CalculateRentalCost(NEW.memid, NEW.facid, NEW.slots));
        WHEN NEW.payed = 0 THEN
            DELETE FROM payments p WHERE p.bookid = NEW.bookid;
    END CASE;
END $$
/* заполняем payments*/
DROP TRIGGER IF EXISTS payed_in_book $$
CREATE TRIGGER payed_in_book 
AFTER INSERT ON bookings 
FOR EACH ROW
BEGIN
    IF NEW.payed = 1 THEN
        INSERT INTO payments(bookid, payment)
        VALUES(NEW.bookid, CalculateRentalCost(NEW.memid, NEW.facid, NEW.slots));
    END IF;
END $$
DELIMITER ;
/* отмечаем, что все аренды июля 2012 оплачены*/
UPDATE bookings 
SET payed = 1
WHERE YEAR(starttime) = 2012 AND MONTH(starttime) = 7;
/* оплата на июль 2012 с данными из payments*/
SELECT SUM(payment) as costJuly1
FROM payments;
/* оплата на июль 2012 с данными из bookings*/
SELECT SUM(CalculateRentalCost(memid, facid, slots)) as costJuly2
FROM bookings 
WHERE YEAR(starttime) = 2012 AND MONTH(starttime) = 7;