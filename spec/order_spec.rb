require "takeaway"
require "menu"
require "order"

describe Order do

  it "will give the overall price" do
    takeaway = Takeaway.new
    order = Order.new
    takeaway.add_items("Chicken", 3)
    takeaway.add_items("Cobra", 5)
    expect(order.total_price). to eq 35
  end
end
