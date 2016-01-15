class UsersController <ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Welcome to the site!"
			redirect_to "/"
		else
			flash[alert:] = "There was a problem creating yuor account"
			redirect_to :back
		end
		end

private
	def params
		params.require(:user).permit(:email, :password, :Password_confirmation)
	end

end