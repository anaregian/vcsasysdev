class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "sign up successful"
			redirect_to root_path
		else
			render 'new'
		end
	end

	# Private methods
	private

	# Sets the user variable to the selected user
	def set_user
		@user = User.find(params[:id])
	end

	# Assigns the parameters entered while creating or editing a user
	def user_params
		params.require(:user).permit(:username, :fname, :lname, :email, :password)
	end
end