# frozen_string_literal: true

module Api
  module V1
    # authentication
    module Authenticatable
      extend ActiveSupport::Concern
      included do
        before_action :authenticate_user!
      end

      TOKEN_EXPIRY_TIME = 3.months
      attr_reader :current_user

      def authenticate_user!
        return if valid_token?

        render json: { errors: 'invalid auth token' }, status: :unauthorized
      end

      def valid_token?
        return false unless auth_token
        return false unless Time.now - auth_token['token_generation_time'].to_datetime < TOKEN_EXPIRY_TIME
        return false unless (@current_user = User.find_by(id: auth_token['user_id']))
      
        true
      end

      def auth_token
        @auth_token ||= JsonWebToken.decode(request.headers['HTTP_AUTH_TOKEN'])
      end
    end
  end
end
