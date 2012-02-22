require './google_directions_wrapper'

describe 'GoogleDirectionsWrapper' do
  
  before(:each) do
    @wrapper = GoogleDirectionsWrapper.new("923 Market St., San Francisco, CA", "1703 Telegraph Avenue, Oakland, CA")
  end
  
  it "when called, returns the wrapper object" do
    @wrapper.origin.should be_an_instance_of String
    @wrapper.destination.should be_an_instance_of String
  end

  it "#route_time should return route time in seconds" do
    @wrapper.route_time.should == 1140
  end

  it "#route_distance should return route distance in miles" do
    @wrapper.route_distance.should == 10.4
  end

  it"#origin_zipcode should return the zipcode" do
    @wrapper.origin_zipcode.should == "94103"
  end

end

  