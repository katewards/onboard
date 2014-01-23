class SessionsController < ApplicationController

	# sessions are the way the browser tracks me
	# we want to manage them in our app
	# sessions controller deals with this stuff

	def destroy
		# aka logout
		reset_session
		flash[:success] = "You've logged out"
		redirect_to root_path
	end

	# this is my log in form
	def new

	end

	def create

		# do the log in

		# I want to find the username and password typed in

		@username = params[:session][:username]
		@password = params[:session][:password]

		# then I wnat to see if there's a user with that username
		# find_by_X is an automatic thing rails can do 

		@user = User.find_by_username(@username)

		# if there is, check their password as well
		# this is built into hassecurepassword gem

		if @user.present? and @user.authenticate(@password)

		# if it matches, give them a session

		session[:user_id] = @user.id
		flash[:success] = "You're logged in"
		redirect_to root_path

		else 

		flash[:error] = "Wrong username/password"

		# if not, show the new page 

		render "new"
			
		end

	
	end

end
