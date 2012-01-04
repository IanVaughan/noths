class Item

  attr_accessor :code, :name, :price

  def initialize(code, name, price)
    @code, @name, @price = code, name, price
  end

  def to_s
    "Item->Product code:#{@code}, Name:#{@name}, Price:#{@price}"
  end

end
