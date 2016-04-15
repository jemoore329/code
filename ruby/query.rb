
require 'digest/sha1'

require 'zlib'

require_relative 'redshift.rb'

$pg = SA::Redshift.new
$pg.open

query = "
delete from insight.elle_campaign 
"
puts "Running: #{query}"
res = $pg.query(query)




