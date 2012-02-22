require './public_route'

describe PublicRoute do
  before(:each) do
    origin = "Fair Oaks St"
    destination = "2901 Diamond Street"
    @public = PublicRoute.new(origin,destination)
  end
  
  it "should be an instance of PublicRoute" do
    @public.class.should == PublicRoute
  end
  
  it "should check if destination address is a bart station" do
    @public.closest_bart_to_destination.should == nil
  end
    
    
end