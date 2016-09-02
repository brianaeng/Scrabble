require_relative '../Scrabble'
require_relative 'Scoring'
require_relative 'TileBag'

class Scrabble::Player
  attr_reader :name, :plays_array, :total_score_instance, :players_tilebag, :tiles_array

  def initialize(name)
    @name = name
    @scores = []
    @plays_array = []
    @tiles_array = []
  end

  #Adds the input word to the plays array and score to scores array (as long as game is not already won)
  def play(word)
    #Returns false if player has already won
    if won?
      return false
    else
      @plays_array.push(word)
      score = Scrabble::Scoring.score(word)
      @scores.push(score)
      return score
    end
  end

  #Returns an Array of the words played by the player
  def plays
    return @plays_array
  end

  #Returns the sum of scores of played words
  def total_score
    @total_score_instance = @scores.inject(0, :+)
  end

  #If the player has over 100 points, returns true, otherwise returns false
  def won?
    total_score
    if @total_score_instance > 100
      return true
    else
      return false
    end
  end

  #Returns the highest scoring played word
  def highest_scoring_word
     Scrabble::Scoring.highest_score_from(@plays_array)
  end

  #Returns the highest scoring word's score
  def highest_word_score
    Scrabble::Scoring.score(Scrabble::Scoring.highest_score_from(@plays_array))
  end

  #Returns the Player's drawn tiles
  def tiles
    return @tiles_array
  end

  #Pulls 7 tiles for the Player's tiles array
  def draw_tiles(tile_bag)
    counter = 7

    until @tiles_array.length == 7
      random_number = rand(1..counter)
      drawn_tiles = tile_bag.draw_tiles(random_number)
      @tiles_array += drawn_tiles
      counter -= random_number
    end
  end

end

# player0 = Scrabble::Player.new("nemo")
# players_tilebag = Scrabble::TileBag.new
# print player0.draw_tiles(players_tilebag)
# puts
# print player0.tiles

# player0 = Scrabble::Player.new("nemo")
# player0.play("eat") #Score of this is 3
# puts
# player0.play("quick") #Score of this is 20
# puts
# player0.play("test") #Score of this is 4
# puts
# puts player0.total_score
# puts player0.highest_scoring_word
# puts player0.highest_word_score

# print player0.plays_array
# print player0.highest_scoring_word
# print player0.highest_word_score
