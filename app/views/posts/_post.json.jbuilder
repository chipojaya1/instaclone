json.extract! post, :id, :name, :email, :post, :image, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
