class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
