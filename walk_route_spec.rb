require './route'
require './walk_route'


describe 'WalkRoute' do
  before(:each) do
    @walking_route = WalkRoute.new("923 Market St., San Francisco, CA", "1703 Telegraph, Avenue, Oakland, CA")
  end
  

  it "when we create a new walking route it returns an origin, destination, cost, and walking time" do
    @walking_route.should be_an_instance_of WalkRoute
    @walking_route.origin.should be_an_instance_of String
    @walking_route.destination.should be_an_instance_of String
    @walking_route.cost_in_pennies.should eq 0
    @walking_route.time_in_seconds.should be_an_instance_of Fixnum
    puts @walking_route.time_in_seconds
  end

end