require './bart_route'

describe BartRoute do
  
  before(:each) do
    origin = "2800 Mission Street"
    destination = "2901 Diamond Street"
    @bart_route = BartRoute.new(origin, destination)
  end
      
  it "should create a route object" do
    @bart_route.should be_an_instance_of BartRoute
    @bart_route.origin.should == "2800 Mission Street"
    @bart_route.destination.should == "2901 Diamond Street"
  end
  
  it "should calculate the cost of a trip between two bart stations" do
    origin = "2800 Mission Street"
    destination = "2901 Diamond Street"
    bart_route = BartRoute.new(origin, destination)
    bart_route.cost_in_pennies.should == 175
  end
  
  it "should calculate the time of a trip between two bart stations" do
    origin = "2800 Mission Street"
    destination = "2901 Diamond Street"
    bart_route = BartRoute.new(origin, destination)
    # Guessing these times BECAUSE I DON"T KNOW THE ACTUAL TIMES OK!?!?
    bart_route.time_in_seconds.should be_within(180).of(181)
  end
  
  it "should check if the origin address is a Bart station" do
    origin = "2800 Mission Street"
    @bart_route.origin.bart_address? == true
  end
  
  it "should calculate a subroute if the origin or destination isn't a bart station" do
    origin = "Fair Oaks St"
    destination = "2901 Diamond Street"
    bart_route = BartRoute.new(origin, destination)
    bart_route.time_in_seconds.should > 181
  end
end