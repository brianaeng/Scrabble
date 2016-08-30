# Scrabble.rb - Scoring class file - Briana/lib/.

# Create a Scrabble::Scoring class which contains some sort of data structure to store the individual letter scores listed below - would that be under initializing of that class?

require_relative '../Scrabble'

class Scrabble::Scoring
  def self.score(word)
    # @word_array =  takes a (string word argument).upcase.to_a
    # iterate through the word_array and match each array item to the SCORE_HASH.keys and taking the key's value and adding it to @total_score.
    bonus
    # create @wordscore_array and push into @@array_of_words
  end

  def bonus
    # check if the word deserves a bonus (50 points)
    # if @word_array.legnth == 7
    # @total_score += 50
  end

  def self.highest_score_from(array_of_words)
    # search for @@array_of_words[word][max_value]
    # check if there are multiple instances of the max value. true = tie.
      # retrieve words that have a tie between them.
      # compare length:
        # if length == 7 => winning word.
        # else take length.min
          # if there is a tie between both the score and the length - it will take the first word - which means we covered the requirement.
    # return @@array_of_words[word]
  end

end
