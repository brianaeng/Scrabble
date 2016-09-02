require_relative '../Scrabble'

class Scrabble::Scoring
  attr_accessor :total_score, :word_array, :array_of_words, :wordscore_array

  #Scores a word and adds a bonus if the word is longer than 7 letters
  def self.score(word)
    word_array = word.downcase.split("")

    #Total score keeps the word's score
    total_score = 0
    word_array.each do |letter|
      Scrabble::SCORE_HASH.each do |key, value|
        if key.include? letter
          total_score += value
        end
      end
    end

    #Adds the 50 point bonus for 7 letter words
    if word_array.length == 7
      total_score += 50
    end

    return total_score

  end

  #Returns the highest score from an array of words
  def self.highest_score_from(array_of_words)
    array_of_scores = []

    array_of_words = array_of_words.map(&:downcase)

    #Breaks the array down to each word, scores the word, & stores the score in the scores array
    array_of_words.each do |word|
      score_per_word = Scrabble::Scoring.score(word)
      array_of_scores.push(score_per_word)
    end

    #Finds the max score in array_of_scores
    max_score = array_of_scores.max

    #Finds the max score index
    index_of_max_score = array_of_scores.index(max_score)

    #Finds the corresponding word at the same index in the array_of_words
    winning_word = array_of_words[index_of_max_score]

    #Checks for how many times the max value appears in the scores array (to look for ties)
    num_of_winning_words = array_of_scores.count(max_score)

    tie_array = []

    #If there's a single winning word, it returns that word. If there's more than one then check for a 7-letter word or the shortest word
    if num_of_winning_words == 1
      winning_word
    else
      (array_of_scores.length).times do |i|
        if array_of_scores[i] == max_score
          tie_array.push(array_of_words[i])
        end
      end
      if tie_array.max_by(&:length).length == 7
        return tie_array.max_by(&:length)
      else
        return tie_array.min_by(&:length)
      end
    end
  end
end

# print Scrabble::Scoring.highest_score_from(["test", "z", "q"])
# puts
# print Scrabble::Scoring.highest_score_from(["testing", "test", "qqqqqqq"])
# puts
# print Scrabble::Scoring.score("quick")
