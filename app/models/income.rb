# Model for the incomes
class Income < ActiveRecord::Base
	# Validates the presence and the numericality of the allocated_money column
	validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0}
	# Validates the presencr of the date column
	validates :date, presence: true
end