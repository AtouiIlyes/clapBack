FactoryBot.define do
  factory :contract do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    client_id { nil } 
    sales_person_id { nil }
    manager_id { nil }
  end
end
