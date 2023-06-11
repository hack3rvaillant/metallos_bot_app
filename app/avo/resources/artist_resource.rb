class ArtistResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :name, as: :text, link_to_resource: true
  field :description, as: :trix
  field :protocols, as: :has_many
end
