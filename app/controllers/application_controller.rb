class ApplicationController < ActionController::Base
    include Response
    
    def home
        @bookings = Booking.all
    end
end
