class ApplicationMailer < ActionMailer::Base
	default :from => "noreply@mydomain.com"

	def registration_confirmation(user)
		@user = user
		mail(:to => "#{user.fname} <#{user.email}>", :subject => "Please confirm your registration")
	end
end
