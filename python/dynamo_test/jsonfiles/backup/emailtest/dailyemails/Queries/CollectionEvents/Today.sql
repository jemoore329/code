select count(*) from event_log.collectionevent where date(created) = current_date - 1
