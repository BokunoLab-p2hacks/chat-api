require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "GET /messages" do

    before do
      @user = create(:user)
      create_list(:message, 3, user: @user)
      get "/messages"
    end

    it "returns 200 if the response succeeded" do
      expect(response).to have_http_status(200)
    end

    it "returns a list of users#info" do
      expect(response_body).to eq(Message.all.map(&:info).map(&:stringify_keys))
    end
  end
end
