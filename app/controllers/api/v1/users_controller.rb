module Api
  module V1
    class UsersController < ApplicationController

      before_action :authenticate_user!
      before_action :set_user, only: [:show, :update, :destroy]

      def index
        @user = User.all.as_json(include: :role)
        json_response(@user, api_v1_users_url)
      end

      def create
        @user = User.create!(sign_up_params)
        json_response(@user.as_json(include: :role), api_v1_users_url(@user), :created)
      end

      def show
        json_response(@user, api_v1_users_url(@user))
      end

      def update
        @user.update(sign_up_params)
        json_response(@user.as_json(include: :role), api_v1_users_url(@user))
      end

      def destroy
        @user.destroy
        head :no_content
      end

      private

      def set_user
        # 404 managed by concern exeption handler
        @user = User.find(params[:id])
      end

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
      end
    end
  end
end