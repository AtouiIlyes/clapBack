require 'rails_helper'

#require Rails.root.join('spec', 'apis', 'v1', 'shared_exemples', 'respond_to_missing.rb')

RSpec.describe 'Client API', type: :request do

  #initialise test data
  let!(:clients_list) { create_list :client, 5 }
  let(:client_id) { clients_list.first.id }

  
  describe 'GET /api/v1/clients' do 

    # make http request before each example
    before { get '/api/v1/clients' }

    it 'returns clients' do

      expect(json_response).not_to be_empty
      expect(json_response.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status 200
    end 

  end


  describe "GET /api/v1/clients/:id" do

    before { get "/api/v1/clients/#{client_id}", params: {format: 'json'} }

    context 'when the record exists' do 

      it 'returns the clients' do
        expect(json_response).not_to be_empty
        expect(json_response['id']).to eq(client_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end

    context 'when the record does not exists' do
      let(:client_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(json_response['message']).to match(/Couldn't find Client/)
      end

    end
  
  end


  describe "POST /api/v1/clients" do

    let(:valid_params) do
      { client: {
          name: "odevie",
          siret: "927301987000",
          address: "chemin du moulin brûlé",
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

      before { post "/api/v1/clients/", params: valid_params }

      it "creates a new client" do
        expect(response).to have_http_status(201)
        expect(response.headers['Location']).to eq api_v1_client_url(Client.last)
        expect(json_response['name']).to eq 'odevie'
      end

      it 'shouldn\'t create two client with same siret' do
        post "/api/v1/clients/", params: valid_params
        expect(response).to have_http_status(422)
      end

    end


    context "with invalid parameters" do
      let(:invalid_params) do
        { client: {name: "odevie"}}
      end

      before { post "/api/v1/clients/", params: invalid_params }

      it 'return status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed:/)
      end
        
    end
    
  end

 
  describe 'PUT /api/v1/clients/:id' do
    let(:valid_attributes) do { client: { name: 'My new company' } } end

    context 'when the record exists' do
      before { put "/api/v1/clients/#{client_id}", params: valid_attributes }

      it 'updates the records' do
        expect(json_response['name']).to eq('My new company')
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /api/v1/clients/:id' do
    
    before { delete "/api/v1/clients/#{client_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end    
  end


  DatabaseCleaner.clean
end