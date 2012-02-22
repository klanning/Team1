require './route'
require './gas_price'

class DriveRoute < Route

  attr_reader :origin, :destination, :cost_in_pennies, :time_in_seconds


	def initialize(origin, destination)
	  
	  @origin = origin
    @destination = destination
    
	  formated_origin = origin.split.join("+")
	  formated_destination = destination.split.join("+")
	  url = "http://maps.googleapis.com/maps/api/directions/json?origin=#{formated_origin}&destination=#{formated_destination}&sensor=false"
  
	  faraday_object = Faraday.get(url)
	  response_json = JSON.parse(faraday_object.body)
	  @time_in_seconds = calc_drive_time(response_json)
	  @cost_in_pennies = calc_drive_cost(response_json)
	end

	def calc_drive_time(response_json)
	  response_json['routes'][0]['legs'][0]['duration']['value']
	end

	def calc_drive_cost(response_json)
	  distance_in_miles = response_json['routes'][0]['legs'][0]['distance']["text"].split[0].to_f
	  zipcode = response_json['routes'][0]['legs'][0]['start_address'].split[-2][0..-2]
	  cost_of_gas = (distance_in_miles / 25 * ( 100 * GasPrice.find_gas_price(zipcode))).to_i   # assumes 25mpg at $4/gallon (400 pennies)
	end

end