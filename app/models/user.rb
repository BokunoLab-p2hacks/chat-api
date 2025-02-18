class User < ApplicationRecord
  include Uuidable
  
  with_options presence: true do
    validates :name
    validates :email, uniqueness: true
  end

  def info
    {
      id: self.id,
      name: self.name,
      email: self.email
    }
  end
end
