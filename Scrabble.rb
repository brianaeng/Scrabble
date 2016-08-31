# Scrabble.rb - module main file - located at main dr = Briana/Scrabble/.

#  the entire project should be in a module called Scrabble


module Scrabble
  SCORE_HASH = {
    %w(a e i o u l n r s t) => 1,
    %w(d g ) => 2,
    %w(b c m p) => 3,
    %w(f h v w y) => 4,
    %w(k) => 5,
    %w(j x) => 8,
    %w(q z) => 10
    }
end
