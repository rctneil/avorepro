class AddTypeToAttraction < ActiveRecord::Migration[7.2]
  def change
    add_column :attractions, :type, :string
  end
end
