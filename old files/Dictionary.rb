# require_relative 'Player'

class Scrabble::Dictionary

  def self.validate_word(word)
    word = word.downcase

    File.open("en.txt", "r") do |file|
      file.each do |line|
        if line.strip.to_s == word
          return true
        else
          break
        end
      end
    end

  end

end

#From Player class
# def play(word)
#   #Returns false if player has already won
#   if won?
#     return false
#   else
#     if (Scrabble::Dictionary.validate_word(word)) == true
#       @plays_array.push(word)
#       score = Scrabble::Scoring.score(word)
#       @scores.push(score)
#       return score
#     else
#       print "problem"
#     end
#   end
# end
