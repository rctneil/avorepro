class Model < ApplicationRecord
  belongs_to :company
  has_many :submodels
  has_many :companyables, foreign_key: :model_id, dependent: :nullify
end
