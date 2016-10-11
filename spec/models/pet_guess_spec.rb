require "rails_helper"

describe 'PetGuess' do
  before do
    @guess = PetGuess.create(height: 71.75, weight: 205, pet_type: 'Cat')
  end

  it 'has a height and a weight and pet_type' do
    expect(@guess.height).to eq(71.75)
    expect(@guess.weight).to eq(205)
    expect(@guess.pet_type).to eq('Cat')
  end

  context '#pet_type' do
    it 'will return the pet type' do
      @guess.pet_type = 'Dog'
      expect(@guess.pet_type).to eq('Dog')
    end
    context 'when the pet_type has not been set' do
      it 'will return nil for the pet type' do
        guess = PetGuess.create(height: 123, weight: 456)
        expect(guess.pet_type).to be_nil
      end
    end
  end

  context 'guessing' do
    context 'without a guess strategy' do
      it 'makes no guesses' do
        expect(@guess.pet_type_guess).to be_nil
      end
    end

    context '#set_guess_strategy' do
      before do
        @catGuessStrategy = Class.new do
          def make_pet_type_guess(height, weight)
            'Cat'
          end
        end
      end
      before do
        @dogGuessStrategy = Class.new do
          def make_pet_type_guess(height, weight)
            'Dog'
          end
        end
      end
      it 'uses the passed-in guessing strategy to make a guess' do
        @guess.set_guess_strategy(@catGuessStrategy.new)
        expect(@guess.pet_type_guess).to eq('Cat')
        @guess.set_guess_strategy(@dogGuessStrategy.new)
        expect(@guess.pet_type_guess).to eq('Dog')
      end
    end
  end
end