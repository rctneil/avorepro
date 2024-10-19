class Avo::Resources::Companyable < Avo::BaseResource
  self.stimulus_controllers = "companyable-resource"

  def fields
      field :id, as: :id,
          link_to_record: true,
          sortable: true,
          filterable: true

      field :company, as: :belongs_to

      field :companyable, as: :belongs_to,
        polymorphic: true,
        polymorphic_as: :companyable,
        searchable: true,
        types: [::Attraction, ::Venue]
  end
end
