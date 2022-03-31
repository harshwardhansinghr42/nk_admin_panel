json.extract! product_comment, :id, :product_id, :user_id, :comment, :created_at, :updated_at
json.url product_comment_url(product_comment, format: :json)
