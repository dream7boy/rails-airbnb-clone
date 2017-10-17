class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :total_price
      t.integer :duration
      t.string :status
      # t.references :user, foreign_key: true
      t.references :booker, index: true, foreign_key: { to_table: :users }
      t.references :pet, foreign_key: true

      t.timestamps
    end
  end
end
