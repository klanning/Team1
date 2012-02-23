require './bart_directory'

class PublicRoute < Route
  
  attr_reader :closest_bart_to_destination
  
  def initialize(origin, destination)
    @directory = BartDirectory.new
    @origin = origin
    @destination = destination
      
    @directory.bart_address?(address)
    
    
    if "#{origin} is NOT a bart station address" && "#{destination} is NOT a bart station address"
     first "find the closest bart station to #{origin}" && "find the closest bart station to #{destination}"
     then start_walk_route = WalkRoute.new(origin, closest_bart_station_to_origin)
          bart_route       = BartRoute.new(closest_bart_station_to_origin, closest_bart_station_to_destination)
          end_walk_route   = WalkRoute.new(closest_bart_station_to_destination, destination)
    
    elsif "#{origin} is a bart station address" && "#{destination} is a bart station address"
      return BartRoute.new(origin,destination)
    end
    
  end
  
end