class UsersController < ApplicationController

	before_action :set_user, only: [:edit, :update, :show, :destroy]

	def index
		@users = User.all		
	end
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "sign up successful"
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def edit

	end

	# Updates the edited user
	def update
		if @user.update(user_params)
			flash[:success] = "user updated"
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	# Controls the show page of an individual position
	def show

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