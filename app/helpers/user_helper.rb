module UserHelper

	def wrong_code
		flash.now[:danger] = "Incorrect admin code"
		render 'user/new'
	end
end