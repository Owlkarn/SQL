DROP DATABASE IF EXISTS homework_2;

CREATE DATABASE IF NOT EXISTS homework_2;

USE homework_2;

CREATE TABLE IF NOT EXISTS sales (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  order_date DATE NOT NULL,
  count_product INT UNSIGNED
);

INSERT sales (
  order_date, count_product)
VALUES
  ('2022-01-01', 156),
  ('2022-01-02', 180),
  ('2022-01-03', 21),
  ('2022-01-04', 124),
  ('2022-01-05', 341);
  
CREATE TABLE IF NOT EXISTS sales_2 (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  order_type VARCHAR(45) NOT NULL,
  FOREIGN KEY (id) REFERENCES sales (id)
  ON DELETE NO ACTION
  ON UPDATE CASCADE
);

INSERT INTO sales_2 (
  id, order_type)
SELECT id,
  CASE
    WHEN count_product <= 100 THEN 'Маленький заказ'
    WHEN count_product <= 300 AND count_product > 100 THEN 'Средний заказ'
    ELSE 'Большой заказ'
  END AS order_type
FROM sales;

CREATE TABLE IF NOT EXISTS orders (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  employee_id VARCHAR(45) NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  order_status VARCHAR(45) NOT NULL
);

INSERT orders (
  employee_id, amount, order_status)
VALUES
  ('e03', 15.00, 'OPEN'),
  ('e01', 25.50, 'OPEN'),
  ('e05', 100.70, 'CLOSED'),
  ('e02', 22.18, 'OPEN'),
  ('e04', 9.50, 'CANCELLED');
  
SELECT id, employee_id, amount, order_status,
CASE
  WHEN order_status = 'OPEN' THEN 'Order is in open state'
  WHEN order_status = 'CLOSED' THEN 'Order is closed'
  WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
END AS full_order_status
FROM orders;
