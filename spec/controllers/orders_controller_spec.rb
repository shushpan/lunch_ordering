require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "#create" do
    it "returns http 302" do
      post :create, {}
      expect(response).to have_http_status(302)
    end
  end

end