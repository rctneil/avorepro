class Attraction < ApplicationRecord
  belongs_to :venue
  has_many :companyables, as: :companyable
  has_many :companies, through: :companyables

  extend FriendlyId
  friendly_id :name, use: :slugged
end
