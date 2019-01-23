module Api
  module V1
    class ClientsController < ApplicationController

      #before_action :authenticate_user!
      before_action :set_client, only: [:show, :update, :destroy]

      def index
        @clients = Client.all.as_json(include: :contracts)
        #@clients = @clients.as_json(include: :contracts)
        #render json: @clients, status: :ok, location: api_v1_clients_url
        json_response(@clients, api_v1_clients_url)
      end

      def show
        json_response(@client, api_v1_client_url(@client))
      end

      def create
        @client = Client.create!(client_params)
        json_response(@client, api_v1_client_url(@client), :created)
      end


      def update
        @client.update(client_params)
        json_response(@client, api_v1_client_url(@client))
      end

      def destroy
        @client.destroy
        head :no_content
      end


      private

      def client_params
        params.require(:client).permit(:name, :siret, :address, :zip_code, :city, :country, :phone, :fax, :activity, :activity_code, :vat_number)
      end

      def set_client
        # 404 managed by concern exeption handler
        @client = Client.find(params[:id])
      end

    end
  end
end