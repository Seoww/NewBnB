class ReservationMailer < ApplicationMailer

	def reservation_email(customer, host, listing, reservation_id)
		@customer = customer
		@host = host
		@listing = listing 
		mail(to: @host.email, subject: "Reservation Created!")
	end 
end
