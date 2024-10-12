class CreateModels < ActiveRecord::Migration[7.2]
  def change
    create_table :models do |t|
      t.string :name
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
