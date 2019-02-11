class AddInitialUserType < ActiveRecord::Migration[5.2]
  def up
    UserType.create(name: 'facturation', description: 'contact facturation pour un compte')
    UserType.create(name: 'operationnel', description: 'contact opérationnel pour un compte')
  end
end
