SELECT 
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS month,
    ROUND(
        100.0 * SUM(
            CASE 
                WHEN order_delivered_customer_date > order_estimated_delivery_date 
                THEN 1 
                ELSE 0 
            END
        ) / COUNT(*), 
    2) AS late_pct
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY month
ORDER BY month;