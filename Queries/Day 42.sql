use 50_Days_SQL_Challenge;

-- =====================================================
-- 1. CREATE CLEANED TABLES
-- =====================================================

-- CLEANED CUSTOMERS

CREATE TABLE cleaned_customers (
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    city VARCHAR(100),
    signup_date VARCHAR(50)
);

INSERT INTO cleaned_customers
SELECT *
FROM raw_customers;


-- CLEANED PRODUCTS

CREATE TABLE cleaned_products (
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT
);

INSERT INTO cleaned_products
SELECT *
FROM raw_products;


-- CLEANED ORDERS

CREATE TABLE cleaned_orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_date VARCHAR(50)
);

INSERT INTO cleaned_orders
SELECT *
FROM raw_orders;


-- CLEANED ORDER DETAILS

CREATE TABLE cleaned_order_details (
    order_detail_id VARCHAR(50),
    product_id VARCHAR(50),
    quantity INT
);

INSERT INTO cleaned_order_details
SELECT *
FROM raw_order_details;


-- CLEANED PAYMENTS

CREATE TABLE cleaned_payments (
    payment_id VARCHAR(50),
    order_id VARCHAR(50),
    payment_amount INT,
    payment_date VARCHAR(50)
);

INSERT INTO cleaned_payments
SELECT *
FROM raw_payments;


-- =====================================================
-- 2. REMOVE LEADING AND TRAILING SPACES
-- =====================================================

-- CUSTOMERS

UPDATE cleaned_customers
SET
    customer_id = TRIM(customer_id),
    customer_name = TRIM(customer_name),
    city = TRIM(city),
    signup_date = TRIM(signup_date);


-- PRODUCTS

UPDATE cleaned_products
SET
    product_name = TRIM(product_name),
    category = TRIM(category);


-- ORDERS

UPDATE cleaned_orders
SET
    order_id = TRIM(order_id),
    customer_id = TRIM(customer_id),
    order_date = TRIM(order_date);


-- ORDER DETAILS

UPDATE cleaned_order_details
SET
    order_detail_id = TRIM(order_detail_id),
    product_id = TRIM(product_id);


-- PAYMENTS

UPDATE cleaned_payments
SET
    payment_id = TRIM(payment_id),
    order_id = TRIM(order_id),
    payment_date = TRIM(payment_date);


-- =====================================================
-- 3. STANDARDIZE TEXT
-- =====================================================

UPDATE cleaned_customers
SET
    customer_name = UPPER(customer_name),
    city = UPPER(city);


UPDATE cleaned_products
SET
    product_name = UPPER(product_name),
    category = UPPER(category);


-- =====================================================
-- 4. REPLACE NULL VALUES
-- =====================================================

-- CUSTOMERS

UPDATE cleaned_customers
SET city = 'UNKNOWN'
WHERE city IS NULL;

UPDATE cleaned_customers
SET customer_name = 'UNKNOWN'
WHERE customer_name IS NULL;


-- PRODUCTS

UPDATE cleaned_products
SET product_name = 'UNKNOWN'
WHERE product_name IS NULL;

UPDATE cleaned_products
SET category = 'UNKNOWN'
WHERE category IS NULL;

UPDATE cleaned_products
SET price = 0
WHERE price IS NULL;


-- ORDERS

UPDATE cleaned_orders
SET customer_id = 'UNKNOWN'
WHERE customer_id IS NULL;


-- ORDER DETAILS

UPDATE cleaned_order_details
SET product_id = 'UNKNOWN'
WHERE product_id IS NULL;

UPDATE cleaned_order_details
SET quantity = 0
WHERE quantity IS NULL;


-- PAYMENTS

UPDATE cleaned_payments
SET order_id = 'UNKNOWN'
WHERE order_id IS NULL;

UPDATE cleaned_payments
SET payment_amount = 0
WHERE payment_amount IS NULL;


-- =====================================================
-- 5. CHECK FOR DUPLICATES
-- =====================================================

SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM cleaned_customers
GROUP BY customer_id
HAVING COUNT(*) > 1;


SELECT
    product_name,
    COUNT(*) AS duplicate_count
FROM cleaned_products
GROUP BY product_name
HAVING COUNT(*) > 1;


SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM cleaned_orders
GROUP BY order_id
HAVING COUNT(*) > 1;


SELECT
    order_detail_id,
    COUNT(*) AS duplicate_count
FROM cleaned_order_details
GROUP BY order_detail_id
HAVING COUNT(*) > 1;


SELECT
    payment_id,
    COUNT(*) AS duplicate_count
FROM cleaned_payments
GROUP BY payment_id
HAVING COUNT(*) > 1;



