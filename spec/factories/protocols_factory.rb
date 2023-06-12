FactoryBot.define do
  factory :protocol do
    content { "MyString" }
    copyright_cleared { false }
    creation_year { 2022 }
    participation_mode { :solo }
    punchline { "In enim justo rhoncus ut" }
    status { :draft }
    artist
    org
    trait :cleared do
      copyright_cleared { true }
    end
  end
end
