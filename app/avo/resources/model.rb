class Avo::Resources::Model < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :name, as: :text,
      link_to_record: true,
      sortable: true
    field :company, as: :belongs_to
    field :submodels, as: :has_many
  end
end
