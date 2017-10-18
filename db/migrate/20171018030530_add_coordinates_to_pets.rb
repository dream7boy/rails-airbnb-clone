class AddCoordinatesToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :location, :string
    add_column :pets, :latitude, :float
    add_column :pets, :longitude, :float
  end
end
