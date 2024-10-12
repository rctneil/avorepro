class Stuff < ActiveRecord::Migration[7.2]
  def change
    change_column_null :companyables, :model_id, true
    change_column_null :companyables, :submodel_id, true
  end
end
