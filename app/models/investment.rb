class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :funding_round
  has_many :answers, dependent: :destroy

  validates :interested, inclusion: { in:[true, false] }
end
