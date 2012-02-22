require './route'

describe Route do

    before :all do
       @driving_route = DriveRoute.new("923 Market St., San Francisco, CA", "1703 Telegraph Avenue, Oakland, CA")
           
     end

    it "when passed a driving route, returns a route object" do
      @driving_route.should be_an_instance_of DriveRoute
      @driving_route.origin.should be_an_instance_of String
      @driving_route.destination.should be_an_instance_of String
      @driving_route.cost_in_pennies.should be_an_instance_of Fixnum
      @driving_route.time_in_seconds.should be_an_instance_of Fixnum
    end
    it "returns proper input for a test drive route" do
      @driving_route.origin.should == "923 Market St., San Francisco, CA"
      @driving_route.destination.should == "1703 Telegraph Avenue, Oakland, CA"
      @driving_route.cost_in_pennies.should be_within(10).of(174)
      @driving_route.time_in_seconds.should == 1140
    end

  end
  