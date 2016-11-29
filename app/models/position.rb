# Model for the positions
class Position < ActiveRecord::Base
	# One to many association with activities
	has_many :activities, :dependent => :destroy
	# Validates the presence, the uniqueness and the length of the name colummn
	validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 2, maximum: 25}
	# Validates the presence and the numericality of the allocated_money column
	validates :allocated_money, presence: true, numericality: {greater_than_or_equal_to: 0}

	def self.search_pos(search)
		if search
			where(["name LIKE ?", "%#{search}%"])
		else
			all
		end
	end
end