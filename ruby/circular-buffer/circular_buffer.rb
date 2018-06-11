class CircularBuffer
  def initialize(size)
    @buffer = Array.new(size)
    @size = size
    self.clear
  end

  def write(data)
    raise BufferFullException if @read_pos == @write_pos && !@buffer[@write_pos].nil?
    @buffer[@write_pos] = data
    @write_pos += 1
    @write_pos = 0 if @read_pos == @size
  end

  def read
    raise BufferEmptyException if @read_pos == @write_pos && @buffer[@read_pos].nil?
    data = @buffer[@read_pos]
    @buffer[@read_pos] = nil
    @read_pos += 1
    @read_pos = 0 if @read_pos == @size
    data
  end

  def clear
    @buffer.fill (nil)
    @read_pos = (@size/2).ceil
    @write_pos = (@size/2).ceil
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end
end
