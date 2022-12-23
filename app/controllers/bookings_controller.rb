class BookingsController < ApplicationController
  
  def new
    @booking = Booking.new
  end

  def create
    booking = Booking.new(booking_params)
    cost = PricingEngine.new(animal_type: booking.animal_type, hours_requested: booking.hours_requested).determine_cost
    booking.cost = cost
    
    if booking.save
      redirect_to new_booking_path, { notice: "Booked successfully. Your total is $#{cost}."}
    else
      redirect_to new_booking_path, { alert: "Your booking could not be completed"}
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :animal_name, :animal_type, :hours_requested,
      :date_of_service)
  end
end
