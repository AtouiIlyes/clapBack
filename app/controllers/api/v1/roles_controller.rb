module Api
  module V1
    class RolesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_role, only: [:show, :update, :destroy]

      def index
        @roles = Role.all.as_json(include: :permissions)
        json_response(@roles, api_v1_roles_url)
      end

      def show
        json_response(@role, api_v1_role_url(@role))
      end

      def create
        @role = Role.create!(role_params)
        json_response(@role.as_json(include: :permissions), api_v1_role_url(@role), :created)
      end


      def update
        @role.update(role_params)
        json_response(@role.as_json(include: :permissions), api_v1_role_url(@role))
      end

      def destroy
        @role.destroy
        head :no_content
      end

      private

      def role_params
        params.require(:role).permit(:name, :description, :permission_ids => [])
      end

      def set_role
        # 404 managed by concern exeption handler
        @role = Role.find(params[:id])
      end
    end
  end
end