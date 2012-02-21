require './route'

describe Route do
  
  # before(:each) do
  #   start_address = "923 Market St. SF, CA"
  #   end_address = "100 California St. SF, CA"
  #   @route = Route.new(start_address, end_address)
  # end
  #     
  #     
  # it "should create a route object" do
  # 
  #   @route.should be_an_instance_of Route
  # end
  # 
  # it "should have an origin" do
  #   @route.origin.should == "923 Market St. SF, CA"
  # end
  # 
  # it "should have a destination" do
  #   @route.destination.should == "100 California St. SF, CA"
  # end
  # 
  # it "should have a cost" do
  #   @route.cost.should_not == nil
  # end
  # 
  # it "should have an estimated time" do
  #   @route.estimated_time.should_not == nil
  # end

  describe 'Route' do
    before :all do
       @driving_route = Route.driving("923 Market St., San Francisco, CA", "1703 Telegraph Avenue, Oakland, CA")
     end

    it "when passed a driving route, returns a route object" do
      @driving_route.should be_an_instance_of Route
      @driving_route.origin.should be_an_instance_of String
      @driving_route.destination.should be_an_instance_of String
      @driving_route.cost_in_pennies.should be_an_instance_of Fixnum
      @driving_route.time_in_seconds.should be_an_instance_of Fixnum
    end
    it "returns proper input for a test drive route" do
      @driving_route.origin.should == "923 Market St., San Francisco, CA"
      @driving_route.destination.should == "1703 Telegraph Avenue, Oakland, CA"
      @driving_route.cost_in_pennies.should be_within(1).of(166)
      @driving_route.time_in_seconds.should == 1140
    end

  end
  
end