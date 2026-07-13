-- Check that the table already exist then drop it

DROP TABLE IF EXISTS RETAIL_STORE;


-- Create Retail store table

CREATE TABLE RETAIL_STORE(
                 TRANSACTION_ID        INT PRIMARY KEY NOT NULL,
				 DATE                  DATE,
				 CUSTOMER_ID           VARCHAR(10) NOT NULL,
				 GENDER                VARCHAR(10),
				 AGE                   INT,
				 PRODUCT_CATEGORY      VARCHAR(30),
				 QUANTITY              INT,
				 PRICE_PER_UNIT        INT,
				 TOTAL_AMOUNT          INT
);


-- Copy Data from local device

COPY RETAIL_STORE
FROM 'E:\Project raw data files\retail_sales_dataset.CSV'
DELIMITER ','
CSV HEADER;


-- Check that data loaded or not
SELECT * FROM RETAIL_STORE;



-- BASIC QUESTION
-- List of customer who buy the beauty product

SELECT CUSTOMER_ID,
       PRODUCT_CATEGORY,
       QUANTITY,
	   PRICE_PER_UNIT
FROM
       RETAIL_STORE
WHERE
       PRODUCT_CATEGORY = 'Beauty';




-- List of male customer who order electronic product and the revenue generated

SELECT CUSTOMER_ID,
       DATE,
	   GENDER,
	   PRODUCT_CATEGORY,
	   TOTAL_AMOUNT
FROM
       RETAIL_STORE
WHERE
       GENDER = 'Male'
AND
       PRODUCT_CATEGORY = 'Electronics';





-- Gender buy the product most

SELECT GENDER,
	   COUNT (QUANTITY) AS ORDER_QUANTITY,
	   SUM (TOTAL_AMOUNT) AS TOTAL_SALES
FROM
       RETAIL_STORE
GROUP BY
       GENDER
ORDER BY
       TOTAL_SALES DESC;



-- The minimum, maximum and average age who buy the products

SELECT MIN (AGE) AS MIMIMUM_AGE,
       MAX (AGE) AS MAXIMUM_AGE,
	   ROUND (AVG (AGE), 2) AS AVERAGE_AGE_GROUP
FROM
       RETAIL_STORE;




-- Product category that sales most

SELECT PRODUCT_CATEGORY,
       COUNT (QUANTITY) AS SALES_QUANTITY,
	   SUM (TOTAL_AMOUNT) AS SALES_AMOUNT
FROM 
       RETAIL_STORE
GROUP BY
       PRODUCT_CATEGORY
ORDER BY
       SALES_AMOUNT DESC;




-- Total revenue generate from Clothing product

SELECT PRODUCT_CATEGORY,
       COUNT (PRODUCT_CATEGORY) AS QUANTITY_SALES,
       SUM (TOTAL_AMOUNT) AS REVENUE
FROM
       RETAIL_STORE
GROUP BY
       PRODUCT_CATEGORY
HAVING
       PRODUCT_CATEGORY = 'Clothing';




-- Average revenue generate per category

SELECT PRODUCT_CATEGORY,
       ROUND (AVG (TOTAL_AMOUNT), 2) AS AVERAGE_SALES
FROM
       RETAIL_STORE
GROUP BY
       PRODUCT_CATEGORY;




-- Customer Id rank by the Amount

SELECT CUSTOMER_ID,
           CASE
           WHEN TOTAL_AMOUNT > 1000 THEN 'Premium customer'
		   WHEN TOTAL_AMOUNT >= 500 AND TOTAL_AMOUNT <= 1000 THEN 'Standard customer'
		        ELSE 'Basic customer'
           END AS CUSTOMER_BY_RANK
FROM
           RETAIL_STORE
WHERE
           TOTAL_AMOUNT < 499;



-- From January to March of 2023 Which product category sales most

SELECT DATE,
       PRODUCT_CATEGORY,
	   SUM (TOTAL_AMOUNT) AS AMOUNT
FROM
       RETAIL_STORE
WHERE
      DATE
BETWEEN
      '2023-01-01'
AND
      '2023-03-31'
GROUP BY
       DATE,
	   PRODUCT_CATEGORY
ORDER BY
       AMOUNT DESC
LIMIT 1;



-- Gender buy the product most

SELECT GENDER,
       PRODUCT_CATEGORY,
	   SUM (QUANTITY) AS TOTAL_QUANTITY
FROM
       RETAIL_STORE
GROUP BY
       GENDER,
	   PRODUCT_CATEGORY;



-- Rank product category sales

SELECT PRODUCT_CATEGORY,
       SUM(QUANTITY) AS TOTAL_QUANTITY,
       CASE
	   WHEN SUM(QUANTITY) > 850 THEN 'BEST SELLING PRODUCT'
	   WHEN SUM(QUANTITY) > 800 AND SUM(QUANTITY) <= 850 THEN 'AVERAGE SELLING PRODUCT'
	   ELSE 'LOWEST SELLING PRODUCT'
	   END AS CATEGORY_RANK
FROM
       RETAIL_STORE
GROUP BY
       PRODUCT_CATEGORY
ORDER BY
       TOTAL_QUANTITY DESC;
