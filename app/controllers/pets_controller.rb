class PetsController < ApplicationController

  def index
    @start_date = DateTime.new(2017, 10, 3)
    @end_date = DateTime.new(2017, 10, 4)
    @pets = Pet.species("pokemon").start_date(@start_date).end_date(@end_date)
  end

  def show
    @pet = Pet.find(params[:id])
  end

end
