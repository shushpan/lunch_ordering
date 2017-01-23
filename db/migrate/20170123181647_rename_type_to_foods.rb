class RenameTypeToFoods < ActiveRecord::Migration[5.0]
  def change
    rename_column :foods, :type, :food_type
  end
end
