class BookingsController < ApplicationController

  def index
    @user = current_user
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @booking = @pet.bookings.build
    @duration = (@pet.end_date - @pet.start_date).to_i
    @total_price = @pet.daily_price * @duration
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @booking = @pet.bookings.build(booking_params)
    @booking.status = "Pending"
    @booking.booker = current_user
    @booking.start_date = @pet.start_date
    @booking.end_date = @pet.end_date

    if @booking.save
      redirect_to user_bookings_path(current_user)
    else
      render "new"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:duration, :total_price)
  end
end
