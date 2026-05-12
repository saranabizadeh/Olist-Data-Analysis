SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month_sort,
    DATE_FORMAT(o.order_purchase_timestamp, '%b %Y') AS month_label,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.price) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY month_sort, month_label
ORDER BY month_sort;