class Step < ApplicationRecord
  belongs_to :proceeding

  validates :stepType, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :sended, presence: true
  validates :days_number, presence: true
  validates :rank, presence: true
  validates :proceeding_id, presence: true

end
