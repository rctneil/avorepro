class Attraction < ApplicationRecord
  belongs_to :venue
  has_many :companyables, as: :companyable
  has_many :companies, through: :companyables

  delegate :name,
    to: :venue,
    allow_nil: true,
    prefix: true

  def name_and_venue
      [name, venue_name].join (' at ')
  end
end
