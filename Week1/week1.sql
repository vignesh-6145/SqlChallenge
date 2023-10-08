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
    FOREIGN KEY (customer_id) REFERENCES members(customer_id) ON DELETE CASCADE
);

--Menu data
INSERT INTO menu  VALUES (1,'sushi',10);
INSERT INTO menu  VALUES  (2,'curry',15);
INSERT INTO menu  VALUES (3,'ramen',12);

DESC menu;
SELECT * FROM menu;
-- members data input

INSERT INTO members VALUES('A',timestamp '2021-01-07 0:0:0');
INSERT INTO members VALUES('B',timestamp '2021-01-09 0:0:0');
DESC members;
SELECT * FROM members;

-- sales

INSERT INTO sales VALUES('A',date '2021-01-01',1);
INSERT INTO sales VALUES('A',date '2021-01-01',2);
INSERT INTO sales VALUES('A',date '2021-01-07',2);
INSERT INTO sales VALUES('A',date '2021-01-10',3);
INSERT INTO sales VALUES('A',date '2021-01-11',3);
INSERT INTO sales VALUES('A',date '2021-01-11',3);
INSERT INTO sales VALUES('B',date '2021-01-01',2);
INSERT INTO sales VALUES('B',date '2021-01-02',2);
INSERT INTO sales VALUES('B',date '2021-01-04',1);
INSERT INTO sales VALUES('B',date '2021-01-11',1);
INSERT INTO sales VALUES('B',date '2021-01-16',3);
INSERT INTO sales VALUES('B',date '2021-02-01',3);
INSERT INTO sales VALUES('B',date '2021-01-01',3);
INSERT INTO sales VALUES('B',date '2021-01-01',3);
INSERT INTO sales VALUES('B',date '2021-01-07',3);
DESC sales;
SELECT * FROM sales;

-- Question 1
-- What is the total amount each customer spent at the restaurant?


SELECT me.customer_id, SUM(m.price) 
FROM (members me INNER JOIN sales s ON (me.customer_id=s.customer_id))   INNER JOIN menu m on (s.product_id=m.product_id)
GROUP BY me.customer_id;


-- Question 2
-- How many days has each customer visited the restaurant?

SELECT customer_id, COUNT(s.order_date)
FROM members m INNER JOIN sales s USING(customer_id)
GROUP BY customer_id;

-- Question 3
-- What was the first item from the menu purchased by each customer?


-- Question 4
-- What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT *
FROM ( SELECT product_id,customer_id,COUNT(product_id)
        FROM sales
        GROUP BY product_id,customer_id
        ORDER BY COUNT(product_id) DESC
)
WHERE ROWNUM=1;



-- Question 5
-- Which item was the most popular for each customer?

SELECT *
FROM (SELECT customer_id,product_id,COUNT(product_id)
        FROM sales
        GROUP BY customer_id,product_id
        ORDER BY count(3) DESC
    )
    WHERE ROWNUM <= (SELECT COUNT(DISTINCT(customer_id))
                FROM members);


DESC menu;








DROP TABLE sales;
DROP TABLE menu;
DROP TABLE members;