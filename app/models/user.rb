class User < ActiveRecord::Base
<<<<<<< HEAD

=======
>>>>>>> 44d7b0d7ee3b3c242f9f0d640ae6424c10bd3ea7
	include CodeHelper
	before_save {|user| user.email = user.email.downcase}
	before_create :confirmation_token


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

	def email_activate
		self.email_confirmed = true
		self.confirm_token = nil
		save!(:validate => false)
	end

	private

	def confirmation_token
		if self.confirm_token.blank?
			self.confirm_token = SecureRandom.urlsafe_base64.to_s
		end
	end
end
