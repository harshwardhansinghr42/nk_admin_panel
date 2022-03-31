module Api
  module V1
    class ProductsController < ApplicationController
      include Authenticatable
      before_action do
        # this is for local disk storage
        ActiveStorage::Current.host = ENV['CURRENT_HOST']
      end
      before_action :product, only: [:show]

      def index
        products = Product.includes(:product_likes, images_attachments: :blob).active.default_order
        products = products.where(category_id: params[:categories]) if params[:categories]
        products = products.page(params[:page] || 1)
        user_liked_products = []#@current_user.product_likes.pluck(:product_id)
        
        render json: products, each_serializer: ProductListSerializer, user_liked_products: user_liked_products, product_images: product_images(products)
      end

      def show
        liked = @product.product_likes.where(user_id: @current_user.id).exists?
        images = @product.images.includes(:blob).map{|image| image.url}

        render json: @product, serializer: ProductDetailSerializer, liked: liked, images: images
      end

      private

      def product_images(products)
        product_images = {}
        products.each{|p| product_images[p.id] = p.images.first.url}
        product_images
      end

      def product
        @product = Product.find(params[:id])
      end
    end
  end
end