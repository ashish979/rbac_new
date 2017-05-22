class Role < ApplicationRecord
  include Uuidable

  #associations
  has_and_belongs_to_many :users, uniq: true
  has_and_belongs_to_many :permissions, uniq: true

  #validations
  validates_presence_of :name, :uuid
  validates_uniqueness_of :name
  validates_uniqueness_of :uuid
  validates_length_of :name, :maximum => 50

  def assign_permission(permission)
    permissions.push(permission) unless permissions.include? permission
  end

  def unassign_permission(permission)
    permissions.delete(permission)
  end

  def self.super_admin
    Role.where(uuid: :super_admin).first
  end
end
