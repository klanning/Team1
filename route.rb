class Route
attr_accessor :origin, :destination, :cost, :estimated_time

  def initialize(start_address, end_address, cost = 1, estimated_time = 1)
    @origin = start_address
    @destination = end_address
    @cost = cost
    @estimated_time = estimated_time
  end


end