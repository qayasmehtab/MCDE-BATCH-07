SELECT 

MAX(LIST_PRICE) MAX_PRICE
FROM PRODUCTION.PRODUCTS


-------===== WINDOW FUNCTION-------==

--SYNTAX----

--- FUNCTION()  OVER(PARTITION BY  ORDER BY  WINDOW FRAME)


SELECT 
CATEGORY_ID,
PRODUCT_NAME,
MAX(LIST_PRICE) OVER(PARTITION BY CATEGORY_ID ORDER BY PRODUCT_NAME DESC )  MAX_PRICE
FROM PRODUCTION.PRODUCTS
--- AGGREGATED NUMBER()
SELECT
    product_name,
    list_price,
    AVG(list_price) OVER (PARTITION BY CATEGORY_ID ) AS overall_avg
FROM production.products;

---========

SELECT
    ROW_NUMBER() OVER (ORDER BY first_name) AS row_num,
    first_name,
    last_name,
    city
FROM sales.customers ;


----- CTE WTH ROW NUMBER

WITH CTE_CUSTOMER AS 
(
SELECT 
ROW_NUMBER() OVER(ORDER BY FIRST_NAME) AS ROW_NUM,
CUSTOMER_ID,
FIRST_NAME,
LAST_NAME,
CITY
FROM 
SALES.customers
)
SELECT * FROM
CTE_CUSTOMER WHERE ROW_NUM >= 10 AND ROW_NUM <=100


--------------============ DENSRANK() & RANK()
SELECT
    RANK() OVER (ORDER BY LIST_PRICE) AS RANK_COL,
     DENSE_RANK() OVER (ORDER BY LIST_PRICE) AS DENSRANK_COL,
  product_name,
  product_id,
  list_price
FROM PRODUCTION.products;


WITH RANK_CTE AS (
SELECT
    RANK() OVER (ORDER BY LIST_PRICE) AS RANK_COL,
     DENSE_RANK() OVER (ORDER BY LIST_PRICE) AS DENSRANK_COL,
  product_name,
  product_id,
  list_price
FROM PRODUCTION.products

)
SELECT
* FROM
RANK_CTE WHERE DENSRANK_COL =5;



----------=======NTILE()
SELECT
    product_name,
    list_price,

    NTILE(10) OVER (ORDER BY list_price, product_name) AS price_quartile
FROM production.products
ORDER BY list_price;