# Scrabble.rb - module main file - located at main dr = Briana/Scrabble/.

#  the entire project should be in a module called Scrabble


module Scrabble
  SCORE_HASH = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  } 
end
