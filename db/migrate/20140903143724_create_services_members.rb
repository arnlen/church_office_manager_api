class CreateServicesMembers < ActiveRecord::Migration
  def change
    create_table :services_members do |t|
    	t.integer :service_id
    	t.integer :member_id

    	t.timestamps
    end
  end
end
