--=============================================================================
--THIS IS FOR AU7_TOTAL
--=============================================================================
drop table insight.au7_total_final;

create table insight.au7_total_final as
select week as dt, week - '201422' as dt_id, case when neo is not null then cnt + neo else cnt end as user_ct  from (
select week, scan+client+voyager as cnt,neo from insight.au7_total
union 
select week, scan+client+voyager as cnt,neo from insight.au7_total_old
) where dt like '2014%'
group by 1,2,cnt,neo
union 
select week as dt, week - '201501' + 31 as dt_id, case when neo is not null then cnt + neo else cnt end as user_ct  from (
select week, scan+client+voyager as cnt,neo from insight.au7_total
union 
select week, scan+client+voyager as cnt,neo from insight.au7_total_old
) where dt like '2015%'
group by 1,2,cnt,neo
union
select week as dt, week - '201601' + 83 as dt_id, case when neo is not null then cnt + neo else cnt end as user_ct  from (
select week, scan+client+voyager as cnt,neo from insight.au7_total
union 
select week, scan+client+voyager as cnt,neo from insight.au7_total_old
) where dt like '2016%'
group by 1,2,cnt,neo
;

delete from insight.au7_total_final
where dt like '%53'
;

-- create b value
drop table insight.estimate_b;

create table insight.estimate_b as
SELECT SUM(covar.s) / SUM(var.s) b
FROM (SELECT (dt_id - AVG(dt_id::float8) OVER ())*(user_ct - AVG(user_ct) OVER ()) AS s
      FROM insight.au7_total_final) covar
  JOIN (SELECT pow(dt_id - AVG(dt_id::float8) OVER (),2) AS s
        FROM insight.au7_total_final) var ON TRUE;

-- create a value
drop table insight.estimate_a;

create table insight.estimate_a as
SELECT AVG(user_ct) - AVG(dt_id::float)*(SELECT b FROM insight.estimate_b) a
FROM insight.au7_total_final;


--=============================================================================
--THIS IS FOR AU7_CLIENTS
--=============================================================================

drop table insight.au7_final_clients;

create table insight.au7_final_clients as
select dt, dt - '201422' as dt_id, sum(cnt) as user_ct from (
select to_char(created, 'YYYYWW') as dt,
--case when date(created) in ('2014-12-29', '2014-12-30', '2014-12-31') then '201501' else to_char(created, 'YYYYIW') end as dt,
clienttype, count(distinct clientid) as cnt from event_log.clientinfoevent 
where clienttype != '' --in ('Android', 'iPad', 'iOS', 'WindowsPhone')
and date(created) >= '2014-06-01'
and remoteaddr not in ('83.145.207.168','194.157.151.74')
group by 1,2
) where dt like '2014%'
group by 1,2
union
select dt, dt - '201501'+31 as dt_id, sum(cnt) as user_ct from (
select to_char(created, 'YYYYWW') as dt,
--case when date(created) in ('2014-12-29', '2014-12-30', '2014-12-31') then '201501' else to_char(created, 'YYYYIW') end as dt,
clienttype, count(distinct clientid) as cnt from event_log.clientinfoevent 
where clienttype != '' --in ('Android', 'iPad', 'iOS', 'WindowsPhone')
and date(created) >= '2014-06-01'
and remoteaddr not in ('83.145.207.168','194.157.151.74')
group by 1,2
) where dt like '2015%'
group by 1,2
union
select dt, dt - '201601'+83 as dt_id, sum(cnt) as user_ct from (
select to_char(created, 'YYYYWW') as dt,
--case when date(created) in ('2014-12-29', '2014-12-30', '2014-12-31') then '201501' else to_char(created, 'YYYYIW') end as dt,
clienttype, count(distinct clientid) as cnt from event_log.clientinfoevent 
where clienttype != '' --in ('Android', 'iPad', 'iOS', 'WindowsPhone')
and date(created) >= '2014-06-01'
and remoteaddr not in ('83.145.207.168','194.157.151.74')
group by 1,2
) where dt like '2016%'
group by 1,2
;

delete from insight.au7_final_clients
where dt like '%53'
;


-- create b value
drop table insight.estimate_b_clients;

create table insight.estimate_b_clients as
SELECT SUM(covar.s) / SUM(var.s) b
FROM (SELECT (dt_id - AVG(dt_id::float8) OVER ())*(user_ct - AVG(user_ct) OVER ()) AS s
      FROM insight.au7_final_clients) covar
  JOIN (SELECT pow(dt_id - AVG(dt_id::float8) OVER (),2) AS s
        FROM insight.au7_final_clients) var ON TRUE;

-- create a value
drop table insight.estimate_a_clients;

create table insight.estimate_a_clients as
SELECT AVG(user_ct) - AVG(dt_id::float)*(SELECT b FROM insight.estimate_b_clients) a
FROM insight.au7_final_clients;



