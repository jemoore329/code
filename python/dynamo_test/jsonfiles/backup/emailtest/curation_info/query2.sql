-----UNLABLED ISSUES WITH ACTIVITY -----
select * from (
select count(*) as opens, issueid 
from intake.access_log 
where act = 'open'
and date(created) > current_date -60
and issueid not in (select id from intake.logical_issues)
and issueid > 0
group by 2
order by 1 desc
) where opens > 49
and issueid != 1277
;
