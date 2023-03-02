FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password { Devise.friendly_token }
    is_chief { false }
    first_name { Faker::Name.first_name }
    second_name { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.phone_number }
    jti { SecureRandom.uuid }
    remember_created_at { nil }
    sign_in_count { 0 }
    current_sign_in_at { nil }
    last_sign_in_at { nil }
    current_sign_in_ip { nil }
    last_sign_in_ip { nil }
    position { association :position }

    trait :chief do
      is_chief { true }
    end
  end
end
