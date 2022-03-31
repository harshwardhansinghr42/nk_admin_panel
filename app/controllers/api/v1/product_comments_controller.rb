module Api
  module V1
    class ProductCommentsController < ApplicationController
      include Authenticatable

      def index
        render json: ProductComment.where(product_id: params[:product_id])
      end

      def destroy
        comment = @current_user.product_comments.find_by_id(params[:id])
        render json: {error: 'comment not found'} and return unless comment

        comment.destroy
        head :ok
      end

      def create
        product = Product.find_by_id(params[:product_id])
        render json: {error: 'product not found'} and return unless product

        product_comment = product.product_comments.new(comment: params[:comment], user_id: @current_user.id)
        if product_comment.save
          head :ok
        else
          render json: {error: product_comment.errors.full_messages}
        end
      end
    end
  end
end