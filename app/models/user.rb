class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :investments, dependent: :destroy
  has_many :funding_rounds, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description_and_industry_and_url,
    against: [ :name, :description, :industry, :url ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

    # t.string "role"
    # t.string "name"
    # t.string "description"
    # t.string "industry"
    # t.string "url"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :role, :name, :description, :industry, presence: true
  validates :role, inclusion: { in:["startup", "investor"] }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
