class CreateServicesMembers < ActiveRecord::Migration
  def change
    create_table :members_services do |t|
    	t.integer :service_id
    	t.integer :member_id

    	t.timestamps
    end

    add_index :members_services, :service_id
    add_index :members_services, :member_id
  end
end
