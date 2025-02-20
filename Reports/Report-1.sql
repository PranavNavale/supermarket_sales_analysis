-- Report-1

-- Customer type wise Product Performance ranking 

select product_line,customer_type,total_revenue,rank() over(partition by product_line,customer_type order by total_revenue desc) as rank 
from (
select 
pld.product_line,ctd.customer_type,sum(sf.total) as total_revenue
from sales_fact sf inner join customer_type_dim ctd on sf.customer_type_id=ctd.customer_type_id
inner join product_line_dim pld  on sf.product_line_id=pld.product_line_id
group by pld.product_line,ctd.customer_type
) ranked order by rank;

