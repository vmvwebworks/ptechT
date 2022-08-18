class BookingsController < ApplicationController

    def new
        @booking = Booking.new
    end

    def create
        booking = Booking.create(bookings_params)
        add_currency(booking)
        redirect_to root_path
    end
    
    def edit
        @booking = Booking.find(params[:id])
    end

    def update
        booking = Booking.find(params[:id])
        booking.update(bookings_params)
        add_currency(booking)
        redirect_to root_path
    end

    def destroy
        Booking.find(params[:id]).destroy
        redirect_to root_path
    end

    private

        def add_currency(booking)
            unless params[:booking][:currency].blank?
                currency = Currency.find(params[:booking][:currency].to_i)
                currency.bookings << booking
            end
        end

        def bookings_params
            params.require(:booking).permit(:name, :price, :check_in, :check_out, :guest_name, :guest_email  )
        end
end
