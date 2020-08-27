class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.funding_round_id = params[:funding_round_id]

    if @question.save
      redirect_to user_funding_round_questions_path
    else
      render :new
    end
  end

  def index
    @questions = Question.where("funding_round_id = #{params[:funding_round_id]}")
    @funding_round = FundingRound.find(params[:funding_round_id])
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question)
  end
end
