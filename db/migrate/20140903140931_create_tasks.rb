class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :due_date
      t.boolean :completed
      t.integer :service_id

      t.timestamps
    end
  end
end
