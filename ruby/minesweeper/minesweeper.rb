module Board
  def self.transform(inp)
    width = inp[0].length
    height = inp.length

    raise ArgumentError if inp[0] !~ /^\+\-+\+$/
    raise ArgumentError if inp[-1] !~ /^\+\-+\+$/
    inp.each_with_index { |line,y|
      raise ArgumentError if line.size != width
      raise ArgumentError if line !~ /^\|[* ]+\|$/ && y > 0 && y < (height-1)
    }

    inp.each_with_index { |line,y|
      line.chars.each_with_index { |char,x|
        update_mine_count(inp,x,y) if char==' '
      }
    }

    inp
  end

  def self.update_mine_count(inp,x,y)
    mine_count = 0
    ((x-1)..(x+1)).each { |x1|
      ((y-1)..(y+1)).each { |y1|
        mine_count += 1 if inp[y1][x1] == '*'
      }
    }
    inp[y][x] = mine_count.to_s if mine_count > 0
  end
end
