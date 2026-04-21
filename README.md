Customer Analysis using SQL (dvdrental Database)

Project Overview
This project analyzes customer behavior using the open‑source **dvdrental** PostgreSQL database.  
The goal is to identify key customer insights such as:

- Top customers by total payments  
- Total rentals per customer  
- Average payment per customer  
- Revenue distribution across stores  

The project demonstrates SQL querying, data aggregation, joins, and visualization of analytical results.

Dataset
The analysis is based on the **dvdrental** sample database, which includes tables

Total rentals per Customer
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_rentals DESC;

Average payment per Customer
SELECT 
    ROUND(AVG(total_amount), 2) AS avg_payment_per_customer
FROM (
    SELECT 
        customer_id,
        SUM(amount) AS total_amount
    FROM payment
    GROUP BY customer_id
) sub;

Total revenue per store
SELECT 
    s.store_id,
    SUM(p.amount) AS total_revenue
FROM store s
JOIN staff st ON s.store_id = st.store_id
JOIN payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id
ORDER BY total_revenue DESC;

Active vs inactive customers
SELECT 
    active,
    COUNT(*) AS total_customers
FROM customer
GROUP BY active
ORDER BY active DESC;

