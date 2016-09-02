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

    TILES = (["a"] * 9) + (["b"] * 2) + (["c"] * 2) + (["d"] * 4) + (["e"] * 12) + (["f"] * 2) + (["g"] * 3) + (["h"] * 2) + (["i"] * 9) + (["j"] * 1) + (["k"] * 1) + (["l"] * 4) + (["m"] * 2) + (["n"] * 6) + (["o"] * 8) + (["p"] * 2) + (["q"] * 1) + (["r"] * 6) + (["s"] * 4) + (["t"] * 6) + (["u"] * 4) + (["v"] * 2) + (["w"] * 2) + (["x"] * 1) + (["y"] * 2) + (["z"] * 1)
end
