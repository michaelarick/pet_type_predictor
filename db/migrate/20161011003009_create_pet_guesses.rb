class CreatePetGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :pet_guesses do |t|
      t.float :height
      t.float :weight
      t.string :guessed_pet_type
      t.string :correct_pet_type

      t.timestamps
    end
  end
end
