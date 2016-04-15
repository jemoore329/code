SELECT total FROM sa.manual_download_metrics where channel = 'iOS' and date(created) = current_date - 1
