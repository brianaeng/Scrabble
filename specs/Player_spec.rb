require_relative 'Spec_helper'
# require_relative '../lib/Scoring'
require_relative '../lib/Player'

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
  # it 'must return error for an empty string passed for name' do
  #   expect(Scrabble::Player.name("")).must_equal(ArgumentError)
  # end
  # it 'must return error when name is not a string' do
  #   expect(Scrabble::Player.name(5)).must_equal(ArgumentError)
  # end
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
