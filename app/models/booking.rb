class Booking < ApplicationRecord
  has_and_belongs_to_many :passengers
  belongs_to :flight
	validates :billing_address, presence: true
	validates :nbr_passengers, presence: true
	validates :flight_id, presence: true


  accepts_nested_attributes_for :passengers
end
