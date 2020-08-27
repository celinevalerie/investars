class QuestionController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to users_path
    else
      render :new
    end
  end

  def index
    @answer = Answer.all
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params 
    params.require(:question).permit(:question)
  end
end
