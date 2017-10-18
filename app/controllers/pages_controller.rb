class PagesController < ApplicationController
  def home
    @pets = Pet.all
    @pet = Pet.new
    # @SPECIES = Pet.where(key: "species")
    @SPECIES = ["cat", "dog"]
  end
end
