require "#{File.dirname(__FILE__)}/helper"

class Rule

  attr_reader :type, :amount, :value, :code

  # Emulate a db
  @@rules = []

  def initialize(params={})
    @type = params[:given_type]
    @amount = params[:when_amount]
    @value = params[:deduct]
    @code = params[:from_product]
  end

  def to_s
    "Rules->type:#{type}, amount:#{amount}, value:#{value}, code:#{code}"
  end

  def self.add(item)
    @@rules << item if item.class == Rule
    @@rules += item if item.class == Array
  end

  def self.discount(total)
    # Doesnt account for different discount levels/amounts!
    r = @@rules.find { |r| r.type == :discount }
    total = Helper.reduce_amount_by_percent(total, r.value) if total > r.amount
    total
  end

  def self.match(ih, items)
    result = items.find_all do |item|
      # Find a rule based on the current item
      rules = @@rules.find_all { |rule| rule.code == item.code }
      # apply the rule to the item if it meets the criteria
      rules.each do |apply_rule|
        item.price = apply_rule.value if ih[apply_rule.code] >= apply_rule.amount
      end
    end
    items
  end

end
