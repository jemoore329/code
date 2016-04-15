SELECT total FROM sa.manual_download_metrics where channel in ('iOS', 'Android') and date(created) = current_date - 2
