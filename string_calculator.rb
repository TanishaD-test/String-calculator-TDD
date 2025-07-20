class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.empty?
    if numbers.start_with?("//")
      delimiter_part, numbers = numbers[2..-1].split("\n", 2)
      delimiters = Regexp.new(Regexp.escape(delimiter_part))
    else
      delimiters = /,|\n/
    end
    nums = numbers.split(delimiters).map(&:to_i)
    negatives = nums.select(&:negative?)
    unless negatives.empty?
      raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}"
    end
    nums.sum
  end
end
      
