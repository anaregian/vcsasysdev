class Component < ActiveRecord::Base
	# One to many association with activity
	belongs_to :activity, optional: true
	# Validates the presence and the length of the name colummn
	validates :component_name, presence: true, length: {minimum: 2, maximum: 25}
	# Validates the presence and the numericality of the allocated_money column
	validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}

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
