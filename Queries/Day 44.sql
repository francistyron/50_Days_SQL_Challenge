use 50_Days_SQL_Challenge;

-- 1.Total Customers

SELECT 
    COUNT(*) AS total_customers  
FROM 
    cleaned_customers;


-- 2.Total Orders

SELECT
    COUNT(*) AS total_orders 
FROM 
    cleaned_orders;


-- 3.Total Revenue

SELECT 
    SUM(payment_amount) AS total_revenue 
FROM
    cleaned_payments;


-- 4.Avg Order Value

SELECT 
    ROUND(AVG(payment_amount),2) AS avg_revenue 
FROM
    cleaned_payments;



-- 5.Total Products Sold

SELECT 
    SUM(quantity) AS total_products_sold
FROM
    cleaned_order_details;



-- 6.Orders Per Customer

SELECT
    customer_id,
    COUNT(order_id) AS orders_per_customer
FROM 
    cleaned_orders
GROUP BY 
    customer_id;



