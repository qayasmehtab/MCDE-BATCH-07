---- cross join 

SELECT
    s.store_name,
    c.category_name
FROM sales.stores AS s
CROSS JOIN production.categories AS c;







 --find the each customers order , order date, from
 --which store he order and which staff handle that order

SELECT c.first_name as "Customer F Name", o.order_id,
o.order_date,
sta.first_name as "Staff F Name",
sto.store_name
FROM sales.customers c
left join sales.orders o
on c.customer_id = o.customer_id
inner join sales.stores sto
on o.store_id = sto.store_id
inner join sales.staffs sta
on o.staff_id = sta.staff_id
offset 1000 rows fetch next 615 only;



SELECT 
c.first_name customer_name,
o.order_id,
o.order_date,
s.store_id,
s.store_name,
st.first_name as staff_name
from sales.customers as c 
left join sales.orders as o
on  c.customer_id = o.customer_id 
inner join sales.stores  as s
on  o.store_id = s.store_id 
inner join sales.staffs as st
on s.store_id = st.store_id;

=============views =============

SELECT 
c.first_name customer_name,
o.order_id,
o.order_date,
s.store_id,
s.store_name,
st.first_name as staff_name
from sales.customers as c 
left join sales.orders as o
on  c.customer_id = o.customer_id 
inner join sales.stores  as s
on  o.store_id = s.store_id 
inner join sales.staffs as st
on s.store_id = st.store_id;




SELECT
FIRST_NAME,
LAST_NAME,
PHONE,
STATE FROM SALES.customers;

--------
CREATE VIEW SALES.VW_CUSTOMERS
AS
SELECT *
FROM SALES.CUSTOMERS;


SELECT * FROM SALES.VW_CUSTOMERS
;




CREATE VIEW SALES.VW_JOIN
AS 
SELECT 
c.first_name customer_name,
o.order_id,
o.order_date,
s.store_id,
s.store_name,
st.first_name as staff_name
from sales.customers as c 
left join sales.orders as o
on  c.customer_id = o.customer_id 
inner join sales.stores  as s
on  o.store_id = s.store_id 
inner join sales.staffs as st
on s.store_id = st.store_id;



SELECT V.CUSTOMER_NAME,
V.ORDER_ID, V.STORE_NAME, 
V.STORE_ID, S.QUANTITY
FROM SALES.VW_JOIN AS V 
LEFT JOIN PRODUCTION.STOCKS AS S
ON V.STORE_ID = S.STORE_ID;


