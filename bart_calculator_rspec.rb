require './bart_calculator'
require './address'

describe BartCalculator do
  
  before(:each) do
    @start_address = Address.new("123 Market St.")
    @end_address   = Address.new("789 California St.")
    
    @bart = BartCalculator.new
    @calc_return = @bart.calculate(@start_address, @end_address)
  end
  
  it "should be an BartCalculator object" do
    @bart.should be_an_instance_of BartCalculator
  end
  
  describe "#calculate" do
    it "should have a calculate method" do
      @bart.should respond_to :calculate
    end
    
    it "should raise an ArgumentError error unless 2 Address objects are passed" do
      expect { @bart.calculate }.to raise_error(ArgumentError)
    end
    
    it "should return a route object" do
      start_address = Address.new("123 Market St.")
      end_address   = Address.new("789 California St.")
      @calc_return.should be_an_instance_of Route
    end
    
    it "should return a route object with the right origin and destination" do
      @calc_return.origin.should == @start_address
      @calc_return.destination.should == @end_address
    end
    
    it "should return a route of 0 time and distance if the origin and destination are the same" do
      start_address = Address.new("123 Market St.")
      end_address = Address.new("123 Market St.")
      @bart.calculate(start_address,end_address).estimated_time.should == 0
      @bart.calculate(start_address,end_address).cost.should == 0
    end
    
    it "should return the right cost between stations" do
      start_address = Address.new("2800 Mission Street")
      end_address = Address.new("2901 Diamond Street")
      @bart.calculate(start_address,end_address).cost.should == 175
    end
  end
end