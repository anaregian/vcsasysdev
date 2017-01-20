class User < ActiveRecord::Base

	before_save {|user| user.email = user.email.downcase}

	validates :username, presence: true, 
		uniqueness: {case_sensitive: false}, 
		length: {minimum: 3, maximum: 25}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :email, presence: true,
		length: {maximum: 100},
		uniqueness: {case_sensitive: false},
		format: {with: VALID_EMAIL_REGEX}

	has_secure_password

	def self.search_user(search)
		if connection.adapter_name == 'PostgreSQL'
			if search
				where(["fname || ' ' || lname ILIKE :s", :s => "%#{search}%"])
			else
				all
			end
		else
			if search
				where(["fname || ' ' || lname LIKE :s", :s => "%#{search}%"])
			else
				all
			end
		end
	end
end