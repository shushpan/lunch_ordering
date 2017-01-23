class RemoveDescriptionToFoods < ActiveRecord::Migration[5.0]
  def change
    remove_column :foods, :description
  end
end
