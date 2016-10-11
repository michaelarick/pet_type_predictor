require "rails_helper"

describe 'PetGuess' do
  before do
    @guess = PetGuess.create(height: 71.75, weight: 205)
  end

  it 'has a height and a weight' do
    expect(@guess.height).to eq(71.75)
    expect(@guess.weight).to eq(205)
  end
end