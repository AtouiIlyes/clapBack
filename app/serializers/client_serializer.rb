class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :siret, :address, :zip_code, :city, :country, :phone, :fax, :activity, :activity_code, :vat_number


  # inclure les relation => belongs_to :user, pui suser serializer avec ce qu'on veut afficher 
  # https://blog.codeship.com/building-a-json-api-with-rails-5/

end
