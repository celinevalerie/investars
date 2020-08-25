class InvestmentsController < ApplicationController
  def index
    @investments = Investment.where("user_id = params[:user_id] and funding_round_id = params[:funding_round_id]")
  end
end
