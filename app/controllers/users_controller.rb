class UsersController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update]

  def show
  end

  def update
  @user.update(users_params)
  redirect_to user_path(@user)
  flash[:notice] = "Your profile was edited"
  end

  private

  def users_params
    params.require(:user).permit(:email, :location, :photo, :photo_cache)
  end

  def set_user
    @user = current_user
  end
end
