module Api
  module V1
    class PermissionsController < ApplicationController

      before_action :authenticate_user!

      def index
        @permissions = Permission.all
        json_response(@permissions, api_v1_permissions_url())
      end


    end
  end
end