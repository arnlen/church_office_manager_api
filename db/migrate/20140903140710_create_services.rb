class CreateServices < ActiveRecord::Migration
  def change

    create_table :services do |t|
      t.string :name
      t.integer :task_left, default: 0
      t.integer :task_done, default: 0
      t.integer :task_total, default: 0
      t.boolean :ready, default: false
      t.integer :leader_id
      t.integer :member_in_charge_id
      t.integer :office_id

      t.timestamps
    end

  end
end
