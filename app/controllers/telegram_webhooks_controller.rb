class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext

  def start!(*)
    active_bot_broadcast = Org.find_by(name: "Maison des Métallos").active_bot_broadcast # TODO, make the org selection dynamic
    respond_with :message, text: t(".greetings")
    respond_with :message, text: t(".what_we_do")
    if active_bot_broadcast
      respond_with :message, text: t(".current_protocol")
      respond_with :message, text: t(".your_turn")
      respond_with :message, text: Sanitize.fragment(active_bot_broadcast.intro), parse_mode: "HTML"
      active_bot_broadcast.thumbnail.open do |file|
        respond_with :photo, photo: file
      end
      respond_with :message, text: Sanitize.fragment(active_bot_broadcast.steps), parse_mode: "HTML"
      respond_with :message, text: Sanitize.fragment(active_bot_broadcast.outro), parse_mode: "HTML"
      respond_with :message, text: t(".join_group_chat", url: active_bot_broadcast.telegram_conversation_url)
    else
    end
  end

  def stop!
    bot.close
  end

  # def help!(*)
  #   respond_with :message, text: t(".content")
  # end

  # def memo!(*args)
  #   if args.any?
  #     session[:memo] = args.join(" ")
  #     respond_with :message, text: t(".notice")
  #   else
  #     respond_with :message, text: t(".prompt")
  #     save_context :memo!
  #   end
  # end

  # def remind_me!(*)
  #   to_remind = session.delete(:memo)
  #   reply = to_remind || t(".nothing")
  #   respond_with :message, text: reply
  # end

  # def keyboard!(value = nil, *)
  #   if value
  #     respond_with :message, text: t(".selected", value: value)
  #   else
  #     save_context :keyboard!
  #     respond_with :message, text: t(".prompt"), reply_markup: {
  #       keyboard: [t(".buttons")],
  #       resize_keyboard: true,
  #       one_time_keyboard: true,
  #       selective: true
  #     }
  #   end
  # end

  # def inline_keyboard!(*)
  #   respond_with :message, text: t(".prompt"), reply_markup: {
  #     inline_keyboard: [
  #       [
  #         {text: t(".alert"), callback_data: "alert"},
  #         {text: t(".no_alert"), callback_data: "no_alert"},
  #         {text: t(".repo"), url: "https://github.com/telegram-bot-rb/telegram-bot"}
  #       ]
  #     ]
  #   }
  # end

  def callback_query(data)
    if data == "alert"
      answer_callback_query t(".alert"), show_alert: true
    else
      answer_callback_query t(".no_alert")
    end
  end

  def inline_query(query, _offset)
    query = query.first(10) # it's just an example, don't use large queries.
    t_description = t(".description")
    t_content = t(".content")
    results = Array.new(5) do |i|
      {
        type: :article,
        title: "#{query}-#{i}",
        id: "#{query}-#{i}",
        description: "#{t_description} #{i}",
        input_message_content: {
          message_text: "#{t_content} #{i}"
        }
      }
    end
    answer_inline_query results
  end

  # As there is no chat id in such requests, we can not respond instantly.
  # So we just save the result_id, and it's available then with `/last_chosen_inline_result`.
  def chosen_inline_result(result_id, _query)
    session[:last_chosen_inline_result] = result_id
  end

  def last_chosen_inline_result!(*)
    result_id = session[:last_chosen_inline_result]
    if result_id
      respond_with :message, text: t(".selected", result_id: result_id)
    else
      respond_with :message, text: t(".prompt")
    end
  end

  def message(message)
    respond_with :message, text: t(".content", text: message["text"])
  end

  def action_missing(action, *_args)
    if action_type == :command
      respond_with :message,
        text: t("telegram_webhooks.action_missing.command", command: action_options[:command])
    end
  end
end
