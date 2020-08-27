class FundingRound < ApplicationRecord
belongs_to :user
has_many :investments
has_many :questions

validates :name, presence: true
validates :amount, presence: true
end
