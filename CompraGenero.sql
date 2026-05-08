-- Este programa nos dice quien compra mas segun el genero
SELECT 
    c.gender, -- Selecciona genero 
    ROUND(SUM(o.quantity * p.price),2) AS total_gastado -- Ganancia total
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.gender; -- Agrupa por genero