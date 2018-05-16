class Integer
  def to_roman
    cur_roman = ''
    cur_arabic = self
    converter = [
      [1000, 'M'],
      [ 900, 'CM'],
      [ 500, 'D'],
      [ 400, 'CD'],
      [ 100, 'C'],
      [  90, 'XC'],
      [  50, 'L'],
      [  40, 'XL'],
      [  10, 'X'],
      [   9, 'IX'],
      [   5, 'V'],
      [   4, 'IV'],
      [   1, 'I']];
    converter.each { |set|
      value = cur_arabic / set[0]
      cur_roman += set[1] * value
      cur_arabic = cur_arabic % set[0]
    }
    cur_roman
  end
end

module BookKeeping
  VERSION=2
end
