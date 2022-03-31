class ProductComment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :comment, presence: true, length: { maximum: 500 }
end
