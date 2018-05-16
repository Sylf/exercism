class Anagram
  def initialize(seed)
    @seed = seed.downcase
    @seed_sorted = resort(@seed)
  end

  def match(word_list)
    anagram_list = []
    for word in word_list do
      if @seed.length == word.length and @seed_sorted == resort(word) and @seed.downcase!= word.downcase then
        anagram_list << word
      end
    end
    anagram_list
  end

  def resort(word)
  end
end

  module BookKeeping
    VERSION = 2
  end
