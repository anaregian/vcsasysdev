module UserHelper

	def wrong_code
		flash.now[:danger] = "Incorrect admin code"
		render 'user/new'
	end

	def confirmed_email

		if @user.email_confirmed?
			return true
		else 
			return false
		end
	end

end