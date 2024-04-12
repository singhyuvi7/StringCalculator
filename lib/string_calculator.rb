module StringCalculator
  def add
    raise_if_negatives
    digits.reduce(0, :+)
  end

  def raise_if_negatives
    raise "Negatives not allowed: #{negatives.join(', ')}" if negatives.any?
  end

  def negatives
    @negatives ||= digits.select {|d| d < 0}
  end

  def digits
    @digits ||= gsub("\n", delimiter).split(delimiter).map(&:to_i)
  end

  def delimiter
    @delimiter ||= has_custom_delimiter? ? custom_delimiter : ','
  end

  def has_custom_delimiter?
    self[0,2] == '//'
  end

  def custom_delimiter
    self[2]
  end
end
