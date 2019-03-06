class Contact < ApplicationRecord
  # accepts_nested_attributes_for
  belongs_to :role, optional: true, foreign_key: :role_id
  belongs_to :user_type, optional: true, foreign_key: :type_id

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :function, presence: true
  validates :address_one, presence: true
  validates :address_two, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :phone, presence: true

  
end
