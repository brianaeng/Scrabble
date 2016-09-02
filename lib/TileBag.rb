require_relative '../Scrabble'

class Scrabble::TileBag
  attr_reader :tiles

  def initialize
    @tiles = Scrabble::TILEBAG
  end

  #Draws a certain number of random tiles, deletes them from the tilebag, and returns drawn tiles
  def draw_tiles(num)
    random_tiles = @tiles.sample(num)
    random_tiles.each do |letter|
      @tiles.slice!(@tiles.index(letter))
    end
    return random_tiles
  end

  #Displays the tiles remaining (unused) in a player's tilebag
  def tiles_remaining
    return @tiles
  end

end

# bag1 = Scrabble::TileBag.new
# print bag1.draw_tiles(3)
# print bag1.tiles
