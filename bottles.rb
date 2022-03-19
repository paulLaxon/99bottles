# bottle verse class
class BottleVerse
  def song
    lyrics(99, 0)
  end

  def lyrics(bottles_at_start, bottles_at_end)
    bottles_at_start.downto(bottles_at_end).map { |bottles| verse(bottles) }.join('\\n')
  end

  def verse(bottles)
    "#{quantity(bottles).capitalize} #{container(bottles)} of beer on the wall, #{quantity(bottles)} #{container(bottles)} of beer.\\n" \
    "#{action(bottles)}, #{quantity(successor(bottles))} #{container(successor(bottles))} of beer on the wall.\\n"
  end

  def container(number)
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun(number)
    if number == 1
      'it'
    else
      'one'
    end
  end

  def quantity(number)
    if number.zero?
      'no more'
    else
      number.to_s
    end
  end

  def action(number)
    if number.zero?
      'Go to the store and buy some more'
    else
      "Take #{pronoun(number)} down and pass it around"
    end
  end

  def successor(number)
    if number.zero?
      99
    else
      number - 1
    end
  end
end
