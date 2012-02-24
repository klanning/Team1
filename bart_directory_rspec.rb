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
  
  # describe "#closest_station" do
  #     
  #     it "should return the closest station" do
  #       origin = "2100 Mission Street San Francisco CA"
  #       @directory.closest_station(origin).should == "2000 Mission Street"
  #     end
  # 
  #     it "should return the closest station for a different" do
  #       destination = "2800 Diamond Street San Francisco CA"
  #       @directory.closest_station(destination).should == "2901 Diamond Street"
  #     end
  #   end
  
  describe '#get_abbr' do
    it "should return the abbrevation of a bart station given an address" do
      @directory.get_abbr("2000 Mission Street").should == "16TH"
    end
  end
  
  describe '#get_lat_long' do
  it "should return the latitude and longitude for each bart station" do
    @directory.get_lat_long("2000 Mission Street").should == "[37.765062, -122.419694]"
  end

  end
  
end