require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @food_1 = Food.new(price: 12)
    @food_2 = Food.new(price: 5)
    @order = Order.new()
    @order.foods << [@food_1, @food_2]
  end

  subject {@order}

 it "correct .calculate_total_amount" do
   @order.calculate_total_amount
   expect(@order.total_amount).to eq(17)
 end

  it "incorrect .calculate_total_amount" do
    @order.calculate_total_amount
    expect(@order.total_amount).not_to eq(0)
  end
end
