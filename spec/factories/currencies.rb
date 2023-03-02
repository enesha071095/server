FactoryBot.define do
  factory :currency do
    name { Faker::Currency.name }
  end
end
