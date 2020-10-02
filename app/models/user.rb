class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 30}
  validates :email, uniqueness: true, length: {maximum: 255},
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  before_validation {email.downcase!}

  validates :password, presence: true, length: {minimum: 6}
  has_secure_password
  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  mount_uploader :icon, IconUploader
  validates :icon, presence: true
end
