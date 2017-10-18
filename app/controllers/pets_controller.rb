class PetsController < ApplicationController

  def index
    @start_date = DateTime.new(2017, 10, 3)
    @end_date = DateTime.new(2017, 10, 5)
    @pets = Pet.species("crocodile").start_date(@start_date).end_date(@end_date)

    @hash = Gmaps4rails.build_markers(@pets) do |pet, marker|
      marker.lat pet.latitude
      marker.lng pet.longitude
    end
  end

  def show
    @pet = Pet.find(params[:id])
    @booking = @pet.bookings.build
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.owner = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:start_date, :end_date,
      :name, :species, :daily_price, :description, :age,
      :gender, :personality)
  end
end
