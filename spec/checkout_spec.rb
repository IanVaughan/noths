#coding: utf-8
require "#{File.dirname(__FILE__)}/../lib/checkout"
require "#{File.dirname(__FILE__)}/../lib/item"
require "#{File.dirname(__FILE__)}/../lib/helper"

describe Checkout, "#total" do

  before(:each) do
    @items = []
    @items.push(Item.new(001, "Lavender heart"         , 9.25))
    @items.push(Item.new(002, "Personalised cufflinks" , 45.00))
    @items.push(Item.new(003, "Kids T-shirt"           , 19.95))

    @rules = []
    #If you spend over £60, then you get 10% of your purchase
    @rules << Rule.new(:given_type => :discount, :when_amount => 60, :deduct => 10)
    #If you buy 2 or more lavender hearts then the price drops to £8.50
    @rules << Rule.new(:given_type => :count, :when_amount => 2, :from_product => 001, :deduct => 8.50)
  end

  # really #initialize
  it "returns 0 for empty basket" do
    co = Checkout.new(@rules)
    co.total.should == 0
  end

  it "returns the cost of an item" do
    co = Checkout.new(@rules)
    co.scan(@items[0])
    co.total.should == @items[0].price
  end

  it "returns the cost of an many items" do
    co = Checkout.new(@rules)
    co.scan(@items[0]).scan(@items[1])
    co.total.should == @items[0].price + @items[1].price
  end

  it "gives discount of 10% to orders over £60" do
    co = Checkout.new(@rules)
    item = Item.new(111, "test", 72)
    co.scan(item)
    co.total.should == Helper.reduce_amount_by_percent(72, 10)
  end

  it "drops the price of lavendar hearts to £8.50 if ordered 2 or more" do
    co = Checkout.new(@rules)
    co.scan(@items[0]).scan(@items[0])
    co.total.should == 2 * 8.5
  end

  #Basket: 001,002,003
  #Total price expected: £66.78
  it "prices example basket 1 correctly" do
    co = Checkout.new(@rules)
    co.scan(@items[0]).scan(@items[1]).scan(@items[2])
    co.total.should == 66.78
  end

  #Basket: 001,003,001
  #Total price expected: £36.95
  it "prices example basket 2 correctly" do
    co = Checkout.new(@rules)
    co.scan(@items[0]).scan(@items[2]).scan(@items[0])
    co.total.should == 36.95
  end

  #Basket: 001,002,001,003
  #Total price expected: £73.76
  it "prices example basket 3 correctly" do
    co = Checkout.new(@rules)
    co.scan(@items[0]).scan(@items[1]).scan(@items[0]).scan(@items[2])
    co.total.should == 73.76
  end

end
