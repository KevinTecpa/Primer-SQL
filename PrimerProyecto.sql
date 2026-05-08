SELECT 
    p.product_name,                    -- Nombre del producto
    p.category,                        -- Categoria
    SUM(o.quantity) AS unidades_vendidas,      -- Total de unidades
    ROUND(SUM(o.quantity * p.price), 2) AS total_generado  -- Dinero generado
FROM orders o
JOIN products p ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name, p.category   -- Agrupar por producto
ORDER BY unidades_vendidas DESC       -- Ordenar de mayor a menor
LIMIT 5;                              -- Solo los 5 primeros