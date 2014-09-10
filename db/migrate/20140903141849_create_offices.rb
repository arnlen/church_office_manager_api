class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.date :date

      t.timestamps
    end
  end
end
