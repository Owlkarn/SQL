-- Создайте функцию, которая принимает кол-во сек и
-- формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER //

CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(255)
NO SQL
BEGIN
  DECLARE days INT;
  DECLARE hours INT;
  DECLARE minutes INT;
  DECLARE sec INT;
  DECLARE result VARCHAR(255);
  
  SET days = FLOOR(seconds / (24 * 60 * 60));
  SET seconds = seconds % (24 * 60 * 60);
  
  SET hours = FLOOR(seconds / (60 * 60));
  SET seconds = seconds % (60 * 60);
  
  SET minutes = FLOOR(seconds / 60);
  SET seconds = seconds % 60;
  
  SET result = CONCAT(days, ' day(s) ', hours, ' hour(s) ', minutes, ' minute(s) ', seconds, ' second(s)');
  
  RETURN result;
END //

DELIMITER ;

SELECT format_seconds(123456);

-- Выведите только четные числа от 1 до 10 (Через цикл).
-- Пример: 2,4,6,8,10

DELIMITER //

CREATE FUNCTION get_numbers (n INT)
RETURNS VARCHAR(100)
NO SQL
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE even_numbers VARCHAR(100) DEFAULT '';
  
  WHILE i <= n DO
    IF i%2 = 0 THEN
      SET even_numbers = CONCAT(even_numbers, i, ', ');
	END IF;
    SET i = i + 1;
  END WHILE;
  SET even_numbers = SUBSTRING(even_numbers, 1, LENGTH(even_numbers) - 2);
  RETURN even_numbers;
END //

DELIMITER ;

SELECT get_numbers(20);
  

