class OcrNumbers

  def self.convert(input)
    raise ArgumentError unless input.split("\n").length % 4 == 0
    raise ArgumentError unless input.split("\n").all? {|sub| sub.length % 3 == 0 }

    ocr_string(input)
  end

  def self.ocr_string(input)
    lines = input.split("\n")
    lines.map!(&:chars)
    output = []

    (0..(lines.size-1)).step(4) do |i|
      sub_number = []
      while lines[i].size > 0 do
        sub_number.push(lines[i].shift(3) + lines[i+1].shift(3) + lines[i+2].shift(3) )
      end
      output.push (
        sub_number.reduce("") do |memo, item|
          memo += ocr_digit(item.join)
        end
      )
    end

    output.join(',')
  end

  def self.ocr_digit(input_digit)

    {
      " _ " +
      "| |" +
      "|_|" => "0",

      "   " +
      "  |" +
      "  |" => "1",

      " _ " +
      " _|" +
      "|_ " => "2",

      " _ " +
      " _|" +
      " _|" => "3",

      "   " +
      "|_|" +
      "  |" => "4",

      " _ " +
      "|_ " +
      " _|" => "5",

      " _ " +
      "|_ " +
      "|_|" => "6",

      " _ " +
      "  |" +
      "  |" => "7",

      " _ " +
      "|_|" +
      "|_|" => "8",

      " _ " +
      "|_|" +
      " _|" => "9",

    }[input_digit] || "?"
  end


end


