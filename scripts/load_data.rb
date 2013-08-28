require 'json'
require 'net/http'

$root_url = "http://ancbkn.herokuapp.com"

def post_to_prod(crime)
  post_params = build_crime(crime) 

	uri = URI.parse($root_url + "/crimes")
	start_request(uri, post_params) 
end

def bulk_post_to_prod(crimes)
  crimes_array = []

  crimes.each { |crime| crimes_array << build_crime(crime) }

	post_params = {
	  :crimes => crimes_array
	}

	uri = URI.parse($root_url + "/crimes/bulk")
	start_request(uri, post_params) 
end

def build_crime(crime)
  dateFormat = crime["m_reportDate"]
  start_index = dateFormat.index("(") + 1
  end_index = dateFormat.index("-") - 1
  rawDateFormat = Time.at(dateFormat[start_index..end_index].to_i/1000)
    
	puts "*"*10
  puts rawDateFormat
		
	param = {
		:crime => {
      :code => crime["m_crimeCode"],
      :name => crime["m_crimeType"],
      :lat => crime["m_latitude"],
      :lng => crime["m_longitude"],
      :rawDateFormat => rawDateFormat,
      :reportNumber => crime["m_reportNo"],
      :incidentTime => crime["m_reportTimeString"],
      :street => crime["m_streetName"]
		}
	}
end

def start_request(uri, post_params)
  # Convert the parameters into JSON and set the content type as application/json
	req = Net::HTTP::Post.new(uri.path)
  req.body = JSON.generate(post_params)
  req["Content-Type"] = "application/json"
 
  http = Net::HTTP.new(uri.host, uri.port)
  response = http.start {|htt| htt.request(req)}
  #puts response.body
end

topObject = JSON.parse(File.read("scripts/crimes_small.json"));
crimes = topObject ["crimes"]

bulk_post_to_prod(crimes)

#crimes.each do |c|
 # post_to_prod(c)
#end

