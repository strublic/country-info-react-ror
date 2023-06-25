FactoryBot.define do
  factory :country do
    name { Faker::Address.country[0..19] }
    capital_city { Faker::Address.city[0..19] }
    population_size { rand(1..5)**9 }
    area_total { rand(1..5)**9 }
    desc { Faker::Lorem.paragraph[0..139] }
  end
end