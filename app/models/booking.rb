class Booking < ApplicationRecord
  # belongs_to :user
  belongs_to :booker, class_name: "User", foreign_key: "booker_id"
  belongs_to :pet
  validates :total_price, :duration, :status, presence: true
end
