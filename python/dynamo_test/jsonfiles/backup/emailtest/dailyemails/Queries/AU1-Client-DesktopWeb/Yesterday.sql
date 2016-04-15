select count(distinct userid) from event_log.clientinfoevent where clienttype = 'DesktopWeb' and date(created) = current_date - 2
