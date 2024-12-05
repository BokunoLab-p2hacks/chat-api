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

  describe "POST /users" do
    before do
      user = build(:user)
      @params = { name: user.name, email: user.email }
      
      post "/users", params: { user: @params }
    end

    it "returns a 200 if the response succeeded" do
      expect(response).to have_http_status(200)
    end

    it "creates a new user" do
      expect(User.count).to eq(1)
    end
    
    it "returns the new user#info" do
      expect(response_body).to eq(User.first.info.stringify_keys)
    end

    it "returns a 422 if the user is invalid" do
      @params[:name] = nil
      post "/users", params: { user: @params }
      expect(response).to have_http_status(422)
    end
  end
end
