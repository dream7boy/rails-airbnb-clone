class AddDatesToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :start_date, :date
    add_column :pets, :end_date, :date
  end
end
