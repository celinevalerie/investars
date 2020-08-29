class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @questions = Question.where("funding_round_id = #{params[:funding_round_id]}")
  end

  def create
    @question = Question.new(question_params)
    @question.funding_round_id = params[:funding_round_id]

    if @question.save
      redirect_to new_user_funding_round_question_path
    else
      render :new
    end
  end

  def index
    @funding_round = FundingRound.find(params[:funding_round_id])
    @investments = @funding_round.investments
    @investments_ids = @funding_round.investments.ids
    @answers = Answer.all
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question)
  end
end
