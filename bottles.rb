# bottle verse class
class BottleVerse
  def song
    lyrics(99, 0)
  end

  def lyrics(bottles_at_start, bottles_at_end)
    bottles_at_start.downto(bottles_at_end).map { |bottles| verse(bottles) }.join('\\n')
  end

  def verse(bottles)
    case bottles
    when 0
      'No more bottles of beer on the wall, no more bottles of beer.\n' \
      'Go to the store and buy some more, 99 bottles of beer on the wall.\n'
    when 1
      "#{bottles} #{container(bottles)} of beer on the wall, " \
      "#{bottles} #{container(bottles)} of beer.\\n" \
      'Take one down and pass it around, no more bottles of beer on the wall.\\n'
    else
      "#{bottles} #{container(bottles)} of beer on the wall, " \
      "#{bottles} #{container(bottles)} of beer.\\n" \
      "Take one down and pass it around, #{bottles - 1} #{container(bottles - 1)} of beer on the wall.\\n"
    end
  end

  def container(number)
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end
end
