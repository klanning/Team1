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
    @time_in_seconds 
    route.cost_in_pennies 
    route.time_in_seconds
    
    my_weighted_value = (@cost_in_pennies*100)+(@time_in_seconds*10)
    other_route_weighted_value = (route.cost_in_pennies*100)+(route.time_in_seconds*10)
    
    if my_weighted_value == other_route_weighted_value
      "These routes are pretty much identical."
    elsif
      my_weighted_value > other_route_weighted_value
      "You should take the Driving Route because it is faster and cheaper!"
    else
      "You should take the Bart Route because it is faster and cheaper!"
    end
  end
end