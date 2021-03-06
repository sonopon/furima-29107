class User < ApplicationRecord
  has_many :items
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }

  with_options presence: true do
    validates :nickname
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_date
  end
end
