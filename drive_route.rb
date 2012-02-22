require './route'
require './gas_price'
require './google_directions_wrapper'

class DriveRoute < Route

  attr_reader :origin, :destination, :cost_in_pennies, :time_in_seconds


	def initialize(origin, destination)
	  @google_directions = GoogleDirectionsWrapper.new(origin, destination, "driving")
	  @origin = origin
    @destination = destination
    
	  @time_in_seconds = calc_drive_time
	  @cost_in_pennies = calc_drive_cost
	  

	end

	def calc_drive_time()
	  @google_directions.route_time
	end

	def calc_drive_cost()
	  distance_in_miles = @google_directions.route_distance
	  zipcode = @google_directions.origin_zipcode
	  cost_of_gas = (distance_in_miles / 25 * ( 100 * GasPrice.find_gas_price(zipcode))).to_i   # assumes 25mpg at $4/gallon (400 pennies)
	end

end