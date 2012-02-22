require './gas_price'

describe GasPrice do
  it "retruns a gas price when given an address" do
      GasPrice.find_gas_price(97214).should be_an_instance_of Float
  end
end