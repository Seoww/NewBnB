class UsersController < Clearance::UsersController
	def user_from_params
	    email = user_params.delete(:email)
	    password = user_params.delete(:password)
	    name = user_params.delete(:name)

	  Clearance.configuration.user_model.new(user_params).tap do |user|
	      user.email = email
	      user.password = password
	      user.name = name 
  		end
	end

	def user_params
		params[Clearance.configuration.user_parameter] || Hash.new
	end

	def index
	end 
end 