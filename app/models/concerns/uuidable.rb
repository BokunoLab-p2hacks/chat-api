module Uuidable
  extend ActiveSupport::Concern

  included do
    before_create :set_uuid
  end

  private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
