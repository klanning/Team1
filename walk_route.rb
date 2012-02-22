require './google_directions_wrapper'

class WalkRoute < Route
  
  attr_reader :origin, :destination, :cost_in_pennies, :time_in_seconds
  
  def initialize(origin, destination)
    @google_directions = GoogleDirectionsWrapper.new(origin, destination, "walking")
    @origin = origin
    @destination = destination
    @cost_in_pennies = 0
    @time_in_seconds = calc_walk_time
  end
  
  def calc_walk_time
    @google_directions.route_time
  end
end