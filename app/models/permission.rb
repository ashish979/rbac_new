class Permission < ApplicationRecord
  include Uuidable

  #associations
  has_and_belongs_to_many :roles, uniq: true

  #validations
  validates :description, presence: true
  validates_length_of :description, :maximum => 50
  validates_length_of :action, :maximum => 50
  validates_length_of :subject_class, :maximum => 50
  validates :uuid, presence: true, uniqueness: true
  validates :action, uniqueness: { scope: :subject_class }
end
