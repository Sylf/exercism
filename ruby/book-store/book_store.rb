class BookStore
  def self.calculate_price(books)
    stacks = []

    books.each { |book|
      stack_found = 0
      if stacks.size == 0
        stacks.push([book])
        next
      end
      stacks.each_with_index { |stack,idx|
        if !stacks[idx].include?(book)
          stacks[idx].push book if stack_found != 1
          stack_found = 1
          next
        end
      }
      next if stack_found == 1
      stacks.push ([book])
    }

    while stacks.any? {|stack| stack.size == 5} do
      stack_of_five = nil
      stack_of_three = nil
      stacks.each_with_index { |stack, idx|
          stack_of_five = idx if stack.size==5
          stack_of_three = idx if stack.size==3
      }

      if !stack_of_five.nil? && !stack_of_three.nil?
        stack = stacks[stack_of_five]

        stack.each_with_index { |book, idx|
          if !stacks[stack_of_three].include?(book)
            stacks[stack_of_three].push(book)
            stacks[stack_of_five].delete_at(idx)
          end
        }
      else
        break
      end
    end

    net = 0

    stacks.each { |stack|
      subnet = stack.size * 8

      if stack.uniq.size == 2
        subnet -= subnet * 0.05
      end
      if stack.uniq.size == 3
        subnet -= subnet * 0.10
      end
      if stack.uniq.size == 4
        subnet -= subnet * 0.20
      end
      if stack.uniq.size == 5
        subnet -= subnet * 0.25
      end

      net += subnet
    }

    net
  end
end

module BookKeeping
  VERSION=0
end
