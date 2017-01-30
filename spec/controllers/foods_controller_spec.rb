require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:food) {Food.new(id: 1, name: 'test',date: Date.today)}
  describe "#get_foods_for_date" do
    it "returns http 302" do
      food.save
      post :get_foods_for_date, {date: Date.today}
      expect(response).to have_http_status(302)
    end
  end
end