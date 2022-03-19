# bottle class
class Bottles
  def song
    verses(99, 0)
  end

  def verses(number_at_start, number_at_end)
    number_at_start.downto(number_at_end).map { |number| verse(number) }.join('\\n')
  end

  def verse(number)
    "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " \
    "#{quantity(number)} #{container(number)} of beer.\\n" \
    "#{action(number)}, " \
    "#{quantity(successor(number))} #{container(successor(number))} of beer on the wall.\\n"
  end

  private

  def container(number)
    BottleNumber.new(number).container
  end

  def pronoun(number)
    BottleNumber.new(number).pronoun
  end

  def quantity(number)
    BottleNumber.new(number).quantity
  end

  def action(number)
    BottleNumber.new(number).action
  end

  def successor(number)
    BottleNumber.new(number).successor
  end
end

# bottle number class
class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def container
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun
    if number == 1
      'it'
    else
      'one'
    end
  end

  def quantity
    if number.zero?
      'no more'
    else
      number.to_s
    end
  end

  def action
    if number.zero?
      'Go to the store and buy some more'
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def successor
    if number.zero?
      99
    else
      number - 1
    end
  end
end
