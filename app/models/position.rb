# Model for the positions
class Position < ActiveRecord::Base
	# Validates the presence, the uniqueness and the length of the name colummn
	validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 2, maximum: 25}

	# Validates the presence and the numericality of the allocated_money column
	validates :allocated_money, presence: true, numericality: {greater_than_or_equal_to: 0}
end