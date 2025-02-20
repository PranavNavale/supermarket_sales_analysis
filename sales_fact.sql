
CREATE TABLE IF NOT EXISTS sales_fact (
customer_type_id INT NOT NULL,
product_line_id INT NOT NULL,
invoice_id STRING ,
branch STRING
gender STRING
total NUMERIC,
sales_date date,
payment STRING,
)