module Api
  module V1
    class ProductListSerializer < ProductSerializer
      def liked
        @instance_options[:user_liked_products].include? object.id
      end

      def images
        @instance_options[:product_images][object.id]
      end
    end
  end
end