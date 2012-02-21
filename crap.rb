

start_addrss = "923 market sf"
end_addrss = "509 n st"
driving_route = Route.driving(start_addrss, end_addrss)
barting_route = Route.barting(start_addrss,endaddrss,:bart)

driving_route > barting_route ? "BART" : "DRIVE"

drive_or_bart.compare(rout1,route2)




class Route
  def self.driving
    output = Route.new
    
    return self.new()
    
  end
end