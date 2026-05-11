from sqlalchemy import create_engine
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns



engine = create_engine(
    "mysql+pymysql://root:1234@localhost:3306/mi_primer_db"
)


query = """SELECT 
    c.customer_id,
    c.age,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity * p.price) AS total_spent,
    AVG(o.quantity) AS avg_quantity
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN products p
ON o.product_id = p.product_id
GROUP BY c.customer_id, c.age;
"""

df = pd.read_sql(query, engine)

corr_matrix = df.corr(numeric_only=True)
print(corr_matrix)

