create database pizzadb;
use pizzadb;

-- Orders placed each day

SELECT 
    DAYNAME(date) AS days, COUNT(order_id) AS num_order
FROM
    orders
GROUP BY days;

-- Sales by day

SELECT 
    DAYNAME(date) AS days,
    FLOOR(SUM(b.quantity * c.price)) AS sales
FROM
    orders a
        JOIN
    order_details b ON a.order_id = b.order_id
        JOIN
    pizzas c ON b.pizza_id = c.pizza_id
GROUP BY days
ORDER BY sales DESC;

-- Sales by month

SELECT 
    MONTHNAME(date) AS month,
    FLOOR(SUM(o.quantity * p.price)) AS sales
FROM
    orders a
        JOIN
    order_details o ON a.order_id = o.order_id
        JOIN
    pizzas p ON o.pizza_id = p.pizza_id
GROUP BY month
ORDER BY sales DESC;

-- Peaks hours

SELECT 
    HOUR(time), COUNT(order_id) AS orders
FROM
    orders
GROUP BY HOUR(time)
ORDER BY orders DESC;

-- Sales by pizza's size

SELECT 
    p.size, FLOOR(SUM(o.quantity * p.price)) AS sales
FROM
    order_details o
        JOIN
    pizzas p ON o.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY sales DESC;

-- Sales by pizza's category

SELECT 
    b.category, FLOOR(SUM(o.quantity * p.price)) AS sales
FROM
    pizza_types b
        JOIN
    pizzas p ON b.pizza_type_id = p.pizza_type_id
        JOIN
    order_details o ON p.pizza_id = o.pizza_id
GROUP BY b.category
ORDER BY sales DESC;


-- Bestsellers

SELECT 
    p.pizza_type_id, FLOOR(SUM(o.quantity * p.price)) AS sales
FROM
    order_details o
        JOIN
    pizzas p ON o.pizza_id = p.pizza_id
GROUP BY p.pizza_type_id
ORDER BY sales DESC
LIMIT 5;

-- Worstsellers

SELECT 
    p.pizza_type_id, FLOOR(SUM(o.quantity * p.price)) AS sales
FROM
    order_details o
        JOIN
    pizzas p ON o.pizza_id = p.pizza_id
GROUP BY p.pizza_type_id
ORDER BY sales
LIMIT 5;







