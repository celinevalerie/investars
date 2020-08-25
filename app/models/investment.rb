class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :funding_round

  validates :interested, inclusion: { in:[true, false] }

  def interested?
    self.interested
  end
end
