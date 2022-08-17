class ApplicationController < ActionController::Base
    def home
        @bookings = Booking.all
    end
end
