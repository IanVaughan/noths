#!/usr/bin/ruby
require "#{File.dirname(__FILE__)}/../lib/checkout"
require "#{File.dirname(__FILE__)}/../lib/item"

class Runner

  def initialize(basket, rules)
    @basket, @rules = basket, rules
  end

  def run
    co = Checkout.new(@rules)
#    co.scan(item)
  end

#i1=Item.new(1,2,3)
#i2=Item.new(3,4,5)
#co.scan(i1).scan(i2)

end

r = Runner.new("model/basket/basket.1", "model/rules/rules.1")
r.run

irb
