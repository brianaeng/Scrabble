# Scrabble.rb - Scoring class file - Briana/lib/.

# Create a Scrabble::Scoring class which contains some sort of data structure to store the individual letter scores listed below - would that be under initializing of that class?

require_relative '../Scrabble'

class Scrabble::Scoring
  attr_accessor :total_score, :word_array, :array_of_words, :wordscore_array

  SCORE_HASH = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
    }

  def self.score(word)
    # @word_array =  takes a (string word argument).upcase.to_a
    @@word_array = word.upcase.split("")
    # iterate through the word_array and match each array item to the SCORE_HASH.keys and taking the key's value and adding it to @total_score.
    total_score = 0
    @@word_array.each do |letter|
      SCORE_HASH.each do |key, value|
        if key.include? letter
          total_score += value
        end
      end
    # create @wordscore_array and push into @@array_of_words
    end

    #add 50 points bonus for 7 letter words
    if @@word_array.length == 7
      total_score += 50
    end

    return total_score
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

puts Scrabble::Scoring.score("dog")
puts Scrabble::Scoring.score("highest")
# Scrabble::Scoring.highest_score_from(["test", "testing", "highest"])
