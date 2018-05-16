class Game
  attr_reader :score
  def initialize
    @score = 0
    @current_frame = nil
    @frames = Array.new()
  end

  def roll(pins)
    @score += pins
    return if @frames.count == 9
    if @current_frame.nil?
      @current_frame = Frame.new(pins)
    elsif @current_frame.is_complete?
      @score += pins if @current_frame.is_spare? || @current_frame.is_strike?
      @frames.push @current_frame
      @current_frame = Frame.new(pins)
    else
      @current_frame.add_throw(pins)
    end
  end

  class Frame
    attr :first_throw, :second_throw
    def initialize(pins)
      @first_throw = pins
      if pins == 10
        @is_complete = true
        @second_throw = 0
      else
        @is_complete = false
        @second_throw = nil
      end
    end

    def add_throw(pins)
      @second_throw = pins
    end

    def is_strike?
      @first_throw == 10
    end

    def is_spare?
      @first_throw != 10 && (@first_throw+@second_throw) == 10
    end

    def is_complete?
      is_strike? || !@second_throw.nil?
    end
  end
end
