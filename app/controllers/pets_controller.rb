class PetsController < ApplicationController

  def index
    # @start_date = DateTime.new(2017, 10, 3)
    # @end_date = DateTime.new(2017, 10, 4)
    # @pets = Pet.species(params[:pet_species]).start_date(@start_date).end_date(@end_date)

    if params[:species]
      @pets = Pet.where('species LIKE ?', "%#{params[:species]}%")
      # @pets = Pet.where('species LIKE ?', "%#{params[:start_date]}%")
    else
      @pets = Pet.all
    end

    # if params[:start_date]
    #   @pets = Pet.where('start_date LIKE ?', "%#{params[:start_date]}%")
    # else
    #   @pets = Pet.all
    # end

    # if params[:end_date]
    #   @pets = Pet.where('end_date LIKE ?', "%#{params[:end_date]}%")
    # else
    #   @pets = Pet.all
    # end

    @start_date = DateTime.new(2017, 10, 3)
    @end_date = DateTime.new(2017, 10, 5)
    # @pets = Pet.species("crocodile").start_date(@start_date).end_date(@end_date)

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
      :gender, :personality)
  end

  def search_params
    params.require(:pet).permit(:start_date, :end_date, :species)
  end
end
