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

  describe "POST /messages" do
    before do
      @user = create(:user)
      message = build(:message)
      @params = { content: message.content, userId: @user.id }

      post "/messages", params: { message: @params }
    end

    it "returns 200 if the response succeeded" do
      expect(response).to have_http_status(200)
    end

    it "creates a new message" do
      expect(Message.count).to eq(1)
    end

    it "returns the new message#info" do
      expect(response_body).to eq(Message.first.info.stringify_keys)
    end

    it "returns 422 if the message is invalid" do
      @params[:userId] = nil
      post "/messages", params: { message: @params }
      expect(response).to have_http_status(422)
    end
  end
end
