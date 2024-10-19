class AddSlugToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :attractions, :slug, :string
    add_index :attractions, :slug, unique: true
  end
end
