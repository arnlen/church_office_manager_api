class CreateServiceTemplates < ActiveRecord::Migration
  def change

    create_table :service_templates do |t|
      t.string :name
      t.integer :leader_id

      t.timestamps
    end

    add_index :service_templates, :name, unique: true
  end
end
