require './bart_directory'

describe BartDirectory do
  
  before(:each) do
    @directory = BartDirectory.new
  end
  
  describe '#bart_station?' do
    it "should check if an address is a Bart station" do
      origin = "2000 Mission Street"
      destination = "Sunset Blvd."
      @directory.bart_address?(origin).should == origin
      @directory.bart_address?(destination).should == nil
    end
  end
  
  describe "#closest_station" do
       
       it "should return the closest station" do
         origin = "2100 Mission Street San Francisco CA"
         @directory.closest_station(origin).should == "2000 Mission Street"
       end
   
       it "should return the closest station for a different" do
         destination = "2800 Diamond Street San Francisco CA"
         @directory.closest_station(destination).should == "2901 Diamond Street"
       end
     end
  
  describe '#get_abbr' do
    it "should return the abbrevation of a bart station given an address" do
      @directory.get_abbr("2000 Mission Street").should == "16TH"
    end
  end
  
  describe '#get_lat_long' do
    it "should return the latitude and longitude for each bart station" do
      @directory.get_lat_long("923 Market St., San Francisco, CA").should == {"lat"=>37.78355000000001, "lng"=>-122.40864}
    end

  end
  
  describe "#compare_lat_long" do
    it "should return a single number value which represents the distance between two latitudes and longitudes" do
      @directory.compare_lat_longs({"lat"=>37.78355000000001, "lng"=>-122.40864}, {"lat"=>37.765062, "lng"=>-122.419694}).should be_within(0.00001).of 0.029541999999999
      #comparing 923 market st with 2000 mission st
    end
  end

  
end