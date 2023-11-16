/*Удалите все записи об аренде объектов в транзакции, выведите 
список аренд, завершите транзакция с отказом от всех произведенных 
изменений. Повторите запрос списка аренд. Сравните результат.*/
START TRANSACTION;
DELETE FROM bookings;
SELECT 'Before' AS result_type, * FROM bookings;
ROLLBACK;
SELECT 'After' AS result_type, * FROM bookings;
