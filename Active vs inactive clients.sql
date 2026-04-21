SELECT 
    active,
    COUNT(*) AS total_customers
FROM customer
GROUP BY active;

