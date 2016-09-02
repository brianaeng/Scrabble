# Scrabble_spec.rb - minitests file - Briana/Scrabble/specs/.

# Create a Spec file which corresponds to your Scrabble::Scoring class. This spec should contain one red test as a starting point (this test can be modified as your get further through the requirements).


require_relative 'Spec_helper'
require_relative '../lib/Scoring'
require_relative '../lib/Player'
require_relative '../lib/TileBag'

#Wave 1 - Scoring
describe 'testing Scoring class' do
  it 'must return correct score (Fixnum) for a given word (checking also for adding bonus)' do
    expect(Scrabble::Scoring.score("dog")).must_equal(5)
  end

  it 'must return correct score (Fixnum) for a given word (checking also for adding bonus)' do
    expect(Scrabble::Scoring.score("highest")).must_equal(64)
  end

  it 'must return correct score (Fixnum) for a given word (checking also for adding bonus)' do
    expect(Scrabble::Scoring.score("testing")).must_equal(58)
  end

  it 'must return shortest word from the @@tie_array' do
    expect(Scrabble::Scoring.highest_score_from(["don","f", "ae"])).must_equal("f")
  end

  it 'must return highest scoring word' do
    expect(Scrabble::Scoring.highest_score_from(["muzzle","quick", "ember"])).must_equal("muzzle")
  end

  it 'must return first word from the @@tie_array when both are the same length' do
    expect(Scrabble::Scoring.highest_score_from(["y","w", "d"])).must_equal("y")
  end

  it 'must return first word from the @@tie_array when both are the same length' do
    expect(Scrabble::Scoring.highest_score_from(["so","rate", "late"])).must_equal("rate")
  end

  it 'must return 7 lettered word from the @@tie_array' do
    expect(Scrabble::Scoring.highest_score_from(["last","qqqqqx", "aloudie"])).must_equal("aloudie")
  end

end

#Wave 2 - Player

describe 'testing Player class' do
  it 'must return the name argument when called through the attr_reader' do
    expect(Scrabble::Player.new("nameish").name).must_equal("nameish")
    expect(Scrabble::Player.new("test").name).must_equal("test")
  end

  it 'must return error when less than one argument is passed for name' do
    expect(proc {Scrabble::Player.new()}).must_raise ArgumentError
  end

  it 'must return error when more than one argument is passed for name' do
    expect(proc {Scrabble::Player.new("test1", "test2")}).must_raise ArgumentError
  end

  it 'must return the score of the players\' word' do
    player0 = Scrabble::Player.new("nemo")
    expect(player0.play("d")).must_equal(2)
  end

  it 'must return the score of the players\' word' do
    player0 = Scrabble::Player.new("test3")
    expect(player0.play("q")).must_equal(10)
  end

  it 'must return the plays_array when plays method is called' do
    player1 = Scrabble::Player.new("nameish")
    player1.play("d") # = Fixnum
    player1.play("youbett")
    expect(player1.plays).must_equal(["d", "youbett"])
  end

  it 'must return the highest word score when highest_word_score method is called' do
    player1 = Scrabble::Player.new("nameish")
    player1.play("d") # = Fixnum
    player1.play("youbett")
    expect(player1.highest_word_score).must_equal(62)
  end

  it 'must return the highest scoring word when highest_scoring_word method is called' do
    player1 = Scrabble::Player.new("nameish")
    player1.play("d") # = Fixnum
    player1.play("youbett")
    expect(player1.highest_scoring_word).must_equal("youbett")
  end

  it 'must return the highest word score when highest_word_score method is called' do
    player1 = Scrabble::Player.new("nameish")
    player1.play("d") # = Fixnum
    player1.play("youbett")
    expect(player1.total_score).must_equal(64)
  end

  it 'must return the highest word score when highest_word_score method is called' do
    player1 = Scrabble::Player.new("nameish")
    player1.play("youbett")
    player1.play("youbett")
    expect(player1.play("youbett")).must_equal(false)
  end

  it 'must return the right number of tiles when draw tiles is called' do
    player0 = Scrabble::Player.new("nemo")
    players_tilebag = Scrabble::TileBag.new
    player0.draw_tiles(players_tilebag)
    expect((player0.tiles).length).must_equal(7)
  end

  it 'must return the player tiles array when draw tiles is called' do
    player0 = Scrabble::Player.new("nemo")
    players_tilebag = Scrabble::TileBag.new
    player0.draw_tiles(players_tilebag)
    expect(player0.tiles).must_equal(player0.tiles_array)
  end

end

# Wave 3 - TileBag

describe 'testing TileBag class' do
  it 'must return correct number of randomized tiles for a given number of tiles' do
    draw1 = Scrabble::TileBag.new
    expect((draw1.draw_tiles(4)).length).must_equal(4)
  end

  it 'must return correct number of randomized tiles for a given number of tiles' do
    draw1 = Scrabble::TileBag.new
    expect((draw1.draw_tiles(0)).length).must_equal(0)
  end

  it 'must return correct array of tiles left after drawing random tiles' do
    draw1 = Scrabble::TileBag.new
    draw1.draw_tiles(4)
    expect(draw1.tiles_remaining).must_equal(draw1.tiles)
  end

  it 'must return correct array of tiles left after drawing random tiles' do
    draw1 = Scrabble::TileBag.new
    draw1.draw_tiles(4)
    draw1.draw_tiles(3)
    expect(draw1.tiles_remaining).must_equal(draw1.tiles)
  end

  it 'must return correct class after creating a TileBag instance' do
    draw1 = Scrabble::TileBag.new
    expect(draw1.class).must_equal(Scrabble::TileBag)
  end

end
