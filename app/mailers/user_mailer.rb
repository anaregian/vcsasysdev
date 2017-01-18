#Class to send the user an email

class UserMailer < ActionMailer::Base
	default :from => "noreply@mydomain.com"

	def registration_confirmation(user)
		@user = user
		mail(:to => "#{user.fname} <#{user.email}>", :subject => "Please confirm your registration")
	end

	def password_reset(user)
  	@user = user
  	mail :to => user.email, :subject => "Password Reset"
	end

end
