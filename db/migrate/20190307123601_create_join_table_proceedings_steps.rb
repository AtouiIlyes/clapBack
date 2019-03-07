class CreateJoinTableProceedingsSteps < ActiveRecord::Migration[5.2]
  def change
    create_join_table :proceedings, :steps do |t|
    end
  end
end
