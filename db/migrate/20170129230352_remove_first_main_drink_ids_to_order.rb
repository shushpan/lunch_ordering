class RemoveFirstMainDrinkIdsToOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :first_course_id
    remove_column :orders, :main_course_id
    remove_column :orders, :drink_id
  end
end
