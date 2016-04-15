select count(*) from event_log.loveitleaveitevent where itemstatus = 'leaveit' and date(created) = current_date - 8
