class Avo::Resources::Companyable < Avo::BaseResource
  self.stimulus_controllers = "companyable-resource"

  def fields
      field :id, as: :id,
          link_to_record: true,
          sortable: true,
          filterable: true

      field :company, as: :belongs_to,
          html: {
              edit: {
                  input: {
                      data: {
                          companyable_resource_target: "companyFieldInput", # Make the input a target
                          action: "input->companyable-resource#onCompanyChange" # Add an action on change
                      }
                  }
              }
          }

      field :companyable, as: :belongs_to,
          polymorphic: true,
          polymorphic_as: :companyable,
          searchable: false,
          types: [::Attraction, ::Venue]

      field :model, as: :belongs_to,
          placeholder: "Select a model",
          html: {
              edit: {
                  input: {
                      data: {
                          companyable_resource_target: "modelFieldInput", # Make the input a target
                          action: "input->companyable-resource#onModelChange" # Add an action on change
                      }
                  }
              }
          }

      field :submodel, as: :belongs_to,
          html: {
              edit: {
                  input: {
                      data: {
                          companyable_resource_target: "submodelFieldInput" # Make the input a target
                      }
                  }
              }
          }
  end
end
