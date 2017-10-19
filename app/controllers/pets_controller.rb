class PetsController < ApplicationController

  def index

    if params[:start_date].present? && params[:end_date].present?
      @pets = Pet.where('species LIKE ? AND start_date = ? AND end_date = ?',
      "%#{params[:species]}%", "%#{params[:start_date]}%", "%#{params[:end_date]}%")
    else
      @pets = Pet.all
      flash[:alert] = "No specific dates chosen"
    end

    @hash = Gmaps4rails.build_markers(@pets) do |pet, marker|
      marker.lat pet.latitude
      marker.lng pet.longitude
      marker.infowindow render_to_string(partial: "/pets/map_box", locals: { pet: pet })
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
      :gender, :personality, :location, :photo, :photo_cache)
  end

  def search_params
    params.require(:pet).permit(:start_date, :end_date, :species)
  end
end
