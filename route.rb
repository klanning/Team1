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
end


