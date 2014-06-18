class CreateDeviceGroups < ActiveRecord::Migration
  def change
    create_table :device_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
