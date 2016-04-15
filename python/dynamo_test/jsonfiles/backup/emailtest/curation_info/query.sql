---ACTIVE MAGAZINE ISSUES---
select count(*) as opens, publicationname, logicalissuename, issueid
from intake.access_log a, intake.logical_issues b
where a.issueid = b.id
and act = 'open'
and date(b.live) > current_date - 60
group by 2,3,4
order by 2,4 asc
;
