class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :first_course_id
      t.integer :main_course_id
      t.integer :drink_id
      t.belongs_to :user, new: true
      t.date :date
      t.timestamps null: false
    end
  end
end
