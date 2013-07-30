
require 'json'
require 'net/http'

def post_to_prod(crime)
  uri = URI.parse("http://ancbkn.herokuapp.com/crimes")
  dateFormat = crime["m_reportDate"]
  start_index = dateFormat.index("(") + 1
  end_index = dateFormat.index("-") - 1
  rawDateFormat = Time.at(dateFormat[start_index..end_index].to_i/1000)
  puts "*"*10
  puts rawDateFormat
  post_params = { 
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

  # Convert the parameters into JSON and set the content type as application/json
  req = Net::HTTP::Post.new(uri.path)
  req.body = JSON.generate(post_params)
  req["Content-Type"] = "application/json"
  
  http = Net::HTTP.new(uri.host, uri.port)
  response = http.start {|htt| htt.request(req)}
  puts response.body
end

topObject = JSON.parse(File.read("scripts/crimes.json"));
crimes = topObject ["crimes"]

crimes.each do |c|
  post_to_prod(c)
end


