require 'rails_helper'

#require Rails.root.join('spec', 'apis', 'v1', 'shared_exemples', 'respond_to_missing.rb')

RSpec.describe 'Contract API', type: :request do

  let!(:salesman) { create(:user) }
  let!(:manager) { create(:user) }
  let!(:client) { create(:client) }
  let(:client_id) { client.id }
  let!(:contracts) { create_list(:contract, 5, client_id: client.id, sales_person_id: salesman.id, manager_id: manager.id )}
  let(:id) { contracts.first.id }

  # générer une liste de contract pour le client pour tester index
  # garder un id pour tester show update destroy
  # tester la creation


  #https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one


  describe 'GET /api/v1/client/:id/contracts' do

    before { get "/api/v1/clients/#{client_id}/contracts"}

    context 'when client exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'returns all contracts' do
        expect(json_response.size).to eq(5) 
      end

    end

    context 'when client does not exists' do
      let(:client_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'retruns not found message' do 
        expect(response.body).to match(/Couldn't find Client/)
      end
    end
  end

  describe "GET /api/v1/clients/:client_id/contracts/:id" do

    before { get "/api/v1/clients/#{client_id}/contracts/#{id}" }

    context 'when contract exist' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json_response['id']).to eq (id)
      end
    end

    context 'when contract does not exist' do
      let(:id) { 0 }

      it 'ret
      urns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Contract/)
      end
    end
  end
  
  describe "POST /api/v1/clients/:client_id/contracts/" do
    let(:valid_attributes) do 
      { contract: { 
          name: "le nom du contrat",
          description: "blavbla",
          client_id: client.id,
          sales_person_id: salesman.id,
          manager_id:  manager.id,
        }
      }
    end
    

    context 'when params are valid' do
      before { post "/api/v1/clients/#{client_id}/contracts/", params: valid_attributes}

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do 

      let(:invalid_attributes) do
        {contract: {
          name: "",
          description: "",
        }}
      end

      before { post "/api/v1/clients/#{client_id}/contracts/", params: invalid_attributes } 

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a faillure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end


  describe "PUT /api/v1/clients/:client_id/contracts/:id" do

    let(:valid_attributes) do
      {contract: { 
        name: 'nom', 
        description: '' 
      }}
    end

    before { put "/api/v1/clients/#{client_id}/contracts/#{id}", params: valid_attributes }

    context 'when params are valid' do 

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      
      it 'changes the name of the contract' do
        updated_contract = Contract.find(id)
        expect(updated_contract.name).to eq('nom')
        expect(json_response[0]['name']).to eq('nom')
      end
    end



    context 'when contract does not exsist' do
      let (:id) { 0 }

      it 'return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find Contract/)
      end
    end


  end



end