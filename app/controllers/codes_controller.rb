class CodesController < ApplicationController

#before_filter :require_user, only: [:edit,  :show, :destroy, :index, :update]
before_action :require_admin_user, except: [:verify_code]

	def new
		@code = Code.new
	end

	def index
		@codes = Code.all
	end

	def show

	end
	def edit
		@code = Code.find(params[:id])
	end

	def create
		@code = Code.new(code_params)
		@codesList = Code.select(:code)
		if !logged_in?
			if  @codesList.include? @code
				flash.now[:success] = "Redirecting to Sign up page"
				redirect_to signup_path
			else
				flash[:danger] = "Invalid admin code"
				render 'new'

			end
		else
			if current_user.admin?
				@code.save
				flash[:success] = "New code added"
				redirect_to codes_path
			else
				flash[:danger] = "Sorry only admins can use this page"
				render 'new'

			end
		end
	end

	def update
		@code = Code.find(params[:id])
		if @code.update(code_params)
			flash[:success] = "Code updated"
			redirect_to codes_path
		else
			render 'edit'
		end
	end

	def verify_code

	end

	def code_params
		params.require(:code).permit(:code)
	end

	def require_admin_user
		if !current_user.admin?
		flash[:danger] = "Requires you to be an admin user to access that page"
		redirect_to root_path
		end
	end

end
