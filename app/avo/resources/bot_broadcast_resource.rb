class BotBroadcastResource < Avo::BaseResource
  self.title = :sanitized_intro
  self.includes = [:protocol]
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  # Fields generated from the model
  field :start_at, as: :date_time, name: "début de la diffusion", sortable: true
  field :end_at, as: :date_time, name: "fin de la diffusion"
  field :protocol, as: :belongs_to
  field :thumbnail, name:"vignette", as: :file, link_to_resource: true, accept: "image/*"
  field :intro, as: :trix
  field :steps, as: :trix
  field :outro, as: :trix
  field :cta, as: :text
  field :telegram_conversation_url, as: :text
  # add fields here

  grid do
    cover :thumbnail, as: :file, link_to_resource: true
    title :protocol_punchline, as: :text do |broadcast|
      broadcast.protocol.punchline
    end
    body :intro, as: :text, as_html: true
  end
end
