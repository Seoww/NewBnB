class UsersController < Clearance::UsersController
	def edit
		@user = User.find(current_user.id)
	end 

	def index
	end

	def show 
		@user = User.find(params[:id])

		# byebug
	end 

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to listings_path
		else 
			render 'edit'
		end 
	end 

	def create 
		user = User.new(user_params)
		if user.save 
			redirect_to listings_path
		else 
			redirect_to root_path
		end 
	end

	private


	def user_params
		params.require(:user).permit(:name, :email, :password, :avatar)
	end

end 
