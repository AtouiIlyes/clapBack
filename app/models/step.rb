class Step < ApplicationRecord
  has_and_belongs_to_many :proceedings
  accepts_nested_attributes_for :proceedings

  validates :stepType, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :sended, presence: true
  validates :days_number, presence: true
  validates :rank, presence: true
end
