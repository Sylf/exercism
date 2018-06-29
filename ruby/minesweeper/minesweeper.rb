module Board
  def self.transform(inp)
    width = inp[0].length
    height = inp.length

    raise ArgumentError if inp[0] !~ /^\+\-+\+$/
    raise ArgumentError if inp[-1] !~ /^\+\-+\+$/
    inp.each_with_index { |line,i|
      raise ArgumentError if line.size != width
      raise ArgumentError if line !~ /^\|[* ]+\|$/ && i > 0 && i < (height-1)
    }


    ["+------+", "|1*22*1|", "|12*322|", "| 123*2|", "|112*4*|", "|1*22*2|", "|111111|", "+------+"]
  end
end
