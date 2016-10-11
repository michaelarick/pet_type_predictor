class PetGuess < ApplicationRecord
  attr_accessor :pet_type

  def set_guess_strategy(strategy)
    @guess_strategy = strategy
  end

  def pet_type_guess
    return nil if @guess_strategy.nil?
    @pet_type_guess = @guess_strategy.make_pet_type_guess(@height, @weight)
  end
end
