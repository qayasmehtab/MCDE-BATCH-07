---=============== Aggregation-=========

select * from Sales.customers;

--- COUNT()

SELECT COUNT(*)TOTAL_ROWS FROM SALES.CUSTOMERS;



SELECT COUNT(phone),COUNT(customer_id), state  FROM SALES.CUSTOMERS;


------====== aggregation with join

select
c.category_name,
SUM(P.list_price) as sum_category
from
production.products AS P
INNER JOIN production.categories as c
ON c.category_id = P.category_id
group by 
c.category_name;

SELECT
    p.category_id,
	c.category_name,
    COUNT(*)        AS product_count,
    sum(p.list_price) AS sum_price
FROM production.products as p
inner join production.categories as c
on  c.category_id = p.category_id
GROUP BY p.category_id ,c.category_name 
ORDER BY category_id DESC;


----------- without

SELECT
    category_id,
    COUNT(*)        AS product_count,
    sum(list_price) AS sum_price
FROM production.products
GROUP BY category_id
ORDER BY product_count DESC;

------ having===================

SELECT
    category_id,
    COUNT(*)        AS product_count,
    sum(list_price) AS sum_price

FROM production.products
----- category_id in (1,2, 3)
GROUP BY category_id
having category_id in (1,2, 3);