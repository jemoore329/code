select sum(a.ret+b.ret+c.ret) from insight.new_ret_scan a, insight.new_ret_neo b, insight.new_ret_pubs c where a.created = current_date - 2 and b.created = current_date - 2 and c.created = current_date - 2