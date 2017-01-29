class CreateFoodsOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :foods_orders, id: false do |t|
      t.integer :food_id
      t.integer :order_id
    end
  end
end
