require "net/https"
require "uri"


uri = URI.parse("https://www.periscopedata.com/api/shopadvisor/chart/csv/e96926cf-8729-544b-df69-cc4e5afaaba1/1173")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)
puts response.body


