SELECT 
    c.city,                                    -- Ciudad del cliente
    SUM(o.quantity) AS total_unidades_vendidas, -- Total de unidades compradas
    ROUND(SUM(o.quantity * p.price), 2) AS total_generado,  -- Total de dinero generado
    COUNT(DISTINCT o.order_id) AS total_ordenes,           -- Total de ordenes
    COUNT(DISTINCT o.customer_id) AS clientes_unicos       -- Clientes únicos
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON p.product_id = o.product_id
GROUP BY c.city                              -- Agrupar por ciudad
ORDER BY total_generado DESC                  -- Ordenar por ingresos
LIMIT 3;