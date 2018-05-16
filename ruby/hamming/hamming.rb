
class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.length != strand2.length
    # return 0 if strand1 === strand2
    #(0..(strand1.length)).reduce(0) { |count, pos|
    #  count += ((strand1[pos] != strand2[pos])?1:0)
    #}
    strand1
        .bytes  # breaks into bytes of array
        .zip(strand2.bytes) #
        .count { |pair| pair[0] != pair[1] }
  end
end

module BookKeeping
  VERSION = 3
end
