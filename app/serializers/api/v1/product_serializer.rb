module Api
  module V1
    class ProductSerializer < ActiveModel::Serializer
      attributes :id, :name, :price, :discount, :discount_expiry, :category_id, :liked, :images, :likes_count
      
      def likes_count
        object.product_likes.size
      end
    end
  end
end