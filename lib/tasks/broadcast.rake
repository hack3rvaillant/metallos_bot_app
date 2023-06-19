namespace :broadcast do
  desc "Notify open conversation of the new protocol"
  task :send => :environment do
    # add condition of active bot_broadcast for an org
    Conversation.find_each do |conv|
      Telegram.bot.send_message(chat_id: conv.chat_id, text: "Un nouveau protocole vient d'être publiébroadcast \n C'était ça! test passage à la ligne")
      # Telegram.bot.send_message(chat_id: conv.chat_id, text: Sanitize.fragment(Org.first.ready_to_broadcast_bot_broadcast.intro, Sanitize::Config::TELEGRAM))

      sleep 1.0/35.0
      # TODO, add the inline keyboard to see the active protocol
    rescue
      next
    end
  end
end
