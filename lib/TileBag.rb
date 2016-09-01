require_relative '../Scrabble'
require_relative 'Scoring'
require_relative 'Player'

class TileBag
  attr_reader :tiles
  def initialize
    @tiles = []
    @tiles += (["a"] * 9) + (["b"] * 2) + (["c"] * 2) + (["d"] * 4) + (["e"] * 12) + (["f"] * 2) + (["g"] * 3) + (["h"] * 2) + (["i"] * 9) + (["j"] * 1) + (["k"] * 1) + (["l"] * 4) + (["m"] * 2) + (["n"] * 6) + (["o"] * 8) + (["p"] * 2) + (["q"] * 1) + (["r"] * 6) + (["s"] * 4) + (["t"] * 6) + (["u"] * 4) + (["v"] * 2) + (["w"] * 2) + (["x"] * 1) + (["y"] * 2) + (["z"] * 1)
  end

  def draw_tiles(num)
    # @tiles.delete(@tiles.sample)
    random_tiles = @tiles.sample(num)
    random_tiles.each do |letter|
      @tiles.slice!(@tiles.index(letter))
    end
    # random_tiles = @tiles.sample(num)
    # # @tiles -= random_tiles
    return random_tiles
  end
end


bag1 = TileBag.new
print bag1.draw_tiles(3)
print bag1.tiles
