require 'rails_helper'

#require Rails.root.join('spec', 'apis', 'v1', 'shared_exemples', 'respond_to_missing.rb')

RSpec.describe 'Client API', type: :request do

  #initialise test data
  let!(:clients_list) { create_list :client, 10 }
  let(:client_id) { clients.first.id }

  describe 'GET /api/v1/clients' do 
    # make http request before each example
    before { get '/api/v1/clients' }

    it 'returns clients' do

      expect(json_response).not_to be_empty
      expect(json_response.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status 200
    end 

  end


  describe "GET /api/v1/clients/:id" do

    before { get '/api/v1/clients/#{client_id}' }

    context 'when the record exists' do 

      it 'returns the clients' do
        expect(json_response).not_to be_empty
        expect(json_response[:id]).to eq(client_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end

    context 'when the record does not exists' do
      let(:client_id) { -1 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(reponse.body).to match(/Couldn't find Client/)
      end

    end
  
  end


  describe "POST /api/v1/clients" do

    let(:valid_params) do
      { client: {
          name: "odevie",
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

    context "with valid parameters" do

      # before do
      #   post "/api/v1/clients/", params: valid_params
      # end

      before { post "/api/v1/clients/", params: valid_params }

      it "creates a new client" do
        #expect { post :create, params: :valid_params }.to change(Client, :count).by(+1)
        
        #expect { post "/api/v1/clients/", params: valid_params }.to change(Client, :count).by(+1)
        
        # test for the 200 status-code
        expect(response).to have_http_status(201)

        # test for url returned
        expect(response.headers['Location']).to eq api_v1_client_url(Client.last)

        #test for data returned
        expect(json_response[:name]).to eq 'odevie'

        post "/api/v1/clients/", params: valid_params
        expect(response.status).to eq(422)
      end


      DatabaseCleaner.clean

    end
  end
end