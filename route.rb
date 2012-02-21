require 'faraday'
require 'json'

class Route
attr_reader :origin, :destination, :cost_in_pennies, :time_in_seconds

  def initialize(origin, destination, cost_in_pennies, time_in_seconds)
    @origin = origin
    @destination = destination
    @cost_in_pennies = cost_in_pennies
    @time_in_seconds = time_in_seconds
  end

  def self.driving(origin, destination)
    formated_origin = origin.split.join("+")
    formated_destination = destination.split.join("+")
    url = "http://maps.googleapis.com/maps/api/directions/json?origin=#{formated_origin}&destination=#{formated_destination}&sensor=false"
    
    faraday_object = Faraday.get(url)
    response_json = JSON.parse(faraday_object.body)
    time_in_secs = self.calc_drive_time(response_json)
    cost_in_pennies = self.calc_drive_cost(response_json)
    
    Route.new(origin, destination, cost_in_pennies, time_in_secs)
  end
  
  def self.calc_drive_time(response_json)
    response_json['routes'][0]['legs'][0]['duration']['value']
  end
  
  def self.calc_drive_cost(response_json)
    distance_in_miles = response_json['routes'][0]['legs'][0]['distance']["text"].split[0].to_f
    cost_of_gas = (distance_in_miles / 25 * 400).to_i   # assumes 25mpg at $4/gallon (400 pennies)
  end
  
end
