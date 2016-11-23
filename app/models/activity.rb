class Activity < ActiveRecord::Base
	# Validates the presence and the length of the name colummn
	validates :activity_name, presence: true, length: {minimum: 2, maximum: 25}

	# Validates the presence and the numericality of the allocated_money column
	validates :allocated_money, presence: true, numericality: {greater_than_or_equal_to: 0}
end