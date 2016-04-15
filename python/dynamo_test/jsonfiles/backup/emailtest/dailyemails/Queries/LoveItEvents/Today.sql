select count(*) from event_log.loveitleaveitevent where itemstatus = 'loveit' and date(created) = current_date - 1
