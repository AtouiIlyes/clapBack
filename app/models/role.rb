class Role < ApplicationRecord

  has_and_belongs_to_many :permissions
  accepts_nested_attributes_for :permissions
  
  has_many :users
end
