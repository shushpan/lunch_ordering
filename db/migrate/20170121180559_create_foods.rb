class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.date :date
      t.timestamps null:false
    end
  end
end
