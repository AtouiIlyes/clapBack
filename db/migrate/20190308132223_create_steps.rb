class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :name 
      t.string :description 
      t.string :sended 
      t.integer :stepType 
      t.integer :days_number
      t.integer :rank
      t.integer :proceeding_id
      t.timestamps
    end
  end
end
