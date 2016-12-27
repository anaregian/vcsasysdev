# Model for activities table
class Activity < ActiveRecord::Base
	# One to many association with positions
	belongs_to :position
	# One to many association with component
	has_many :components, :dependent => :destroy
	# Validates the presence and the length of the name colummn
	validates :activity_name, presence: true, length: {minimum: 2, maximum: 25}
	# Validates the presence and the numericality of the allocated_money column
	validates :allocated_money, presence: true, numericality: {greater_than_or_equal_to: 0}
	# Ensures the presence of the position_id in each activity
	validates :position_id, presence: true

	def self.search_act(search)
		if connection.adapter_name == 'PostgreSQL'
			if search
				where(["activity_name ILIKE ?", "%#{search}%"])
			else
				all
			end
		else
			if search
				where(["activity_name LIKE ?", "%#{search}%"])
			else
				all
			end
		end
	end

	def self.search_comp(search)
		if connection.adapter_name == 'PostgreSQL'
			if search
				where(["component_name ILIKE ?", "%#{search}%"])
			else
				all
			end
		else
			if search
				where(["component_name LIKE ?", "%#{search}%"])
			else
				all
			end
		end
	end
end