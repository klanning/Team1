require './route'

describe Route do
  
  before(:each) do
    origin = "923 Market St. SF, CA"
    destination = "100 California St. SF, CA"
    @bart_route = Route.bart(origin, destination)
  end
      
      
  it "should create a route object" do
    @bart_route.should be_an_instance_of Route
  end
  
  it "should calculate the cost of a trip between two bart stations" do
    origin = "2800 Mission Street"
    destination = "2901 Diamond Street"
    bart_route = Route.bart(origin,destination)
    bart_route.cost_in_pennies.should == 175
  end
  
end