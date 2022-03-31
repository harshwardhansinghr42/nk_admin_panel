module Api
  module V1
    class ProductLikesController < ApplicationController
      include Authenticatable

      def destroy
        # change this
        render json: {error: 'product not found'} and return unless Product.find(params[:id])
      
        ProductLike.where(user_id: @current_user.id, product_id: params[:id]).destroy_all
        head :ok
      end

      def create
        render json: {error: 'product not found'} and return unless Product.find(params[:id])
      
        ProductLike.create(user_id: @current_user.id, product_id: params[:id])
        head :ok
      end
    end
  end
end