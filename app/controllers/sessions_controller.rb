class SessionsController < ApplicationController

	def new
		#presents an empty login form
		@user = User.new
		@is_login = true
	end

	def create
		# brings us into our session/stores the thought of loggin in/places cookies/only local machine knows its logged in.
		 
		 #find the user that is trying to log in.

		u = User.where(email: params[:user][:email]).first
		if u && u.authenticate(params[:user][:password])
			# if u.is_active == false
			# 	redirect_to reactive
			#store as a cookie in the users browser, their unique user id indicating that the user has logged in.

			session[:user_id] = u.id.to_s
			redirect_to new_decision_path(current_user)
		else
			flash.now.alert = "Email or password is invalid"
			#go back to login page.
			redirect_to root_path
		end
	end

	def destroy
		session[:user_id] = nil
		reset_session
		redirect_to root_path
	end

end
