# Model for the positions
class Position < ActiveRecord::Base
	# One to many association with activities
	has_many :activities, :dependent => :destroy
	# Validates the presence, the uniqueness and the length of the name colummn
	validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 2, maximum: 25}
	# Validates the presence and the numericality of the allocated_money column
	validates :allocated_money, presence: true, numericality: {greater_than_or_equal_to: 0}

	def self.search_pos(search)
		if connection.adapter_name == 'PostgreSQL'
			if search
				where(["name ILIKE ?", "%#{search}%"])
			else
				all
			end
		else
			if search
				where(["name LIKE ?", "%#{search}%"])
			else
				all
			end
		end
	end

	def self.search_act(search)
		if connection.adapter_name == 'PostgreSQL'
			if search
				where(['activity_name ILIKE ?', "%#{search}%"])
			else
				all
			end
		else
  			if search
   				where(['activity_name LIKE ?', "%#{search}%"])
  			else
    			all
  			end
  		end
  	end
end
