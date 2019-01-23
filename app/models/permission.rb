class Permission < ApplicationRecord

  has_and_belongs_to_many :roles
  accepts_nested_attributes_for :roles
  
end
