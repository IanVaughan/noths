require "#{File.dirname(__FILE__)}/../lib/checkout"
require "#{File.dirname(__FILE__)}/../lib/item"

describe Checkout, "#scan" do

  before(:all) do
    @items = []
    @items.push(Item.new(001, "Lavender heart"         , 1))
    @items.push(Item.new(002, "Personalised cufflinks" , 2))
    @items.push(Item.new(003, "Kids T-shirt"           , 3))

  end

  # really #initialize
  it "returns 0 for empty basket" do
    co = Checkout.new("")
    co.total.should == 0
  end

  it "returns the cost of an item" do
    co = Checkout.new("")
    co.scan(@items[0])
    co.total.should == @items[0].price
  end

  it "returns the cost of an many items" do
    co = Checkout.new("")
    co.scan(@items[0]).scan(@items[1])
    co.total.should == @items[0].price + @items[1].price
  end


  #scan
  # allow array of items

end


describe Checkout, "#total" do

  it "returns discount"

end
