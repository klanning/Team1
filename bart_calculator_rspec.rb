require 'bart_calculator'
require 'address'

describe BartCalculator do
  
  before(:each) do
    @bart = BartCalculator.new
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
      @bart.calculate(start_address, end_address).should be_an_instance_of Route
    end

  end
  
end