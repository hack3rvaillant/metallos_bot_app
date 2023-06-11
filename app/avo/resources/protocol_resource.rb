class ProtocolResource < Avo::BaseResource
  self.title = :punchline
  self.includes = []
  self.translation_key = 'avo.resource_translations.protocol'
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :status, as: :badge, options: {
    info: "draft",
    success: "published",
    warning: "ready_to_review"
  }
  field :punchline, name: "accroche", as: :text, link_to_resource: true
  field :org, as: :belongs_to, name: "Organisation"
  field :artist, as: :belongs_to, name: "Artiste"
  field :official_title, as: :text, name: "Titre officiel"
  field :creation_year, as: :number, name: "Année de création", placeholder: "2012"
  field :content, as: :trix, name: "Contenu"
  field :about, as: :trix, name: "À propos"
  field :participation_mode, name: "Mode de participation", as: :select, options: I18n.t("models.protocol.participation_modes").invert, only_on: [:edit, :new]
  field :participation_mode, name: "Mode de participation", as: :badge, options: {
    info: "solo",
    success: "multi"
  }
  field :props_needed, as: :trix, name: "Matériel nécessaire"
  field :copyright_cleared, as: :boolean, name: "Droits d'auteur négociés"
  field :duration, name: "durée indicative", as: :select, options: I18n.t("models.protocol.durations").invert
  field :internal_notes, as: :trix, name: "Notes internes"
  field :events, as: :has_many
  field :bot_broadcasts, as: :has_many
end
