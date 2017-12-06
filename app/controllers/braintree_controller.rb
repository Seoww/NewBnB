class BraintreeController < ApplicationController
  def new
  	@reservation = Reservation.find(params[:reservation_id])
	@this_listing = @reservation.listing
	@client_token = Braintree::ClientToken.generate
  end

  def checkout
  	  	@reservation = Reservation.find(params[:reservation_id])
	  	@this_listing = @reservation.listing
		@host = User.find(@this_listing.user_id)
		@customer = User.find(current_user.id)

	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

	  result = Braintree::Transaction.sale(
	   :amount => "10.00", #this is currently hardcoded
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )


	  if result.success?
	  	  ReservationMailer.reservation_email(@customer, @host, @this_listing , @id ).deliver_now
	  	  redirect_to :root, :flash => { :success => "Transaction successful!" }

	  else
	  	  redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
	  end
	end
end
