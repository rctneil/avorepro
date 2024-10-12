class RemoveNotNullFromModelAndSubmodelInCompanyables < ActiveRecord::Migration[7.2]
  def change
    change_column :companyables, :model_id, :integer, null: true
    change_column :companyables, :submodel_id, :integer, null: true
  end
end
