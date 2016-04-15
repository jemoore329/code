require 'pg'

@conn = PGconn.connect( :host=>"analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com", :port=>5439, :dbname=>"analytics", :user=>"sa", :password=>'Valaskala1000')

res = @conn.exec("select * from insight.elle_campaign")

#puts res.getvalue(0,0), res.getvalue(0,1)
#puts res[0]['opens']

res.each do |row|
  puts row['shpli'] + ' | ' +  row['opens']
end

puts

res.each do |row|
puts row
end


puts
 
puts res[1]

puts

puts res.fields() 

puts
