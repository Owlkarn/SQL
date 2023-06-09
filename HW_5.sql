-- Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW view1 as
SELECT *
FROM cars
WHERE Cost < 25000;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
ALTER VIEW view1 as
SELECT *
FROM cars
WHERE Cost < 30000;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW view2 as
SELECT *
FROM cars
WHERE Name = 'Skoda' OR Name = 'Audi';

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
SELECT an_name, an_price
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_an 
AND Orders.ord_datetime >= '2020-02-05' 
AND Orders.ord_datetime <= '2020-02-12';

-- Добавьте новый столбец под названием «время до следующей станции». 
-- Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
-- Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. 
-- Проще это сделать с помощью оконной функции LEAD . 
-- Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
-- В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
SELECT train_id, station, station_time, 
subtime(
LEAD (station_time) OVER (PARTITION BY train_id), station_time) AS 'time_to_next_station'
FROM trains;


