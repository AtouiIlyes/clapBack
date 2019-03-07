class CreateProceedings < ActiveRecord::Migration[5.2]
  def change
    create_table :proceedings do |t|
      t.integer :code 
      t.string :libelle 
      t.timestamps
    end
  end

end
