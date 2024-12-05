require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    before do
      @message = build(:message)
    end

    it "is valid with valid attributes" do
      expect(@message).to be_valid
    end

    it "is not valid without a content" do
      @message.content = nil
      expect(@message).to_not be_valid
    end

    it "is not valid without a user" do
      @message.user = nil
      expect(@message).to_not be_valid
    end

    it "is not valid with a content longer than 140 characters" do
      @message.content = "a" * 141
      expect(@message).to_not be_valid
    end
  end

  describe "uuidable" do
    it "is generated on create" do
      message = create(:message)
      expect(message.id).to be_present
    end
  end

  describe 'associations' do
    it "belongs to a user" do
      user = create(:user)
      message = create(:message, user: user)
      expect(message.user).to eq(user)
    end
  end
end
