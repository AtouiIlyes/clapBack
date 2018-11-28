class CreateClients < ActiveRecord::Migration[5.2]
  def up
    create_table :clients do |t|
      t.string :name
      t.string :siret
      t.string :address
      t.integer :zip_code
      t.string :city
      t.string :country
      t.string :phone
      t.string :fax
      t.string :activity
      t.string :activity_code
      t.string :vat_number

      t.timestamps
    end
  end

  def down
    drop_table :clients
  end
end
