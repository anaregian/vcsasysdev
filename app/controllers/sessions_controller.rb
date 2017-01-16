class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if  user && user.authenticate(params[:session][:password]) && user.email_confirmed
			session[:user_id] = user.id
			flash[:success] = "Logged in!"
			redirect_to root_path
			
		else
			if  user && user.email_confirmed?
				flash.now[:danger] = "Sign in unsuccessful"
				render 'new'
			
			elsif !user
				flash.now[:danger] = "User does not exist"
				render 'new'

			else
				flash.now[:danger] = "Confirm email before logging in. 
				If you have a typo in your email please ask an administrator to delete your account. Then you may re-register with the same username"
				render 'new'
			end
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end

end