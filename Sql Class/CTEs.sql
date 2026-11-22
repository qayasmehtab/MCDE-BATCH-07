




with avg_ctg_cte as 
(
select
category_id,
count(*) as total_products
from 
production.products
group by category_id
)

select avg(total_products) from avg_ctg_cte
