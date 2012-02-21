require 'address'

describe Address do
  context "when it gets created" do
    it "should be initialized with a string address" do
      my_address = Address.new("923 market st, sf, ca")
      my_address.raw_string.should eq "923 market st, sf, ca"
    end
    
    # it "should validate a valid address" do
    #   my_address = Address.new("923 market st, sf, ca")
    #   my_address.validate.should be_true
    # end
    
  end
end