class BookingsController < ApplicationController

  def new
    @pet = Pet.find(params[:pet_id])
    @duration = (@pet.end_date - @pet.start_date).to_i
    @total_price = @pet.daily_price * @duration
    @booking = @pet.bookings.build
    # byebug
  end

  def create
    # byebug
    @pet = Pet.find(params[:pet_id])
    @booking = @pet.bookings.build(booking_params)
    @booking.status = "Pending"
    @booking.booker = current_user
    byebug
    if @booking.save
      redirect_to @pet
    else
      render "pets/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:duration, :total_price)
  end
end
