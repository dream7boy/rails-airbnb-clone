class Booking < ApplicationRecord
  # belongs_to :user
  belongs_to :booker, class_name: "User", foreign_key: "booker_id"
  belongs_to :pet

  validates :total_price, :duration, :status, :start_date, :end_date, presence: true
  validates :total_price, numericality: { only_integer: true, greater_than: 0 } 
end
