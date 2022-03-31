module Api
  module V1
    class CategoriesController < ApplicationController
      include Authenticatable

      def index
        render json: Category.default_order
      end
    end
  end
end