require "./drive_route"

describe "whater" do
  it "hi" do
    # Person = double ("Person")
    # Person.stub!(:hi).and_return("it works!")
    # Wrap.go
    @driving_route = DriveRoute.new("923 Market St., San Francisco, CA", "1703 Telegraph Avenue, Oakland, CA")
    GasPrice = double ("GasPrice")
    GasPrice.stub!(:find_gas_price).and_return(4.16)
  end
end