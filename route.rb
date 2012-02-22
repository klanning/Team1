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
  
  def compare(other_route)
    
    if @origin != other_route.origin || @destination != other_route.destination
      return "These routes are inherently different. You can't compare apples and oranges!"
    end
    
    my_weighted_value = (@cost_in_pennies*100)+(@time_in_seconds*10)
    other_route_weighted_value = (other_route.cost_in_pennies*100)+(other_route.time_in_seconds*10)
    
    if my_weighted_value > other_route_weighted_value
      other_route
    elsif my_weighted_value < other_route_weighted_value
      self
    else
      "These routes are pretty much identical."
    end
    
  end
  
  def add(other_route)
    total_cost = @cost_in_pennies + other_route.cost_in_pennies
    total_time = @time_in_seconds + other_route.time_in_seconds
    Route.new(origin, other_route.destination, total_cost, total_time)
  end
end