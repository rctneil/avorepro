class Avo::Resources::Attraction < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  self.title = :name_and_venue

  def fields
    field :id, as: :id
    field :name, as: :text
    field :venue, as: :belongs_to
    field :companyables, as: :has_many
  end
end
