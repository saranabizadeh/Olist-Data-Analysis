SELECT pr.product_category_name,
       SUM(i.price) AS revenue
FROM order_items i
JOIN products pr
ON i.product_id = pr.product_id
GROUP BY pr.product_category_name
ORDER BY revenue DESC
LIMIT 10;