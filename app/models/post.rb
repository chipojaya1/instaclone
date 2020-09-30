class Post < ApplicationRecord
delegate :email, to: :user, prefix: :author, allow_nil: false
validates :post, presence: true, length: {maximum: 500}
belongs_to :user
has_many :favorites, dependent: :destroy
has_many :favorite_users, through: :favorites, source: :user
end
