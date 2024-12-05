class Message < ApplicationRecord
  include Uuidable
  
  belongs_to :user, required: true
  validates :content, presence: true, length: { maximum: 140 }
end
