class User < ApplicationRecord
  include Uuidable
  
  with_options presence: true do
    validates :name
    validates :email
  end
end
