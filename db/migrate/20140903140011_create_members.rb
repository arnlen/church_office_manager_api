class CreateMembers < ActiveRecord::Migration
  def change

    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end

    add_index :members, :name, unique: true
    add_index :members, :email
  end

end
