module Api
  module V1
    class RegistrationsController < ApplicationController
      def create
        user = User.find_or_initialize_by(phone: params[:phone])
        user.generate_registration_otp
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity and return unless user.save
        user.send_registration_otp

        render json: { user_id: user.id }
      end

      def verify_otp
        user = User.find_by(id: params[:id])
        render json: { error: 'user not found' }, status: :unprocessable_entity and return unless user
        #render json: { error: 'otp is either invalid or expired' }, status: :unprocessable_entity and return unless user.verify_otp(params[:otp])

        render json: { auth_token: JsonWebToken.generate_token(user.id) }
      end
    end
  end
end