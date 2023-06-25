FactoryBot.define do
  factory :user do
    username { Faker::Lorem.word }
    password {"123456"}
  end
end