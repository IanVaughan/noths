require "#{File.dirname(__FILE__)}/../lib/item"

describe Item, "#init" do

  it "sets the correct item code via accessor" do
    item = Item.new(0,0,0)
    item.code = 10
    item.code.should == 10
  end

  it "sets the correct item code via initialize" do
    item = Item.new(10,0,0)
    item.code.should == 10
  end

  # Item.new (x, y, z)
  # validate code/description (sting)/price (min/max)

  # validate parse of long string
  # Item.new (a)

end
