SELECT total FROM sa.manual_download_metrics where channel = 'Android' and date(created) = current_date - 8
