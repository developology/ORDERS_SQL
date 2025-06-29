-- 🛠️ DATABASE AND TABLE CREATION

CREATE DATABASE Riddhi;
USE Riddhi;

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
	customer_name VARCHAR(100),
	order_date DATE,
	delivery_date DATE,
	amount DECIMAL(10,2),
	discount_percentage INT
);

-- 📥 INSERTING SAMPLE RECORDS INTO orders TABLE

INSERT INTO orders VALUES
(1, 'Amit', '2024-12-01', '2024-12-05', 1000.50, 10),
(2, 'Sita', '2024-12-02', '2024-12-06', 1500.00, 5),
(3, 'Ravi', '2024-12-03', '2024-12-07', 2000.75, 15),
(4, 'Priya', '2024-12-04', '2024-12-10', 500.00, 0),
(5, 'John', '2024-12-05', '2024-12-08', 2500.00, 20),
(6, 'Sneha', '2024-12-06', '2024-12-12', 1750.25, 10),
(7, 'Vikram', '2024-12-07', '2024-12-11', 2200.00, 5),
(8, 'Fatima', '2024-12-08', '2024-12-13', 3000.50, 25),
(9, 'David', '2024-12-09', '2024-12-15', 45600.89, 23),
(10, 'Anjali', '2024-12-10', '2024-12-14', 1200.00, 0);

-- 🔍 VIEW ALL ORDERS
SELECT * FROM orders;


-- Q1. Show customer name, order month, week day number and day name
SELECT 
	customer_name, 
	MONTHNAME(order_date) AS month_of_order, 
	WEEKDAY(order_date) AS week_of_month, 
	DAYNAME(order_date) AS day_name 
FROM orders;


-- Q2. Show order ID, order date, and the name of the day when the order was placed
SELECT 
	order_id, 
	order_date, 
	DAYNAME(order_date) AS day_of_order 
FROM orders;


-- Q3. Show order ID, order month number, and month name
SELECT 
	order_id, 
	MONTH(order_date) AS month_number, 
	MONTHNAME(order_date) AS month_name 
FROM orders;


-- Q4. Show number of days taken for delivery of each order
SELECT 
	order_id, 
	DATEDIFF(delivery_date, order_date) AS difference_days 
FROM orders;


-- Q5. Show expected delivery date extended by 7 days
SELECT 
	order_id, 
	delivery_date, 
	DATE_ADD(delivery_date, INTERVAL 7 DAY) AS extended_delivery 
FROM orders;


-- Q6. Show discounted amount for each order
SELECT 
	order_id, 
	(amount - (amount * discount_percentage) / 100) AS discounted_amount 
FROM orders;


-- Q7. Show total amount grouped by quarter
SELECT 
	QUARTER(order_date) AS quarter_number, 
	SUM(amount) AS sum_of_amount 
FROM orders 
GROUP BY QUARTER(order_date);


-- Q8. Show if an order was placed on weekend or weekday and display total orders and sales
SELECT
	CASE 
		WHEN DAYOFWEEK(order_date) IN (1, 7) THEN "Weekend"
		ELSE "Weekday"
	END AS day_type,
	COUNT(*) AS total_orders,
	SUM(amount) AS total_sales
FROM orders
GROUP BY day_type;


-- Q9. Monthly sales trend - show total orders and sales per month
SELECT 
	MONTHNAME(order_date) AS month_orders,
	COUNT(*) AS total_orders,
	SUM(amount) AS total_amount
FROM orders
GROUP BY month_orders;


-- Q10. Categorize discount levels and show number of orders and total amount per category
SELECT
	CASE 
		WHEN discount_percentage > 15 THEN "High Discount"
		WHEN discount_percentage BETWEEN 6 AND 15 THEN "Moderate"
		ELSE "No/Low Discount"
	END AS discount_type,
	COUNT(*) AS order_number,
	SUM(amount) AS sum_amt 
FROM orders
GROUP BY discount_type;


-- Q11. Show whether each order is delayed or on time (5+ days = Delayed)
SELECT 
	order_id, 
	CASE 
		WHEN DATEDIFF(delivery_date, order_date) >= 5 THEN "Delayed Orders" 
		ELSE "On Time" 
	END AS Delay_or_no 
FROM orders;


-- 🔁 Optional: View all orders again
SELECT * FROM orders;
