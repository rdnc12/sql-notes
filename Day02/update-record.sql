CREATE TABLE customers_products
( 
  product_id number(10),
  customer_name varchar2(50),
  product_name varchar2(50)
);

INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (20, 'John', 'Apple');
INSERT INTO customers_products VALUES (30, 'Amy', 'Palm');
INSERT INTO customers_products VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_products VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_products VALUES (40, 'John', 'Apricot');
INSERT INTO customers_products VALUES (20, 'Eddie', 'Apple');

SELECT *
FROM customers_products;

--How to update data in a table
UPDATE customers_products
SET product_name = 'Apricot'
WHERE product_name = 'Palm'; 

UPDATE customers_products
SET product_name = 'ORANGE'
WHERE product_name = 'Orange';

--Update product_ids to 9 if they are less than 20
UPDATE customers_products
SET product_id = 9
WHERE product_id<20;

--Update product_name to Grape and customer_name to Ali if the product_id is 30
UPDATE customers_products
SET product_name = 'Grape',
    customer_name = 'Ali'
WHERE  product_id = 30; 

--Create a table whose name is product_details. The fields will be product_id, product_price, product_producer
CREATE TABLE product_details
(
product_id number(10),
product_price number(5,2),
product_producer number(3)
);

--product_id = 10, product_price = 100, product_producer = 101
--product_id = 20, product_price = 200, product_producer = 202
INSERT INTO product_details VALUES(10, 100, 101);
INSERT INTO product_details VALUES(20, 200, 202);

SELECT *
FROM product_details;

--Update the product_ids which are 10 to the product_producer code.
UPDATE customers_products
SET product_id = (SELECT product_producer
                  FROM product_details
                  WHERE product_id = 10
                 )
WHERE product_id = 9;

--Update product_producer which is 202 to product_id 
UPDATE product_details
SET product_producer = (SELECT product_id
                        FROM customers_products
                        WHERE customer_name = 'Eddie'
                       )
WHERE product_id = 20;  

--update product_id=101
UPDATE customers_products
SET product_id = (SELECT product_producer
                  FROM product_details
                  WHERE product_id = 10
                 )
WHERE product_id = 20;  