FactoryBot.define do
  factory :message do
    sequence(:content) { |n| "Message#{n}" }
    user { create(:user) }    
  end
end
