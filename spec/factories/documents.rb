FactoryBot.define do
  factory :document do
    user
    department
    name { Faker::Lorem.word }
    status { false }
    deadline { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }
    document_type
    count { Faker::Number.number(digits: 2) }
    amount { Faker::Number.number(digits: 4) }
    execution_deadline { Faker::Date.between(from: Date.today, to: 1.year.from_now) }
    contract_type
    currency
  end
end
