select count(*) as opens, b.publicationname, b.logicalissuename, date(b.live) as live_date, a.issueid
from intake.access_log a, intake.logical_issues b
where a.issueid = b.id
and act = 'open'
and date(b.live) > current_date - 60
group by 2,3,4,5
order by 2 asc, issueid asc
;


