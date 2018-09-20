class Allergies

  VALUES = %w( eggs peanuts shellfish strawberries tomatoes chocolate pollen cats )

  def initialize(score)
    @score = score
  end

  def allergic_to?(item)
    @score & 2**(VALUES.index(item)) != 0
  end

  def list
    VALUES.select {|allergen| allergic_to?(allergen)}#.keys()
  end

end
