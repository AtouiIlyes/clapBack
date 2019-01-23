class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :code
      t.string :api_url
      t.timestamps
    end
  end
end
