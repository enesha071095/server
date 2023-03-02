FactoryBot.define do
  factory :department do
    name { Faker::Company.unique.department }
  end
end
