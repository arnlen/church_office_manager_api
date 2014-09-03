class CreateTaskTemplates < ActiveRecord::Migration
  def change
    create_table :task_templates do |t|
      t.string :name
      t.string :due_date
      t.integer :service_id

      t.timestamps
    end
  end
end
