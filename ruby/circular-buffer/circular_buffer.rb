# frozen_string_literal: true

# Simulation of circular buffer logic.
# http://exercism.io/exercises/ruby/circular-buffer/readme
class CircularBuffer
  def initialize(size)
    @buffer = Array.new(size)
    @size = size
    clear
  end

  def write(data)
    raise BufferFullException \
      if @read_pos == @write_pos && !@buffer[@write_pos].nil?
    write!(data)
  end

  def write!(data)
    @read_pos = advance_pos(@read_pos, @size) unless @buffer[@write_pos].nil?
    @buffer[@write_pos] = data
    @write_pos = advance_pos(@write_pos, @size)
  end

  def read
    raise BufferEmptyException \
      if @read_pos == @write_pos && @buffer[@read_pos].nil?

    data = @buffer[@read_pos]
    @buffer[@read_pos] = nil
    @read_pos = advance_pos(@read_pos, @size)
    data
  end

  def clear
    @buffer.fill nil
    @read_pos = (@size / 2).ceil
    @write_pos = (@size / 2).ceil
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  private

  def advance_pos(old_pos, size)
    pos = old_pos
    pos += 1
    pos = 0 if pos == size
    pos
  end
end
