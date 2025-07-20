class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.empty?
    delimiters = /,|\n/
    nums = numbers.split(delimiters).map(&:to_i)
    negatives = nums.select(&:negative?)
    unless negatives.empty?
      raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}"
    end
    nums.sum
  end
end
      
