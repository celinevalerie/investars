class AnswerController < ApplicationController
  def new
    @answer = Answer.new
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
