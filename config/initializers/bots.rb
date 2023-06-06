puts ENV["RAILS_MASTER_KEY"]

Telegram.bots_config = Rails.application.credentials.telegram.bots!
