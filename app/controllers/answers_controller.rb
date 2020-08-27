class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @user = User.find(params[:user_id])
    @funding_round = FundingRound.find(params[:funding_round_id])
    @investment = Investment.find(params[:investment_id])
    @investment.funding_round = @funding_round
    @questions = @funding_round.questions
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to users_path
    else
      render :new
    end
  end

  def index
    @answer = Answer.all
  end

  private
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params 
    params.require(:answer).permit(:answer)
  end
end
