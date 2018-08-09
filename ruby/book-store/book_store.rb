class BookStore
  def self.calculate_price(books)
    net = books.size * 8

    stacks = []

    books.each { |book|
      empty_slot_found = false
      stacks.each { |stack|
        if ! (stacks[stack].include?(book))
          stacks[stack].push book
          empty_slot_found = true
        end
      }
      if !empty_slot_found
        stacks.push [book]
      end
    }

    if books.uniq.size == 2
      net -= net * 0.05
    end
    if books.uniq.size == 3
      net -= net * 0.10
    end
    if books.uniq.size == 4
      net -= net * 0.20
    end
    if books.uniq.size == 5
      net -= net * 0.25
    end


    net
  end
end
