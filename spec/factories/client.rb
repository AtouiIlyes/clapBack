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

    # name "odevie"
    # siret "9273019870000"
    # address "chemin du moulin brûlé"
    # zip_code "13150"
    # city  "arles"
    # country "France"
    # phone "0090987634"
    # activity "bite"

  end
end