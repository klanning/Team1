require 'faraday'
require 'json'
require 'net/http'
require 'uri'

class Route
  
  attr_reader :origin, :destination, :cost_in_pennies, :time_in_seconds

  def initialize(origin, destination, cost_in_pennies, time_in_seconds)
    @origin = origin
    @destination = destination
    @cost_in_pennies = cost_in_pennies
    @time_in_seconds = time_in_seconds
  end
  
  def compare(route)
    
    if @origin != route.origin || @destination != route.destination
      return "These routes are inherently different. You can't compare apples and oranges!"
    end
    
    my_weighted_value = (@cost_in_pennies*100)+(@time_in_seconds*10)
    other_route_weighted_value = (route.cost_in_pennies*100)+(route.time_in_seconds*10)
    
    if my_weighted_value > other_route_weighted_value
      route
    elsif my_weighted_value < other_route_weighted_value
      self
    else
      "These routes are pretty much identical."
    end
    
  end
end