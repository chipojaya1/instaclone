class Post < ApplicationRecord
  validates :post, presence: true, length: {maximum: 500}
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :image, ImageUploader
  validates :image, presence: true
end
