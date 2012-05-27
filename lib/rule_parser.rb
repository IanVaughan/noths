class Types
  attr_accessor :type, :amount, :value

  def initialize(type = 0, amount = 0, value = 0)
    @type, @amount, @value = type, amount, value
  end

  def to_s
    "Types->type:#{type}, amount:#{amount}, value:#{value}"
  end

  def ==(other)
    @type == other.type && @amount == other.amount && @value == other.value
  end

end

class RuleParser
  attr_accessor :type
#  @@words = %w{ spend }
#  @@types = Struct.new(:type, :amount, :value)

  def initialize(rules)
    rules.each_line { |r| add r }
#    @rules = Hash.new
#    @type = Types.new(:total, 60, "10%")
    self
  end

  def add(rule)
    @type = Types.new
    rule.split(" ").each do |r|
      case r
        when "spend"
          @type.type = :total

        when /(\\d+)/
          @type.value = $1
      end
    end
    self
  end

  def apply(items)
    sum=0
    items.each { |i| sum += i.price }
    sum
  end

end

#If you spend over £60, then you get 10% of your purchase
#If you buy 2 or more lavender hearts then the price drops to £8.50

#If /^they/you/customer/ /spend|buy|sum|total/ /over|more<than>/|/under|less<than>/ (*.) then
#If ... (*.) ... (*.) ...

#str = "store[name]=Ilyas store,store[phone]= 4999-233-2923, store[fax]= 80233923293,store[description]=lkjklsdaj,save=save,cancel=cancel"
#store = Hash[*str.scan(/\S\[([^\s,]+)\]\s*=\s*([^,]+)/).flatten]
#{"name"=>"Ilyas store", "phone"=>"4999-233-2923", "description"=>"lkjklsdaj"}

# create validators for rule writers
# and parse it against a dummie test set of data to show them what the effect wiould be
