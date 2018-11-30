class Client < ApplicationRecord

  # accepts_nested_attributes_for

  validates :name, presence: true
  validates :siret,  presence: true, uniqueness: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :phone, presence: true
  validates :activity, presence: true

  has_many :contracts
  
end
