require './route'

describe Route do
  
  before(:each) do
    origin = "923 Market St. SF, CA"
    destination = "100 California St. SF, CA"
    destination2 = "A galaxy far far away..."
    
    
    @route1 = Route.new(origin,destination,150,100)
    @route2 = Route.new(origin,destination,150,100)
    @route3 = Route.new(origin,destination2,100,100)
  end
  
  describe "#compare" do
    it "should find Routes with equal time and cost equal " do
      @route1.compare(@route2).should == "These routes are pretty much identical."
    end
    
    it "shouldn't be able to compare routes to different places" do
      @route3.compare(@route2).should == "These routes are inherently different. You can't compare apples and oranges!"
    end
  
  end
      
end