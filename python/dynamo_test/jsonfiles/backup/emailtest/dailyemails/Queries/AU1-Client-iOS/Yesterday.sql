select count(distinct userid) from event_log.clientinfoevent where clienttype = 'iOS' and date(created) = current_date - 2
