start_addrss = "923 market sf"
end_addrss = "509 n st"
driving_route = Route.driving(start_addrss, end_addrss)
barting_route = Route.barting(start_addrss,endaddrss,:bart)

driving_route > barting_route ? "BART" : "DRIVE"




class Route
  def self.driving
    return self.new()
    
  end
end