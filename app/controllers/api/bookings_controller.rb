module Api
    class BookingsController < ApplicationController
        protect_from_forgery with: :null_session
        
        def index
            @bookings = Booking.all
            json_response(@bookings)
        end
    
        def create
            booking = Booking.create(bookings_params)
            json_response(booking)
        end
    
        def update
            booking = Booking.find(params[:id])
            booking.update(bookings_params)
            json_response(booking)
        end
    
        def destroy
            booking = Booking.find(params[:id]).destroy
            json_response(booking)
        end
    
        private
            def bookings_params
                params.permit( :name, :currency_id, :price, :check_in, :check_out, :guest_name, :guest_email )
            end
    end
end

