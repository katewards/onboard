class UsersController < ApplicationController

  def new

  	@user = User.new

  end

  def create

  	@user = User.new(user_params)

  	if @user.save

  		flash[:success] = "You've signed up"

  		# we want to keep track of who we just signed up as
  		# in rails we use a thing called a session
  		# this tracks us in browser using a cookie

  		session[:user_id] = @user.id

  		redirect_to root_path
  	else
  		render "new"
  	end
  

  end

  private

  def user_params

	params.require(:user).permit(:name,
	 :username, :email, :password, :password_confirmation)

  end


end
