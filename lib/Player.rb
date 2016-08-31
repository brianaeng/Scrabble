# Player.rb - Scoring class file - Briana/lib/.

# Create a Scrabble::Player class with a minimum of 11 specs. The only required paramter for instances of the class is the player's name. Instances of the class should repond to the following messages:
#
# #name: returns the value of the @name instance variable
# #plays: returns an Array of the words played by the player
# #play(word): Adds the input word to the plays Array
# Returns false if player has already won
# Returns the score of the word
# #total_score: Returns the sum of scores of played words
# #won?: If the player has over 100 points, returns true, otherwise returns false
# #highest_scoring_word: Returns the highest scoring played word
# #highest_word_score: Returns the highest_scoring_word score

require_relative '../Scrabble'
require_relative 'Scoring'

class Scrabble::Player < Scrabble::Scoring
  #extend Scrabble::Scoring#.highest_score_from
  # #name: returns the value of the @name instance variable
  attr_reader :name, :plays_array, :total_score_instance

  def initialize(name)
    @name = name
    # later maybe add error handeling for "" or Fixnum arguments
    @plays_array = []
  end

  # #play(word): Adds the input word to the plays Array
  def play(word)
    # Returns false if player has already won
    @plays_array.push(word)
    if won?
      return false
    end
    Scrabble::Scoring.score(word)
  end

  # #plays: returns an Array of the words played by the player
  def plays
    return @plays_array
  end

  # #total_score: Returns the sum of scores of played words
  def total_score
    Scrabble::Scoring.make_array_of_scores(@plays_array)
    @total_score_instance = return_array_of_scores.inject(0, :+)
  end

  # #won?: If the player has over 100 points, returns true, otherwise returns false
  def won?
    total_score
    #check to see total_score_instance > 100 - if it is, return true, else return false
    if @total_score_instance > 100
      return true
    else
      return false
    end
  end

  # #highest_scoring_word: Returns the highest scoring played word
  def highest_scoring_word
    #call the Scrabble::Scoring.highest_score_from(plays_array) and return the winning_word
  end

  # #highest_word_score: Returns the highest_scoring_word score
  def highest_word_score
    #call the Scrabble::Scoring.highest_score_from(plays_array) and return max_score
  end
end

# player0 = Scrabble::Player.new("nemo")
# player0.play("e")
# print player0.plays_array
# print player0.total_score_instance
