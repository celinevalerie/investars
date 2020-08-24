class FundingRoundsController < ApplicationController
  def new
    @funding_round = FundingRound.new
  end

  def create
    @funding_round = FundingRound.new(funding_round_params)
    @funding_round.save
  end

  def index
    @funding_rounds = FundingRound.all
  end

  def interested
    set_funding_round
    if @funding_round.interested == true
      @funding_round.interested = false
    else
      @funding_round.interested = true
    end
  end

  private

  def set_funding_round
    @funding_round = FundingRound.find(params[:id])
  end

  def funding_round_params
    params.require(:funding_round).permit(:name, :amount)
  end
end
