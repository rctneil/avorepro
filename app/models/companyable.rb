class Companyable < ApplicationRecord
  belongs_to :company
  belongs_to :companyable, polymorphic: true
  belongs_to :model, optional: true
  belongs_to :submodel, optional: true
end
