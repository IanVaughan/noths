require "#{File.dirname(__FILE__)}/../lib/rule"

class Checkout

  def initialize(rules)
    @items = []
    @items_hash = {}
    Rule.add(rules)
  end

  def scan(item)
    @items << item if item.class == Item
    @items_hash[item.code] ||= 0;
    @items_hash[item.code] += 1;
    self
  end

  def total
    sum=0

    @items = Rule.match(@items_hash, @items)

    @items.each do |i|
      sum += i.price
    end

    sum = Rule.discount(sum)
  end

  def to_s
    s = "Basket has #{@items.count} items :"
    if @items.count
      @items.each { |i| s += "#{i.code}, " }
      s += "\nTotal price :" + self.total.to_s()
    end
  end

end
