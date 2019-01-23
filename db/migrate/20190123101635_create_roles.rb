class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    add_column :users, :role_id, :integer

  end
end
