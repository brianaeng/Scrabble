# Scoring.rb - Scoring class file - Briana/lib/.

# Create a Scrabble::Scoring class which contains some sort of data structure to store the individual letter scores listed below - would that be under initializing of that class?

require_relative '../Scrabble'
# Scrabble.rb - Scoring class file - Briana/lib/.

# Create a Scrabble::Scoring class which contains some sort of data structure to store the individual letter scores listed below - would that be under initializing of that class?

#  for testing: require_relative 'Scrabble'

class Scrabble::Scoring
  attr_accessor :total_score, :word_array, :array_of_words, :wordscore_array

  def self.score(word)
    # @@word_array =  takes a (string word argument).upcase.to_a
    @word_array = word.downcase.split("")
    # iterate through the word_array and match each array item to the SCORE_HASH.keys and taking the key's value and adding it to @total_score.
    @total_score = 0
    @word_array.each do |letter|
      Scrabble::SCORE_HASH.each do |key, value|
        if key.include? letter
          @total_score += value
        end
      end
    end

    #add 50 points bonus for 7 letter words
    if @word_array.length == 7
      @total_score += 50
    end
    return @total_score
  end

  def self.highest_score_from(array_of_words)
    @@array_of_scores = []
    self.make_array_of_scores(array_of_words)

    # finding the max score in array_of_scores;
    # finding the max score index;
    # finding the corresponding word at the same index in the array_of_words:
    max_score = @@array_of_scores.max
    index_of_max_score = @@array_of_scores.index(max_score)
    winning_word = @array_of_words[index_of_max_score]
    # # check the # of times max value appears in array_of_scores (for potential draw):
    num_of_winning_words = @@array_of_scores.count(max_score)
    # single winning_word:
    if num_of_winning_words == 1
      winning_word
      # draw:
    else
      @tie_array = []
      @@array_of_scores.length.times do |i|
        if @@array_of_scores[i] == max_score
          @tie_array.push(@array_of_words[i])
        end
      end
      if @tie_array.max_by(&:length).length == 7
        return @tie_array.max_by(&:length)
      else
        return @tie_array.min_by(&:length)
      end
    end # of it
  end # of def

  def self.make_array_of_scores(array_of_words)
    @array_of_words = array_of_words.map(&:downcase)

    @array_of_words.each do |word|
    score_per_word = Scrabble::Scoring.score(word)
    # create @wordscore_array and push into array_of_words
    @@array_of_scores.push(score_per_word)
    end
  end

  def return_array_of_scores
    return @@array_of_scores
  end

end # of class

# print Scrabble::Scoring.highest_score_from(["testing", "test", "qqqqqqq"])
# print Scrabble::Scoring.score("quick")
