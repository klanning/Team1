require './bart_directory'
require './route'
require './bart_route'
require './walk_route'

class PublicRoute < Route
  
  attr_reader :closest_bart_to_destination
  
  def initialize(origin, destination)
    
    @directory = BartDirectory.new
    @origin = origin
    @destination = destination
    
    closest_bart_station_to_origin = @directory.closest_station(origin) 
    closest_bart_station_to_destination = @directory.closest_station(destination)
    
    if closest_bart_station_to_origin == closest_bart_station_to_destination
      return WalkRoute.new(origin,destination)
    else
      start_walk_route = WalkRoute.new(origin, closest_bart_station_to_origin)
      bart_route = BartRoute.new(closest_bart_station_to_origin, closest_bart_station_to_destination)
      end_walk_route = WalkRoute.new(closest_bart_station_to_destination, destination)
      return start_walk_route.add(bart_route.add(end_walk_route))
    end
    
  end
  
end

#should put initialize functions into factory methods