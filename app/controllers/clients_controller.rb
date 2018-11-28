class ClientsController < ApplicationController

  def create

    # logger.debug params

    @client = Client.new(client_params)

    if @client.save
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end




  private


  def client_params
    params.require(:client).permit(:name, :siret, :address, :zip_code, :city, :country, :phone, :fax, :activity, :activity_code, :vat_number)
  end



end
