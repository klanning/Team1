require './route'

describe Route do
  
  before(:each) do
    origin = "923 Market St. SF, CA"
    destination = "100 California St. SF, CA"
    @bart_route = Route.bart(origin, destination)
  end
      
end