# bottle class
class Bottles
  def song
    verses(99, 0)
  end

  def verses(number_at_start, number_at_end)
    number_at_start.downto(number_at_end).map { |number| verse(number) }.join('\\n')
  end

  def verse(number)
    bottle_number = BottleNumber.for(number)

    "#{bottle_number} of beer on the wall, #{bottle_number} of beer.\\n".capitalize +
      "#{bottle_number.action}, #{bottle_number.successor} of beer on the wall.\\n"
  end
end

# bottle number class
class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def self.for(number)
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    when 6
      BottleNumber6
    else
      BottleNumber
    end.new(number)
  end

  def to_s
    "#{quantity} #{container}"
  end

  def container
    'bottles'
  end

  def pronoun
    'one'
  end

  def quantity
    number.to_s
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def successor
    BottleNumber.for(number - 1)
  end
end

# bottle number 0
class BottleNumber0 < BottleNumber
  def quantity
    'no more'
  end

  def action
    'Go to the store and buy some more'
  end

  def successor
    BottleNumber.for(99)
  end
end

# bottle number 1
class BottleNumber1 < BottleNumber
  def container
    'bottle'
  end

  def pronoun
    'it'
  end
end

# bottle number 6
class BottleNumber6 < BottleNumber
  def container
    'six-pack'
  end

  def quantity
    1
  end
end
