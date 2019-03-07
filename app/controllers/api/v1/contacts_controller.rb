module Api
  module V1
    class ContactsController < ApplicationController
        before_action :authenticate_user!
        before_action :set_contact, only: [:show, :update, :destroy]

        def index
          @contacts = Contact.all.as_json(:include => [:role, :user_type])
          json_response(@contacts, api_v1_contacts_url)
        end

        def create
          @contact = Contact.create!(contacts_params)
          json_response(@contact.as_json(), api_v1_contacts_url(@contact), :created)
        end

        def show
          json_response(@contact.as_json(:include => [:role, :user_type]), api_v1_contacts_url(@contact))
        end

        def update
          @contact.update(contacts_params)
          json_response(@contact.as_json(:include => [:role, :user_type]), api_v1_contacts_url(@contact))
        end

        def destroy
          @contact.destroy
          head :no_content
        end

        private

        def set_contact
          # 404 managed by concern exeption handler
          @contact = Contact.find(params[:id])
        end

        def contacts_params
          params.require(:contact).permit(
            :email,
            :first_name,
            :last_name,
            :type_id, 
            :role_id, 
            :function, 
            :address_one, 
            :address_two,
            :phone,
            :fax,
            :country, 
            :city, 
            :zip_code    
          );
        end
    end
  end 
end