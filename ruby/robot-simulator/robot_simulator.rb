class Robot
  attr_reader :bearing, :coordinates
  @@bearings = [:north, :east, :south, :west]
  def initialize
  end

  def orient(direction)
    raise ArgumentError unless @@bearings.include?(direction)
    @direction = @@bearings.find_index(direction)
    @bearing = direction
  end

  def turn_left
    @direction += 3
    @bearing = @@bearings[@direction%4]
  end

  def turn_right
    @direction += 1
    @bearing = @@bearings[@direction%4]
  end

  def at(x,y)
    @coordinates = [x,y]
  end

  def advance
    @coordinates = case @bearing
    when :north
      [@coordinates[0], @coordinates[1]+1]
    when :east
      [@coordinates[0]+1, @coordinates[1]]
    when :south
      [@coordinates[0], @coordinates[1]-1]
    when :west
      [@coordinates[0]-1, @coordinates[1]]
    end
  end
end

class Simulator
  def initialize
    @instructions = {
      'R' => :turn_right,
      'L' => :turn_left,
      'A' => :advance
    }
  end

  def instructions(str)
    instructions = []

    str.chars.each do |t|
      instructions.push @instructions[t]
    end
    instructions
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, commands)
    instructions(commands).each do |command|
      robot.send(command)
    end
  end
end
