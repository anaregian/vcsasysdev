class UsersController < ApplicationController
	include CodeHelper

	before_action :set_user, only: [:edit, :update, :show, :destroy]
	before_action :require_user, except: [:new, :create , :confirm_email]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def index
		@users = User.search_user(params[:search])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save && verify_code
			UserMailer.registration_confirmation(@user).deliver
			flash[:success] = "Registration completed! Please confirm your email address."

		end
		return redirect_to root_path
	end

	def confirm_email
		user = User.find_by_confirm_token(params[:id])
		if user
			user.email_activate
			flash[:success] = "Welcome to the V.C.S.A. budget system. Your account has now been confirmed."
			
		else
			flash[:danger] = "Error: User has already confirmed this account or user does not exist."
			
		end
		return redirect_to root_path 
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

	def destroy
		@user.destroy
		session[:user_id] = nil
		flash[:danger] = "The user was deleted"
		redirect_to root_path
	end
	# Private methods
	private

	# Sets the user variable to the selected user
	def set_user
		@user = User.find(params[:id])
	end

	# Assigns the parameters entered while creating or editing a user
	def user_params
		params.require(:user).permit(:username, :fname, :lname, :email, :password, :admin, :admin_code)
	end

	def require_same_user
		if current_user != @user and !current_user.admin?
			flash[:danger] = "You cannot edit or delete other people's accounts"
			redirect_to root_path
		end
	end


	def verify_code
		if @user.admin_code != get_code
		 	flash[:danger] = "Incorrect Admin code, user not created"
		 	@user.destroy
		 	session[:user_id] = nil
		 	return false
		else
			return true

	end

		end

end
