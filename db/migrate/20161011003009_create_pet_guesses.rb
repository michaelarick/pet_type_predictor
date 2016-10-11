class CreatePetGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :pet_guesses do |t|
      t.float :height
      t.float :weight
      t.string :pet_type

      t.timestamps
    end
  end
end
