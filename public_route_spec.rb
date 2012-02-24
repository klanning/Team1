require './public_route'

describe PublicRoute do
  before(:each) do
    origin = "212 Fair Oaks Street CA"
    destination = "2901 Diamond Street"
    @public = PublicRoute.new(origin, destination)
  end
  
  it "should be an instance of PublicRoute" do
    @public.class.should == PublicRoute
  end
  
  it "should check if destination address is a bart station" do
    @public.closest_bart_to_destination.should == nil
  end
    
  it "should return a route with somewhee near the right duration" do
    @public.time_in_seconds.should be_within(120).of(660)
  end
  
  it "should return a route with somewhere near the right time and cost" do
    @public.cost_in_pennies.should == 175
  end
    
end