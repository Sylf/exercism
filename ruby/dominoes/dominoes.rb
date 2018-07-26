class Dominoes

  def self.chain(input)
    return [] if input.length == 0
    return input if input.length == 1 and input.first.first == input.first.last
    # All numbers shown on domino tiles must have even count.
    # [1,2] [1,2] (two each of 1 and 2) is solvable, but [1,2] [1,2] [1,2] (three each of 1 and 2) is not
    return nil if input.flatten.each_with_object(Hash.new(0)) { |elem, hash| hash[elem]+=1 }.any?{ |n| n[1].odd? }
    []
  end




end
