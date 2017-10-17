class PetsController < ApplicationController

  def index
    @pets = Pet.species("dog")
  end
end
