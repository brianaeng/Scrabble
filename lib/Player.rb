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
  attr_reader :name

  def initialize(name)
    @name = name
    # if @name == "" #|| @name == Fixnum
    #   raise ArgumentError.new("Invalid name") #{|name| (name == "") || (name == Fixnum)}
    # end
  end

  # #play(word): Adds the input word to the plays Array
  def play(word)
    #adds word to plays_array
    # Returns false if player has already won
    # Returns the score of the word (calling self.score method)
  end

  # #plays: returns an Array of the words played by the player
  def plays
    #returns plays_array
  end

  # #total_score: Returns the sum of scores of played words
  def total_score
    #total_score_instance = play_array.sum
  end

  # #won?: If the player has over 100 points, returns true, otherwise returns false
  def won?
    #check to see total_score_instance > 100 - if it is, return true, else return false
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

print Scrabble::Player.new("test")
