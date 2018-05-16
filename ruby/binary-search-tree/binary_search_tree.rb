class Bst
  include Enumerable
  attr_reader :data, :left, :right
  def initialize(num)
    @data = num
  end

  def insert(num)
    if num <= @data then
      @left ? @left.insert(num) : @left = Bst.new(num)
    else
      @right ? @right.insert(num) : @right = Bst.new(num)
    end
  end

  def each(&block)
    lst = []
    @left.each { |x| lst << x } if @left
    lst << self.data
    @right.each { |x| lst << x } if @right
    lst.each(&block)
  end
end

module BookKeeping
  VERSION = 1
end
