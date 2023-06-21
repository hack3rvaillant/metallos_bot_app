class BotBroadcastResource < Avo::BaseResource
  self.title = :sanitized_intro
  self.includes = [:protocol]
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  # Fields generated from the model
  field :start_at, as: :date_time, name: "début de la diffusion", sortable: true
  field :end_at, as: :date_time, name: "fin de la diffusion"
  field :protocol, as: :belongs_to, name: "protocole"
  field :thumbnail, name:"vignette", as: :file, link_to_resource: true, accept: "image/*", hide_on: [:index]
  field :intro, as: :trix
  field :actif, only_on: [:index], as: :text do |bb|
    now = Time.current
    next "🚀" if now >= bb.start_at && now <= bb.end_at
    next "📅" if now < bb.start_at
    next "🛑" if now > bb.end_at
  end
  field :steps, as: :trix, hide_on: [:index], name: "instructions"
  field :outro, as: :trix, hide_on: [:index]
  field :cta, as: :text, hide_on: [:index]
  field :telegram_conversation_url, as: :text, hide_on: [:index], name: "url de conversation Telegram"
  # add fields here

  grid do
    cover :thumbnail, as: :file, link_to_resource: true
    title :protocol_punchline, as: :text do |broadcast|
      broadcast.protocol.punchline
    end
    body :sanitized_intro, as: :text, as_html: true
  end
end
