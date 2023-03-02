FactoryBot.define do
  factory :signature do
    document
    token { SecureRandom.hex(20) }
  end
end
