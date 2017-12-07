class ReservationsController < ApplicationController

	def new 
		@reservation = Reservation.new
		# byebug
	end 

	def create 
		reservation = current_user.reservations.new(reservation_params)
		if reservation.save
			redirect_to braintree_new_path
		else 
			render listing_path
		end 
	end

	def index
	end 

	private

	def reservation_params
		params.require(:reservation).permit(:user_id, :listing_id, :start_time, :end_time)
	end  
end 