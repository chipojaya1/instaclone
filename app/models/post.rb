class Post < ApplicationRecord
  belongs_to :user
  delegate :email, to: :user, prefix: :author, allow_nil: false
  validates :post, presence: true, length: {maximum: 500}
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
