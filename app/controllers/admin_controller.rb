# frozen_string_literal: true

class AdminController < ApplicationController
  def home
    @bookings = Booking.all
  end
end
