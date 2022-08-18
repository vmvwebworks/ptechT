module Api
    class BookingsController < ApplicationController
        protect_from_forgery with: :null_session
        
        def index
            @bookings = Booking.all
            json_response(@bookings)
        end
    
        def create
            # puts params
            booking = Booking.create(bookings_params)
            # add_currency(booking)
            json_response(booking)
        end
    
        def update
            booking = Booking.find(params[:id])
            booking.update(bookings_params)
            add_currency(booking)
            json_response(booking)
        end
    
        def destroy
            booking = Booking.find(params[:id]).destroy
            json_response(booking)
        end
    
        private
    
            def add_currency(booking)
                unless params[:booking][:currency].blank?
                    currency = Currency.find(params[:booking][:currency].to_i)
                    currency.bookings << booking
                end
            end
    
            def bookings_params
                params.permit( :name, :currency_id, :price, :check_in, :check_out, :guest_name, :guest_email )
            end
    end
end

