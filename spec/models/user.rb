require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    before do
      @user = build(:user)
    end

    it "is valid with valid attributes" do      
      expect(@user).to be_valid
    end

    it "is not valid without a name" do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without an email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
  end

  describe "uuid" do
    it "is generated on create" do
      user = create(:user)
      expect(user.id).to be_present
    end
  end
end
