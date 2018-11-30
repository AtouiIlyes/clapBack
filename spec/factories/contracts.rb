FactoryBot.define do
  factory :contract do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
end
