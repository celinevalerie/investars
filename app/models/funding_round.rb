class FundingRound < ApplicationRecord
belongs_to :user
has_many :investments, dependent: :destroy
has_many :questions, dependent: :destroy

validates :name, presence: true
validates :amount, presence: true
end
