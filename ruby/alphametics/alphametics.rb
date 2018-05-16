class Alphametics
  def self.solve(input)
    (equasion, result) = input.split(' == ')
    operands = equasion.split(' + ')
    return {} if operands.count == 1 && operands[0] != result
    return {} if operands.select { |o| o.length > result.length }.count >0

    letters = (operands+[result]).flatten.join.split('').uniq.join
    '1234567890'.chars.permutation(letters.length).map(&:join).each do |possibility|
      if (operands.inject(0){|a,b| a+b.tr(letters, possibility).to_i} == result.tr(letters, possibility).to_i)
        unless (operands + [result]).flatten.find{|s| s.tr(letters,possibility)[0] == '0'}
          return Hash[letters.chars.zip(possibility.chars.map(&:to_i))]
        end
      end
    end
  end
end

module BookKeeping
  VERSION = 4
end
