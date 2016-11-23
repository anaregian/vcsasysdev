class Component < ActiveRecord::Base
	# One to many association with activity
	belongs_to :activity
	# Validates the presence and the length of the name colummn
	validates :component_name, presence: true, length: {minimum: 2, maximum: 25}
	# Validates the presence and the numericality of the allocated_money column
	validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
	# Ensures the presence of the position_id in each activity
	validates :activity_id, presence: true
end
