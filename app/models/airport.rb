class Airport < ApplicationRecord
	validates :code, presence: true, length: { is: 3 }
end
