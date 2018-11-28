require 'rails_helper'

RSpec.describe ClientsController, type: :controller do

  before do


  end

  describe "POST /clients" do
    context "with valid parameters" do
      let(:valid_params) do
        { client: {
            name: "odevie",
            siret: "9273019870000",
            address: "Chemin du moulin brûlé",
            zip_code: 13150,
            city: "Boulbon",
            country: "France",
            phone: "0664353783",
            fax: "",
            activity: "developpement informatique",
            activity_code: "6202Z",
            vat_number: ""  
          }
       }
      end

      it "creates a new client" do
        expect { post :create, params: valid_params }.to change(Client, :count).by(+1)
        expect(response).to have_http_status :created
        expect(response.headers['Location']).to eq client_url(Client.last)
        expect(Client.last).to have_atttibutes valid_params[:client]
      end

      # it "create a client with the correct attributes" do
      #   post :create, params: valid_params
        
      # end

      #DatabaseCleaner.clean

    end

  end
end