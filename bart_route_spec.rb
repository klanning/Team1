require './bart_route'

describe BartRoute do
  
  before(:each) do
    origin = "2800 Mission Street"
    destination = "2901 Diamond Street"
    @bart_route = BartRoute.new(origin, destination)
    bart_stub = double("BartRoute")
    bart_stub.stub!(:calculate_bart_time).and_return(180)
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
    bart_route.time_in_seconds.should be_within(300).of(300)
  end

end