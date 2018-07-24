class Dominoes

  def self.chain(input)
    return [] if input.length == 0
    return input if input.length == 1 and input.first.first == input.first.last
  end
end
