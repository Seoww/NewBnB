class UsersController < Clearance::UsersController
	def edit
		@user = User.find(params[:id])
	end 

	def index

	end

	def create 
		user = User.new(user_params)
		if user.save 
			redirect_to root_path
		else 
			redirect_to sign_up_path
		end 
	end

	private


	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end 