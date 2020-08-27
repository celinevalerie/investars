class Answer < ApplicationRecord
  belongs_to :investment
  belongs_to :question
end
