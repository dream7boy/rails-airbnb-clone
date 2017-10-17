class PetsController < ApplicationController

  def index
    @start_date = DateTime.new(2017, 10, 3)
    @end_date = DateTime.new(2017, 10, 4)
    @pets = Pet.species("pokemon").start_date(@start_date).end_date(@end_date)
  end

  def show
    @pet = Pet.find(params[:id])
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
