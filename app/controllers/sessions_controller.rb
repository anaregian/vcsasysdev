class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user.email_confirmed? && user && user.authenticate(params[:session][:password]) && 
			
			session[:user_id] = user.id
			flash[:success] = "Logged in!"
			redirect_to root_path


		else
			if user.email_confirmed?
				flash.now[:danger] = "Sign in unsuccessful"
				render 'new'
		
			else
				flash.now[:danger] = "Confirm email before logging in"
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