class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :investments
  has_many :funding_rounds

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :role, :name, :description, :industry, presence: true
  validates :role, inclusion: { in:["startup", "investor"] }
end
