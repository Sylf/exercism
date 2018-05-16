class Allergies
  attr_reader :list
  def initialize(allergies)
    @allergies = allergies
    @allergy_list = {
      1 => 'eggs',
      2 => 'peanuts',
      4 => 'shellfish',
      8 => 'strawberries',
      16 => 'tomatoes',
      32 => 'chocolate',
      64 => 'pollen',
      128 => 'cats'
    }

    @list = []
    @allergy_list.each do |key,value|
      @list.push value if (key & allergies != 0)
    end
  end

  def allergic_to?(symptom)
    (@allergy_list.key(symptom) & @allergies != 0)
  end
end

module BookKeeping
  VERSION=1
end
