class Avo::Resources::Attraction < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  self.title = :name

  self.find_record_method = -> {
    if id.is_a?(Array)
        query.where(slug: id).first
    else
        query.friendly.find id
    end
}

  def actions
    action Avo::Actions::WasteTime
  end

  def fields
    field :id, as: :id
    field :name, as: :text
    field :slug, as: :text
    field :venue, as: :belongs_to
    field :type, as: :select,
      options: {
        "Other Attraction": nil,
        "Coaster": "Coaster"
      },
      include_blank: false,
      sortable: true,
      filterable: true
    field :companyables, as: :has_many
  end
end
