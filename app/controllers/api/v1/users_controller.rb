module Api
  module V1
    class UsersController < ApplicationController

      def index
        @user = User.all.as_json(include: :role)
        json_response(@user, api_v1_users_url)
      end


      private

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
      end
    end
  end
end