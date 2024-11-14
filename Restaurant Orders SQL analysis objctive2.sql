-- Objective 2 
USE restaurant_db;

-- 1. View the order_details table.
SELECT * FROM order_details;

SELECT * FROM order_details
ORDER BY order_date;



-- 7. What is the date range of the table?
SELECT 
	MIN(order_date) AS min_date,
	MAX(order_date) AS max_date,
    DATEDIFF( MAX(order_date), MIN(order_date)) as range_of_days_between
FROM order_details;



-- 8. How many orders were made within this date range?
SELECT COUNT(DISTINCT order_id) AS orders_count 
FROM order_details;



-- 9. How many items were ordered within this date range?
SELECT COUNT(*) AS ordered_items_count
FROM order_details;



-- 10. Which orders had the most number of items?
WITH orders_count AS (
	SELECT order_id, count(item_id) AS num_items
	FROM order_details
	GROUP BY order_id
)
SELECT  order_id, num_items as max_items_count
FROM orders_count 
WHERE num_items = ( SELECT MAX(num_items) FROM orders_count);



-- 11. How many orders had more than 12 items?
SELECT COUNT(*) AS orders_counts
FROM
	(SELECT order_id, COUNT(item_id) AS num_items
	FROM order_details
	GROUP BY order_id
	HAVING num_items > 12) AS num_orders;



