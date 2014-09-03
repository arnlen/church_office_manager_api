class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.integer :task_left
      t.integer :task_done
      t.integer :task_total
      t.boolean :ready
      t.integer :leader_id
      t.integer :office_id

      t.timestamps
    end
  end
end
