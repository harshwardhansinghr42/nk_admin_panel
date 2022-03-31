module Api
  module V1
    class ProductDetailSerializer < ProductSerializer
      def liked
        @instance_options[:liked]
      end

      def images
        @instance_options[:images]
      end
    end
  end
end