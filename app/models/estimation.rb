# Model for the estimations
class Estimation < ActiveRecord::Base
	# Validates the presence and the numericality of the estimate column
	validates :estimate, presence: true, numericality: {greater_than_or_equal_to: 0}
end