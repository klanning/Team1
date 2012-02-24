require 'faraday'
require 'json'


class GoogleDirectionsWrapper
 
  attr_reader :origin, :destination, :mode


  def initialize(origin, destination, mode="driving")
  
    @origin = origin
    @destination = destination
    @mode = mode
    
    formated_origin = origin.split.join('+')
    formated_destination = destination.split.join('+')
    url = "http://maps.googleapis.com/maps/api/directions/json?origin=#{formated_origin}&destination=#{formated_destination}&sensor=false&mode=#{mode}"
    faraday_object = Faraday.get(url)
    @response_json = JSON.parse(faraday_object.body)
    
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