class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    if numbers.start_with?("//")
      delimiter_part, numbers = numbers[2..-1].split("\n", 2)

      if delimiter_part.start_with?("[") && delimiter_part.end_with?("]")
        delimiters = delimiter_part.scan(/\[(.+?)\]/).flatten
        regex_pattern = delimiters.map { |d| Regexp.escape(d) }.join('|')
        delimiters = Regexp.new(regex_pattern)
      else
        delimiters = Regexp.new(Regexp.escape(delimiter_part))
      end
    else
      delimiters = /,|\n/
    end

    nums = numbers.split(delimiters).map(&:to_i)

    negatives = nums.select(&:negative?)
    unless negatives.empty?
      raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}"
    end

    nums.reject { |n| n > 1000 }.sum
  end
end
