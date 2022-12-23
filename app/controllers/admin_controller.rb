class AdminController < ApplicationController
  def home
    @bookings = Booking.all
  end
end
