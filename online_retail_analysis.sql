-- Data Cleaning - Removing Canceled Orders

DELETE FROM retail
WHERE invoice_no LIKE 'C%';

-- Data Cleaning - Removing Data Without Customer ID

DELETE FROM retail
WHERE customer_id IS NULL OR customer_id = '';

-- Monthly Revenue Trend

SELECT 
DATE_TRUNC('month',
TO_TIMESTAMP(invoice_date, 'DD.MM.YYYY HH24:MI')) AS month,
SUM ((unit_price)*(quantity)) AS revenue
FROM retail
GROUP BY month
ORDER BY month;

-- Top Customers by Revenue

SELECT 
customer_id,
SUM((unit_price)*(quantity)) AS revenue
FROM retail
GROUP BY customer_id
ORDER BY revenue DESC
LIMIT 10;

-- Revenue by Country

SELECT 
country,
SUM((unit_price)*(quantity)) AS revenue
FROM retail
GROUP BY country
ORDER BY revenue DESC;