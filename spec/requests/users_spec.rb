require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before do
      create_list(:user, 3)
      get "/users"
    end

    it "returns a 200 if the response succeeded" do
      expect(response).to have_http_status(200)
    end

    it "returns a list of users#info" do
      expect(response_body).to eq(User.all.map(&:info).map(&:stringify_keys))
    end
  end
end
