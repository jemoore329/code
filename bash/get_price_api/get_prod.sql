select distinct product_id from (
select count(*), product_id  
from replica.evoquproddb_watchlist
where date(created) between '2014-01-01' and '2014-12-31'
and product_id != ''
group by 2
order by 1 desc limit 10
)
;
