---- Non-correlated
----Scalar
---- multi row 


SELECT product_id, product_name, list_price
from production.products where 
list_price > (
select avg(list_price) from production.products  ----=  1520.49
)



===========

select first_name, customer_id, state
from sales.customers
where customer_id IN (select customer_id from sales.customers where state in ('NY'))

--------================== derived table ==

-- Average number of orders per staff member
SELECT
   +staff_id, order_count, order_id
FROM (
    SELECT
        staff_id,
        COUNT(order_id) AS order_count
    FROM sales.orders
    GROUP BY staff_id
) AS staff_order_counts where staff_id in (1,2,3,4,5,6,7,8,9,10);

--------==================


--Write an SQL query using a non-correlated derived table to 
--display orders whose order_id is greater than the average order_id.
---=====
SELECT 
order_id 
FROM 
sales.orders 
WHERE order_id > ( -- greater than avg oder_id
	SELECT
	AVG(order_count) -- scalar value
	FROM(
		SELECT  -- derived table
		customer_id,
		COUNT(order_id) as order_count
		FROM sales.orders
		GROUP BY customer_id
	) AS order_count_table
)

from (select order_id, avg(order_id)as avg_order_id from sales.orders
group by order_id) as derived_table 
;










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

---- derived table
SELECT
customer_id, city
FROM (
    SELECT customer_id, first_name, city
    FROM sales.customers
    WHERE city = 'New York'
) AS derived_customers
where customer_id > 100;


SELECT
	AVG(total_item_per_order)
FROM (SELECT oi.order_id, COUNT(oi.item_id) total_item_per_order FROM sales.order_items oi GROUP BY oi.order_id) AS derived_table