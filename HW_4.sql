USE homework_4; 
-- Задание №1.. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA

SELECT MARK, COLOR, COUNT(*) AS COUNT
FROM auto
WHERE MARK IN ('BMW', 'LADA')
GROUP BY MARK, COLOR;

-- Задание №2.. Вывести на экран марку авто и количество AUTO не этой марки

SELECT MARK, (SELECT COUNT(*) FROM auto) - COUNT(*) AS COUNT
FROM auto
GROUP BY MARK;

-- Задание №3. Даны 2 таблицы, созданные следующим образом.
-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.

SELECT test_a.*
FROM test_a
LEFT JOIN test_b
ON test_a.id = test_b.id
WHERE test_b.id IS NULL;

-- Необходимо преобразовать поля таблицы к типу DATETIME, сохранив введеные ранее значения.

-- Добавляем временное поле
ALTER TABLE orders ADD COLUMN odate_new DATETIME;

-- Обновляем новое поле с преобразованием значения
UPDATE orders SET odate_new = STR_TO_DATE(odate, '%m/%d/%Y');

-- Удаляем старое поле
ALTER TABLE orders DROP COLUMN odate;

-- Переименовываем новое поле
ALTER TABLE orders CHANGE odate_new odate DATETIME;


