FactoryBot.define do
  factory :protocol do
    artist
    org
    title { "MyString" }
    content { "MyText" }
    start_at { "2023-06-07 15:54:25" }
    end_at { "2023-06-07 15:54:25" }
    status { I18n.t("models.protocol.statuses", locale: :en).values.sample }
    temporality { I18n.t("models.protocol.temporalities", locale: :en).values.sample }
    place { I18n.t("models.protocol.places", locale: :en).values.sample}
    address_of_event { "MyString" }
    datetime_of_event { "2023-06-07 15:54:25" }
    url_of_event { "MyString" }
    participation_type { "solo" }
    duration_in_minutes { 1 }
    copyright_cleared { false }
    bot_visible { false }
    bot_intro { "MyText" }
    bot_steps { "MyText" }
    props_needed { "MyText" }
    bot_cta { "MyString" }
    bot_outro { "MyText" }
    telegram_conversation_url { "MyString" }
  end
end
