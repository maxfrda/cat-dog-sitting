class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
   booking = Booking.create(booking_params)
   redirect_to root_path, redirect_options_for(booking)
  end

  private

  def redirect_options_for(booking)
    if booking.persisted?
      { notice: "Booked successfully"}
    else
      { alert: 'Could not book'}
    end
  end

  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :animal_name, :animal_type, :hours_requested,
      :date_of_service)
  end
end
