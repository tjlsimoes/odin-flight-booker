class Passenger < ApplicationRecord
  has_and_belongs_to_many :bookings

	validates :name, presence: true
	validates :email, presence: true
end
