---- linear prediction model ---

-- sample data set --

drop table insight.linear_test;

create table insight.linear_test as
select date(created) as dt, date(created) - '2016-03-01' as dt_id, count(distinct v_userid) as user_ct
from intake.access_log
where date(created) > '2016-03-01'
and act = 'open'
group by 1,2
;


--- get B value --
create table insight.estimate_b as
select sum(covar.s) / sum(var.s) b
  from (
    select (
      dt_id - avg(dt_id::float8) over ()) * (
        user_ct - avg(user_ct) over ()
      ) as s 
      from insight.linear_test) covar
    join (
      select pow(dt_id - avg(dt_id::float8) over (), 2) as s 
      from insight.linear_test
    ) var
    on true
    ;

--- get A value --
create table insight.estimate_a as
select 
    avg(user_ct) - avg(dt_id::float) * 
      (select b from insight.estimate_b) a
  from insight.linear_test
  ;

---- generate series table ---
drop table insight.series;

create table insight.series as
select row_number() over (order by true) as n
from intake.access_log limit 3000
;



---- final result query ---
select
	  '2016-03-01'::date + n, 
	  user_ct,
	  ((select a from insight.estimate_a) + 
      (select b from insight.estimate_b) * n ) as estimate
    
	from 
	  -- make more dt_ids for the projection
	  insight.series 
    left join insight.linear_test
      on insight.series.n = insight.linear_test.dt_id
      ;
