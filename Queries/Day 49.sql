use 50_Days_SQL_Challenge;

-- 1.Find Top 5 Customers by Revenue using CTE.

WITH cte AS
(
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(pa.payment_amount) AS total_revenue
    FROM
        cleaned_customers c
    JOIN 
        cleaned_orders o
    ON c.customer_id = o.customer_id
    JOIN
        cleaned_payments pa
    ON pa.order_id = o.order_id
    GROUP BY 1,2
    ORDER BY 3 DESC
)
SELECT 
    customer_name,
    total_revenue 
FROM cte 
LIMIT 5;

-- 2.Find Top 5 Products by Quantity Sold using CTE


WITH cte AS 
(
    SELECT
        p.product_id,
        p.product_name,
        SUM(o.quantity) AS total_quanity
    FROM 
        cleaned_products p
    JOIN 
        cleaned_order_details o
    ON p.product_id = o.product_id
    GROUP BY 1,2
    ORDER BY 3 DESC
)
SELECT
    product_name,
    total_quanity
FROM cte LIMIT 5;

-- 3.Rank customers based on generated revenue using DENSE_RANK().
WITH cte AS
(
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(pa.payment_amount) OVER(PARTITION BY c.customer_id) AS total_revenue
        
    FROM
        cleaned_customers c
    JOIN 
        cleaned_orders o
    ON c.customer_id = o.customer_id
    JOIN
        cleaned_payments pa
    ON pa.order_id = o.order_id
)
SELECT
*,
DENSE_RANK() OVER(ORDER BY total_revenue DESC) AS customer_rank
FROM cte

-- 4.Rank products based on quantity sold using RANK() 


WITH cte AS 
(
    SELECT
        p.product_id,
        p.product_name,
        SUM(o.quantity) OVER(PARTITION BY p.product_id ) AS total_quanity
    FROM 
        cleaned_products p
    JOIN 
        cleaned_order_details o
    ON p.product_id = o.product_id
)
SELECT
    *,
    RANK() OVER(ORDER BY total_quanity DESC) AS products_rank
FROM cte;

-- 5.Find category-wise revenue using CTE.

WITH cte AS 
(
    SELECT
        p.category,
        SUM(pa.payment_amount) AS revenue_by_category
    FROM 
        cleaned_products p
    JOIN 
        cleaned_order_details o
    ON p.product_id = o.product_id
    JOIN cleaned_payments pa
    ON pa.order_id = o.order_id
    GROUP BY 1
    
)
SELECT
    category,
    revenue_by_category
FROM cte
ORDER BY 2 DESC;


-- 6.Categorize customers into High, Medium, and Low Revenue groups using CASE.

WITH cte AS
(
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(pa.payment_amount) AS total_revenue
    FROM
        cleaned_customers c
    JOIN 
        cleaned_orders o
    ON c.customer_id = o.customer_id
    JOIN
        cleaned_payments pa
    ON pa.order_id = o.order_id
    GROUP BY 1,2

)
SELECT
*,
CASE WHEN total_revenue < 2000 THEN 'Low Revenue'
    WHEN total_revenue < 50000 THEN 'Medium'
    ELSE 'High'
END AS Categorized
FROM cte;


-- 7.Create Stored Procedure for Customer Revenue Report.

CREATE OR REPLACE PROCEDURE 
customer_revenue(INOUT p_results REFCURSOR)
LANGUAGE plpgsql
AS $$
BEGIN
OPEN p_results FOR
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(pa.payment_amount) AS total_revenue
    FROM
        cleaned_customers c
    JOIN 
        cleaned_orders o
    ON c.customer_id = o.customer_id
    JOIN
        cleaned_payments pa
    ON pa.order_id = o.order_id
    GROUP BY 1,2;
END;
$$;


BEGIN;
CALL customer_revenue('customer_revenue_cursor');
FETCH ALL FROM "customer_revenue_cursor";
COMMIT;

