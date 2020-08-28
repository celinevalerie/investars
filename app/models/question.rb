class Question < ApplicationRecord
  belongs_to :funding_round

  def answer(question)
      Answer.where("question_id = #{question.id}").first.answer
  end
end
