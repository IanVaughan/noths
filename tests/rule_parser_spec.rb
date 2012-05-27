#coding: utf-8

require "#{File.dirname(__FILE__)}/../lib/rule_parser"

describe RuleParser, "#initialize" do

  before(:all) do
    @rule = "If you spend over £60, then you get 10% of your purchase"
    @type = Types.new(:total, 60, "10%")
  end

  it "parses the rules" do
    # use expects
    #rp = RuleParser.new(@rule)
    #rp.type.should == @type
  end

end

describe RuleParser, "#add" do

  it "parses a rule" do
    rule = "If you spend over £60, then you get 10% of your purchase"
    type = Types.new(:total, 60, "10%")
    rp = RuleParser.new(rule)
    rp.type.should == type
  end

end

describe RuleParser, "#apply" do

  before(:all) do
    #item_stub = Item.stub!(:code).and_return("111")
    #item_stub = Item.stub!(:name).and_return("test_name")
    #@item_stub = Item.stub!(:price).and_return("100")
    i = Item.new(0)
    i.stub!(:price).and_return(100)

    @items_stub=[]
    @items_stub.push(i)
  end

  it "deducts the correct amount of the total" do
    rp = RuleParser.new("")
    total = rp.apply(@items_stub)
    total.should == 90 # @item_stub - 10%
  end

end

#initialize
# add/remove rules
# check for inconsistencies?

#describe Types , "#" do
#end
