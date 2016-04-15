select count(distinct userid) from event_log.clientinfoevent where clienttype = 'Android' and date(created) = current_date - 1
