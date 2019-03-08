class Proceeding < ApplicationRecord

  validates :code, presence: true
  validates :libelle, presence: true

  has_many :steps

end
