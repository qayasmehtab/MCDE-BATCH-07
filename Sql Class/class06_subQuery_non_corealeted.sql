---- Sub queries----


---====non-corelated--====

------SCALAR(SINGLE VALUE)


SELECT PRODUCT_NAME, PRODUCT_ID , LIST_PRICE FROM 
production.products WHERE
LIST_PRICE > (
SELECT AVG(list_price) FROM production.products

)

select PRODUCT_ID, order_id , DISCOUNT From
sales.order_items WHERE 
discount > ( 
SELECT AVG(DISCOUNT) FROM sales.order_items
)

---===== Multi row ====

SELECT CUSTOMER_ID, FIRST_NAME, STATE FROM 
SALES.customers
WHERE customer_id IN (
SELECT CUSTOMER_ID  FROM sales.customers WHERE STATE = 'ny'  ----- MULTIPLE VALUSE LIKE (1,2,3,4,5)

)

SELECT category_id, 
product_name, list_price, model_year
from 
production.products
where category_id IN (
select category_id 
from 
production.categories where 
category_name 
IN ('Road Bikes','Cyclocross Bicycles', 'Children Bicycles' )
)

-------- derived table ( Non-correlated )

-- Average number of orders per staff member

-- Average number of orders per staff member
SELECT
    AVG(order_count) AS average_order_count_per_staff
FROM (
    SELECT
        staff_id,
        COUNT(order_id) AS order_count
    FROM sales.orders
    GROUP BY staff_id
) AS staff_order_counts;



