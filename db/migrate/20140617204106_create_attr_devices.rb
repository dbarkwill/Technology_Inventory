class CreateAttrDevices < ActiveRecord::Migration
  def change
    create_table :attr_devices do |t|
      t.integer :attr_id, index: true
      t.integer :device_id, index: true
      t.text :value

      t.timestamps
    end
  end
end
