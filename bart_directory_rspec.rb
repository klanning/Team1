require './bart_directory'

describe BartDirectory do
  
  before(:each) do
    @directory = BartDirectory.new
  end
  
  describe '#bart_station?' do
    it "should check if an address is a Bart station" do
      origin = "2800 Mission Street"
      destination = "Sunset Blvd."
      @directory.bart_address?(origin).should == true
      @directory.bart_address?(destination).should == false
    end
  end
  
  describe "#closest_station" do
    it "should return the closest station"
  end
  
  describe '#get_abbr' do
    it "should return the abbrevation of a bart station given an address" do
      @directory.get_abbr("2800 Mission Street").should == "24TH"
    end
  end
  
end