class CreateCompanyables < ActiveRecord::Migration[7.2]
  def change
    create_table :companyables do |t|
      t.integer :companyable_id
      t.string :companyable_type
      t.references :model, null: false, foreign_key: true
      t.references :submodel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
