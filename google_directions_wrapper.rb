require 'faraday'
require 'json'


class GoogleDirectionsWrapper
 
  attr_reader :origin, :destination, :mode
  attr_writer :response_json


  def initialize(origin, destination, mode="driving")
    @origin = origin
    @destination = destination
    @mode = mode
    @response_json = JSON.parse(open("json_cached_output1.json").read)
    
  end
  
  def fetch
    formated_origin = @origin.split.join('+')
    formated_destination = @destination.split.join('+')
    url = "http://maps.googleapis.com/maps/api/directions/json?origin=#{formated_origin}&destination=#{formated_destination}&sensor=false&mode=#{mode}"
    # puts url
    sleep 1
    faraday_object = Faraday.get(url)
    @response_json = JSON.parse(faraday_object.body)
    # @response_json = JSON.parse(open("json_cached_output1.json").read)
    # puts faraday_object
    # puts @response_json
  end
  
  def route_time
    @response_json['routes'][0]['legs'][0]['duration']['value']
  end
    
  def route_distance
    @response_json['routes'][0]['legs'][0]['distance']['text'].split[0].to_f
  end
  
  def origin_zipcode
    @response_json['routes'][0]['legs'][0]['start_address'].split[-2][0..-2]
  end
  
  def origin_lat_longs
    @response_json['routes'][0]['legs'][0]['start_location']
  end

end


# http://maps.googleapis.com/maps/api/directions/json?origin=#{formated_origin}&destination=#{formated_destination}&sensor=false&mode=#{mode}
