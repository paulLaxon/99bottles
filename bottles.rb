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
      "#{bottles} bottle of beer on the wall, " \
      "#{bottles} bottle of beer.\\n" \
      'Take one down and pass it around, no more bottles of beer on the wall.\\n'
    when 2
      "#{bottles} bottles of beer on the wall, " \
      "#{bottles} bottles of beer.\\n" \
      "Take one down and pass it around, #{bottles - 1} bottle of beer on the wall.\\n"
    else
      "#{bottles} bottles of beer on the wall, " \
      "#{bottles} bottles of beer.\\n" \
      "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.\\n"
    end
  end
end
