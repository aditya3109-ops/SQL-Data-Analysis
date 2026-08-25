USE employee;

-- 1. Show all records
SELECT * FROM employee;

-- 2. Total number of orders
SELECT COUNT(*) AS total_orders
FROM employee;

-- 3. Total sales
SELECT SUM(total_price) AS total_sales
FROM employee;

-- 4. Average order value
SELECT AVG(total_price) AS average_order_value
FROM employee;

-- 5. Sales by category
SELECT
    category,
    SUM(total_price) AS total_sales
FROM employee
GROUP BY category
ORDER BY total_sales DESC;

-- 6. Sales by region
SELECT
    region,
    SUM(total_price) AS total_sales
FROM employee
GROUP BY region
ORDER BY total_sales DESC;

-- 7. Top 10 customers
SELECT
    customer_name,
    SUM(total_price) AS total_spent
FROM employee
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- 8. Average order value by customer
SELECT
    customer_name,
    AVG(total_price) AS average_order_value
FROM employee
GROUP BY customer_name
ORDER BY average_order_value DESC;

-- 9. Orders above average
SELECT *
FROM employee
WHERE total_price > (
    SELECT AVG(total_price)
    FROM employee
);

-- 10. CASE statement
SELECT
    order_id,
    customer_name,
    total_price,
    CASE
        WHEN total_price >= 10000 THEN 'High Value'
        WHEN total_price >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_category
FROM employee;