class AddTypeToFoods < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :type, :string
  end
end
