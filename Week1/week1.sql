CREATE TABLE members(
    customer_id VARCHAR2(1) PRIMARY KEY,
    join_date TIMESTAMP
);
CREATE TABLE menu(
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(5),
    price NUMBER
);

CREATE TABLE sales(
    customer_id VARCHAR2(1),
    order_date DATE,
    product_id Number,
    
);
-- Sales data input

INSERT INTO sales(customer_id,order_date,productid) VALUES ()


DROP TABLE sales;
DROP TABLE menu;
DROP TABLE members;