class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.string :name
      t.string :description
      t.integer :sales_person_id
      t.integer :manager_id
      t.integer :workflow_id

      t.timestamps
    end
  end
end
