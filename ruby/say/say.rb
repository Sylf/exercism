class Say
  @@ones = %w( zero one two three four five six seven eight nine )
  @@tens = %w( zero ten twenty thirty forty fifty sixty seventy eighty ninty )
  @@teens = %w( ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen )
  def initialize(number)
    @number = number
  end

  def in_english
    if @number.between?(100,999)
      return @@ones[@number/100] + ' hundred ' + under_one_hundred(@number%100)
    end
    return under_one_hundred(@number) if @number.between?(1,99)
    return 'zero'
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
end
