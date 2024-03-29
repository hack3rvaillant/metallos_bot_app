class TelegramWebhooksController < Telegram::Bot::UpdatesController
  # skip_before_action :authenticate_user!

  include Telegram::Bot::UpdatesController::MessageContext
  before_action :set_current_bot_broadcast, only: [:start!, :current_protocol, :callback_query]
  before_action :set_conversation, only: [:start!, :current_protocol, :callback_query]

  def start!(*)
    if @active_bot_broadcast
      current_protocol_intro!
    else
      respond_with :message, text: t(".no_current_protocol")
    end
  end

  def current_protocol_intro!
    respond_with :message, text: "🔔 <b>Protocole n°#{@active_bot_broadcast.protocol.position.to_s.rjust(2, "0")} — du #{@active_bot_broadcast.start_at.strftime("%d/%m/%Y")} au #{@active_bot_broadcast.end_at.strftime("%d/%m/%Y")}</b>", parse_mode: "HTML"
    respond_with :message,
      text: Sanitize.fragment(@active_bot_broadcast.intro, Sanitize::Config::TELEGRAM),
      parse_mode: "HTML",
      reply_markup: {
        inline_keyboard: [[
          {text: t(".see_current"), callback_data: "current_protocol"}
        ]]
      }
  end

  def current_protocol!
    @active_bot_broadcast.thumbnail do |file|
      respond_with :photo, photo: file
    end
    respond_with :message, text: Sanitize.fragment(@active_bot_broadcast.steps, Sanitize::Config::TELEGRAM), parse_mode: "HTML"

    respond_with :message, text: t(".todo_before", date: @active_bot_broadcast.end_at.strftime("%d %B")), reply_markup: {
      inline_keyboard: [[
        {text: t(".share_button"), callback_data: "current_protocol_outro"}
      ]]
    }
  end

  def current_protocol_outro!
    respond_with :message, text: Sanitize.fragment(@active_bot_broadcast.outro, Sanitize::Config::TELEGRAM), parse_mode: "HTML"
    respond_with :message, text: "👉 #{@active_bot_broadcast.telegram_conversation_url}", parse_mode: "HTML"
    sleep 5
    respond_with :message, text: t(".do_not_forget")
    respond_with :message, text: "@BureauDesMethodesBot"
  end

  def stop!
    bot.close
  end

  def callback_query(data)
    if data == "alert"
      answer_callback_query t(".alert"), show_alert: true
    elsif data == "current_protocol"
      current_protocol
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

  def set_current_bot_broadcast
    @active_bot_broadcast = Org.find_by(name: "Maison des Métallos").active_bot_broadcast # TODO, make the org selection dynamic
  end

  def set_conversation
    chat_id = chat && chat["id"]
    @conversation = Conversation.find_or_create_by(chat_id: chat_id) # TODO, make them belong to an organisation
  end
end
