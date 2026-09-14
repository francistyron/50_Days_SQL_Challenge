use 50_Days_SQL_Challenge;


---1. Create all tables based on the given ER diagram

CREATE Table raw_customers(
    customers_id varchar(50),
    customer_name varchar(100),
    city varchar(50),
    signup_date varchar(50)
);


CREATE Table raw_orders(
    order_id varchar(50),
    customer_id varchar(50),
    order_date varchar(50)
);


CREATE Table raw_products(
    product_name varchar(50),
    category varchar(50),
    price int (50)
);



CREATE Table raw_order_details(
    order_detail_id varchar(50),
    product_id varchar(50),
    quantity int(50)
);




CREATE Table raw_payments(
    payment_id varchar(50),
    order_id varchar(50),
    payment_amount int(50),
    payment_date varchar(50)
);


---2. Load datasets into MYSQL tables using import/load methods




















