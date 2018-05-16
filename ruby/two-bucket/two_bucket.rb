class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket
  def initialize(bucket1, bucket2, goal, starting_bucket)
    if starting_bucket == 'one' then
      @startbucket = Bucket.new(bucket1, 'one')
      @otherbucket = Bucket.new(bucket2, 'two')
    else
      @startbucket = Bucket.new(bucket2, 'two')
      @otherbucket = Bucket.new(bucket1, 'one')
    end

    loop do
      @startbucket.fill
      break if [@startbucket.qty, @otherbucket.qty].include?(goal)
      puts 'starting - ' + @startbucket.qty.to_s + ', other - ' + @otherbucket.qty.to_s

      @startbucket.pour(@otherbucket)
      break if [@startbucket.qty, @otherbucket.qty].include?(goal)
      puts 'starting - ' + @startbucket.qty.to_s + ', other - ' + @otherbucket.qty.to_s

      if @otherbucket.full?
        @otherbucket.empty
        break if [@startbucket.qty, @otherbucket.qty].include?(goal)
        puts 'starting - ' + @startbucket.qty.to_s + ', other - ' + @otherbucket.qty.to_s
      end

      @startbucket.pour(@otherbucket)
      break if [@startbucket.qty, @otherbucket.qty].include?(goal)
      puts 'starting - ' + @startbucket.qty.to_s + ', other - ' + @otherbucket.qty.to_s

      break if @moves > 20
    end

    @goal_bucket = @startbucket.name
    @other_bucket = @otherbucket.qty
  end
end

class Bucket
  attr_reader :size, :name
  attr_accessor :qty

  def initialize (size, name)
    @qty = 0
    @size = size
    @name = name
    @moves = 0
  end

  def fill
    @qty = @size
    @moves += 1
  end

  def empty
    @qty = 0
    @moves += 1
  end

  def pour (bucket)
    capacity = bucket.size - bucket.qty
    if capacity >= @qty
      bucket.qty += @qty
      empty
    else
      bucket.fill
      @qty -= capacity
    end
    @moves += 1
  end

  def full?
    @size == @qty
  end
end

