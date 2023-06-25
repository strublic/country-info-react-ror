FactoryBot.define do
  factory :country do
    name { Faker::Address.country }
    capital_city { Faker::Address.city }
  end
end