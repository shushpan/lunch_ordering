require 'rails_helper'

RSpec.describe Food, type: :model do
  before { @food = Food.create(name: 'Food 1', date: Date.today, food_type: 'First course',price: 12)}

  subject { @food }

  it { should respond_to(:name) }
  it { should respond_to(:date) }
  it { should respond_to(:food_type) }
  it { should respond_to(:price) }
  it { should be_valid }

  describe "when price < 0" do
    before do
      food_dup = @food
      food_dup.price = @food.price - 13
    end
    it { should_not be_valid}
  end
end
