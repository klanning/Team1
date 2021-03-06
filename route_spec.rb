require './route'
require './drive_route'

describe Route do
  
  before(:all) do
    
    @driving_route = DriveRoute.new("923 Market St., San Francisco, CA", "1703 Telegraph Avenue, Oakland, CA")
    
    origin = "923 Market St. SF, CA"
    destination = "100 California St. SF, CA"
    destination2 = "1703 Telegraph Avenue, Oakland, CA"
    
    
    @route1 = Route.new(origin,destination,150,100)
    @route2 = Route.new(origin,destination,150,100)
    @route3 = Route.new(origin,destination2,100,100)
    @route4 = Route.new(origin,destination,100,300)
    @route5 = @route1.add(@route3)
  end
  # 
  # it "when passed a driving route, returns a route object" do
  #   @driving_route.should be_an_instance_of DriveRoute
  #   @driving_route.origin.should be_an_instance_of String
  #   @driving_route.destination.should be_an_instance_of String
  #   @driving_route.cost_in_pennies.should be_an_instance_of Fixnum
  #   @driving_route.time_in_seconds.should be_an_instance_of Fixnum
  # end
  # it "returns proper input for a test drive route" do
  #   @driving_route.origin.should == "923 Market St., San Francisco, CA"
  #   @driving_route.destination.should == "1703 Telegraph Avenue, Oakland, CA"
  #   @driving_route.cost_in_pennies.should be_within(10).of(174)
  #   @driving_route.time_in_seconds.should == 1140
  # end
  # 
  # describe "#compare" do
  #   it "should find Routes with equal time and cost equal " do
  #     @route1.compare(@route2).should == "These routes are pretty much identical."
  #   end
  #   
  #   it "shouldn't be able to compare routes to different places" do
  #     @route3.compare(@route2).should == "These routes are inherently different. You can't compare apples and oranges!"
  #   end
  #   
  #   it "should weight cost more heavily than time" do
  #     @route1.compare(@route4).should == @route4
  #   end
  # end  
  
  describe "#add" do
    it "should add two routes' cost and time as a new route object" do
      @route5.should be_an_instance_of Route
    end
    
    it "when added should return the total time" do
      @route5.time_in_seconds.should == @route1.time_in_seconds + @route3.time_in_seconds
    end
    
    it "when added should return the total cost" do
      @route5.cost_in_pennies.should == @route1.cost_in_pennies + @route3.cost_in_pennies
    end
    
  end
  
end