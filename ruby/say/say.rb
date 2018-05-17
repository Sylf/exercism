class Say
  @@ones = %w( zero one two three four five six seven eight nine )
  @@tens = %w( zero ten twenty thirty forty fifty sixty seventy eighty ninty )
  @@teens = %w( ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen )
  # kilo, million, billion etc
  @@kmb = %w( zero thousand million billion )
  def initialize(number)
    @number = number
  end

  def in_english
    if @number.between?(1000,999_999_999)
      return above_thousand(@number).rstrip
    elsif @number.between?(100,999)
      return say_hundreds(@number).rstrip
    elsif @number.between?(1,99)
      return under_one_hundred(@number).rstrip
    elsif @number === 0
      return 'zero'
    else
      raise ArgumentError
    end
  end

  def under_one_hundred(number)
    return '' if number === 0
    if number.between?(20,99)
      if (number%10===0)
        return @@tens[number/10]
      else
        return @@tens[number/10] + '-' + @@ones[number%10]
      end
    end
    return @@teens[number-10] if number.between?(11,19)
    @@ones[number] if number < 10
  end

  def say_hundreds(number)
    if number > 99 then
      return @@ones[number/100] + ' hundred ' + under_one_hundred(number%100)
    else
      return under_one_hundred(number%100)
    end
  end

  def above_thousand(number)
    index = (number.to_s.length-1) / 3
    new_number = number / (1000**index)
    return under_one_hundred(new_number) + ' ' + @@kmb[index] + ' ' + say_hundreds(number % 1000)
  end
end
