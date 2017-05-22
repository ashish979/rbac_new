module Uuidable
  extend ActiveSupport::Concern
  require 'securerandom'

  included do
    before_validation :generate_uuid, on: :create
  end

  protected

  def generate_uuid
    self.uuid = SecureRandom.uuid unless uuid.present?
  end
end
