class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @funding_round = FundingRound.find(params[:funding_round_id])
    @questions = @funding_round.questions
    @investment = Investment.new(interested: false, user: current_user, funding_round: @funding_round)
    @investment.save
  end

  def create
    params.each do |key, value|
      if key.match?(/question/) == true
        @answer = Answer.new()
        @answer.investment_id = params[:investment_id]
        @answer.question_id = key.rpartition('-').last
        @answer.answer = value
        @answer.save
      end
    end

    if @answer.save
      @investment = Investment.find(params[:investment_id])
      @investment.interested = true
      if @investment.save
        redirect_to user_path(current_user)
      else
        render :new
      end
    else
      render :new
    end
  end

  def index
    @answer = Answer.all
  end

  def answer
    self.answer
  end

  private
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
