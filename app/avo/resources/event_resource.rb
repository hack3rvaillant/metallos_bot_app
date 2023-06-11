class EventResource < Avo::BaseResource
  self.title = :url
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :happen_at, as: :date_time, name: "date"
  field :protocol, as: :belongs_to
  field :place, as: :select, options: I18n.t("models.event.places").invert, only_on: [:new, :edit]
  field :place, as: :badge, options: {info: "online", success: ""}
  field :url, as: :text, as_html: true do |event|
    "<a href='#{event.url}', target='_blank'>#{event.url}</a>"
  end
  field :address, as: :text
  field :coordinates, as: :location, stored_as: [:lat, :long]
end
