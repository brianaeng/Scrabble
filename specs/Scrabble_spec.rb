# Scrabble_spec.rb - minitests file - Briana/Scrabble/specs/.

# Create a Spec file which corresponds to your Scrabble::Scoring class. This spec should contain one red test as a starting point (this test can be modified as your get further through the requirements).


require_relative 'Spec_helper'
require_relative '../lib/Scoring'

describe 'testing Scoring' do
  it 'must return correct score (Fixnum) for a given word (checking also for adding bonus)' do
    expect(Scrabble::Scoring.score("dog")).must_equal(5)
    expect(Scrabble::Scoring.score("highest")).must_equal(64)
  end

  it 'must return word with the highest score (String) from the @@array_of_words' do
    expect(Scrabble::Scoring.highest_score_from(["dog","highest", "cat"])).must_equal("highest")
  end

  it 'must return shortest word from the @@tie_array' do
    expect(Scrabble::Scoring.highest_score_from(["st","ouln", "dae"])).must_equal("dae")
  end

  it 'must return first word from the @@tie_array when both are the same length' do
    expect(Scrabble::Scoring.highest_score_from(["so","rate", "late"])).must_equal("rate")
  end

  it 'must return 7 lettered word from the @@tie_array' do
    expect(Scrabble::Scoring.highest_score_from(["last","qqqqqx", "aloudie"])).must_equal("aloudie")
  end

end
