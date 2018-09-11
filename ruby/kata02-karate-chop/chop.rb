DEBUG_OUTPUT = ENV['D']
# alias for configurability
def chop(i, arr)
    case ENV['V']
    when '2' then chop_2(i, arr)
    when '3' then chop_3(i, arr)
    when '4' then chop_4(i, arr)
    when '5' then chop_5(i, arr)
    else chop_1(i, arr)
    end
end

# version 1: recursion
def chop_1(i, arr)
    if DEBUG_OUTPUT
        puts "\nchop #{i}, #{arr.inspect}\n"
    end

    # check if its empty
    if arr.empty?
        if DEBUG_OUTPUT
            puts "ran out of things to check\n"
        end

        return -1
    end

    if arr.length == 1
        if arr[0] != i
            if DEBUG_OUTPUT
                puts "#{arr[0]} is != #{i}, out of things to check\n"
            end

            return -1
        else
            if DEBUG_OUTPUT
                puts "found #{i} at 0\n"
            end

            return 0
        end
    end

    mid = arr.length / 2

    if DEBUG_OUTPUT
        puts "midway between 0 and #{arr.length} is #{mid} (arr[#{mid}]: #{arr[mid]})\n"
    end

    if arr[mid] == i
        if DEBUG_OUTPUT
            puts "found #{i} at #{mid}\n"
        end

        return mid
    elsif arr[mid] < i
        if DEBUG_OUTPUT
            puts "#{arr[mid]} is < #{i}, checking to the right\n"
        end

        result = chop_1(i, arr[mid+1 .. -1])

        if result == -1
            return result
        else
            return mid+1 + result
        end
    else
        if DEBUG_OUTPUT
            puts "#{arr[mid]} is > #{i}, checking to the left\n"
        end

        return chop_1(i, arr[0 .. mid - 1])
    end
end

# version 2
def chop_2(i, arr)
    puts "\nchop #{i}, #{arr.inspect}\n" if DEBUG_OUTPUT

    done = false
    found_position = 0

    while !done do
      if arr.length < 2
        done = true
        break;
      end

      mid = arr.length / 2

      if arr[mid] <= i then
        arr.shift(mid)
        found_position += mid
      else
        arr.pop(mid)
      end
    end

    if arr.pop == i then
      return found_position
    else
      return -1
    end
end
# version 3
def chop_3(i, arr)
    -1
end
# version 4
def chop_4(i, arr)
    -1
end
# version 5
def chop_5(i, arr)
    -1
end
