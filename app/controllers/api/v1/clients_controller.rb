module Api
  module V1

    class ClientsController < ApplicationController

      # def index
      #   @clients = Client.all

      #   logger.debug(@clients)

      #   render json: @clients, status: 200
      # end


      def index

        logger.debug('bite')
        logger.debug('bite')
        logger.debug('bite')
        @todos = Client.all
        json_response(@todos)
      end

      def create

        logger.debug('bite')
        logger.debug('bite')
        logger.debug('bite')

        @client = Client.new(client_params)

        if @client.save
          render json: @client, status: :created, location: api_v1_client_url(@client)
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end

      def index
        
      end


      private

      def client_params
        params.require(:client).permit(:name, :siret, :address, :zip_code, :city, :country, :phone, :fax, :activity, :activity_code, :vat_number)
      end

    end
  end
end