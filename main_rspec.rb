require './main'

describe "main" do
  
  it "runs" do
    public_transportation_route = double("public_transportation_route")
    public_transportation_route.stub!(:calc_drive_time) {5000}
    public_transportation_route.stub!(:calc_drive_cost) {200}
  end
  
end