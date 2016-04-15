require "net/https"
require 'json'
require "uri"


uri = URI.parse("https://www.shopadvisor.com/api/discount/-20/-90/1443104539?category=200280333&size=25")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)
#puts response.body
obj = JSON.parse(response.body)
#puts JSON.pretty_generate(obj)
#puts obj


#puts "first"
#first =obj[1]
#puts first['evoquId']


$i = 1
$length = obj.length

while $i < $length do
  temp =obj[$i]
  puts "#{temp['evoquId']}, #{temp['movement']}" 
  $i += 1
end




