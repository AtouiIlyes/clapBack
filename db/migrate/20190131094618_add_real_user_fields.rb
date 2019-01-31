class AddRealUserFields < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :first_name 
      t.string :last_name 
      t.integer :type_id 
      t.string :function 
      t.string :address_one 
      t.string :address_two 
      t.string :phone
      t.string :fax
      t.string :city 
      t.integer :zip_code    
    end
  end
end
