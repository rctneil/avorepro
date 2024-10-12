class AddCompanyToCompanyables < ActiveRecord::Migration[7.2]
  def change
    add_reference :companyables, :company, null: false, foreign_key: true
  end
end
