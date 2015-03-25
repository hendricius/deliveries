class Company < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

  has_many :orders, dependent: :destroy
  has_many :drivers, dependent: :destroy
  geocoded_by :address
  after_validation :geocode
end
