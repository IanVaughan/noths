module Helper
  # rounds down to two decimal places
  def Helper.reduce_amount_by_percent(amount, pc)
    value = amount
    value -= (amount.to_f / 100.to_f * pc.to_f)
    (value * 100).round.to_f / 100
  end
end
