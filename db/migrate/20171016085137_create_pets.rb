class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.text :description
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
