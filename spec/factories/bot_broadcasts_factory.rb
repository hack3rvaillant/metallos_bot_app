FactoryBot.define do
  factory :bot_broadcast do
    intro { "MyString" }
    steps { "MyString" }
    outro { "MyString" }
    cta { "MyString" }
    start_at { Time.current }
    end_at { 2.days.from_now }
    telegram_conversation_url {"https://tlgrm.com/srantkwa"}
    protocol
  end
end
