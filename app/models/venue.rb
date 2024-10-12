class Venue < ApplicationRecord
  has_many :attractions, dependent: :nullify
  has_many :companyables, as: :companyable
  has_many :companies, through: :companyables
end
