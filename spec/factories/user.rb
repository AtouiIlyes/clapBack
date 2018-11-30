FactoryBot.define do
  factory :user do
    email { Faker::Name.name }
    encrypted_password { "$2a$11$3wVZRdBCok5qCF76e/t.VePEZhaPrqVQdzFGKYEWlmw85NqiYq2wm" }
    
  end
end