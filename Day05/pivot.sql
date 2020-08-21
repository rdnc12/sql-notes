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
--PIVOT: We can convert data in records to column names
SELECT * 
FROM (SELECT customer_name, product_name 
      FROM customers_products
      )
PIVOT
(COUNT(product_name) FOR product_name IN ('Orange', 'Apricot', 'Palm', 'Apple'));