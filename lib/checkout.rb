require "#{File.dirname(__FILE__)}/item"
require "#{File.dirname(__FILE__)}/rule_parser"

class Checkout

  def initialize(rules)
    @items=[]
    @rp = RuleParser.new(rules)
  end

  def scan(item)
    @items.push(item)
    self
  end

  def total
    @rp.apply(@items)
  end

  def to_s
    s = "Basket has #{@items.count} items :"
    if @items.count
      @items.each { |i| s += "#{i.code}, " }
      s += "\nTotal price :" + self.total.to_s()
    end
  end

end
