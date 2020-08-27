class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:startups, :investors]
  def show
    set_user
    @funding_rounds = @user.funding_rounds
    @investments = Investment.where("user_id = #{@user.id}")
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
    if params[:query].present?
      @investors = User.search_by_name_and_description_and_industry_and_url(params[:query])
    else
      @investors = User.where("role = 'investor'")
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role, :name, :description, :industry, :photo)
  end

end
