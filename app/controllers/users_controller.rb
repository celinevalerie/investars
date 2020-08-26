class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:startups, :investors]
  def show
    set_user
  end

  def edit
    set_user
  end

  def update
    set_user

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def index
    @startups = User.where("role = 'startup'")
    @investors = User.where("role = 'investor'")
  end

  def startups
    @startups = User.where("role = 'startup'")
  end

  def investors
    @investors = User.where("role = 'investor'")
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role, :name, :description, :industry, :photo)
  end

end
