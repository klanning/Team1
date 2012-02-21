class Route
attr_accessor :origin, :destination

  def initialize(start_address, end_address)
    @origin = start_address
    @destination = end_address
  end


end