class Proceeding < ApplicationRecord

  has_and_belongs_to_many :steps
  accepts_nested_attributes_for :steps

  validates :code, presence: true
  validates :libelle, presence: true
end
