-- Este programa nos dice en que mes se compra mas
SELECT 
    YEAR(order_date) AS año, -- Selecciona year (esto nos ayuda da diferenciar enero de 2023 a enero de 2024)
    MONTH(order_date) AS mes_numero, -- Selecciona mes
    MONTHNAME(order_date) AS mes_nombre, 
    SUM(quantity) AS total_unidades -- Nos da el total por mes
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date), MONTHNAME(order_date)
ORDER BY año, mes_numero; -- agrupa por year y mes