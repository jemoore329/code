select sum(scan+neo+voyager+client) from insight.au1_total where date(created) = current_date - 1
