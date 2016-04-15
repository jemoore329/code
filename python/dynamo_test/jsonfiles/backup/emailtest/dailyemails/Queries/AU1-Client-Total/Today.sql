select count(distinct userid) from event_log.clientinfoevent where date(created) = current_date - 1
