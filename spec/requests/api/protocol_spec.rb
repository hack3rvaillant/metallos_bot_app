require "rails_helper"

RSpec.describe "Api::Protocols", type: :request do
  let!(:protocol1) { create :protocol }
  let!(:protocol2) { create :protocol }

  describe "GET /index" do
    it "returns http success" do
      get "/api/protocols"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/protocol/#{protocol2.id}.js"
      expect(response).to have_http_status(:success)
    end
  end
end
