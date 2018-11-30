class Contract < ApplicationRecord


  belongs_to :client
  belongs_to :sales_person, class_name: 'User', foreign_key: 'sales_person_id'
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'


  validates :name, presence: true

end
