require './google_maps_api.rb'

describe 'Route' do
  before :all do
     @driving_route = Route.driving("923 Market St., San Francisco, CA", "1703 Telegraph Avenue, Oakland, CA")
   end
   
  it "when passed a driving route, returns a route object" do
    @driving_route.should be_an_instance_of Route
    @driving_route.origin.should be_an_instance_of String
    @driving_route.destination.should be_an_instance_of String
    @driving_route.cost_in_pennies.should be_an_instance_of Fixnum
    @driving_route.time_in_secs.should be_an_instance_of Fixnum
    puts @driving_route.origin
    puts @driving_route.destination
    puts @driving_route.cost_in_pennies
    puts @driving_route.time_in_secs
  end
  it "returns proper input for a test drive route" do
    @driving_route.origin.should == "923+Market+St.,+San+Francisco,+CA"
    @driving_route.destination.should == "1703+Telegraph+Avenue,+Oakland,+CA"
    @driving_route.cost_in_pennies.should be_within(1).of(166)
    @driving_route.time_in_secs.should == 1140
  end
    
  # it "gets a propper response from google" do
  #   @drive_calc.get_directions.should not_match /did not match any documents/
  # end
  
end