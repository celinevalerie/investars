class FundingRound < ApplicationRecord
belongs_to :user
has_many :investments

validates :name, presence: true
validates :amount, presence: true
end
