class BookingsController < ApplicationController

    def new
        @booking = Booking.new
    end

    def create
        puts params
        booking = Booking.create(bookings_params)
        redirect_to root_path
    end
    
    def edit
        @booking = Booking.find(params[:id])
    end

    def update
        booking = Booking.find(params[:id])
        booking.update(bookings_params)
        redirect_to root_path
    end

    def destroy
        Booking.find(params[:id]).destroy
        redirect_to root_path
    end

    private

        def bookings_params
            params.require(:booking).permit(:name, :price, :currency_id, :check_in, :check_out, :guest_name, :guest_email  )
        end
end
