SELECT 
    c.customer_id || ' - ' || c.first_name || ' ' || c.last_name AS customer_label,
    COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY customer_label
ORDER BY total_rentals DESC
limit 10;