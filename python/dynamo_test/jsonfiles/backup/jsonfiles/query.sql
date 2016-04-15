select shopper_id, replace(brand, ',','') as brandname, ci_lower_bound as score
from signals.brand_score
--where shopper_id in ( 1445244, 1572483, 53, 3516376)
where shopper_id between 43 and 500
order by shopper_id
limit 5000
;
