class Clock
  def initialize (hour, minute)
    @hour = hour
    @minute = minute

    @hour += @minute / 60
    @hour = @hour % 24
    @minute = @minute % 60
  end

  def Clock.at(hour, minute)
    Clock.new(hour,minute)
  end

  def to_s
    sprintf "%02d:%02d", @hour, @minute
  end

  def +(minutes)
    Clock.at(@hour,@minute+minutes)
  end

  def ==(clock2)
    self.to_s == clock2.to_s
  end
end
