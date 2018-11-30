FactoryBot.define do
  factory :client do
    name { Faker::Company.name }
    siret { Faker::Company.french_siret_number }
    address { Faker::Address.street_address }
    zip_code { Faker::Address.zip_code }
    city{ Faker::Address.city }
    country { Faker::Address.country }
    phone { Faker::PhoneNumber.phone_number }
    activity {  Faker::Company.industry }
  end
end