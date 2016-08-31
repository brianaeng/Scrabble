# Scrabble_spec.rb - minitests file - Briana/Scrabble/specs/.

# Create a Spec file which corresponds to your Scrabble::Scoring class. This spec should contain one red test as a starting point (this test can be modified as your get further through the requirements).


require_relative 'Spec_helper'
require_relative '../lib/Scoring'
require_relative '../lib/Player'
# require_relative '../testing'

#Wave 1
describe 'testing Scoring class' do
  it 'must return correct score (Fixnum) for a given word (checking also for adding bonus)' do
    expect(Scrabble::Scoring.score("dog")).must_equal(5)
  end

  it 'must return correct score (Fixnum) for a given word (checking also for adding bonus)' do
    expect(Scrabble::Scoring.score("highest")).must_equal(64)
  end

  # it 'must return word with the highest score (String) from the @@array_of_words & check for case sensetivity' do
  #   expect(Scrabble::Scoring.highest_score_from(["Dog","Highest", "Cat"])).must_equal("highest")
  # end

  # it 'must return shortest word from the @@tie_array' do
  #   expect(Scrabble::Scoring.highest_score_from(["don","f", "ae"])).must_equal("f")
  # end

  # it 'must return shortest word from the @@tie_array' do
  #   expect(Scrabble::Scoring.highest_score_from(["st","ouln", "dae"])).must_equal("dae")
  # end
  #
  # it 'must return first word from the @@tie_array when both are the same length' do
  #   expect(Scrabble::Scoring.highest_score_from(["y","w", "d"])).must_equal("y")
  # end

  it 'must return first word from the @@tie_array when both are the same length' do
    expect(Scrabble::Scoring.highest_score_from(["so","rate", "late"])).must_equal("rate")
  end


  # it 'must return 7 lettered word from the @@tie_array' do
  #   expect(Scrabble::Scoring.highest_score_from(["last","qqqqqx", "aloudie"])).must_equal("aloudie")
  # end

end

#Wave 2

describe 'testing Player class' do
  it 'must return the name argument when called through the attr_reader' do
    expect(Scrabble::Player.new("nameish").name).must_equal("nameish")
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

  it 'must return the plays_array when plays method is called' do
    player1 = Scrabble::Player.new("nameish")
    player1.play("d") # = Fixnum
    player1.play("youbetterwork")
    expect(player1.plays).must_equal(["d", "youbetterwork"])
  end
end
