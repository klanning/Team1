require 'route'

describe Route do
  
  before(:each) do
    start_address = "923 Market St. SF, CA"
    end_address = "100 California St. SF, CA"
    
    @route = Route.new(start_address, end_address)
  end
      
      
  it "should create a route object" do

    @route.should be_an_instance_of Route
  end
  
  it "should have an origin" do
    @route.origin.should == "923 Market St. SF, CA"
  end
  
  it "should have a destination" do
    @route.destination.should == "100 California St. SF, CA"
  end
  
  it "should have a cost"
  
  it "should have an estimated time"
  
end