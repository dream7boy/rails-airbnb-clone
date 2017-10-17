class AddPriceToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :daily_price, :integer
  end
end
