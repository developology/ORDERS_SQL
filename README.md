# 📊 SQL Sales Data Project – Orders Analysis

This project demonstrates the creation of a SQL database named **Riddhi**, containing a table called `orders` with sample sales data. It explores various SQL queries for data analysis like date manipulation, aggregation, conditional logic, and reporting.


## 📌 About the Project

This project is designed to:
- Practice SQL fundamentals
- Explore functions like `DATEDIFF()`, `CASE`, `MONTHNAME()`, `DAYNAME()`
- Analyze data by date, discounts, customer, and delivery performance
- Generate reports such as monthly trends and sales per quarter
  

## 🛠 Technologies Used

- MySQL
- SQL Workbench
---

## 🗂 Database Structure

**Database Name:** `Riddhi`  
**Table Name:** `orders`

| Column Name         | Data Type         | Description               |
|---------------------|------------------|---------------------------|
| `order_id`          | INT (Primary Key) | Unique ID for each order |
| `customer_name`     | VARCHAR(100)      | Customer's name           |
| `order_date`        | DATE              | Order placement date      |
| `delivery_date`     | DATE              | Order delivery date       |
| `amount`            | DECIMAL(10,2)     | Total order amount        |
| `discount_percentage` | INT            | Discount given on order   |

---

## 🧾 Sample Data

10 rows of dummy data have been inserted for query practice.  

## 📌 Queries Included

- ✅ Displaying order month, week, and day
- ✅ Calculating delivery time in days
- ✅ Extending delivery dates
- ✅ Calculating discount-based prices
- ✅ Grouping by quarter and month
- ✅ Identifying weekends vs weekdays
- ✅ Categorizing discount levels using `CASE`
- ✅ Detecting delayed orders
- ✅ Monthly and quarterly sales trends

---

## ▶️ How to Run

1. Open your MySQL terminal or GUI (like Workbench).
2. Run the following scripts in order:
   - `CREATE DATABASE Riddhi;`
   - `USE Riddhi;`
   - Table creation and `INSERT` statements
   - Execute each query block to see outputs
3. Optionally: import `orders.sql` file if included in the repo
