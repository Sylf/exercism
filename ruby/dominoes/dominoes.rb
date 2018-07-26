class Dominoes

  def self.chain(input)
    return [] if input.length == 0
    return input if input.length == 1 and input.first.first == input.first.last
    return nil if input.flatten.each_with_object(Hash.new(0)) { |elem, hash| hash[elem]+=1 }.any?{ |n| n[1].odd? }
    []
  end




end
