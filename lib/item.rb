class Item
  attr_accessor :code, :name, :price

  def initialize(code, name = 0, price = 0)
    #code, name, price = line.chomp.split(/\s*\|\s*/)
    @code, @name, @price = code, name, price
  end

  def to_s
    "Item->Product code:#{@code}, Name:#{@name}, Price:#{@price}"
  end

end
