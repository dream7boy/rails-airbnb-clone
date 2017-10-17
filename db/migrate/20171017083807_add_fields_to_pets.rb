class AddFieldsToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :age, :integer
    add_column :pets, :gender, :string
    add_column :pets, :personality, :string
  end
end
