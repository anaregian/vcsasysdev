class CodesController < ApplicationController

 http_basic_authenticate_with :name => "sunny", :password => "asdasd123"
before_action :require_same_user, only: [:edit,  :show, :destroy, :index]
	def new
		@code = Code.new
	end

	def index
		@codes = Code.all
	end

	def show
		
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

	def destroy
		@code = Code.find(params[:id])
		@code.destroy
		flash[:danger] = "Code was deleted"
		redirect_to code_path
	end

	def code_params
		params.require(:code).permit(:code)
	end

	def require_same_user
		if !current_user.admin?
		flash[:danger] = "You can only edit or delete your own codes"
		render 'new'
		end
	end
end
