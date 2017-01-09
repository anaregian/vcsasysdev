class CodesController < ApplicationController

 http_basic_authenticate_with :name => "sunny", :password => "asdasd123"

	def new
		@code = Code.new
	end

	def create
		@code = Code.new(code_params)
		if !logged_in?
			if @code #No idea how to check.
				flash.now[:success] = "Redirecting to Sign up page"
				redirect_to signup_path
			else
				flash.now[:danger] = "Invalid admin code"
			end
		else # admins can create new codes
			if current_user.admin?
				@code.save
				flash[:success] = "New code added"
				redirect_to root_path
			else
				flash[:danger] = "Sorry only admins can use this page"
				render 'new'

			end
		end
	end

	def code_params
		params.require(:code).permit(:code)
	end

end
