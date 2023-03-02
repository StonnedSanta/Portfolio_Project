create database pizzadb;
use pizzadb;

-- How many customers do we have each day? Are there any peak hours?
SELECT 
    *
FROM
    orders;

-- orders placed each day
SELECT 
    date, COUNT(order_id)
FROM
    orders
GROUP BY date;

-- peaks hours
SELECT 
    time, COUNT(order_id)
FROM
    orders
GROUP BY time;

-- How many pizzas are typically in an order? Do we have any bestsellers
SELECT 
    *
FROM
    order_details;

-- pizzas in an order
SELECT 
    order_id, COUNT(quantity)
FROM
    order_details
GROUP BY order_id;

-- Bestsellers
SELECT 
    pizza_id, COUNT(quantity)
FROM
    order_details
GROUP BY pizza_id;

-- How much money did we make this year? Can we indentify any seasonality in the sales?
SELECT 
    *
FROM
    pizzas;

-- year's revenue 
SELECT 
    pizzas.pizza_id, SUM(pizzas.price)
FROM
    pizzas
        JOIN
    order_details ON order_details.quantity
GROUP BY pizzas.pizza_id;








