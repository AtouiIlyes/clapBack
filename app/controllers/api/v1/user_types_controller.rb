module Api
  module V1
    class UserTypesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_user_type, only: [:show, :update, :destroy]

      def index
        @user_types = UserType.all.as_json()
        json_response(@user_types, api_v1_user_types_url)
      end

      def show
        json_response(@user_type.as_json(), api_v1_user_type_url(@user_type))
      end

      def create
        @user_type = UserType.create!(user_type_params)
        json_response(@user_type.as_json(), api_v1_user_type_url(@user_type), :created)
      end


      def update
        @user_type.update(user_type_params)
        json_response(@user_type.as_json(), api_v1_user_type_url(@user_type))
      end

      def destroy
        @role.destroy
        head :no_content
      end

      private

      def user_type_params
        params.require(:user_type).permit(:name, :description)
      end

      def set_user_type
        # 404 managed by concern exeption handler
        @user_type = UserType.find(params[:id])
      end
    end
  end
end