select count(*) from event_log.pushnotificationevent where date(created) = current_date - 2
