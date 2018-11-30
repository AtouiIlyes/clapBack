require 'rails_helper'

#require Rails.root.join('spec', 'apis', 'v1', 'shared_exemples', 'respond_to_missing.rb')

RSpec.describe 'Contract API', type: :request do

    let!(:salesman) { create(:user) }
    let!(:manager) { create(:user) }
    let!(:client) { create(:client) }
    let(:client_id) { client.id }

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
          expect(json_response.size).to eq(4) 
        end
      end
    end



end