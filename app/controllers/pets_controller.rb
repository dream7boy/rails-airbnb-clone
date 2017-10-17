class PetsController < ApplicationController

  def index
    @start_date = DateTime.new(2017, 10, 5)
    @end_date = DateTime.new(2017, 10, 7)
    @pets = Pet.species("pokemon").start_date(@start_date).end_date(@end_date)
  end
end
