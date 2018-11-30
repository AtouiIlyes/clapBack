class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JWTBlacklist

  #https://www.spacevatican.org/2008/5/6/creating-multiple-associations-with-the-same-table/
  has_many :sold_contracts, class_name: 'Contract', foreign_key: 'sales_person_id'
  has_many :managed_contracts, class_name: 'Contract', foreign_key: 'manager_id'
end
