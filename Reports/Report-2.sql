-- Report-2
 
-- Month wise top performing product in each Branch


select branch,month,product_line,total_revenue,dense_rank() over(partition by branch,month,product_line order by total_revenue desc ) as rank
from (
select 
sf.branch,extract(MONT from fs.sales_date) as month,pld.product_line,sum(sf.total) as total_revenue
from sales_fact sf inner join customer_type_dim ctd on sf.customer_type_id=ctd.customer_type_id
inner join product_line_dim pld  on sf.product_line_id=pld.product_line_id
group by sf.branch, month, pld.product_line
) ranked_data where rank=1 order by branch,month,product_line;