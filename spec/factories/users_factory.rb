FactoryBot.define do
  factory :user do
    org
    email { "me@metallos.fr" }
    password { "password1234" }
    confirmed_at { Time.current }
    trait :admin do
      email { User::ADMIN_EMAILS.sample }
    end
  end
end
