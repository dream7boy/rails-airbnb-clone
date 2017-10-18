class Pet < ApplicationRecord
  # belongs_to :user
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :bookings, dependent: :destroy

  validates :name, :species, :description, presence: true
  validates :name, uniqueness: true

  # validates :species, inclusion: { in: %w(cat, dog) }
  scope :species, -> (species) { where species: species }
  scope :start_date, -> (start_date) { where start_date: start_date }
  scope :end_date, -> (end_date) { where end_date: end_date }
end
