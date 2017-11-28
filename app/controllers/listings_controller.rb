class ListingsController < ApplicationController

	def index
		@listing = Listing.paginate(:page => params[:page], :per_page => 6)	
	end

	def show 
		@this_listing = Listing.find(params[:id])
		@full_address = @this_listing.address + ", " + @this_listing.zipcode + ", " + @this_listing.city + ", " + @this_listing.state + ", " + @this_listing.country
		@reservation = Reservation.new 
	end 

	def new
		@listing = Listing.new
	end

	def create 
		listing = current_user.listings.new(listing_params)
		if listing.save 
			redirect_to listings_path
		else 
			render new_listing_path
		end 
	end

	private

	def listing_params
		params.require(:listing).permit(:name, :property_type, :room_number, :guest_number, :bed_number, :country, :state, :city, :zipcode, :address, :price, :description, {pictures:[]})
	end

end 