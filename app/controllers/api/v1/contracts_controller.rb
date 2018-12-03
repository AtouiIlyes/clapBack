module Api
  module V1
    class ContractsController < ApplicationController
      before_action :set_client
      before_action :set_contract, only: [:show, :update, :destroy]

      # GET /contracts
      def index
        @contracts = Contract.all
        json_response(@contracts, api_v1_client_contracts_url)
      end

      # GET /contracts/1
      def show
        json_response(@contract, api_v1_client_contract_url(@contract))
      end

      # POST /contracts
      def create
        @contract = Contract.create!(contract_params)
        json_response(@contract, api_v1_client_contract_url(@client, @contract), :created)
      end

      # PATCH/PUT /contracts/1
      def update
        @contract = Contract.update(contract_params)
        json_response(@contract, api_v1_client_contract_url(@contract))
      end

      # DELETE /contracts/1
      def destroy
        @contract.destroy
      end

      private

        def set_client
          @client = Client.find(params['client_id'])
        end

        # Use callbacks to share common setup or constraints between actions.
        def set_contract
          @contract = @client.contracts.find_by!(id: params[:id]) if @client
        end

        # Only allow a trusted parameter "white list" through.
        def contract_params
          params.require(:contract).permit(:name, :description, :client_id, :sales_person_id, :manager_id)
        end
    end
  end
end