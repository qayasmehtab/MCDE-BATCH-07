---== LEAD() & LAG()
SELECT
    customer_id,
    order_id,
    order_date,
    LAG(order_date )  OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_order_date,
    LEAD(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS next_order_date
FROM sales.orders;


----- WINDOW FRAMING

SELECT 
PRODUCT_NAME,
PRODUCT_ID,
CATEGORY_ID,
LIST_PRICE,
SUM(LIST_PRICE) OVER(PARTITION BY CATEGORY_ID ORDER BY PRODUCT_ID ROWS BETWEEN UNBOUNDED PRECEDING AND 1 FOLLOWING  ) TOTAL_SALES
 FROM production.products

 -------- STORED PROCEDURE------

CREATE PROCEDURE production.uspProductList
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM production.products
    ORDER BY product_name;
END;


EXEC production.uspProductList


------- WITH PARAMETER

CREATE PROCEDURE production.uspFindProducts
    @min_price DECIMAL(10, 2),
    @max_price DECIMAL(10, 2)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM production.products
    WHERE list_price BETWEEN @min_price AND @max_price
    ORDER BY list_price;
END;

EXEC production.uspFindProducts 10,1000;
EXEC production.uspFindProducts @min_price = 300, @max_price = 3000


--- with default value of parameters
CREATE PROCEDURE production.FindProducts
    @min_price DECIMAL(10, 2) = 0,
    @max_price DECIMAL(10, 2) = 999999
AS
BEGIN
    SELECT product_name, list_price
    FROM production.products
    WHERE list_price BETWEEN @min_price AND @max_price
    ORDER BY list_price;
END;

EXEC  production.FindProducts 300,4000
