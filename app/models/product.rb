class Product < ApplicationRecord
  enum status: [:inactive, :active]

  belongs_to :category
  has_many_attached :images
  has_and_belongs_to_many :tags
  has_many :product_likes
  has_many :product_comments
  # has_many :user_product_likes, ->(user_id) { where(user_id: user_id) }, class_name: 'ProductLike'
end
