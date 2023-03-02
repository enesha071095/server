FactoryBot.define do
  factory :position do
    name { Faker::Job.title }
  end
end
