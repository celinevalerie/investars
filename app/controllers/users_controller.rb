class UsersController < ApplicationController
  def show
    set_user
  end

  def edit
    set_user
  end

  def update
    set_user
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  def index
    @user = User.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role, :name, :description, :industry, :photo)
  end

end
