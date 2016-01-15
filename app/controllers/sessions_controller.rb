class SessionsController < ApplicationController
  def index
  end

	def new
	end

	def create
		@user = User.authenticate(params[:email], params[:password])
		if @user
			flash[:notice]= "You've been logged in."
			session[:user_id] = @user.user_id
			redirect_to "/"
		else
			flash[:alert] = "Something is wrong."
			redirect_to log_in_path
		end
	end

	def destroy
	session[:user_id]= nil
	flash[:notice] = "You've been logged out."
	redirect_to "/"
	end
end
