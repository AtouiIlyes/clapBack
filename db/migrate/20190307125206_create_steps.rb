class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.integer :stepType 
      t.string :name 
      t.string :description 
      t.string :sended 
      t.integer :days_number
      t.integer :rank
      t.timestamps
    end
  end
end
