class FundingRoundsController < ApplicationController
  def new
    @funding_round = FundingRound.new
  end

  def create
    @funding_round = FundingRound.new(funding_round_params)
    @funding_round.user_id = current_user.id
    if @funding_round.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def index
    @funding_rounds = FundingRound.all
  end

  def interested
    session[:return_to] ||= request.referer

    @investment = Investment.new(user_id: current_user.id, funding_round_id:params[:id], interested: true)
    @investment.save

    redirect_to session.delete(:return_to)
  end


  private

  def set_funding_round
    @funding_round = FundingRound.find(params[:id])
  end

  def funding_round_params
    params.require(:funding_round).permit(:name, :amount)
  end
end
