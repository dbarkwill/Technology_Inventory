class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.integer :device_group_id
      t.boolean :checkedout
      t.timestamps
    end
  end
end
